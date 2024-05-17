import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_transcriber_app/src/features/home/presentation/controller/home_state.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() => HomeState.initial();

  onStatusChanged(bool isRecording) {
    print(isRecording ? 'Recording' : 'Stopped');
    isRecording ? startRecord() : stopRecord();
  }

  Future<void> startRecord() async {
    clearText();
    print('Recording');
    state = const AsyncValue.loading();
  }

  Future<void> stopRecord() async {
    state = await AsyncValue.guard(() async {
      print('Recorded');
      final transcribedText = await transcribe();
      await Future.delayed(const Duration(seconds: 2));
      print('Transcribed');
      return state.value!.copyWith(transcribedText: transcribedText);
    });
  }

  Future<String> transcribe() async {
    return 'Transcribed text';
  }

  onLanguageSelected(Country country) {
    setLocale(Locale(country.name, ''));
  }

  setLocale(Locale locale) {
    state = AsyncValue<HomeState>.data(state.value!.copyWith(locale: locale));
  }

  clearText() => state = AsyncValue.data(
        HomeState(locale: state.value!.locale, transcribedText: null),
      );
}
