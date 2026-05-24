import 'package:cardfan/core/database/database_key_store.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  group('FlutterSecureKeyValueStorage', () {
    test(
      'passes secure storage options for every supported platform',
      () async {
        final secureStorage = RecordingFlutterSecureStorage();
        final storage = FlutterSecureKeyValueStorage(secureStorage);

        await storage.write(key: 'database_key', value: 'stored_key');
        await storage.read(key: 'database_key');

        final expectedAndroidOptions = const AndroidOptions(
          // Keep in sync with the app's current Android secure storage path.
          // ignore: deprecated_member_use
          encryptedSharedPreferences: true,
        ).params;
        final expectedAppleOptions = const IOSOptions(
          accessibility: KeychainAccessibility.first_unlock_this_device,
        ).params;
        final expectedMacOsOptions = const MacOsOptions(
          accessibility: KeychainAccessibility.first_unlock_this_device,
        ).params;

        expect(
          secureStorage.writeAndroidOptions?.params,
          expectedAndroidOptions,
        );
        expect(secureStorage.writeIosOptions?.params, expectedAppleOptions);
        expect(
          secureStorage.writeLinuxOptions?.params,
          const LinuxOptions().params,
        );
        expect(
          secureStorage.writeWindowsOptions?.params,
          const WindowsOptions().params,
        );
        expect(
          secureStorage.writeWebOptions?.params,
          const WebOptions().params,
        );
        expect(secureStorage.writeMacOsOptions?.params, expectedMacOsOptions);
        expect(
          secureStorage.readAndroidOptions?.params,
          expectedAndroidOptions,
        );
        expect(secureStorage.readIosOptions?.params, expectedAppleOptions);
        expect(
          secureStorage.readLinuxOptions?.params,
          const LinuxOptions().params,
        );
        expect(
          secureStorage.readWindowsOptions?.params,
          const WindowsOptions().params,
        );
        expect(secureStorage.readWebOptions?.params, const WebOptions().params);
        expect(secureStorage.readMacOsOptions?.params, expectedMacOsOptions);
      },
    );
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

class RecordingFlutterSecureStorage extends FlutterSecureStorage {
  AndroidOptions? readAndroidOptions;
  AppleOptions? readIosOptions;
  LinuxOptions? readLinuxOptions;
  WindowsOptions? readWindowsOptions;
  WebOptions? readWebOptions;
  AppleOptions? readMacOsOptions;
  AndroidOptions? writeAndroidOptions;
  AppleOptions? writeIosOptions;
  LinuxOptions? writeLinuxOptions;
  WindowsOptions? writeWindowsOptions;
  WebOptions? writeWebOptions;
  AppleOptions? writeMacOsOptions;

  final Map<String, String> _values = {};

  @override
  Future<String?> read({
    required String key,
    AppleOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    readAndroidOptions = aOptions;
    readIosOptions = iOptions;
    readLinuxOptions = lOptions;
    readWindowsOptions = wOptions;
    readWebOptions = webOptions;
    readMacOsOptions = mOptions;
    return _values[key];
  }

  @override
  Future<void> write({
    required String key,
    required String? value,
    AppleOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    writeAndroidOptions = aOptions;
    writeIosOptions = iOptions;
    writeLinuxOptions = lOptions;
    writeWindowsOptions = wOptions;
    writeWebOptions = webOptions;
    writeMacOsOptions = mOptions;
    if (value == null) {
      _values.remove(key);
    } else {
      _values[key] = value;
    }
  }
}
