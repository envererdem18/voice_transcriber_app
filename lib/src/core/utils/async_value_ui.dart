import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_transcriber_app/src/core/localization/string_hardcoded.dart';

import '../../common_widgets/alert_dialogs.dart';
import '../../features/home/presentation/controller/home_state.dart';

extension AsyncValueUI on AsyncValue {
  /// Show an alert dialog if the async value has an error.
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      showExceptionAlertDialog(
        context: context,
        title: 'Error'.hardcoded,
        exception: error,
      );
    }
  }

  /// Show the transcribed text in a modal bottom sheet.
  /// The transcribed text will be shown if the async value is a [HomeState] and the transcribed text is not null.
  void showTranscribedText(BuildContext context) {
    if (this is AsyncData<HomeState>) {
      if (value.transcribedText != null) {
        showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return Center(
                child: Text(
              value.transcribedText ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ));
          },
        );
      }
    }
  }
}
