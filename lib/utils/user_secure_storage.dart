import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _storage = FlutterSecureStorage();
  static const _keyToken = 'token';

  static Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  static Future<void> setToken(String token) async {
    return await _storage.write(key: _keyToken, value: token);
  }

  static Future<void> deleteToken() async {
    return await _storage.delete(key: _keyToken);
  }

  static Future<void> removeUser() async {
    return await _storage.deleteAll();
  }
}
