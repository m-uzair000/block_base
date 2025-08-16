part of 'language_bloc.dart';

class LanguageState {
  final Locale locale;
  final Map<String, String> translations;

  LanguageState({
    required this.locale,
    required this.translations,
  });
}
