import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsServices {
  static const String _key = "key";

  static save(String user) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(
      _key,
      jsonEncode(
        {"user": user, "isAuth": true},
      ),
    );
  }

  static Future<bool> isAuth() async {
    var pref = await SharedPreferences.getInstance();
    var result = pref.getString(_key);
    if (result != null) {
      var user = jsonDecode(result);
      return user['isAuth'];
    }
    return false;
  }

  static logout() async {
    var pref = await SharedPreferences.getInstance();
    await pref.remove(_key);
  }
}
