import 'package:al_fifa/bloc/reset_bloc.dart';
import 'package:al_fifa/bloc/visa_bloc.dart';
import 'package:al_fifa/screens/about_us.dart';
import 'package:al_fifa/screens/contact_us.dart';
import 'package:al_fifa/screens/forgot_password.dart';
import 'package:al_fifa/screens/homeScreen.dart';
import 'package:al_fifa/screens/login_screen.dart';
import 'package:al_fifa/screens/menu/myProfile.dart';
import 'package:al_fifa/screens/myRequest/myRequest.dart';
import 'package:al_fifa/screens/otherServices/other_services.dart';
import 'package:al_fifa/screens/passport%20and%20releated%20services/passport.dart';
import 'package:al_fifa/screens/passport%20and%20releated%20services/passport_thankyou.dart';
import 'package:al_fifa/screens/payment/paymentScreen.dart';
import 'package:al_fifa/screens/registerScreen.dart';
import 'package:al_fifa/screens/reset_password.dart';
import 'package:al_fifa/screens/splashscreen.dart';
import 'package:al_fifa/screens/travelInformation/travelInformation.dart';
import 'package:al_fifa/screens/visaScreen/visa.dart';
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
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case visaScreenOne:
        return MaterialPageRoute(builder: (_) => const Visa());
      case cameraScreen:
        return MaterialPageRoute(builder: (_) => const CameraExampleHome());
      case myRequestScreen:
        return MaterialPageRoute(builder: (_) => MyRequestScreen());
      case myProfileScreen:
        return MaterialPageRoute(builder: (_) => const MyProfile());
      case forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case passport:
        return MaterialPageRoute(builder: (_) => const Passport());
      case passportThankyou:
        return MaterialPageRoute(builder: (_) => const PassportThankyou());
      case contactus:
        return MaterialPageRoute(builder: (_) => const ContactUS());
      case aboutUS:
        return MaterialPageRoute(builder: (_) => const AboutUS());
      case otherServices:
        return MaterialPageRoute(builder: (_) => const OtherServices());

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