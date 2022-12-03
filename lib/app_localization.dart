import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DemoLocalizations {
  DemoLocalizations(this.locale);
  final Locale locale;
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;
  }

  Map<String, String>? _sentences;
  Future<bool> load() async {
    String data = await rootBundle
        .loadString('assets/languages/${locale.languageCode}.json');
    Map<String, dynamic> _result = json.decode(data);
    _sentences = Map();
    _result.forEach((String key, dynamic value) {
      _sentences![key] = value.toString();
    });
    return true;
  }

  String? trans(String key) {
    return _sentences![key];
  }
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);
  @override
  Future<DemoLocalizations> load(Locale locale) async {
    DemoLocalizations localizations = DemoLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
