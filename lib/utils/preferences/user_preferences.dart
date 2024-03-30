import 'package:shared_preferences/shared_preferences.dart';

import '../constant/app_enum.dart';

class Preference {
  static const _lang = 'lang';

  static saveAppLanguage(Lang lang) async {
    var pref = await SharedPreferences.getInstance();
    return pref.setString(_lang, lang.toString());
  }


  static Future<Lang?> getAppLanguage() async {
    var pref = await SharedPreferences.getInstance();
    var res = pref.getString(_lang);
    print("this is ress $res}");
    if (res == null) return null;
    return res == Lang.ENG.toString() ? Lang.ENG: Lang.NP;
  }

  static clear() async {
    var pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
