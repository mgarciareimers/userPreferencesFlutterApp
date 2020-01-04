import 'package:flutter/material.dart';

import 'package:user_preferences_flutter_app/src/widgets/menu_widget.dart';
import 'package:user_preferences_flutter_app/src/preferences/preferences.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final preferences = new Preferences();

  @override
  Widget build(BuildContext context) {
    this.preferences.lastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences'),
        backgroundColor: preferences.secondaryColor ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Secondary Color: ${preferences.secondaryColor}'),
          Divider(),
          Text('Gender: ${preferences.gender}'),
          Divider(),
          Text('User Name: ${preferences.username}'),
          Divider(),
        ],
      ),
    );
  }
}