import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final Box box;

  LanguageBloc(this.box)
      : super(LanguageState(
    locale: const Locale('en'),
    translations: {},
  )) {
    on<LoadLanguage>(_onLoadLanguage);
    on<ChangeLanguage>(_onChangeLanguage);
  }

  Future<void> _onLoadLanguage(
      LoadLanguage event, Emitter<LanguageState> emit) async {
    final savedLang = box.get('language', defaultValue: 'en');
    final translations = await _loadJson(savedLang);
    emit(LanguageState(
      locale: Locale(savedLang),
      translations: translations,
    ));
  }

  Future<void> _onChangeLanguage(
      ChangeLanguage event, Emitter<LanguageState> emit) async {
    await box.put('language', event.locale.languageCode);
    final translations = await _loadJson(event.locale.languageCode);
    emit(LanguageState(
      locale: event.locale,
      translations: translations,
    ));
  }

  Future<Map<String, String>> _loadJson(String code) async {
    final String jsonString =
    await rootBundle.loadString('assets/lang/$code.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }
}
