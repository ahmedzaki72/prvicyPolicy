import 'package:flutter/material.dart';
import 'package:languages_localization/localization/localization_constants.dart';
import 'package:languages_localization/widget/app_drawer.dart';
import '../models/languages.dart';
import 'package:languages_localization/main.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = 'setting_screen';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'settings')),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Center(
          child: DropdownButton<Language>(
            hint: Text(getTranslated(context, 'change_language'),),
            icon: Icon(
              Icons.arrow_drop_down,
              size: 30,
            ),
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                  (lan) => DropdownMenuItem(
                value: lan,
                child: Row(
                  children: [
                    Text(lan.name),
                  ],
                ),
              ),
            )
                .toList(),
            onChanged: (Language value) async{
              Locale _temp =await setLocales(value.languageCode);
              MyApp.setLocale(context, _temp);
            },
          ),
        ),
      ),
    );
  }
}
