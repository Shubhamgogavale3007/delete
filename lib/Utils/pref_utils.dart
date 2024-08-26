import 'package:shared_preferences/shared_preferences.dart';
import 'package:shubham_practical/Core/app_string.dart';

import 'logger.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  static init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    Logger().v("Instance created PrefUtils");
  }

  /// will clear all the data stored in preference
  static clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  static Future<void> setAuthToken(String value) {
    return _sharedPreferences!.setString(AppString.authToken, value);
  }

  static String getAuthToken() {
    try {
      return _sharedPreferences!.getString(AppString.authToken) ?? '';
    } catch (e) {
      return '';
    }
  }
}
