import 'package:flutter/material.dart';
import 'package:languages_localization/localization/demo_localization.dart';
import 'package:languages_localization/localization/localization_constants.dart';
import './screens/home_screen.dart';
import './screens/about_screen.dart';
import './screens/setting_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  
  @override
  void didChangeDependencies() {
    getLocale().then((locale){
       setState(() {
         this._locale = locale;
       });
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        DemoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: [
        Locale('en' , 'US'),
        Locale('fa', 'IR'),
        Locale('ar', 'EG'),
        Locale('hi', 'IN'),
      ],
      localeListResolutionCallback: (deviceLocale, supportedLocales){
        for(var locale in supportedLocales) {
          for (var local in deviceLocale) {
            if(locale.languageCode == local.languageCode && locale.countryCode == local.countryCode){
              print(local);
              return local;
            }
          }

        }
        return supportedLocales.first;
      },
      home: MyHomeScreen(),
      routes: {
        MyHomeScreen.routeName :  (ctx) => MyHomeScreen(),
        AboutScreen.routeName : (ctx) => AboutScreen(),
        SettingScreen.routeName : (ctx) => SettingScreen(),
      },
    );
  }
}


// localeListResolutionCallback: (deviceLocale, supportedLocales){
// for(var locale in supportedLocales) {
// if(locale.languageCode ==  deviceLocale.languageCode && locale.countryCode == deviceLocale.countryCode) {
// return deviceLocale;
// }
// }
// return supportedLocales.first;
// },

