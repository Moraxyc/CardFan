import 'dart:convert';

import 'package:cardfan/core/database/database_encryption.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const localDatabaseKeyStorageKey = 'cardfan.local_database_key.v1';

abstract interface class DatabaseKeyStore {
  Future<List<int>> readOrCreateDatabaseKey();
}

abstract interface class KeyValueSecretStorage {
  Future<String?> read({required String key});

  Future<void> write({required String key, required String value});
}

class FlutterSecureKeyValueStorage implements KeyValueSecretStorage {
  const FlutterSecureKeyValueStorage(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<String?> read({required String key}) {
    return _storage.read(
      key: key,
      aOptions: _androidOptions,
      iOptions: _iosOptions,
    );
  }

  @override
  Future<void> write({required String key, required String value}) {
    return _storage.write(
      key: key,
      value: value,
      aOptions: _androidOptions,
      iOptions: _iosOptions,
    );
  }

  static const _androidOptions = AndroidOptions(
    // Keep the plan-required Android secure storage path until the design is updated.
    // ignore: deprecated_member_use
    encryptedSharedPreferences: true,
  );
  static const _iosOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device,
  );
}

class InvalidStoredDatabaseKeyException implements Exception {
  const InvalidStoredDatabaseKeyException();

  @override
  String toString() {
    return 'Stored database key is missing or invalid.';
  }
}

class DatabaseKeyCodec {
  const DatabaseKeyCodec._();

  static String encode(List<int> key) {
    return base64UrlEncode(key);
  }

  static List<int> decode(String encodedKey) {
    try {
      final decoded = base64Url.decode(base64Url.normalize(encodedKey));
      if (decoded.length != 32) {
        throw const InvalidStoredDatabaseKeyException();
      }
      return List<int>.unmodifiable(decoded);
    } on FormatException {
      throw const InvalidStoredDatabaseKeyException();
    }
  }
}

class SecureStorageDatabaseKeyStore implements DatabaseKeyStore {
  const SecureStorageDatabaseKeyStore({required KeyValueSecretStorage storage})
    : _storage = storage;

  final KeyValueSecretStorage _storage;

  @override
  Future<List<int>> readOrCreateDatabaseKey() async {
    final storedKey = await _storage.read(key: localDatabaseKeyStorageKey);
    if (storedKey != null) {
      return DatabaseKeyCodec.decode(storedKey);
    }

    final key = DatabaseEncryption.generateDatabaseKey();
    await _storage.write(
      key: localDatabaseKeyStorageKey,
      value: DatabaseKeyCodec.encode(key),
    );
    return key;
  }
}
