import 'package:flutter/material.dart';

import 'package:user_preferences_flutter_app/src/preferences/preferences.dart';

import 'package:user_preferences_flutter_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _secondaryColor = true;
  int _gender = 1;
  String _username = 'Peter';

  TextEditingController _textEditingController;

  final preferences = new Preferences();

  @override
  void initState() {
    super.initState();

    this.preferences.lastPage = SettingsPage.routeName;

    this._gender = this.preferences.gender;
    this._secondaryColor = this.preferences.secondaryColor;
    this._username = this.preferences.username;

    this._textEditingController = new TextEditingController(text: this._username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: preferences.secondaryColor ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
            child: Text('Settings', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
            value: this._secondaryColor,
            title: Text('Secondary Color'),
            onChanged: this._setSecondaryColor,
          ),
          RadioListTile(
            value: 1,
            title: Text('Male'),
            groupValue: this._gender,
            onChanged: this._setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Female'),
            groupValue: this._gender,
            onChanged: this._setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                helperText: 'Name of the person that uses the phone',
              ),
              controller: this._textEditingController,
              onChanged: this._setUsername,
            ),
          ),
        ],
      ),
    );
  }

  // Method that sets the selected radio value.
  _setSelectedRadio(int value) async {
    this.preferences.gender = value;
    this._gender = value;

    setState(() {});
  }

  // Method that sets the secondary color value.
  _setSecondaryColor(bool value) async {
    this.preferences.secondaryColor = value;
    this._secondaryColor = value;

    setState(() {});
  }

  // Method that sets the user name value.
  _setUsername(String value) async {
    this.preferences.username = value;
    this._username = value;

    setState(() {});
  }
}