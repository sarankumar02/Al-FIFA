import 'dart:async';
import 'package:al_fifa/Widgets/custom_loader.dart';
import 'package:al_fifa/repository/other_services_repo.dart';
import 'package:al_fifa/screens/passport%20and%20releated%20services/passport_thankyou.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rxdart/rxdart.dart';

class OtherServicesBloc {
  final _otherServices = OtherServicesRepository();
  final BehaviorSubject<Map<String, dynamic>> _selectedServices =
      BehaviorSubject<Map<String, dynamic>>();
  final BehaviorSubject<bool> _selectedYouAndOthers = BehaviorSubject<bool>();
  final BehaviorSubject<bool> _selectedYourSelf = BehaviorSubject<bool>();
  final BehaviorSubject<Map<String, dynamic>> _quantity =
      BehaviorSubject<Map<String, dynamic>>();
  final BehaviorSubject<int> _paperQuantity = BehaviorSubject<int>();
  final BehaviorSubject<Map<String, dynamic>> _services =
      BehaviorSubject<Map<String, dynamic>>();
  final BehaviorSubject<Map<String, Object>> _nationality =
      BehaviorSubject<Map<String, Object>>();
  final BehaviorSubject<Map<String, Object>> _selectedNationality =
      BehaviorSubject<Map<String, Object>>();
  final BehaviorSubject<int> _selectedCountryIndex = BehaviorSubject<int>();
  final BehaviorSubject<String> _applicantName = BehaviorSubject<String>();
  final BehaviorSubject<String> _applicantNameMOFA = BehaviorSubject<String>();
  final BehaviorSubject<String> _applicantNameEscort =
      BehaviorSubject<String>();
  final BehaviorSubject<String> _lincenseCollectionChoice =
      BehaviorSubject<String>();
  final BehaviorSubject<String> _mobileNumber = BehaviorSubject<String>();
  final BehaviorSubject<String> _email = BehaviorSubject<String>();
  final BehaviorSubject<String> _selectedDate = BehaviorSubject<String>();
  final BehaviorSubject<String> _selectedCheckIn = BehaviorSubject<String>();
  final BehaviorSubject<String> _selectedCheckOut = BehaviorSubject<String>();
  final BehaviorSubject<String> _livingPlace = BehaviorSubject<String>();
  final BehaviorSubject<String> _toPlace = BehaviorSubject<String>();
  final BehaviorSubject<String> _content = BehaviorSubject<String>();
  final _translationUpload = BehaviorSubject<String>();
  Stream<String> get translationUpload => _translationUpload;
  Stream<Map<String, dynamic>> get selectedServices => _selectedServices;
  Stream<bool> get selectedYourSelf => _selectedYourSelf;
  Stream<bool> get selectedYouAndOthers => _selectedYouAndOthers;
  Stream<Map<String, dynamic>> get quantity => _quantity;
  Stream<int> get paperQuantity => _paperQuantity;
  Stream<Map<String, dynamic>> get services => _services;
  Stream<Map<String, Object>> get nationality => _nationality;
  Stream<Map<String, Object>> get selectedNationality => _selectedNationality;
  Stream<int> get selectedCountryIndex => _selectedCountryIndex;
  Function(String) get changeApplicantName => _applicantName.sink.add;
  Function(String) get changeApplicantNameMofa => _applicantNameMOFA.sink.add;
  Function(String) get changeApplicantNameEscort =>
      _applicantNameEscort.sink.add;
  Function(String) get changeLincenseCollectionChoice =>
      _lincenseCollectionChoice.sink.add;
  Function(String) get changeMobileNumber => _mobileNumber.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changeLivingPlace => _livingPlace.sink.add;
  Function(String) get changeToPlace => _toPlace.sink.add;
  Function(String) get changeContent => _content.sink.add;
  Stream<String> get applicantName =>
      _applicantName.stream.transform(validateApplicantName);
  Stream<String> get applicantNameMofa =>
      _applicantNameMOFA.stream.transform(validateApplicantName);
  Stream<String> get applicantNameEscort =>
      _applicantNameEscort.stream.transform(validateApplicantName);
  Stream<String> get lincenseCollectionChoice =>
      _lincenseCollectionChoice.stream
          .transform(validateLincenseCollectionChoice);
  Stream<String> get mobileNumber =>
      _mobileNumber.stream.transform(validateMobile);
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get livingPlace =>
      _livingPlace.stream.transform(validateLivingPlace);
  Stream<String> get toPlace => _toPlace.stream.transform(validateToPlace);
  Stream<String> get content => _toPlace.stream.transform(validateContent);
  Stream<String> get selectedDate => _selectedDate;
  Stream<String> get selectedCheckIn => _selectedCheckIn;
  Stream<String> get selectedCheckOut => _selectedCheckOut;
  Stream<bool> get iDLValid => Rx.defer(
      () => Rx.combineLatest([
            quantity,
            services,
            lincenseCollectionChoice,
            applicantName,
            mobileNumber,
            email
          ], (values) {
            return true;
          }),
      reusable: true);
  Stream<bool> get escortValid => Rx.defer(
      () => Rx.combineLatest([applicantNameEscort, mobileNumber, email],
              (values) {
            return true;
          }),
      reusable: true);
  Stream<bool> get mofaValid => Rx.defer(
      () =>
          Rx.combineLatest([applicantNameMofa, mobileNumber, email], (values) {
            return true;
          }),
      reusable: true);
  Stream<bool> get tMIValid => Rx.defer(
      () => Rx.combineLatest([
            selectedNationality,
            livingPlace,
            selectedDate,
            selectedYouAndOthers,
            selectedYourSelf,
            applicantName,
            mobileNumber,
            email
          ], (values) {
            return true;
          }),
      reusable: true);
  Stream<bool> get bysValid => Rx.defer(
      () => Rx.combineLatest([
            toPlace,
            selectedCheckIn,
            selectedCheckOut,
            applicantName,
            mobileNumber,
            email
          ], (values) {
            return true;
          }),
      reusable: true);
  Stream<bool> get translationValid => Rx.defer(
      () => Rx.combineLatest([
            paperQuantity,
            translationUpload,
            applicantName,
            mobileNumber,
            email
          ], (values) {
            return true;
          }),
      reusable: true);

  final validateApplicantName = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError('Applicant Name  must have more that 2 characters');
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
  final validateLivingPlace = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError('Living place  must have more that 2 characters');
    } else {
      sink.add(value);
    }
  });
  final validateToPlace = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError('To place  must have more that 2 characters');
    } else {
      sink.add(value);
    }
  });
  final validateContent = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError('content  must have more that 2 characters');
    } else {
      sink.add(value);
    }
  });

  changeSelectedServices(value) {
    _selectedServices.sink.add(value);
  }

  changeSelectedYouAndOthers(value) {
    _selectedYouAndOthers.sink.add(value);
  }

  changeSelectedYourSelf(value) {
    _selectedYourSelf.sink.add(value);
  }

  changeSelectedDate(value) {
    _selectedDate.sink.add(value);
  }

  changeSelectedCheckIn(value) {
    _selectedCheckIn.sink.add(value);
  }

  changeSelectedCheckOut(value) {
    if (value == null) {
      _selectedCheckOut.sink.addError('Please Select Check out date');
    } else {
      _selectedCheckOut.sink.add(value);
    }
  }

  changequantity(value) {
    _quantity.sink.add(value);
  }

  changePaperQuantity(value) {
    _paperQuantity.sink.add(value);
  }

  changeservices(value) {
    _services.sink.add(value);
  }

  changeSelectedNationality(value) {
    _selectedNationality.sink.add(value);
  }

  changeSelectedCountryIndex(value) {
    _selectedCountryIndex.sink.add(value);
  }

  changeTranslationUpload(value) {
    _translationUpload.sink.add(value);
  }

  Future passPortSubmit({required BuildContext context}) async {
    Map? body = {};
    body = {
      "services": _services.value["id"],
      "quantity": _quantity.value["id"],
      "license_collection": _lincenseCollectionChoice.value,
      "applicant_name": _applicantName.value,
      "mobile": _mobileNumber.value,
      "email": _email.value,
      "usertype": "guest",
      "created_by": "0"
    };
    context.loaderOverlay.show(widget: customLoader());

    var response = await _otherServices.otherServicesSubmit(
        body: body, endPoint: "addform_drivinglicense.php");

    context.loaderOverlay.hide();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.othersResponse!.message!)));
    if (response.othersResponse!.successMsg == 1) {
      // Navigator.pushReplacementNamed(context, passportThankyou);
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return PassportThankyou(
            title: "Other Services",
            message: response.othersResponse!.message!.toString(),
          );
        },
      ));
    }
  }

  Future travelMeddicalInsuranceSubmit({required BuildContext context}) async {
    Map? body = {};
    body = {
      "nationality":
          _selectedNationality.value["country"].toString().split("(")[0],
      "living_place": _livingPlace.value,
      "dob": _selectedDate.value,
      "you_others": _selectedYouAndOthers.value == true ? "2" : "1",
      "applicant_name": _applicantName.value,
      "mobile": _mobileNumber.value,
      "email": _email.value,
      "usertype": "guest",
      "created_by": "0"
    };

    context.loaderOverlay.show(widget: customLoader());

    var response = await _otherServices.otherServicesSubmit(
        body: body, endPoint: "addform_travelmedicalinsurance.php");

    context.loaderOverlay.hide();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.othersResponse!.message!)));
    if (response.othersResponse!.successMsg == 1) {
      // Navigator.pushReplacementNamed(context, passportThankyou);
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return PassportThankyou(
            title: "Other Services",
            message: response.othersResponse!.message!.toString(),
          );
        },
      ));
    }
  }

  Future bookYourStaySubmit({required BuildContext context}) async {
    Map? body = {};
    body = {
      "formtype": "1",
      "toplace": _toPlace.value,
      "checkin": _selectedCheckIn.value,
      "checkout": _selectedCheckOut.value,
      "applicant_name": _applicantName.value,
      "mobile": _mobileNumber.value,
      "email": _email.value,
      "usertype": "guest",
      "created_by": "0"
    };

    context.loaderOverlay.show(widget: customLoader());

    var response = await _otherServices.otherServicesSubmit(
        body: body, endPoint: "addform_bookyourstay.php");

    context.loaderOverlay.hide();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.othersResponse!.message!)));
    if (response.othersResponse!.successMsg == 1) {
      // ignore: use_build_context_synchronously
      // Navigator.pushReplacementNamed(context, passportThankyou);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return PassportThankyou(
            title: "Other Services",
            message: response.othersResponse!.message!.toString(),
          );
        },
      ));
    }
  }

  Future escortSubmit({required BuildContext context}) async {
    Map? body = {};
    body = {
      "formtype": "1",
      "applicant_name": _applicantNameEscort.value,
      "mobile": _mobileNumber.value,
      "email": _email.value,
      "usertype": "guest",
      "created_by": "0"
    };

    context.loaderOverlay.show(widget: customLoader());

    var response = await _otherServices.otherServicesSubmit(
        body: body, endPoint: "addform_escort.php");

    context.loaderOverlay.hide();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.othersResponse!.message!)));
    if (response.othersResponse!.successMsg == 1) {
      // ignore: use_build_context_synchronously
      // Navigator.pushReplacementNamed(context, passportThankyou);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return PassportThankyou(
            title: "Other Services",
            message: response.othersResponse!.message!.toString(),
          );
        },
      ));
    }
  }

  Future mOFASubmit({required BuildContext context}) async {
    Map? body = {};
    body = {
      "formtype": "1",
      "applicant_name": _applicantNameMOFA.value,
      "mobile": _mobileNumber.value,
      "email": _email.value,
      "usertype": "guest",
      "created_by": "0"
    };

    context.loaderOverlay.show(widget: customLoader());

    var response = await _otherServices.otherServicesSubmit(
        body: body, endPoint: "addform_mofaattestation.php");

    context.loaderOverlay.hide();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.othersResponse!.message!)));
    if (response.othersResponse!.successMsg == 1) {
      // ignore: use_build_context_synchronously
      // Navigator.pushReplacementNamed(context, passportThankyou);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return PassportThankyou(
            title: "Other Services",
            message: response.othersResponse!.message!.toString(),
          );
        },
      ));
    }
  }

  Future translationSubmit({required BuildContext context}) async {
    Map? body = {};
    body = {
      "paper": _paperQuantity.value.toString(),
      "name": _applicantName.value,
      "mobile": _mobileNumber.value,
      "email": _email.value,
      "content": _content.value,
      "document": _translationUpload.value,
      "usertype": "guest",
      "created_by": "0"
    };

    context.loaderOverlay.show(widget: customLoader());

    var response = await _otherServices.translation(
        body: body, endPoint: "addform_translation.php");

    context.loaderOverlay.hide();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.othersResponse!.message!)));
    if (response.othersResponse!.successMsg == 1) {
      // ignore: use_build_context_synchronously
      // Navigator.pushReplacementNamed(context, passportThankyou);
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return PassportThankyou(
            title: "Other Services",
            message: response.othersResponse!.message!.toString(),
          );
        },
      ));
    }
  }
}
