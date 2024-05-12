import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_transcriber_app/src/core/extensions/build_context_extension.dart';
import 'package:voice_transcriber_app/src/core/localization/localization_notifier.dart';

class SupportedLanguagesScreen extends ConsumerWidget {
  const SupportedLanguagesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(localizationProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.supportedLanguages),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CountryFlag(
              country: Country.us,
              height: 20,
            ),
            selected: selectedLanguage.languageCode == 'en',
            title: Text(context.loc.english),
            onTap: () => ref
                .read(localizationProvider.notifier)
                .changeLanguage(Country.us),
          ),
          ListTile(
            leading: CountryFlag(
              country: Country.tr,
              height: 20,
            ),
            selected: selectedLanguage.languageCode == 'tr',
            title: Text(context.loc.turkish),
            onTap: () => ref
                .read(localizationProvider.notifier)
                .changeLanguage(Country.tr),
          ),
        ],
      ),
    );
  }
}
