import 'dart:async';

import 'package:al_fifa/Widgets/custom_loader.dart';
import 'package:al_fifa/bloc/settings_bloc.dart';
import 'package:al_fifa/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc {
  final _authRepo = AuthRepository();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get loginValid => Rx.defer(
      () => Rx.combineLatest([email, password], (values) {
            return true;
          }),
      reusable: true);
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 6) {
      sink.addError('Password should not be less than 6 characters');
    } else {
      sink.add(value);
    }
  });
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

  Future loginUser(
      {required BuildContext context,
      required SettingsBloc settingsBloc}) async {
    Map body = {"email": _email.value, "password": _password.value};
    print("Body----" + body.toString());
    context.loaderOverlay.show(widget: customLoader());
    var response = await _authRepo.loginUser(body: body);
    context.loaderOverlay.hide();

    print("res" + response.loginResponse!.message!);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.loginResponse!.message!)));
    if (response.loginResponse!.success == 1) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, "/homePage");
      // _prefs.setString("contactid", (response.loginResponse!.contactId!));
      _prefs.setString("userEmailId", (_email.value.trim()));
      _prefs.setBool("LoggedIn", true);
      settingsBloc.changeUserLogin();
    }
  }
}
