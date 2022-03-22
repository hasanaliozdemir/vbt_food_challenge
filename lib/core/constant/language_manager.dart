import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager? _instace;
  static LanguageManager get instance {
    _instace ??= LanguageManager._init();
    return _instace!;
  }

  LanguageManager._init();
  final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');
  
  List<Locale> get supportedLocales => [enLocale, trLocale];
}
