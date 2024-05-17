import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_transcriber_app/src/features/home/application/audio_record_service.dart';
import 'package:voice_transcriber_app/src/features/home/presentation/controller/home_state.dart';

import '../../data/open_api_repository.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() => HomeState.initial();

  onStatusChanged(bool isRecording) {
    isRecording ? startRecording() : stopRecording();
  }

  Future<void> startRecording() async {
    _clearText();
    state = const AsyncValue.loading();
    await ref.read(audioRecordServiceProvider).startRecording();
  }

  Future<void> stopRecording() async {
    state = await AsyncValue.guard(() async {
      await ref.read(audioRecordServiceProvider).stopRecording();
      final transcribedText = await _transcribe();
      await Future.delayed(const Duration(seconds: 2));
      return state.value!.copyWith(transcribedText: transcribedText);
    });
  }

  onLanguageSelected(Country country) {
    _setLocale(Locale(country.name, ''));
  }

  Future<String> _transcribe() async {
    return await ref.read(openApiRepositoryProvider).transcribe();
  }

  _setLocale(Locale locale) {
    state = AsyncValue<HomeState>.data(state.value!.copyWith(locale: locale));
  }

  _clearText() => state = AsyncValue.data(
        HomeState(locale: state.value!.locale, transcribedText: null),
      );
}
