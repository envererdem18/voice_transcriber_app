import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system);

  changeTheme(ThemeMode themeMode) {
    state = themeMode;
  }
}

/// A provider that provides the current theme mode of the app.
///
/// * The initial theme mode will be [ThemeMode.system].
/// * The theme mode can be changed by calling the [changeTheme] method.
///
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(),
);
