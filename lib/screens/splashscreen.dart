import 'dart:async';

import 'package:al_fifa/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? _timer;
  @override
  void initState() {
   _timer =  Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, "/homePage")
        
    );
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/Logos/Alfifa logo.png",
        width: 200,
        height: 200,),
      ),
    );
  }
}
