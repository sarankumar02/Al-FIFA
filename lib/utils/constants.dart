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
  static const TextStyle SucessText = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.green,
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
  static const services = [
    {"id": 1, "type": "International Driving License"},
    {"id": 2, "type": "Driving License"}
  ];

   static const listOfCountriesWithCode = [
    {'id': 0, 'country': 'USA (+1)'},
    {'id': 1, 'country': 'UK (+44)'},
    {'id': 2, 'country': 'Andorra (+376)'},
    {'id': 3, 'country': 'Algeria (+213)'},
    {'id': 4, 'country': 'Angola (+244)'},
    {'id': 5, 'country': 'Anguilla (+1264)'},
    {'id': 6, 'country': 'Antigua & Barbuda (+1268)'},
    {'id': 7, 'country': 'Antilles (Dutch)(+599)'},
    {'id': 8, 'country': 'Argentina (+54)'},
    {'id': 9, 'country': 'Armenia (+374)'},
    {'id': 10, 'country': 'Aruba (+297)'},
    {'id': 11, 'country': 'Ascension Island'},
    {'id': 12, 'country': 'Australia (+61)'},
    {'id': 13, 'country': 'Austria (+43)'},
    {'id': 14, 'country': 'Azerbaijan (+994)'},
    {'id': 15, 'country': 'Bahamas (+1242)'},
    {'id': 16, 'country': 'Bahrain (+973)'},
    {'id': 17, 'country': 'Bangladesh (+880)'},
    {'id': 18, 'country': 'Barbados (+1246)'},
    {'id': 19, 'country': 'Belarus (+375)'},
    {'id': 20, 'country': 'Belgium (+32)'},
    {'id': 21, 'country': 'Belize (+501)'},
    {'id': 22, 'country': 'Benin (+229)'},
    {'id': 23, 'country': 'Bermuda (+1441)'},
    {'id': 24, 'country': 'Bhutan (+975)'},
    {'id': 25, 'country': 'Bolivia (+591)'},
    {'id': 26, 'country': 'Bosnia Herzegovina (+387)'},
    {'id': 27, 'country': 'Botswana (+267)'},
    {'id': 28, 'country': 'Brazil (+55)'},
    {'id': 29, 'country': 'Brunei (+673)'},
    {'id': 30, 'country': 'Bulgaria (+359)'},
    {'id': 31, 'country': 'Burkina Faso (+226)'},
    {'id': 32, 'country': 'Burundi (+257)'},
    {'id': 33, 'country': 'Cambodia (+855)'},
    {'id': 34, 'country': 'Cameroon (+237)'},
    {'id': 35, 'country': 'Canada (+1)'},
    {'id': 36, 'country': 'Cape Verde Islands (+238)'},
    {'id': 37, 'country': 'Cayman Islands (+1345)'},
    {'id': 38, 'country': 'Central African Republic (+236)'},
    {'id': 39, 'country': 'Chile (+56)'},
    {'id': 40, 'country': 'China (+86)'},
    {'id': 41, 'country': 'Colombia (+57)'},
    {'id': 42, 'country': 'Comoros (+269)'},
    {'id': 43, 'country': 'Congo (+242)'},
    {'id': 44, 'country': 'Cook Islands (+682)'},
    {'id': 45, 'country': 'Costa Rica (+506)'},
    {'id': 46, 'country': 'Croatia (+385)'},
    {'id': 47, 'country': 'Cuba (+53)'},
    {'id': 48, 'country': 'Cyprus North (+90392)'},
    {'id': 49, 'country': 'Cyprus South (+357)'},
    {'id': 50, 'country': 'Czech Republic (+42)'},
    {'id': 51, 'country': 'Denmark (+45)'},
    {'id': 52, 'country': 'Diego Garcia (+2463)'},
    {'id': 53, 'country': 'Djibouti (+253)'},
    {'id': 54, 'country': 'Dominica (+1809)'},
    {'id': 55, 'country': 'Dominican Republic (+1809)'},
    {'id': 56, 'country': 'Ecuador (+593)'},
    {'id': 57, 'country': 'Egypt (+20)'},
    {'id': 58, 'country': 'Eire (+353)'},
    {'id': 59, 'country': 'El Salvador (+503)'},
    {'id': 60, 'country': 'Equatorial Guinea (+240)'},
    {'id': 61, 'country': 'Eritrea (+291)'},
    {'id': 62, 'country': 'Estonia (+372)'},
    {'id': 63, 'country': 'Ethiopia (+251)'},
    {'id': 64, 'country': 'Falkland Islands (+500)'},
    {'id': 65, 'country': 'Faroe Islands (+298)'},
    {'id': 66, 'country': 'Fiji (+679)'},
    {'id': 67, 'country': 'Finland (+358)'},
    {'id': 68, 'country': 'France (+33)'},
    {'id': 69, 'country': 'French Guiana (+594)'},
    {'id': 70, 'country': 'French Polynesia (+689)'},
    {'id': 71, 'country': 'Gabon (+241)'},
    {'id': 72, 'country': 'Gambia (+220)'},
    {'id': 73, 'country': 'Georgia (+7880)'},
    {'id': 74, 'country': 'Germany (+49)'},
    {'id': 75, 'country': 'Ghana (+233)'},
    {'id': 76, 'country': 'Gibraltar (+350)'},
    {'id': 77, 'country': 'Greece (+30)'},
    {'id': 78, 'country': 'Greenland (+299)'},
    {'id': 79, 'country': 'Grenada (+1473)'},
    {'id': 80, 'country': 'Guadeloupe (+590)'},
    {'id': 81, 'country': 'Guam (+671)'},
    {'id': 82, 'country': 'Guatemala (+502)'},
    {'id': 83, 'country': 'Guinea (+224)'},
    {'id': 84, 'country': 'Guinea - Bissau (+245)'},
    {'id': 85, 'country': 'Guyana (+592)'},
    {'id': 86, 'country': 'Haiti (+509)'},
    {'id': 87, 'country': 'Honduras (+504)'},
    {'id': 88, 'country': 'Hong Kong (+852)'},
    {'id': 89, 'country': 'Hungary (+36)'},
    {'id': 90, 'country': 'Iceland (+354)'},
    {'id': 91, 'country': 'India (+91)'},
    {'id': 92, 'country': 'Indonesia (+62)'},
    {'id': 93, 'country': 'Iran (+98)'},
    {'id': 94, 'country': 'Iraq (+964)'},
    {'id': 95, 'country': 'Israel (+972)'},
    {'id': 96, 'country': 'Italy (+39)'},
    {'id': 97, 'country': 'Ivory Coast (+225)'},
    {'id': 98, 'country': 'Jamaica (+1876)'},
    {'id': 99, 'country': 'Japan (+81)'},
    {'id': 100, 'country': 'Jordan (+962)'},
    {'id': 101, 'country': 'Kazakhstan (+7)'},
    {'id': 102, 'country': 'Kenya (+254)'},
    {'id': 103, 'country': 'Kiribati (+686)'},
    {'id': 104, 'country': 'Korea North (+850)'},
    {'id': 105, 'country': 'Korea South (+82)'},
    {'id': 106, 'country': 'Kuwait (+965)'},
    {'id': 107, 'country': 'Kyrgyzstan (+996)'},
    {'id': 108, 'country': 'Laos (+856)'},
    {'id': 109, 'country': 'Latvia (+371)'},
    {'id': 110, 'country': 'Lebanon (+961)'},
    {'id': 111, 'country': 'Lesotho (+266)'},
    {'id': 112, 'country': 'Liberia (+231)'},
    {'id': 113, 'country': 'Libya (+218)'},
    {'id': 114, 'country': 'Liechtenstein (+417)'},
    {'id': 115, 'country': 'Lithuania (+370)'},
    {'id': 116, 'country': 'Luxembourg (+352)'},
    {'id': 117, 'country': 'Macao (+853)'},
    {'id': 118, 'country': 'Macedonia (+389)'},
    {'id': 119, 'country': 'Madagascar (+261)'},
    {'id': 120, 'country': 'Malawi (+265)'},
    {'id': 121, 'country': 'Malaysia (+60)'},
    {'id': 122, 'country': 'Maldives (+960)'},
    {'id': 123, 'country': 'Mali (+223)'},
    {'id': 124, 'country': 'Malta (+356)'},
    {'id': 125, 'country': 'Marshall Islands (+692)'},
    {'id': 126, 'country': 'Martinique (+596)'},
    {'id': 127, 'country': 'Mauritania (+222)'},
    {'id': 128, 'country': 'Mayotte (+269)'},
    {'id': 129, 'country': 'Mexico (+52)'},
    {'id': 130, 'country': 'Micronesia (+691)'},
    {'id': 131, 'country': 'Moldova (+373)'},
    {'id': 132, 'country': 'Monaco (+377)'},
    {'id': 133, 'country': 'Mongolia (+976)'},
    {'id': 134, 'country': 'Montserrat (+1664)'},
    {'id': 135, 'country': 'Morocco (+212)'},
    {'id': 136, 'country': 'Mozambique (+258)'},
    {'id': 137, 'country': 'Myanmar (+95)'},
    {'id': 138, 'country': 'Namibia (+264)'},
    {'id': 139, 'country': 'Nauru (+674)'},
    {'id': 140, 'country': 'Nepal (+977)'},
    {'id': 141, 'country': 'Netherlands (+31)'},
    {'id': 142, 'country': 'New Caledonia (+687)'},
    {'id': 143, 'country': 'New Zealand (+64)'},
    {'id': 144, 'country': 'Nicaragua (+505)'},
    {'id': 145, 'country': 'Niger (+227)'},
    {'id': 146, 'country': 'Nigeria (+234)'},
    {'id': 147, 'country': 'Niue (+683)'},
    {'id': 148, 'country': 'Norfolk Islands (+672)'},
    {'id': 149, 'country': 'Northern Marianas (+670)'},
    {'id': 150, 'country': 'Norway (+47)'},
    {'id': 151, 'country': 'Oman (+968)'},
    {'id': 152, 'country': 'Palau (+680)'},
    {'id': 153, 'country': 'Panama (+507)'},
    {'id': 154, 'country': 'Papua New Guinea (+675)'},
    {'id': 155, 'country': 'Paraguay (+595)'},
    {'id': 156, 'country': 'Peru (+51)'},
    {'id': 157, 'country': 'Philippines (+63)'},
    {'id': 158, 'country': 'Poland (+48)'},
    {'id': 159, 'country': 'Portugal (+351)'},
    {'id': 160, 'country': 'Puerto Rico (+1787)'},
    {'id': 161, 'country': 'Qatar (+974)'},
    {'id': 162, 'country': 'Reunion (+262)'},
    {'id': 163, 'country': 'Romania (+40)'},
    {'id': 164, 'country': 'Russia (+7)'},
    {'id': 165, 'country': 'Rwanda (+250)'},
    {'id': 166, 'country': 'San Marino (+378)'},
    {'id': 167, 'country': 'Sao Tome & Principe (+239)'},
    {'id': 168, 'country': 'Saudi Arabia (+966)'},
    {'id': 169, 'country': 'Senegal (+221)'},
    {'id': 170, 'country': 'Serbia (+381)'},
    {'id': 171, 'country': 'Seychelles (+248)'},
    {'id': 172, 'country': 'Sierra Leone (+232)'},
    {'id': 173, 'country': 'Singapore (+65)'},
    {'id': 174, 'country': 'Slovak Republic (+421)'},
    {'id': 175, 'country': 'Slovenia (+386)'},
    {'id': 176, 'country': 'Solomon Islands (+677)'},
    {'id': 177, 'country': 'Somalia (+252)'},
    {'id': 178, 'country': 'South Africa (+27)'},
    {'id': 179, 'country': 'Spain (+34)'},
    {'id': 180, 'country': 'Sri Lanka (+94)'},
    {'id': 181, 'country': 'St. Helena (+290)'},
    {'id': 182, 'country': 'St. Kitts (+1869)'},
    {'id': 183, 'country': 'St. Lucia (+1758)'},
    {'id': 184, 'country': 'Sudan (+249)'},
    {'id': 185, 'country': 'Suriname (+597)'},
    {'id': 186, 'country': 'Swaziland (+268)'},
    {'id': 187, 'country': 'Sweden (+46)'},
    {'id': 188, 'country': 'Switzerland (+41)'},
    {'id': 189, 'country': 'Syria (+963)'},
    {'id': 190, 'country': 'Taiwan (+886)'},
    {'id': 191, 'country': 'Tajikstan (+7)'},
    {'id': 192, 'country': 'Thailand (+66)'},
    {'id': 193, 'country': 'Togo (+228)'},
    {'id': 194, 'country': 'Tonga (+676)'},
    {'id': 195, 'country': 'Trinidad & Tobago (+1868)'},
    {'id': 196, 'country': 'Tunisia (+216)'},
    {'id': 197, 'country': 'Turkey (+90)'},
    {'id': 198, 'country': 'Turkmenistan (+7)'},
    {'id': 199, 'country': 'Turkmenistan (+993)'},
    {'id': 200, 'country': 'Turks & Caicos Islands (+1649)'},
    {'id': 201, 'country': 'Tuvalu (+688)'},
    {'id': 202, 'country': 'Uganda (+256)'},
    {'id': 203, 'country': 'Ukraine (+380)'},
    {'id': 204, 'country': 'United Arab Emirates (+971)'},
    {'id': 205, 'country': 'Uruguay (+598)'},
    {'id': 206, 'country': 'Uzbekistan (+7)'},
    {'id': 207, 'country': 'Vanuatu (+678)'},
    {'id': 208, 'country': 'Vatican City (+379)'},
    {'id': 209, 'country': 'Venezuela (+58)'},
    {'id': 210, 'country': 'Vietnam (+84)'},
    {'id': 211, 'country': 'Virgin Islands - British (+1284)'},
    {'id': 212, 'country': 'Virgin Islands - US (+1340)'},
    {'id': 213, 'country': 'Wallis & Futuna (+681)'},
    {'id': 214, 'country': 'Yemen (North)(+969)'},
    {'id': 215, 'country': 'Yemen (South)(+967)'},
    {'id': 216, 'country': 'Yugoslavia (+381)'},
    {'id': 217, 'country': 'Zaire (+243)'},
    {'id': 218, 'country': 'Zambia (+260)'}
  ];
  static const YYYMMDDFormat = "yyy-MM-dd";


  static const BASE_URL = "https://alfifaportal.urbansoft.co.uk/api/";
  static const pleaseFillAllFields = "Please fill all the fields";
  static const pleaseCheckInternet = "Please check your internet connection";

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
