import 'package:flutter/material.dart';
import 'package:languages_localization/localization/localization_constants.dart';
import 'package:languages_localization/widget/app_drawer.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = 'about_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'about_us')),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(getTranslated(context, 'about')),
      ),
    );
  }
}
