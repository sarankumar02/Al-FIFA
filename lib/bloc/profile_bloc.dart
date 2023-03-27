import 'dart:async';

import 'package:al_fifa/models/profile_model.dart';
import 'package:al_fifa/models/profile_update_model.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rxdart/rxdart.dart';

import '../repository/auth_repo.dart';
import '../widgets/custom_loader.dart';

class UserDetailsBloc {
  final BehaviorSubject<UserDetailsModelResponse> _userDetailsResponse =
      BehaviorSubject<UserDetailsModelResponse>();
  final _authRepo = AuthRepository();
  final BehaviorSubject<bool> _isLoading = BehaviorSubject<bool>();
  final BehaviorSubject<String> _firstName = BehaviorSubject<String>();
  final _lastName = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _contactNumber = BehaviorSubject<String>();

  Function(String) get changeFirstName => _firstName.sink.add;
  Function(String) get changeLastName => _lastName.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changeContactNumber => _contactNumber.sink.add;

  Stream<String> get firstName =>
      _firstName.stream.transform(validateFirstName);
 

  Stream<String> get lastName => _lastName.stream.transform(validateLastName);
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get contactNumber =>
      _contactNumber.stream.transform(validateContact);

  
  Stream<bool> get registerValid => Rx.defer(
      () => Rx.combineLatest([
            firstName,
            lastName,
            email,
            contactNumber,
          ], (values) {
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

  final validateIdNumber = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 6) {
      sink.addError('Id should not be less than 6 characters');
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
  final validateSecurityAnswer = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 6) {
      sink.addError('Answer should not be less than 6 characters');
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

  changeIsLoading(value) {
    _isLoading.sink.add(value);
  }

  // Stream<UserDetailsModelResponse> getUsers({required Map body}) async* {
  //   changeIsLoading(true);
  //   var response = await _authRepo.getUsersDetails(body: body);
  //   changeIsLoading(false);

  //   _userDetailsResponse.sink.add(response);
  //   print("RESPONSE--" + response.error.toString());

  //   yield response;
  // }

  Future<UserDetailsModelResponse> getUserProfile(
      {required Map body,
      required BuildContext context,
      required valueUpdater}) async {
    changeIsLoading(true);

    context.loaderOverlay.show(widget: customLoader());
    var response = await _authRepo.getUsersDetails(body: body);
    changeIsLoading(false);
    context.loaderOverlay.hide();
    if (response.userDetailsModel?.success == 1) {
      User user = response.userDetailsModel!.users![0];
      print("valueUpdatervalueUpdater" + user.toString());
      String dob = "";
      valueUpdater(
          firstName: user.firstName,
          lastName: user.lastName,
          email: user.email,
          contactNumber: user.mobile,
         );
    }

    _userDetailsResponse.sink.add(response);
    print("RESPONSE--" + response.error.toString());

    return response;
  }

  
  Future<UserDetailsUpdateModelResponse> updateUserDetails({
    required Map body,
    required BuildContext context,
  }) async {
    // Map body = {
    //   "Source": {
    //     "contactid": "a8db8788-c358-ec11-b81e-0691c9b0fe40",
    //     "emailaddress1": "m.sabir9795@hotmail.com",
    //     "firstname": "mad",
    //     "lastname": "Max",
    //     "tra_countrycode": "455",
    //     "mobilephone": _contactNumber.value
    //   }
    // };
    context.loaderOverlay.show(widget: customLoader());
    var response = await _authRepo.updateUsersDetails(body: body);
    context.loaderOverlay.hide();
    if (response.updateProfileModel?.successMsg == 1) {
      //SUCCESS
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.updateProfileModel!.message!)));
    } else {
      // failure
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.updateProfileModel!.message!)));
    }
    // _userDetailsResponse.sink.add(response);
    print("RESPONSE--" + response.error.toString());
    return response;
  }
}
