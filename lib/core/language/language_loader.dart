import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class LanguageLoader {
  static final Map<String, Map<String, String>> _localizedValues = {};

  static const supportedLocales = [
    Locale('en'),
    Locale('ur'),
  ];

  static const languages = [
    {'key': 'en', 'flag': 'assets/flags/us.svg'},
    {'key': 'ur', 'flag': 'assets/flags/pk.svg'},
  ];

  static Future<void> init() async {
    for (final lang in languages) {
      final key = lang['key']!;
      final jsonString = await rootBundle.loadString('assets/lang/$key.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      _localizedValues[key] =
          jsonMap.map((k, v) => MapEntry(k, v.toString()));
    }
  }

  static String tr(String key, {Locale? locale}) {
    final langCode = locale?.languageCode ?? 'en';
    return _localizedValues[langCode]?[key] ?? key;
  }
}
