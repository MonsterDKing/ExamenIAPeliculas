import 'dart:convert';

import 'package:examenia/models/LoginResponseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String userInfo = 'userInfo';
  static const String tokenKey = 'token';

  static LocalStorageService _instance;
  static SharedPreferences _preferences;

  static Future<LocalStorageService> get storageInstance async {
    _instance ??= LocalStorageService();
    _preferences ??= await SharedPreferences.getInstance();

    return _instance;
  }

  dynamic _getFromDisk(String key) {
    return _preferences.get(key);
  }

  void _saveToDisk<T>(String key, T content) {
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  // user info

  LoginResponseModel get getUserInfo {
    final String u = _getFromDisk(userInfo) as String;
    if (u == null) {
      return LoginResponseModel();
    }
    final Map<String, dynamic> data = json.decode(u) as Map<String, dynamic>;

    return LoginResponseModel.fromJson(data);
  }

  set setUserInfo(LoginResponseModel u) {
    _saveToDisk(userInfo, json.encode(u.toJson()));
  }
  //user info

  /// Retrieves the driver's token stored at sign-in.
  String get gettokenStore {
    final String token = _getFromDisk(tokenKey) as String;
    return token;
  }

  /// Saves the driver's token ar sign-in.
  set settokenStore(String token) {
    _saveToDisk(tokenKey, token);
  }

  /// Clears the localstorage.
  void clear() {
    _preferences.clear();
  }
}
