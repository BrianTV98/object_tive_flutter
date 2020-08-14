import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences _prefs;
  SharedPref._();
  static SharedPref instance;
  static Future<SharedPref> getInstance() async {
    if (instance == null) {
      _prefs = await SharedPreferences.getInstance();
      instance = SharedPref._();
      return instance;
    } else
      return instance;
  }

  void setInt(String key, int value) {
    _prefs.setInt(key, value);
  }

  void setString(String key, String value) {
    _prefs.setString(key, value);
  }

  void setDouble(String key, double value) {
    _prefs.setDouble(key, value);
  }

  void setBool(String key, bool value) {
    _prefs.setBool(key, value);
  }

  int getInt(String key) {
    return _prefs.getInt(key) ?? 0;
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  double getDouble(String key) {
    return _prefs.getDouble(key) ?? 0;
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  Future<bool> removeSharedPref(String key) async {
    return await _prefs.remove(key) ?? false;
  }

  void clearSharedPref(String key) {
    _prefs.clear();
  }
}
