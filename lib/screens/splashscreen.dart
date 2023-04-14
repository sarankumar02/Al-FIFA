import 'dart:async';

import 'package:al_fifa/bloc/settings_bloc.dart';
import 'package:al_fifa/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SettingsBloc settingsBloc;
  @override
  void initState() {
    settingsBloc = SettingsBloc();
    Future.delayed(
        const Duration(seconds: 4),
        () => {
              settingsBloc.changeUserLogin(),
              Navigator.pushReplacementNamed(context, "/homePage")
            });
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/Logos/Alfifa logo.png",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
