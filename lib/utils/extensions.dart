import 'package:flutter/material.dart';
import '../core/language/language_loader.dart';

extension TranslateX on String {
  String trans(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return LanguageLoader.tr(this, locale: locale);
  }
}
