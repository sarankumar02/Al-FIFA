import 'dart:async';

import 'package:al_fifa/Widgets/custom_loader.dart';
import 'package:al_fifa/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rxdart/rxdart.dart';

class OtherServicesBloc {
  // final _otherServices = PassPortRepository();
  final BehaviorSubject<Map<String, dynamic>> _selectedServices =
      BehaviorSubject<Map<String, dynamic>>();
  final BehaviorSubject<Map<String, dynamic>> _quantity =
      BehaviorSubject<Map<String, dynamic>>();
  final BehaviorSubject<CountrylistModelResponse> _nationality =
      BehaviorSubject<CountrylistModelResponse>();
  final BehaviorSubject<Countrylist> _selectedNationality =
      BehaviorSubject<Countrylist>();
  final BehaviorSubject<int> _selectedCountryIndex = BehaviorSubject<int>();
  final BehaviorSubject<String> _applicantName = BehaviorSubject<String>();
  final BehaviorSubject<String> _applicantNameMOFA = BehaviorSubject<String>();
  final BehaviorSubject<String> _applicantNameESCORT = BehaviorSubject<String>();
  final BehaviorSubject<String> _applicantNameBYS = BehaviorSubject<String>();
  final BehaviorSubject<String> _lincenseCollectionChoice =
      BehaviorSubject<String>();
  final BehaviorSubject<String> _mobileNumber = BehaviorSubject<String>();
  final BehaviorSubject<String> _mobileNumberMOFA = BehaviorSubject<String>();
  final BehaviorSubject<String> _mobileNumberESCORT = BehaviorSubject<String>();
  final BehaviorSubject<String> _mobileNumberBYS = BehaviorSubject<String>();
  final BehaviorSubject<String> _email = BehaviorSubject<String>();
  final BehaviorSubject<String> _emailMOFA = BehaviorSubject<String>();
  final BehaviorSubject<String> _emailESCORT = BehaviorSubject<String>();
  final BehaviorSubject<String> _emailBYS = BehaviorSubject<String>();
  //
  Stream<Map<String, dynamic>> get selectedServices => _selectedServices;
  Stream<Map<String, dynamic>> get quantity => _quantity;
  Stream<CountrylistModelResponse> get nationality => _nationality;

  Stream<Countrylist> get selectedNationality => _selectedNationality;
  Stream<int> get selectedCountryIndex => _selectedCountryIndex;
  Function(String) get changeApplicantName => _applicantName.sink.add;
  Function(String) get changeApplicantNameMOFA => _applicantNameMOFA.sink.add;
  Function(String) get changeApplicantNameBYS => _applicantNameBYS.sink.add;
  Function(String) get changeApplicantNameESCORT => _applicantNameESCORT.sink.add;
  Function(String) get changeLincenseCollectionChoice =>
      _lincenseCollectionChoice.sink.add;
  Function(String) get changeMobileNumber => _mobileNumber.sink.add;
  Function(String) get changeMobileNumberMOFA => _mobileNumberMOFA.sink.add;
  Function(String) get changeMobileNumberESCORT => _mobileNumberESCORT.sink.add;
  Function(String) get changeMobileNumberBYS => _mobileNumberBYS.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changeEmailMOFA => _emailMOFA.sink.add;
  Function(String) get changeEmailESCORT => _emailESCORT.sink.add;
  Function(String) get changeEmailBYS => _emailBYS.sink.add;
  Stream<String> get applicantName =>
      _applicantName.stream.transform(validateApplicantName);
  Stream<String> get applicantNameMOFA =>
      _applicantNameMOFA.stream.transform(validateApplicantNameMOFA);
  Stream<String> get applicantNameBYS =>
      _applicantNameBYS.stream.transform(validateApplicantNameESCORT);
  Stream<String> get applicantNameESCORT =>
      _applicantNameESCORT.stream.transform(validateApplicantNameESCORT);
  Stream<String> get lincenseCollectionChoice =>
      _lincenseCollectionChoice.stream
          .transform(validateLincenseCollectionChoice);
  Stream<String> get mobileNumber =>
      _mobileNumber.stream.transform(validateMobile);
  Stream<String> get mobileNumberMOFA =>
      _mobileNumberMOFA.stream.transform(validateMobileMOFA);
  Stream<String> get mobileNumberESCORT =>
      _mobileNumberESCORT.stream.transform(validateMobileESCORT);
  Stream<String> get mobileNumberBYS =>
      _mobileNumberBYS.stream.transform(validateMobileESCORT);
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get emailMOFA => _emailMOFA.stream.transform(validateEmailMOFA);
  Stream<String> get emailESCORT => _emailESCORT.stream.transform(validateEmailESCORT);
  Stream<String> get emailBYS => _emailBYS.stream.transform(validateEmailESCORT);
  Stream<bool> get iDLValid => Rx.defer(
      () => Rx.combineLatest([
            quantity,
            lincenseCollectionChoice,
            applicantName,
            mobileNumber,
            email
          ], (values) {
            return true;
          }),
      reusable: true);
  Stream<bool> get mOFAValid => Rx.defer(
      () => Rx.combineLatest([
            applicantNameMOFA,
            mobileNumberMOFA,
            emailMOFA
          ], (values) {
            return true;
          }),
      reusable: true);
  Stream<bool> get eSCORT => Rx.defer(
      () => Rx.combineLatest([
            applicantNameESCORT,
            mobileNumberESCORT,
            emailESCORT
          ], (values) {
            return true;
          }),
      reusable: true);
  Stream<bool> get bys => Rx.defer(
      () => Rx.combineLatest([
            applicantNameBYS,
            mobileNumberBYS,
            emailBYS
          ], (values) {
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
  final validateApplicantNameMOFA = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError(' Name must have more that 2 characters');
    } else {
      sink.add(value);
    }
  });
  final validateApplicantNameESCORT = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError(' Name must have more that 2 characters');
    } else {
      sink.add(value);
    }
  });

  final validateLincenseCollectionChoice =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError(
          'Lincense Collection Choice Name must have more that 2 characters');
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
  final validateMobileMOFA = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 6) {
      sink.addError('Enter valid phone number');
    } else {
      sink.add(value);
    }
  });
  final validateMobileESCORT = StreamTransformer<String, String>.fromHandlers(
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
  final validateEmailMOFA = StreamTransformer<String, String>.fromHandlers(
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
  final validateEmailESCORT = StreamTransformer<String, String>.fromHandlers(
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
  changeSelectedServices(value) {
    _selectedServices.sink.add(value);
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

  Future passPortSubmit({required BuildContext context}) async {
    Map? body = {};
    //  print(_selectedNationality.value.traNationalityid);
    body = {
      "services": _selectedServices.value["id"],
      "quantity": _quantity.value["id"],
    
      "applicant_name": _applicantName.value,
      "mobile": _mobileNumber.value,
      "email": _email.value
    };

    print(_applicantName.value);

return;

    print("cuntry${_selectedCountryIndex.value}");

    print("REG BODY ==" + body.toString());
    context.loaderOverlay.show(widget: customLoader());

    // var response = await _passPort.passPartSubmit(body: body);
    // print("res" + response.passportSubmitModel!.message!);

    context.loaderOverlay.hide();

    // ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text(response.passportSubmitModel!.message!)));
    // if (response.passportSubmitModel!.successMsg == 1) {
    //   Navigator.pushReplacementNamed(context, passportThankyou);
    // }
  }
}
