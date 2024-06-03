import 'package:flutter/material.dart';

extension LocalExtension on Locale {
  /// Returns the iso code of the locale.
  ///
  /// * The iso code will be returned according to the language code.
  /// * If the language code is not supported, 'en' will be returned.
  ///
  String get isoCode => switch (languageCode) {
        'tr' => 'tr',
        'en' => 'en',
        'de' => 'de',
        'fr' => 'fr',
        'es' => 'es',
        'it' => 'it',
        'pt' => 'pt',
        'ru' => 'ru',
        'ja' => 'jn',
        _ => 'en',
      };
}
