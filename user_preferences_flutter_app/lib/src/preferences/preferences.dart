import 'package:shared_preferences/shared_preferences.dart';

import 'package:user_preferences_flutter_app/src/pages/home_page.dart';

class Preferences {

  static final Preferences _instance = new Preferences._internal();

  factory Preferences() {
    return _instance;
  }

  Preferences._internal();

  SharedPreferences _sharedPreferences;

  initPreferences() async {
    this._sharedPreferences = await SharedPreferences.getInstance();
  }

  // Gender.
  get gender { return this._sharedPreferences.getInt('gender') ?? 1; }
  set gender(int value) { this._sharedPreferences.setInt('gender', value); }

  // Secondary Color.
  get secondaryColor { return this._sharedPreferences.getBool('secondaryColor') ?? false; }
  set secondaryColor(bool value) { this._sharedPreferences.setBool('secondaryColor', value); }

  // Username.
  get username { return this._sharedPreferences.getString('username') ?? ''; }
  set username (String value) { this._sharedPreferences.setString('username', value); }

  // Last Page.
  get lastPage { return this._sharedPreferences.getString('lastPage') ?? HomePage.routeName; }
  set lastPage (String value) { this._sharedPreferences.setString('lastPage', value); }
}