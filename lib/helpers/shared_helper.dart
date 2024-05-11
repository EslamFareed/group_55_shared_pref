import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static bool checkLogin() {
    return prefs!.getBool("isLogin") ?? false;
  }

  static Future<void> logout() async {
    await prefs!.remove("email");
    await prefs!.remove("password");
    await prefs!.setBool("isLogin", false);
  }
}
