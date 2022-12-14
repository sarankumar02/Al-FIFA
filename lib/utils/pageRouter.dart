import 'package:al_fifa/screens/homeScreen.dart';
import 'package:al_fifa/screens/login_screen.dart';
import 'package:al_fifa/screens/splashscreen.dart';
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