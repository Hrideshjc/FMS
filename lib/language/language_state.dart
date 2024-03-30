import 'package:flutter/foundation.dart';

import '../utils/constant/app_enum.dart';
import '../utils/constant/constant.dart';
import '../utils/preferences/user_preferences.dart';


class LanguageState extends ChangeNotifier {
  LanguageState() {
    _init();
  }
  _init() async {
    Lang? lang = await Preference.getAppLanguage();

    Constants.currentLang = Constants.currentLang;
    notifyListeners();
  }
  void setLang(Lang lang) async {
    Constants.currentLang = lang;
    await Preference.saveAppLanguage(lang);
    notifyListeners();
  }
}