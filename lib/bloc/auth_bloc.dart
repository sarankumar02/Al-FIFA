import 'dart:async';

import 'package:al_fifa/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rxdart/rxdart.dart';

import '../widgets/custom_loader.dart';

class AuthBloc {
  final _authRepo = AuthRepository();

  final BehaviorSubject<bool> _isLoading = BehaviorSubject<bool>();
  final BehaviorSubject<String> _firstName = BehaviorSubject<String>();
  final _lastName = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();
  final _registerDeclarationAccepted = BehaviorSubject<bool>();
  final _contactNumber = BehaviorSubject<String>();

  Function(String) get changeFirstName => _firstName.sink.add;
  Function(String) get changeLastName => _lastName.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeConfirmPassword => _confirmPassword.sink.add;
  Function(String) get changeContactNumber => _contactNumber.sink.add;

  Stream<String> get firstName =>
      _firstName.stream.transform(validateFirstName);
  Stream<bool> get registerDeclarationAccepted =>
      _registerDeclarationAccepted.stream;

  Stream<String> get lastName => _lastName.stream.transform(validateLastName);
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<String> get contactNumber =>
      _contactNumber.stream.transform(validateContact);

  Stream<String> get confirmPassword =>
      _confirmPassword.stream.transform(validateConfirmPassword);

  Stream<bool> get registerValid => Rx.defer(
      () => Rx.combineLatest([
            firstName,
            lastName,
            email,
            contactNumber,
            password,
            confirmPassword,
            registerDeclarationAccepted,
            
          ], (values) {
            if (!_registerDeclarationAccepted.hasValue ||
                _registerDeclarationAccepted.value == false) {
              return false;
            }
            return true;
          }),
      reusable: true);

  BehaviorSubject<bool> get isLoading => _isLoading;

  final validateFirstName = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError('Firstname must have more that 2 characters');
    } else {
      sink.add(value);
    }
  });
  final validateLastName = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError('Lastname must have more that 2 characters');
    } else {
      sink.add(value);
    }
  });
  final validateContact = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 6) {
      sink.addError('Enter valid phone number');
    } else {
      sink.add(value);
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 6) {
      sink.addError('Password should not be less than 6 characters');
    } else {
      sink.add(value);
    }
  });
  final validateConfirmPassword =
      StreamTransformer<String, String>.fromHandlers(
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

  changeRegisterDeclarationAccepted(value) {
    _registerDeclarationAccepted.sink.add(value);
  }

  changeIsLoading(value) {
    _isLoading.sink.add(value);
  }

  Future registerUser(
      {required BuildContext context}) async {
    Map? body = {};
    //  print(_selectedNationality.value.traNationalityid);
    body = {
      "firstname": _firstName.value,
      "lastname": _lastName.value,
      "mobile": _contactNumber.value,
      "email": _email.value,
      "password": _password.value
    };

    print("REG BODY ==" + body.toString());
    context.loaderOverlay.show(widget: customLoader());
    var response = await _authRepo.registerUser(body: body);

    print("res" + response.toString());
    context.loaderOverlay.hide();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.registerModel!.message!)));
    if (response.registerModel!.successMsg == 1) {
      Navigator.of(context).pop();
      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }
  }
}
