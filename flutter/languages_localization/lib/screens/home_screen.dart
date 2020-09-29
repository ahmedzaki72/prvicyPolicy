import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:languages_localization/localization/localization_constants.dart';
import 'package:languages_localization/main.dart';
import '../widget/app_drawer.dart';
import '../constants.dart';
import '../models/languages.dart';

class MyHomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // void _showSelectedTimePicker = (BuildContext context) {
  //     showTimePicker(context: context, initialTime: TimeOfDay.now());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslated(context, 'home_page'),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: DropdownButton(
              icon: Icon(
                Icons.language,
                color: Colors.white,
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
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Center(
                  child: Text(
                    getTranslated(context, 'personal_info'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return getTranslated(context, 'required_field');
                    }
                    return null;
                  },
                  decoration: kInputDecoration.copyWith(
                    hintText: getTranslated(context, 'name_hint'),
                    labelText: getTranslated(context, 'name'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return getTranslated(context, 'required_field');
                    }
                    return null;
                  },
                  decoration: kInputDecoration.copyWith(
                    hintText: getTranslated(context, 'name_email'),
                    labelText: getTranslated(context, 'email'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return getTranslated(context, 'required_field');
                    }
                    return null;
                  },
                  onTap: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year),
                      lastDate: DateTime(DateTime.now().year + 20),
                    );
                  },
                  decoration: kInputDecoration.copyWith(
                    hintText: getTranslated(context, 'date_of_birth'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                    }
                  },
                  child: Text(
                    getTranslated(context, 'submit_info'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
