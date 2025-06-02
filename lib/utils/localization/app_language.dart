import 'package:denta_soft/screens/DrawerScreens/ChangeLanguage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale('device');

  Locale get appLocal => _appLocale;
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('device');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code').toString());
    return _appLocale;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    //    if (_appLocale == type) {
    //      return;
    //    }
    switch (type.languageCode) {
      case "ar":
        {
          _appLocale = Locale("ar");
          await prefs.setString('language_code', 'ar');
          await prefs.setString('countryCode', '');
        }
        break;
      case "en":
        {
          _appLocale = Locale("en");
          await prefs.setString('language_code', 'en');
          await prefs.setString('countryCode', '');
        }
        break;
      // case "fr":
      //   {
      //     _appLocale = Locale("fr");
      //     await prefs.setString('language_code', 'fr');
      //     await prefs.setString('countryCode', '');
      //   }
      //   break;
      case "device":
        {
          _appLocale = Locale("device");
          await prefs.setString('language_code', 'device');
          await prefs.setString('countryCode', '');
        }
        break;
      default:
        {
          _appLocale = Locale("en");
          await prefs.setString('language_code', 'en');
          await prefs.setString('countryCode', '');
        }
        break;
    }
    notifyListeners();
  }

  // this in change language screen
  LanguageSite language = LanguageSite.en;

  setLanguage(LanguageSite _language) {
    language = _language;
    notifyListeners();
  }
}

// String getLanguageCode(int languageId) {
//   if (languageId == 2) {
//     return 'ar';
//   } else if (languageId == 3) {
//     return 'fr';
//   } else {
//     return 'en';
//   }
// }

// int get getLanguageId {
//   final currentLocale = Intl.getCurrentLocale();
//   if (currentLocale.contains('ar')) {
//     return 2;
//   } else if (currentLocale.contains('fr')) {
//     return 3;
//   } else {
//     return 1;
//   }
// }

// Future<int> getLocaleId(String locale) async {
//   if (locale == 'ar') {
//     return 2;
//   } else if (locale == 'fr') {
//     return 3;
//   } else {
//     return 1;
//   }
// }
