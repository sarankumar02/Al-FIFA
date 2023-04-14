// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:al_fifa/api/passport_api.dart';
import 'package:al_fifa/models/Visa/country_model.dart';
import 'package:al_fifa/models/Visa/visa_place_model.dart';
import 'package:al_fifa/models/Visa/visa_requirement_model.dart';
import 'package:al_fifa/models/Visa/visa_type_model.dart';
import 'package:al_fifa/models/country_model.dart';
import 'package:al_fifa/repository/visa_repo.dart';
import 'package:al_fifa/screens/passport%20and%20releated%20services/passport_thankyou.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rxdart/rxdart.dart';

import '../widgets/custom_loader.dart';

class VisaBloc {
  final _visaRepo = VisaRepository();
  final _passportApiProvider = PasssPortApiProvider();
  final _email = BehaviorSubject<String>();
  final _mobile = BehaviorSubject<String>();
  final _firstName = BehaviorSubject<String>();
  final _lastName = BehaviorSubject<String>();
  final _motherFirstName = BehaviorSubject<String>();
  final _motherLastName = BehaviorSubject<String>();
  final _address1 = BehaviorSubject<String>();
  final _address2 = BehaviorSubject<String>();
  final _zipCode = BehaviorSubject<String>();
  final _city = BehaviorSubject<String>();

  final BehaviorSubject<CountrylistModelResponse> _country =
      BehaviorSubject<CountrylistModelResponse>();
  final BehaviorSubject<List<Map>> _countries = BehaviorSubject<List<Map>>();
  final BehaviorSubject<Countrylist> _selectedCountry =
      BehaviorSubject<Countrylist>();
  final BehaviorSubject<VisaTypeModelResponse> _visaType =
      BehaviorSubject<VisaTypeModelResponse>();
  final BehaviorSubject<Visatype> _selectedVisaType =
      BehaviorSubject<Visatype>();
  final BehaviorSubject<VisaPlaceModelResponse> _visaPlaces =
      BehaviorSubject<VisaPlaceModelResponse>();
  final BehaviorSubject<Map> _selectedVisaPlaces = BehaviorSubject<Map>();
  final BehaviorSubject<String> _selectedDate = BehaviorSubject<String>();
  final BehaviorSubject<int> _selectedAdultTraveller = BehaviorSubject<int>();
  final BehaviorSubject<int> _selectedChildTraveller = BehaviorSubject<int>();
  final _passportUpload = BehaviorSubject<String>();
  final _photoUpload = BehaviorSubject<String>();
  Stream<String> get passPortUpload => _passportUpload;
  Stream<String> get photoUpload => _photoUpload;

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changeAddress1 => _address1.sink.add;
  Function(String) get changeAddress2 => _address2.sink.add;
  Function(String) get changeFirstName => _firstName.sink.add;
  Function(String) get changeLastName => _lastName.sink.add;
  Function(String) get changeMotherFirstName => _motherFirstName.sink.add;
  Function(String) get changeMotherLastName => _motherLastName.sink.add;
  Function(String) get changeMobileNumber => _mobile.sink.add;
  Function(String) get changeZipcode => _zipCode.sink.add;
  Function(String) get changeCity => _city.sink.add;
  Stream<String> get selectedDate => _selectedDate;
  Stream<CountrylistModelResponse> get nationality => _country;
  Stream<List<Map>> get countries => _countries;
  Stream<Countrylist> get selectedNationality => _selectedCountry;
  Stream<VisaTypeModelResponse> get visaType => _visaType;
  Stream<Visatype> get selectedVisaType => _selectedVisaType;
  Stream<VisaPlaceModelResponse> get visaPlaces => _visaPlaces;
  Stream<Map> get selectedVisaPlaces => _selectedVisaPlaces;
  Stream<int> get selectedAdultTraveller => _selectedAdultTraveller;
  Stream<int> get selectedChildTraveller => _selectedChildTraveller;
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get firstName =>
      _firstName.stream.transform(validateFirstName);
  Stream<String> get lastName => _lastName.stream.transform(validateLastName);
  Stream<String> get motherFirstName =>
      _motherFirstName.stream.transform(validateFirstName);
  Stream<String> get motherLastName =>
      _motherLastName.stream.transform(validateLastName);
  Stream<String> get mobile => _mobile.stream.transform(validateMobile);
  Stream<String> get address1 => _address1.stream.transform(validateAddress);
  Stream<String> get address2 => _address2.stream.transform(validateAddress);
  Stream<String> get zipCode => _zipCode.stream.transform(validateZipCode);
  Stream<String> get city => _city.stream.transform(validateCity);
  Stream<String> get confirmPassword =>
      _email.stream.transform(validateConfirmPassword);
  Stream<bool> get visaOneValid => Rx.defer(
      () => Rx.combineLatest([
            selectedNationality,
            selectedVisaType,
            selectedVisaPlaces,
            selectedDate,
          ], (values) {
            return true;
          }),
      reusable: true);
  Stream<bool> get visaTwoValid => Rx.defer(
      () => Rx.combineLatest([
            firstName,
            lastName,
            email,
            mobile,
            address1,
            address2,
            city,
            zipCode,
            passPortUpload,
            photoUpload,
            motherFirstName,
            motherLastName
          ], (values) {
            return true;
          }),
      reusable: true);

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
  final validateMobile = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 6) {
      sink.addError('Enter valid phone number');
    } else {
      sink.add(value);
    }
  });
  final validateAddress = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError('Address must have more that 2 characters');
    } else {
      sink.add(value);
    }
  });
  final validateZipCode = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError('Zipcode must have more that 2 characters');
    } else {
      sink.add(value);
    }
  });
  final validateCity = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) async {
    if (value.length < 2) {
      sink.addError('City must have more that 2 characters');
    } else {
      sink.add(value);
    }
  });

  changeSelectedDate(value) {
    _selectedDate.sink.add(value);
  }

  changeSelectedAdultTraveller(value) {
    _selectedAdultTraveller.sink.add(value);
  }

  changeSelectedChildTraveller(value) {
    _selectedChildTraveller.sink.add(value);
  }

  changeSelectedNationality(value) {
    _selectedCountry.sink.add(value);
  }

  changeSelectedVisaType(context, value) {
    _selectedVisaType.sink.add(value);
    getVisaplace(context: context);
  }

  changeSelectedVisaPlaces(value) {
    _selectedVisaPlaces.sink.add(value);
  }

  changeSelectedCountry(context, Countrylist value) {
    _selectedCountry.sink.add(value);
    getVisaType(context: context);
  }

  changeSelectedPassportUpload(value) {
    _passportUpload.sink.add(value);
  }

  changeSelectedPhotoUpload(value) {
    _photoUpload.sink.add(value);
  }

  Future<bool> visaValidation() async {
    if (_selectedAdultTraveller.hasValue || _selectedChildTraveller.hasValue) {
      return true;
    }
    return false;
  }

  Future<CountrylistModelResponse> getNationality(
      {required BuildContext context}) async {
    // changeIsLoading(true);
    context.loaderOverlay.show(widget: customLoader());
    var response = await _passportApiProvider.getCountry();
    context.loaderOverlay.hide();

    // changeIsLoading(false);

    if (response.countrylistModel!.countrylist!.isNotEmpty) {
      print(_selectedCountry.hasValue);

      changeSelectedNationality(response.countrylistModel!.countrylist![0]);
    }

    _country.sink.add(response);
    print("RESPONSE--" + response.toString());
    return response;
  }

  Future getVisaType({required BuildContext context}) async {
    print(_selectedCountry.value.countryname);

    Map body = {"countryId": _selectedCountry.value.countryId.toString()};

    print("REG BODY ==" + body.toString());
    context.loaderOverlay.show(widget: customLoader());
    var response = await _visaRepo.getVisaType(body: body);
    context.loaderOverlay.hide();
    print(response.visaTypeModel!.visatype!.length);
    if (response.visaTypeModel!.visatype!.isNotEmpty) {
      changeSelectedVisaType(context, response.visaTypeModel!.visatype![0]);
      // getVisaplace(context: context);
    }
    _visaType.sink.add(response);
  }

  Future getVisaplace({required BuildContext context}) async {
    Map body = {
      "countryId": _selectedCountry.value.countryId,
      "visaId": _selectedVisaType.value.visaId
    };
    context.loaderOverlay.show(widget: customLoader());
    var response = await _visaRepo.getVisaplace(body: body);
    context.loaderOverlay.hide();
    if (response.visaPlaceModel!.visaplaces.isNotEmpty) {
      List<Map> countries = [];
      List valuesList =
          response.visaPlaceModel!.visaplaces[0].places.values.toList();
      List keysList =
          response.visaPlaceModel!.visaplaces[0].places.keys.toList();

      for (int i = 0;
          i < response.visaPlaceModel!.visaplaces[0].places.keys.length;
          i++) {
        Map data = {};
        data["id"] = keysList[i];
        data["country"] = valuesList[i];
        countries.add(data);
      }
      _countries.sink.add(countries);
      await changeSelectedVisaPlaces(_countries.value[0]);
    }
    _visaPlaces.sink.add(response);
  }

  Stream<VisaRequirementModelResponse> getVisaRequirement(
      {required BuildContext context}) async* {
    Map body = {
      "country": _selectedCountry.value.countryId,
      "visatype": _selectedVisaType.value.visaId
    };
    context.loaderOverlay.show(widget: customLoader());
    var response = await _visaRepo.getVisaRequirement(body: body);
    context.loaderOverlay.hide();
    yield response;
  }

  Future visasubmit({required BuildContext context}) async {
    Map? body = {};
    body = {
      "countryId": _selectedCountry.value.countryId,
      "visaType": _selectedVisaType.value.visaId,
      "visaPlace": _selectedVisaPlaces.value["id"],
      "adultCount":
          (_selectedAdultTraveller.hasValue ? _selectedAdultTraveller.value : 0)
              .toString(),
      "adultCost": (_selectedAdultTraveller.hasValue
          ? _selectedAdultTraveller.value *
              int.parse(_visaPlaces
                  .value.visaPlaceModel!.visaplaces[0].travelersPrice.adults)
          : 0.toString()),
      "childCount":
          (_selectedChildTraveller.hasValue ? _selectedChildTraveller.value : 0)
              .toString(),
      "childCost": (_selectedChildTraveller.hasValue
          ? _selectedChildTraveller.value *
              int.parse(_visaPlaces
                  .value.visaPlaceModel!.visaplaces[0].travelersPrice.children)
          : 0.toString()),
      "totalCost": ((_selectedAdultTraveller.hasValue
                  ? _selectedAdultTraveller.value *
                      int.parse(_visaPlaces.value.visaPlaceModel!.visaplaces[0]
                          .travelersPrice.adults)
                  : 0) +
              (_selectedChildTraveller.hasValue
                  ? _selectedChildTraveller.value *
                      int.parse(_visaPlaces.value.visaPlaceModel!.visaplaces[0]
                          .travelersPrice.children)
                  : 0))
          .toString(),
      "travelDate": _selectedDate.value,
      "firstName": _firstName.value,
      "lastName": _lastName.value,
      "phone": _mobile.value,
      "email": _email.value,
      "motherFirstName": _motherFirstName.value,
      "motherLastName": _motherLastName.value,
      "passport": _passportUpload.value,
      "photo": _photoUpload.value,
      "addressLine_1": _address1.value,
      "addressLine_2": _address2.value,
      "city": _city.value,
      "zipcode": _zipCode.value,
      "paymentStatus": "1",
      "payment_type": "paypal",
      "usertype": "guest",
      "created_by": "0",
    };
    print(body);


    context.loaderOverlay.show(widget: customLoader());

    var response = await _visaRepo.visaSubmit(body: body);

    context.loaderOverlay.hide();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.visaSubmitModel!.message)));
    if (response.visaSubmitModel!.successMsg == 1) {
      // ignore: use_build_context_synchronously
      // Navigator.pushReplacementNamed(context, passportThankyou);
       Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return  PassportThankyou(
            title: "Visa",
            message: response.visaSubmitModel!.message.toString(),
          );
        },
      ));
    }
  }
}
