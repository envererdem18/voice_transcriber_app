import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: Colors.purple,
      ),
    ).copyWith(
      listTileTheme: ListTileThemeData(
        selectedTileColor: Colors.grey[300],
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        circularTrackColor: Colors.white,
      ),
    );
