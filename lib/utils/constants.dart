import 'package:al_fifa/screens/otherServices/other_services.dart';
import 'package:flutter/material.dart';

enum Languages { English, Arabic }

//Page Router
const String splashScreen = '/';
const String loginScreen = '/loginPage';
const String registerScreen = "/registerScreen";
const String homeScreen = '/homePage';
const String visaScreenOne = '/visaScreenOne';
const String visaScreenTwo = '/visaScreenTwo';
const String visaRequest = '/visaRequest';
const String travelInformation = '/travelInformation';
const String paymentScreen = '/paymentScreen';
const String cameraScreen = '/cameraScreen';
const String myRequestScreen = '/myRequestScreen';
const String myProfileScreen = "/myProfileScreen";
const String forgotPasswordScreen = "/forgotPasswordScreen";
const String resetPasswordScreen = "/resetPasswordScreen";
const String passport = "/passport";
const String passportThankyou = "/passportThankyou";
const String contactus = "/contactus";
const String aboutUS = "/aboutUS";
const String otherServices = "/otherServices";

class AppColor {
  static const primaryColor = Color(0xff8046aa);
  static const secondaryColor = Color(0xff9fb0c8);
  static const lightblackColor = Color(0xff515151);
  static const blackColor = Colors.black;
}

class TextStyleAlFifa {
  static const TextStyle text = TextStyle(
      fontWeight: FontWeight.w800,
      color: AppColor.primaryColor,
      fontSize: 18,
      fontFamily: "Tajawal-Regular");
  static const TextStyle titleLabel = TextStyle(
      fontWeight: FontWeight.w900,
      color: AppColor.primaryColor,
      fontSize: 20,
      fontFamily: "Tajawal-Bold");

  static const TextStyle normalText = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColor.secondaryColor,
       fontFamily: "Tajawal-Medium"
      );
  static TextStyle mediumText = const TextStyle(
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontFamily: "Tajawal-Medium");
}

class FontConstant {
  static const headingText = 20.0;
}

class AppConstants {
  // static ThemeData darkTheme = ThemeData(
  //     primarySwatch: Colors.grey,
  //     primaryColor: Colors.black,
  //     brightness: Brightness.dark,
  //     backgroundColor: Color(0xFF212121),
  //     accentColor: AppColors.whiteColor,
  //     accentIconTheme: IconThemeData(color: Colors.black),
  //     dividerColor: Colors.black12,
  //     hintColor: AppColors.textBoxHintColor,
  //     scaffoldBackgroundColor: AppColors.darkThemeBackground);

  // static ThemeData lightTheme = ThemeData(
  //   primarySwatch: Colors.grey,
  //   primaryColor: Colors.white,
  //   brightness: Brightness.light,
  //   hintColor: AppColors.halfOpacityWhite,
  //   scaffoldBackgroundColor: AppColors.scaffoldBackground,
  //   backgroundColor: const Color(0xFFE5E5E5),
  //   accentColor: AppColors.blackColor,
  //   accentIconTheme: IconThemeData(color: Colors.white),
  //   dividerColor: Colors.white54,
  // );

  static const double halfOpacity = 0.5;
  static const double quarterOpacity = 0.25;
  static const idTypes = [
    {"id": 1, "type": "New Passport"},
    {"id": 2, "type": "Passport Renewal"},
  ];
  static const otherServices = [
    {"id": 1, "type": "International Driving License"},
    {"id": 2, "type": "Translatioin"},
    {"id": 3, "type": "Book Your Stay"},
    {"id": 4, "type": "Travel Medical Insurance"},
    {"id": 5, "type": "ESCORT by agent at embassy"},
    {"id": 6, "type": "MOFA Attestation"},
  ];
  static const quantity = [
    {"id": 1, "type": "1"},
    {"id": 2, "type": "2"},
    {"id": 3, "type": "3"},
  ];

  static const BASE_URL = "https://alfifaportal.urbansoft.co.uk/api/";
  static const pleaseFillAllFields = "Please fill all the fields";

  static logger(data1, [data2, data3, data4, data5, data6, data7, data8]) {
    print("DATA 1 -" +
        data1.toString() +
        "\n" +
        "DATA 2 -" +
        data2.toString() +
        "\n" +
        "DATA 3 -" +
        data3.toString() +
        "\n" +
        "DATA 4 -" +
        data4.toString() +
        "\n" +
        "DATA 5 -" +
        data5.toString() +
        "\n" +
        "DATA 6 -" +
        data6.toString() +
        "\n" +
        "DATA 7 -" +
        data7.toString() +
        "\n" +
        "DATA 8 -" +
        data8.toString() +
        "\n");
  }
}
