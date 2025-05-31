import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageController {
  static final StorageController _instance = StorageController._internal();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  factory StorageController() {
    return _instance;
  }

  StorageController._internal();

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'access_token', value: token);
    // Weryfikacja zapisu
    String? savedToken = await _storage.read(key: 'access_token');
    print('Token zapisany: $savedToken');
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'access_token');
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'access_token');
  }

  Future<Map<String, String>> getAllValues() async {
    return await _storage.readAll();
  }
}