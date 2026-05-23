import 'package:cardfan/core/database/database_key_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SecureStorageDatabaseKeyStore', () {
    test(
      'generates and stores a new local database key on first use',
      () async {
        final storage = FakeSecureStorage();
        final store = SecureStorageDatabaseKeyStore(storage: storage);

        final key = await store.readOrCreateDatabaseKey();

        expect(key, hasLength(32));
        expect(storage.values, contains(localDatabaseKeyStorageKey));
        expect(storage.values, isNot(contains('recovery_key')));
      },
    );

    test('reuses an existing valid local database key', () async {
      final storage = FakeSecureStorage();
      final existingKey = List<int>.filled(32, 7);
      await storage.write(
        key: localDatabaseKeyStorageKey,
        value: DatabaseKeyCodec.encode(existingKey),
      );
      final store = SecureStorageDatabaseKeyStore(storage: storage);

      final key = await store.readOrCreateDatabaseKey();

      expect(key, existingKey);
      expect(storage.writeCount, 1);
    });

    test('rejects a stored key that is not valid base64url', () async {
      final storage = FakeSecureStorage();
      await storage.write(key: localDatabaseKeyStorageKey, value: 'not valid');
      final store = SecureStorageDatabaseKeyStore(storage: storage);

      expect(
        store.readOrCreateDatabaseKey(),
        throwsA(isA<InvalidStoredDatabaseKeyException>()),
      );
    });

    test('rejects a stored key that is not 256 bits', () async {
      final storage = FakeSecureStorage();
      await storage.write(
        key: localDatabaseKeyStorageKey,
        value: DatabaseKeyCodec.encode(List<int>.filled(31, 1)),
      );
      final store = SecureStorageDatabaseKeyStore(storage: storage);

      expect(
        store.readOrCreateDatabaseKey(),
        throwsA(isA<InvalidStoredDatabaseKeyException>()),
      );
    });

    test('concurrent first-launch callers share one generated key', () async {
      final storage = FakeSecureStorage();
      final store = SecureStorageDatabaseKeyStore(storage: storage);

      final results = await Future.wait([
        store.readOrCreateDatabaseKey(),
        store.readOrCreateDatabaseKey(),
        store.readOrCreateDatabaseKey(),
      ]);

      expect(results[0], results[1]);
      expect(results[1], results[2]);
      expect(storage.writeCount, 1);
    });
  });
}

class FakeSecureStorage implements KeyValueSecretStorage {
  // `contains` on a Map checks keys; `values` here is the storage map, not its values.
  final Map<String, String> values = {};
  int writeCount = 0;

  @override
  Future<String?> read({required String key}) async {
    return values[key];
  }

  @override
  Future<void> write({required String key, required String value}) async {
    writeCount += 1;
    values[key] = value;
  }
}
