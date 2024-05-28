import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_transcriber_app/src/core/theme/dark_theme.dart';
import 'package:voice_transcriber_app/src/core/theme/light_theme.dart';

import 'core/localization/localization_notifier.dart';
import 'core/routing/app_router.dart';
import 'core/theme/theme_mode_notifier.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localizationProvider);
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: goRouter,
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
    );
  }
}


/// TODOS:
/// 9. Complete all comments
/// 10. Write tests
/// 11. Write documentation
/// 
/// Docs:
///! obfuscation
///