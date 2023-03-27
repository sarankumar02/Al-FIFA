

import 'dart:io';

import 'package:al_fifa/app_localization.dart';
import 'package:al_fifa/bloc/auth_bloc.dart';
import 'package:al_fifa/bloc/login_bloc.dart';
import 'package:al_fifa/bloc/other_services.dart';
import 'package:al_fifa/bloc/passport_bloc.dart';
import 'package:al_fifa/bloc/profile_bloc.dart';
import 'package:al_fifa/bloc/reset_bloc.dart';
import 'package:al_fifa/bloc/settings_bloc.dart';

import 'package:al_fifa/screens/login_screen.dart';
import 'package:al_fifa/screens/splashscreen.dart';
import 'package:al_fifa/utils/pageRouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient( context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() {
   HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<SettingsBloc>(
        create: (_) => SettingsBloc(),
       
      ),
       Provider<AuthBloc>(create: (_) => AuthBloc()),
            Provider<LoginBloc>(create: (_) => LoginBloc()),
            Provider<UserDetailsBloc>(create: (_) => UserDetailsBloc()),
            Provider<ResetPassswordBloc>(create: (_) => ResetPassswordBloc()),
            Provider<PassportBloc>(create: (_) => PassportBloc()),
            Provider<OtherServicesBloc>(create: (_) => OtherServicesBloc()),
    ], child: const MyWidget());
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late SettingsBloc settingsBloc;

  @override
  Widget build(BuildContext context) {
    settingsBloc = Provider.of<SettingsBloc>(context);

    return StreamBuilder(
        stream: settingsBloc.language,
        builder: (context, AsyncSnapshot snapshot) {
          return MaterialApp(
            supportedLocales: const [
              Locale('ar', 'AR'),
              Locale('en', 'US'),
            ],
            
            localizationsDelegates: const [
              DemoLocalizationsDelegate(),
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: snapshot.data,
            debugShowCheckedModeBanner: false,
            title: 'Al Fifa',
            onGenerateRoute: FifaRouter.generateRoute,
            initialRoute: "/",
          );
        });
  }
}

class ScreenDecider extends StatefulWidget {
  const ScreenDecider({Key? key}) : super(key: key);

  @override
  State<ScreenDecider> createState() => _ScreenDeciderState();
}

class _ScreenDeciderState extends State<ScreenDecider> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
