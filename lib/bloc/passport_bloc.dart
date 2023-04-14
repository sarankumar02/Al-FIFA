import 'dart:async';

import 'package:al_fifa/Widgets/custom_loader.dart';
import 'package:al_fifa/models/country_model.dart';
import 'package:al_fifa/repository/auth_repo.dart';
import 'package:al_fifa/repository/passport_repo.dart';
import 'package:al_fifa/screens/passport%20and%20releated%20services/passport_thankyou.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PassportBloc {
  final _passPort = PassPortRepository();
  final BehaviorSubject<Map<String, dynamic>> _selectedIDType =
      BehaviorSubject<Map<String, dynamic>>();
  final BehaviorSubject<Map<String, dynamic>> _quantity =
      BehaviorSubject<Map<String, dynamic>>();
  final BehaviorSubject<CountrylistModelResponse> _nationality =
      BehaviorSubject<CountrylistModelResponse>();
  final BehaviorSubject<Countrylist> _selectedNationality =
      BehaviorSubject<Countrylist>();
  final BehaviorSubject<int> _selectedCountryIndex = BehaviorSubject<int>();
  final BehaviorSubject<String> _applicantName = BehaviorSubject<String>();
  final BehaviorSubject<String> _mobileNumber = BehaviorSubject<String>();
  final BehaviorSubject<String> _email = BehaviorSubject<String>();
  //
  Stream<Map<String, dynamic>> get selectedIDType => _selectedIDType;
  Stream<Map<String, dynamic>> get quantity => _quantity;
  Stream<CountrylistModelResponse> get nationality => _nationality;

  Stream<Countrylist> get selectedNationality => _selectedNationality;
  Stream<int> get selectedCountryIndex => _selectedCountryIndex;
  Function(String) get changeApplicantName => _applicantName.sink.add;
  Function(String) get changeMobileNumber => _mobileNumber.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Stream<String> get applicantName =>
      _applicantName.stream.transform(validateApplicantName);
  Stream<String> get mobileNumber =>
      _mobileNumber.stream.transform(validateMobile);
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<bool> get passportValid => Rx.defer(
      () => Rx.combineLatest([email, mobileNumber, email], (values) {
            return true;
          }),
      reusable: true);
  final validateApplicantName = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError('Applicant Name must have more that 2 characters');
    } else {
      sink.add(value);
    }
  });
  final validateMobile = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 6) {
      sink.addError('Enter valid phone number');
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
  changeSelectedIDType(value) {
    _selectedIDType.sink.add(value);
  }

  changequantity(value) {
    _quantity.sink.add(value);
  }

  changeSelectedNationality(value) {
    _selectedNationality.sink.add(value);
  }

  changeSelectedCountryIndex(value) {
    _selectedCountryIndex.sink.add(value);
  }

  Future<CountrylistModelResponse> getNationality(
      {required BuildContext context}) async {
    // changeIsLoading(true);
    context.loaderOverlay.show(widget: customLoader());
    var response = await _passPort.getCountry();
    context.loaderOverlay.hide();

    // changeIsLoading(false);

    if (response.countrylistModel!.countrylist!.isNotEmpty) {
      changeSelectedNationality(response.countrylistModel!.countrylist![0]);
      changeSelectedCountryIndex(0);
    }

    _nationality.sink.add(response);
    print("RESPONSE--" + response.toString());
    return response;
  }

  Future passPortSubmit({required BuildContext context}) async {
    Map? body = {};
    //  print(_selectedNationality.value.traNationalityid);
    body = {
      "services": _selectedIDType.value["id"],
      "quantity": _quantity.value["id"],
      "country": _selectedNationality.value.countryId,
      "applicant_name": _applicantName.value,
      "mobile": _mobileNumber.value,
      "email": _email.value,
      "usertype": "guest",
      "created_by": "0"
    };

    print(body);
// return;

    print("cuntry${_selectedCountryIndex.value}");

    print("REG BODY ==" + body.toString());
    context.loaderOverlay.show(widget: customLoader());
    var response = await _passPort.passPartSubmit(body: body);
    print("res" + response.passportSubmitModel!.message!);
    context.loaderOverlay.hide();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.passportSubmitModel!.message!)));
    if (response.passportSubmitModel!.successMsg == 1) {
      // Navigator.pushReplacementNamed(context, passportThankyou);
       // ignore: use_build_context_synchronously
       Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return  PassportThankyou(
            title: "PassPort",
            message: response.passportSubmitModel!.message!.toString(),
          );
        },
      ));
    }
  }
}
