import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String _darkModeKey = "darkMode";

  static Future<bool> loadDarkMode() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_darkModeKey) ?? false;
  }

  static Future<void> setDarkMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_darkModeKey, isDark);
  }
}
