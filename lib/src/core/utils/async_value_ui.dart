import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_transcriber_app/src/core/localization/string_hardcoded.dart';

import '../../common_widgets/alert_dialogs.dart';
import '../../features/home/presentation/controller/home_state.dart';

extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      showExceptionAlertDialog(
        context: context,
        title: 'Error'.hardcoded,
        exception: error,
      );
    }
  }

  void showTranscribedText(BuildContext context) {
    if (this is AsyncData<HomeState>) {
      if (value.transcribedText != null) {
        showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return Center(child: Text(value.transcribedText ?? ''));
          },
        );
      }
    }
  }
}
