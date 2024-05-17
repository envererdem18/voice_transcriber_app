import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:voice_transcriber_app/src/common_widgets/buttons/play_pause_button.dart';
import 'package:voice_transcriber_app/src/core/extensions/build_context_extension.dart';
import 'package:voice_transcriber_app/src/core/utils/async_value_ui.dart';
import 'package:voice_transcriber_app/src/features/home/presentation/controller/home_state.dart';

import '../../../common_widgets/language_selector_widget.dart';
import 'controller/home_controller.dart';
import 'widgets/home_app_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<HomeState>>(
      homeControllerProvider,
      (_, state) {
        state.showAlertDialogOnError(context);
        state.showTranscribedText(context);
      },
    );
    final notifier = ref.read(homeControllerProvider.notifier);
    final state = ref.watch(homeControllerProvider);
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LanguageSelectorWidget(
              onLanguageSelected: notifier.onLanguageSelected,
            ),
            const Gap(40),
            PlayPauseButton(
              enabled: state.value?.locale != null,
              warningMessage: context.loc.pleaseSelectALanguageFirst,
              isLoading: state.isLoading,
              onStatusChanged: notifier.onStatusChanged,
            ),
            const Gap(80),
          ],
        ),
      ),
    );
  }
}
