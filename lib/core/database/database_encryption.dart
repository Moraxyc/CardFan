import 'dart:math';

import 'package:sqlite3/sqlite3.dart' as sqlite;

const databaseCryptoSuite = 'sqlite3mc-sqlcipher-v4-aes-256';

abstract interface class RawDatabaseHandle {
  List<List<Object?>> select(String sql);

  void execute(String sql);
}

class SqliteRawDatabaseHandle implements RawDatabaseHandle {
  SqliteRawDatabaseHandle(this._database);

  final sqlite.Database _database;

  @override
  List<List<Object?>> select(String sql) {
    return _database.select(sql).map((row) => row.values).toList();
  }

  @override
  void execute(String sql) {
    _database.execute(sql);
  }
}

class DatabaseEncryptionUnavailableException implements Exception {
  const DatabaseEncryptionUnavailableException([this.cause]);

  final Object? cause;

  @override
  String toString() {
    return cause != null
        ? 'Encrypted SQLite support is unavailable. Check sqlite3mc build hooks.: $cause'
        : 'Encrypted SQLite support is unavailable. Check sqlite3mc build hooks.';
  }
}

class DatabaseKeyVerificationException implements Exception {
  const DatabaseKeyVerificationException(this.cause);

  final Object cause;

  @override
  String toString() {
    return 'Unable to verify encrypted database key: $cause';
  }
}

class DatabaseEncryption {
  const DatabaseEncryption._();

  static List<int> generateDatabaseKey() {
    final random = Random.secure();
    return List<int>.generate(32, (_) => random.nextInt(256), growable: false);
  }

  static String rawSqlCipherKeyLiteral(List<int> databaseKey) {
    if (databaseKey.length != 32) {
      throw ArgumentError.value(
        databaseKey.length,
        'databaseKey.length',
        'Database key must be exactly 32 bytes',
      );
    }

    final hex = databaseKey
        .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
        .join();
    return "x'$hex'";
  }

  static void setupEncryptedDatabase(
    RawDatabaseHandle database,
    List<int> databaseKey,
  ) {
    try {
      if (database.select('PRAGMA cipher;').isEmpty) {
        throw const DatabaseEncryptionUnavailableException();
      }
    } catch (e) {
      if (e is DatabaseEncryptionUnavailableException) rethrow;
      throw DatabaseEncryptionUnavailableException(e);
    }

    database.execute("PRAGMA cipher = 'sqlcipher'");

    try {
      final cipherRows = database.select('PRAGMA cipher;');
      if (cipherRows.isEmpty ||
          cipherRows.first.isEmpty ||
          (cipherRows.first.first != 'sqlcipher' &&
              cipherRows.first.first != 4)) {
        throw const DatabaseEncryptionUnavailableException();
      }
    } catch (e) {
      if (e is DatabaseEncryptionUnavailableException) rethrow;
      throw DatabaseEncryptionUnavailableException(e);
    }

    try {
      database.execute('PRAGMA key = "${rawSqlCipherKeyLiteral(databaseKey)}"');
    } catch (_) {
      // Do not expose the caught exception: it may embed the PRAGMA key SQL
      // (including the key literal) in its message.
      throw const DatabaseKeyVerificationException('key application failed');
    }

    try {
      database.select('SELECT * FROM sqlite_master');
    } catch (error) {
      throw DatabaseKeyVerificationException(error);
    }
  }
}
