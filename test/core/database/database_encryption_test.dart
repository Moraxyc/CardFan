import 'package:cardfan/core/database/database_encryption.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DatabaseEncryption', () {
    test('generates a random 256-bit database key', () {
      final first = DatabaseEncryption.generateDatabaseKey();
      final second = DatabaseEncryption.generateDatabaseKey();

      expect(first, hasLength(32));
      expect(second, hasLength(32));
      expect(first, isNot(second));
    });

    test('encodes raw sqlcipher key as a blob literal', () {
      final key = List<int>.generate(32, (index) => index);

      expect(
        DatabaseEncryption.rawSqlCipherKeyLiteral(key),
        "x'000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f'",
      );
    });

    test('rejects keys that are not exactly 256 bits', () {
      expect(
        () =>
            DatabaseEncryption.rawSqlCipherKeyLiteral(List<int>.filled(31, 0)),
        throwsA(isA<ArgumentError>()),
      );
      expect(
        () =>
            DatabaseEncryption.rawSqlCipherKeyLiteral(List<int>.filled(33, 0)),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('setup fails closed when cipher pragma is unavailable', () {
      final fake = FakeRawDatabase({'PRAGMA cipher;': <List<Object?>>[]});

      expect(
        () => DatabaseEncryption.setupEncryptedDatabase(
          fake,
          List<int>.filled(32, 1),
        ),
        throwsA(isA<DatabaseEncryptionUnavailableException>()),
      );
      expect(fake.executedStatements, isEmpty);
    });

    test('setup applies sqlcipher raw key and verifies sqlite master', () {
      final fake = FakeRawDatabase({
        'PRAGMA cipher;': <List<Object?>>[
          ['sqlcipher'],
        ],
        'SELECT * FROM sqlite_master': <List<Object?>>[],
      });

      DatabaseEncryption.setupEncryptedDatabase(
        fake,
        List<int>.filled(32, 0xab),
      );

      expect(fake.executedStatements, [
        "PRAGMA cipher = 'sqlcipher'",
        "PRAGMA key = \"x'abababababababababababababababababababababababababababababababab'\"",
      ]);
      expect(fake.selectedStatements, contains('SELECT * FROM sqlite_master'));
    });

    test('setup accepts sqlite3mc numeric sqlcipher pragma result', () {
      final fake = FakeRawDatabase({
        'PRAGMA cipher;': <List<Object?>>[
          [4],
        ],
        'SELECT * FROM sqlite_master': <List<Object?>>[],
      });

      DatabaseEncryption.setupEncryptedDatabase(
        fake,
        List<int>.filled(32, 0xcd),
      );

      expect(fake.executedStatements, [
        "PRAGMA cipher = 'sqlcipher'",
        "PRAGMA key = \"x'cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd'\"",
      ]);
      expect(fake.selectedStatements, contains('SELECT * FROM sqlite_master'));
    });

    test('setup fails closed when key verification query fails', () {
      final fake = FakeRawDatabase(
        {
          'PRAGMA cipher;': <List<Object?>>[
            ['sqlcipher'],
          ],
        },
        failSelectStatements: {'SELECT * FROM sqlite_master'},
      );

      expect(
        () => DatabaseEncryption.setupEncryptedDatabase(
          fake,
          List<int>.filled(32, 1),
        ),
        throwsA(isA<DatabaseKeyVerificationException>()),
      );
    });

    test('setup fails closed when PRAGMA key apply throws', () {
      final key = List<int>.filled(32, 1);
      final pragmaKey =
          'PRAGMA key = "${DatabaseEncryption.rawSqlCipherKeyLiteral(key)}"';
      final fake = FakeRawDatabase(
        {
          'PRAGMA cipher;': <List<Object?>>[
            ['sqlcipher'],
          ],
        },
        failExecuteStatements: {pragmaKey},
      );

      expect(
        () => DatabaseEncryption.setupEncryptedDatabase(fake, key),
        throwsA(isA<DatabaseKeyVerificationException>()),
      );
    });

    test('setup fails closed when PRAGMA cipher throws', () {
      final fake = FakeRawDatabase(
        {},
        failSelectStatements: {'PRAGMA cipher;'},
      );

      expect(
        () => DatabaseEncryption.setupEncryptedDatabase(
          fake,
          List<int>.filled(32, 1),
        ),
        throwsA(isA<DatabaseEncryptionUnavailableException>()),
      );
      expect(fake.executedStatements, isEmpty);
    });

    test('setup fails closed when cipher is not sqlcipher after selection', () {
      final callCount = <String, int>{};
      final fake = _CipherSelectCountingFake(
        results: {
          'PRAGMA cipher;': <List<Object?>>[
            ['sqlcipher'],
          ],
        },
        overrideSelectResults: {
          'PRAGMA cipher;': <List<Object?>>[
            ['aes-256-xts'],
          ],
        },
        overrideAfterCall: 1,
        callCounts: callCount,
        sqliteMasterResults: <List<Object?>>[],
      );

      expect(
        () => DatabaseEncryption.setupEncryptedDatabase(
          fake,
          List<int>.filled(32, 1),
        ),
        throwsA(isA<DatabaseEncryptionUnavailableException>()),
      );
      expect(fake.executedStatements, ["PRAGMA cipher = 'sqlcipher'"]);
    });
  });
}

class FakeRawDatabase implements RawDatabaseHandle {
  FakeRawDatabase(
    this.results, {
    this.failSelectStatements = const {},
    this.failExecuteStatements = const {},
  });

  final Map<String, List<List<Object?>>> results;
  final Set<String> failSelectStatements;
  final Set<String> failExecuteStatements;
  final List<String> executedStatements = [];
  final List<String> selectedStatements = [];

  @override
  List<List<Object?>> select(String sql) {
    selectedStatements.add(sql);
    if (failSelectStatements.contains(sql)) {
      throw StateError('verification failed');
    }
    return results[sql] ?? <List<Object?>>[];
  }

  @override
  void execute(String sql) {
    executedStatements.add(sql);
    if (failExecuteStatements.contains(sql)) {
      throw StateError('execute failed');
    }
  }
}

class _CipherSelectCountingFake extends FakeRawDatabase {
  _CipherSelectCountingFake({
    required Map<String, List<List<Object?>>> results,
    required this.overrideSelectResults,
    required this.overrideAfterCall,
    required this.callCounts,
    required this.sqliteMasterResults,
  }) : super(results);

  final Map<String, List<List<Object?>>> overrideSelectResults;
  final int overrideAfterCall;
  final Map<String, int> callCounts;
  final List<List<Object?>> sqliteMasterResults;

  @override
  List<List<Object?>> select(String sql) {
    callCounts[sql] = (callCounts[sql] ?? 0) + 1;
    if (sql == 'SELECT * FROM sqlite_master') {
      selectedStatements.add(sql);
      return sqliteMasterResults;
    }
    if (callCounts[sql]! > overrideAfterCall &&
        overrideSelectResults.containsKey(sql)) {
      selectedStatements.add(sql);
      return overrideSelectResults[sql]!;
    }
    return super.select(sql);
  }
}
