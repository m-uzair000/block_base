import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final Box settingsBox;

  ThemeBloc(this.settingsBox) : super(const ThemeState(themeMode: ThemeMode.light)) {
    on<LoadTheme>(_onLoadTheme);
    on<ToggleTheme>(_onToggleTheme);
  }

  void _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) {
    final isDark = settingsBox.get('isDarkMode', defaultValue: false);
    emit(ThemeState(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
  }

  void _onToggleTheme(ToggleTheme event, Emitter<ThemeState> emit) {
    final newTheme = state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    settingsBox.put('isDarkMode', newTheme == ThemeMode.dark);
    emit(ThemeState(themeMode: newTheme));
  }
}
