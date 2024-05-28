import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_transcriber_app/src/features/home/presentation/home_screen.dart';
import 'package:voice_transcriber_app/src/features/settings/presentation/screens/supported_languages_screen.dart';
import 'package:voice_transcriber_app/src/features/settings/presentation/screens/theme_options_screen.dart';
import 'package:voice_transcriber_app/src/features/settings/presentation/settings_screen.dart';

import 'not_found_screen.dart';

part 'app_router.g.dart';

enum AppRoute {
  home,
  settings,
  supportedLanguages,
  themeOptions,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/home',
        name: AppRoute.home.name,
        pageBuilder: (context, state) => const MaterialPage(
          child: HomeScreen(),
        ),
        routes: [
          GoRoute(
            path: 'settings',
            name: AppRoute.settings.name,
            builder: (context, state) => const SettingsScreen(),
            routes: [
              GoRoute(
                path: 'supportedLanguages',
                name: AppRoute.supportedLanguages.name,
                builder: (context, state) => const SupportedLanguagesScreen(),
              ),
              GoRoute(
                path: 'themeOptions',
                name: AppRoute.themeOptions.name,
                builder: (context, state) => const ThemeOptionsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
