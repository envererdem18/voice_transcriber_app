import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalizationNotifier extends StateNotifier<Locale> {
  LocalizationNotifier() : super(const Locale('en', ''));

  changeLanguage(Country country) => switch (country) {
        Country.us => state = const Locale('en', ''),
        Country.tr => state = const Locale('tr', ''),
        _ => state = const Locale('en', ''),
      };
}

final localizationProvider =
    StateNotifierProvider<LocalizationNotifier, Locale>(
  (ref) => LocalizationNotifier(),
);
