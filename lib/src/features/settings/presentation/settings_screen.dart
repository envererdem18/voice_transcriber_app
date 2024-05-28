import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_transcriber_app/src/core/extensions/build_context_extension.dart';
import 'package:voice_transcriber_app/src/core/theme/theme_mode_notifier.dart';
import 'package:voice_transcriber_app/src/features/settings/presentation/screens/theme_options_screen.dart';

import '../../../core/localization/localization_notifier.dart';
import 'screens/supported_languages_screen.dart';

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
            onTap: () => _onTap(context, const SupportedLanguagesScreen()),
          ),
          ListTile(
            title: Text(context.loc.theme),
            subtitle: Text(context.locTheme(ref.watch(themeModeProvider))),
            subtitleTextStyle: _subtitleTextStyle(ref),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => _onTap(context, const ThemeOptionsScreen()),
          ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, Widget screen) {
    // TODO: implement route navigation
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
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
