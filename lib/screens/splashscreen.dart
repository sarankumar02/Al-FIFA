import 'dart:async';

import 'package:al_fifa/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(milliseconds: 1600),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ScreenDecider())));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/images/splash.png"),
          ),
          Text("SPLASH SCREEN")
        ],
      ),
    );
  }
}
