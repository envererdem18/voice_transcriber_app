import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_transcriber_app/src/core/theme/dark_theme.dart';
import 'package:voice_transcriber_app/src/core/theme/light_theme.dart';
import 'package:voice_transcriber_app/src/features/home/presentation/home_screen.dart';

import 'core/localization/localization_notifier.dart';
import 'core/theme/theme_mode_notifier.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localizationProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      localizationsDelegates: const [
        L.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('tr', ''),
      ],
      locale: locale,
      home: const HomeScreen(),
    );
  }
}


/// TODOS:
/// 1. Implement route navigation for the settings screen
/// 2. Implement route navigation for the supported languages screen
/// 3. Implement route navigation for the theme options screen
/// 9. Complete all comments
/// 10. Write tests
/// 11. Write documentation
/// 
/// Docs:
///! obfuscation
///