import 'dart:async';

import 'package:al_fifa/models/forgot_password_model.dart';
import 'package:al_fifa/models/reset_password_model.dart';
import 'package:al_fifa/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rxdart/rxdart.dart';

import '../widgets/custom_loader.dart';

class ResetPassswordBloc {
  final _authRepo = AuthRepository();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword= BehaviorSubject<String>();




  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeConfirmPassword => _confirmPassword.sink.add;


  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _email.stream.transform(validatePassword);
  Stream<String> get confirmPassword=> _email.stream.transform(validateConfirmPassword);
   Stream<bool> get resetPasswordValid => Rx.defer(
      () => Rx.combineLatest([email,password,confirmPassword], (values) {
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



  Future<ChangePasswordModelResponse> resetpassword(
      {required BuildContext context}) async {
    Map body = {
    "email": _email.value,
    "newpassword": _password.value,
    "confirmpassword": _confirmPassword.value
};
    print("REG BODY ==" + body.toString());
    context.loaderOverlay.show(widget: customLoader());
    var response = await _authRepo.changeUserPassword(body: body);
    context.loaderOverlay.hide();

    print("res" + response.changePasswordModel!.message!);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.changePasswordModel!.message!)));
    if (response.changePasswordModel!.successMsg == 1) {
      Navigator.of(context).pop();
      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }
    return response;
  }
}
