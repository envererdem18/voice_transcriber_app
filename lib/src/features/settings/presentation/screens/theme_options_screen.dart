import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_transcriber_app/src/core/extensions/build_context_extension.dart';

import '../../../../core/theme/theme_mode_controller.dart';

class ThemeOptionsScreen extends ConsumerWidget {
  const ThemeOptionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final themeModeNotifier = ref.read(themeModeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.themeOptions),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: Text(context.loc.light),
            selected: themeMode == ThemeMode.light,
            onTap: () => themeModeNotifier.changeTheme(ThemeMode.light),
          ),
          ListTile(
            leading: const Icon(Icons.nightlight_round),
            title: Text(context.loc.dark),
            selected: themeMode == ThemeMode.dark,
            onTap: () => themeModeNotifier.changeTheme(ThemeMode.dark),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(context.loc.system),
            selected: themeMode == ThemeMode.system,
            onTap: () => themeModeNotifier.changeTheme(ThemeMode.system),
          ),
        ],
      ),
    );
  }
}
