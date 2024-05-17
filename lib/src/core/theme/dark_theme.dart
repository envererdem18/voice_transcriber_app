import 'package:flutter/material.dart';

ThemeData get darkTheme => ThemeData(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: Colors.green,
      ),
    ).copyWith(
      listTileTheme: ListTileThemeData(
        selectedTileColor: Colors.grey[700],
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        circularTrackColor: Colors.white,
      ),
    );
