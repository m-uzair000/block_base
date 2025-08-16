import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/theme_bloc.dart';
import '../theme/theme_event.dart';
import '../theme/theme_state.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(
            state.isDarkMode ? Icons.dark_mode : Icons.light_mode,
          ),
          onPressed: () {
            context.read<ThemeBloc>().add(ToggleTheme());
          },
        );
      },
    );
  }
}
