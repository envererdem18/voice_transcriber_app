import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_transcriber_app/src/core/extensions/build_context_extension.dart';
import 'package:voice_transcriber_app/src/core/routing/app_router.dart';
import 'package:voice_transcriber_app/src/core/theme/theme_mode_notifier.dart';

import '../../../core/localization/localization_notifier.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.settings),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(context.loc.language),
            subtitle: Text(
              context.locLanguageFromLocale(ref.watch(localizationProvider)),
            ),
            subtitleTextStyle: _subtitleTextStyle(ref),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.pushNamed(AppRoute.supportedLanguages.name),
          ),
          ListTile(
            title: Text(context.loc.theme),
            subtitle: Text(context.locTheme(ref.watch(themeModeProvider))),
            subtitleTextStyle: _subtitleTextStyle(ref),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.pushNamed(AppRoute.themeOptions.name),
          ),
        ],
      ),
    );
  }

  TextStyle _subtitleTextStyle(WidgetRef ref) {
    return TextStyle(
      color: ref.read(themeModeProvider) == ThemeMode.light
          ? Colors.purple
          : Colors.green,
      fontWeight: FontWeight.bold,
    );
  }
}
