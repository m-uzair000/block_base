part of 'language_bloc.dart';

abstract class LanguageEvent {}

class LoadLanguage extends LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
  final Locale locale;
  ChangeLanguage(this.locale);
}
