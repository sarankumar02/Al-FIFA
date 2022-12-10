import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsBloc {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _language = BehaviorSubject<Locale>();
  SettingsBloc() {
    _initializeLanguage();
  }

  Stream<Locale> get language => _language.stream;
  _initializeLanguage() async {
    String lang = await _getSavedLanguage();
    print("LAAANG $lang");

    _language.sink.add(Locale(lang, ""));
    print("LAAANG $lang");
  }

  _getSavedLanguage() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String lang = _prefs.getString("lang") ?? "en";
    return lang;
  }

  changeLanguage(langCode) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString("lang", langCode);
    _language.sink.add(Locale("$langCode", ""));
  }

  // getStoredTheme() async {
  //   final SharedPreferences prefs = await _prefs;
  //   final theme = (prefs.getInt('theme') ?? 1);
  //   theme == 0
  //       ? _appTheme.sink.add(AppConstants.darkTheme)
  //       : _appTheme.sink.add(AppConstants.lightTheme);
  // }

  final BehaviorSubject<ThemeData> _appTheme = BehaviorSubject<ThemeData>();

  //
  BehaviorSubject<ThemeData> get appTheme => _appTheme;

  //

  // toggleAppTheme() async {
  //   bool result =
  //       _appTheme.hasValue && _appTheme.value.brightness == Brightness.dark;
  //   result
  //       ? _appTheme.sink.add(AppConstants.lightTheme)
  //       : _appTheme.sink.add(AppConstants.darkTheme);

  //   final SharedPreferences prefs = await _prefs;
  //   prefs.setInt('theme', result ? 1 : 0);
  // }

  dispose() {
    _appTheme.close();
  }
}


// import 'package:flutter/material.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SettingsBloc {
//   final _language = BehaviorSubject<Locale>();
//   SettingsBloc() {
//     _initializeLanguage();
//   }
//   Stream<Locale> get language => _language.stream;
//   _initializeLanguage() async {
//     String lang = await _getSavedLanguage();
//     _language.sink.add(Locale(lang, ""));
//   }

//   _getSavedLanguage() async {
//     SharedPreferences _prefs = await SharedPreferences.getInstance();
//     String lang = _prefs.getString("lang") ?? "en";
//     return lang;
//   }

//   changeLanguage(langCode) async {
//     SharedPreferences _prefs = await SharedPreferences.getInstance();
//     _prefs.setString("lang", langCode);
//     _language.sink.add(Locale("$langCode", ""));
//   }
// }

// final settingsBloc = SettingsBloc();
