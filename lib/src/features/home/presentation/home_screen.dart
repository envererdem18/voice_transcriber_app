import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:voice_transcriber_app/src/common_widgets/buttons/play_pause_button.dart';
import 'package:voice_transcriber_app/src/core/extensions/build_context_extension.dart';
import 'package:voice_transcriber_app/src/features/settings/presentation/settings_screen.dart';

import '../../../common_widgets/language_selector_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Transcriber'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LanguageSelectorWidget(
              onLanguageSelected: (country) {
                print('Selected Language: $country');
              },
            ),
            const Gap(40),
            PlayPauseButton(
              enabled: true,
              warningMessage: context.loc.pleaseSelectALanguageFirst,
              status: (isRecording) {
                print(isRecording ? 'Recording' : 'Stopped');
              },
            ),
            const Gap(80),
          ],
        ),
      ),
    );
  }
}
