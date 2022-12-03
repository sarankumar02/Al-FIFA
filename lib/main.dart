import 'package:al_fifa/app_localization.dart';
import 'package:al_fifa/bloc/settings_bloc.dart';
import 'package:al_fifa/screens/login_screen.dart';
import 'package:al_fifa/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
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
    ], child: MyWidget());
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
            home: SplashScreen(),
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
