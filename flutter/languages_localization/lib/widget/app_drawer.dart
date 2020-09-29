import 'package:flutter/material.dart';
import 'package:languages_localization/localization/localization_constants.dart';
import 'package:languages_localization/screens/about_screen.dart';
import 'package:languages_localization/screens/home_screen.dart';
import 'package:languages_localization/screens/setting_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Container(
              // height: MediaQuery.of(context).size.height *  0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              child: CircleAvatar(
                backgroundColor: Colors.amber,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 30,
              color: Colors.grey,
            ),
            title: Text(
              getTranslated(context, 'home_page'),
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(MyHomeScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              size: 30,
              color: Colors.grey,
            ),
            title: Text(
              getTranslated(context, 'about_us'),
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AboutScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 30,
              color: Colors.grey,
            ),
            title: Text(
              getTranslated(context, 'settings'),
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(SettingScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
