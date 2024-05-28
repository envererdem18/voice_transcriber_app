import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizedBuildContext on BuildContext {
  /// Returns the localized strings for the current locale
  L get loc => L.of(this);

  /// Returns the localized string for the given [Country]
  String locLanguageFromCountry(Country country) => switch (country) {
        Country.tr => loc.turkish,
        Country.us => loc.english,
        Country.de => loc.german,
        Country.fr => loc.french,
        Country.es => loc.spanish,
        Country.it => loc.italian,
        Country.pt => loc.portuguese,
        Country.ru => loc.russian,
        Country.jp => loc.japanese,
        _ => loc.english,
      };

  /// Returns the localized string for the given [Locale]
  String locLanguageFromLocale(Locale locale) => switch (locale.languageCode) {
        'tr' => loc.turkish,
        'en' => loc.english,
        'de' => loc.german,
        'fr' => loc.french,
        'es' => loc.spanish,
        'it' => loc.italian,
        'pt' => loc.portuguese,
        'ru' => loc.russian,
        'ja' => loc.japanese,
        _ => loc.english,
      };

  /// Returns the localized string for the given [ThemeMode]
  String locTheme(ThemeMode themeMode) => switch (themeMode) {
        ThemeMode.light => loc.light,
        ThemeMode.dark => loc.dark,
        ThemeMode.system => loc.system,
      };
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get mediaQuerySize => mediaQuery.size;
  double get screenHeight => mediaQuerySize.height;
  double get screenWidth => mediaQuerySize.width;
}
