import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  Future<bool> removeAuthentication() async {
    final shared = await SharedPreferences.getInstance();
    Future.wait([
      shared.remove('token'),
      shared.remove('userId'),
      shared.remove('device_token'),
    ]);
    return true;
  }

  Future<void> setToken(String token) async {
    final shared = await SharedPreferences.getInstance();
    await shared.setString('token', token);
  }

  Future<void> setDeviceToken(String token) async {
    final shared = await SharedPreferences.getInstance();
    await shared.setString('device_token', token);
  }

  Future<void> setUserId(String userId) async {
    final shared = await SharedPreferences.getInstance();
    await shared.setString('userId', userId);
  }

  Future<String> getToken() async {
    final shared = await SharedPreferences.getInstance();
    return shared.getString('token') ?? '';
  }

  Future<String> getDeviceToken() async {
    final shared = await SharedPreferences.getInstance();
    return shared.getString('device_token') ?? '';
  }

  Future<String> getUserId() async {
    final shared = await SharedPreferences.getInstance();
    return shared.getString('userId') ?? '';
  }
}
