import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class DemoLocalizations {
  final Locale locale;

  DemoLocalizations(this.locale);

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  Map<String, String> _localizeValue;

  Future load() async {
    String jsonStringValue = await rootBundle.loadString('lib/lang/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValue);
    _localizeValue = mappedJson.map((key, value) => MapEntry(key, value.toString()),);
  }

  String  getTranslatedValue (String key) {
    return _localizeValue[key];
  }

  static const LocalizationsDelegate<DemoLocalizations> delegate = _DemoLocalizationsDelegate();
}

class _DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {

  const _DemoLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'fa', 'ar' , 'hi' ].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load (Locale locale) async{
   DemoLocalizations localizations = DemoLocalizations(locale);
   await localizations.load();
   return localizations;
  }

  @override
  bool shouldReload(_DemoLocalizationsDelegate old) => false;
  
}