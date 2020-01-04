import 'package:flutter/material.dart';

import 'package:user_preferences_flutter_app/src/pages/home_page.dart';
import 'package:user_preferences_flutter_app/src/pages/settings_page.dart';

import 'package:user_preferences_flutter_app/src/preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = new Preferences();
  await preferences.initPreferences();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final preferences = new Preferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferences',
      debugShowCheckedModeBanner: false,
      initialRoute: preferences.lastPage,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
