import 'package:flutter/material.dart';

extension LocalExtension on Locale {
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
