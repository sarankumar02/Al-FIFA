import 'package:flutter/material.dart';

enum Languages { English, Arabic }




//Page Router
 const String splashScreen = '/';
 const String loginScreen = '/loginPage';
const String homeScreen = '/homePage';
const String visaScreenOne = '/visaScreenOne';
const String visaScreenTwo = '/visaScreenTwo';
const String visaRequest = '/visaRequest';
const String travelInformation = '/travelInformation';
const String paymentScreen = '/paymentScreen';
const String cameraScreen = '/cameraScreen';
const String myRequestScreen = '/myRequestScreen';


 class AppColor{
   static const primaryColor = Color(0xff8046aa);
   static const secondaryColor = Color(0xff9fb0c8);
   static const blackColor = Colors.black;

 }

 class TextStyleAlFifa{
   static const TextStyle text = TextStyle(
     fontWeight: FontWeight.w800,
     color: AppColor.primaryColor

   );

   static const TextStyle normalText = TextStyle(
       fontWeight: FontWeight.normal,
       color: AppColor.secondaryColor
   );
 }

 class FontConstant{
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
