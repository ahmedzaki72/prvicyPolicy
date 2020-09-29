import 'package:flutter/material.dart';
import 'package:languages_localization/localization/demo_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslated(BuildContext context, String key){
  return DemoLocalizations.of(context).getTranslatedValue(key);
}


/// language code

const String ENGLISH = 'en';
const String FARSI = 'fa';
const String ARABIC = 'ar';
const String HINDA  = 'hi';


/// language code

const String LANGUAGE_CODE = 'languageCode';

Future<Locale> setLocales(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);

  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;
  switch (languageCode) {
    case ENGLISH:
      _temp = Locale(languageCode, 'US');
      break;
    case FARSI:
      _temp = Locale(languageCode, 'IR');
      break;
    case ARABIC:
      _temp = Locale(languageCode, 'EG');
      break;
    case HINDA:
      _temp = Locale(languageCode, 'IN');
      break;
    default:
      _temp = Locale(languageCode, 'US');
  }
  return _temp;
}


Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String  languageCode = _prefs.getString(LANGUAGE_CODE) ?? ENGLISH;

  return _locale(languageCode);
}

