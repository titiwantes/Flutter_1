import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {

  static Future<String?> getThemeParameters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var val = prefs.getString('theme');
    return val;
  }

  static Future setThemeParameters(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('theme', value);
  }
}