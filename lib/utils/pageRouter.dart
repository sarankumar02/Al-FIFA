import 'package:al_fifa/screens/homeScreen.dart';
import 'package:al_fifa/screens/login_screen.dart';
import 'package:al_fifa/screens/myRequest/myRequest.dart';
import 'package:al_fifa/screens/payment/paymentScreen.dart';
import 'package:al_fifa/screens/splashscreen.dart';
import 'package:al_fifa/screens/travelInformation/travelInformation.dart';
import 'package:al_fifa/screens/visaScreen/visaRequest.dart';
import 'package:al_fifa/screens/visaScreen/visaScreenOne.dart';
import 'package:al_fifa/screens/visaScreen/visaScreenTwo.dart';
import 'package:al_fifa/utils/camera.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:flutter/material.dart';

class FifaRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case visaScreenOne:
        return MaterialPageRoute(builder: (_) => VisaScreenOne());
      case visaScreenTwo:
        return MaterialPageRoute(builder: (_) => VisaScreenTwo());
      case visaRequest:
        return MaterialPageRoute(builder: (_) => VisaRequestScreen());
      case travelInformation:
        return MaterialPageRoute(builder: (_) => TravelInformation());
      case paymentScreen:
        return MaterialPageRoute(builder: (_) => PaymentScreen());
      case cameraScreen:
        return MaterialPageRoute(builder: (_) => CameraExampleHome());
      case myRequestScreen:
        return MaterialPageRoute(builder: (_) => MyRequestScreen());
      default:
        return  MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            )
        );
    }




  }
}