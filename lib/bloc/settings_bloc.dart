import 'dart:async';
import 'dart:io';

import 'package:al_fifa/Widgets/custom_loader.dart';
import 'package:al_fifa/models/about_us.dart';
import 'package:al_fifa/models/contact_us.dart';
import 'package:al_fifa/repository/settings_repo.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsBloc {
  final _settingsRepo = SettingsRepository();
  final _language = BehaviorSubject<Locale>();
  final _name = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _subject = BehaviorSubject<String>();
  final _message = BehaviorSubject<String>();
  final BehaviorSubject<bool> _userLogin = BehaviorSubject<bool>.seeded(false);
  Function(String) get changeName => _name.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changeSubject => _subject.sink.add;
  Function(String) get changeMessage => _message.sink.add;
  Stream<String> get name => _name.stream.transform(validateName);
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get subject => _subject.stream.transform(validateSubject);
  Stream<String> get message => _message.stream.transform(validateMessage);
  Stream<bool> get userLogin => _userLogin;
  // Stream<bool>  get userLogin => _userLogin.stream;
  Stream<bool> get contectUsValid => Rx.defer(
      () => Rx.combineLatest([name, email, subject, message], (values) {
            return true;
          }),
      reusable: true);
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (emailAdd, sink) async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailAdd);
    if (!emailValid) {
      sink.addError('Enter a valid email');
    } else {
      sink.add(emailAdd);
    }
  });
  final validateName = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError('Name must have more that 2 characters');
    } else {
      sink.add(value);
    }
  });
  final validateSubject = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError('Subject must have more that 2 characters');
    } else {
      sink.add(value);
    }
  });
  final validateMessage = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError('Message must have more that 2 characters');
    } else {
      sink.add(value);
    }
  });
  changeUserLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var loggedIn=prefs.getBool("LoggedIn");
    print("Logged$loggedIn");
    _userLogin.sink.add(loggedIn??false);
    print(_userLogin.value);
  }

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString("lang") ?? "en";
    return lang;
  }

  changeLanguage(langCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", langCode);
    _language.sink.add(Locale("$langCode", ""));
  }

  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
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

  Stream<AboutModelResponse> getAboutus(
      {required BuildContext context}) async* {
    context.loaderOverlay.show(widget: customLoader());
    var response = await _settingsRepo.getAboutus();
    context.loaderOverlay.hide();

    yield response;
  }

  Future contactUsSubmit({required BuildContext context}) async {
    Map body = {
      "name": _name.value,
      "email": _email.value,
      "subject": _subject.value,
      "message": _message.value
    };
    print("REG BODY ==" + body.toString());
    context.loaderOverlay.show(widget: customLoader());
    var response = await _settingsRepo.contactUsSubmit(body: body);
    context.loaderOverlay.hide();

    print("res" + response.contactModel!.message!);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.contactModel!.message!)));
    if (response.contactModel!.successMsg == 1) {
      Navigator.of(context).pop();
      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }
    // return response;
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
