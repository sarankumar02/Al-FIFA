import 'dart:async';

import 'package:al_fifa/models/forgot_password_model.dart';
import 'package:al_fifa/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rxdart/rxdart.dart';

import '../widgets/custom_loader.dart';

class ForgotPassswordBloc {
  final _authRepo = AuthRepository();
  final _email = BehaviorSubject<String>();

  final _contactNumber = BehaviorSubject<String>();

  Function(String) get changeContactNumber => _contactNumber.sink.add;
  Function(String) get changeEmail => _email.sink.add;


  Stream<String> get email => _email.stream.transform(validateEmail);
   Stream<bool> get forgotPasswordValid => Rx.defer(
      () => Rx.combineLatest([email], (values) {
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



  Future<ForgotPasswordResponse> forgotpassword(
      {required BuildContext context}) async {
    Map body = {
         "email": _email.value
    };
    print("REG BODY ==" + body.toString());
    context.loaderOverlay.show(widget: customLoader());
    var response = await _authRepo.userForgotPasssword(body: body);
    context.loaderOverlay.hide();

    print("res" + response.forgotPassword!.message!);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.forgotPassword!.message!)));
    if (response.forgotPassword!.successMsg == 1) {
      Navigator.of(context).pop();
      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }
    return response;
  }
}
