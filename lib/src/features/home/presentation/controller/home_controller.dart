import 'dart:io';

import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_transcriber_app/src/core/extensions/local_extension.dart';
import 'package:voice_transcriber_app/src/features/home/application/audio_record_service.dart';
import 'package:voice_transcriber_app/src/features/home/presentation/controller/home_state.dart';

import '../../../../core/utils/mp3_converter.dart';
import '../../data/open_api_repository.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() => HomeState.initial();

  /// Start or stop recording audio.
  ///
  /// * If [isRecording] is true, start recording audio.
  /// * If [isRecording] is false, stop recording audio and transcribe the recorded audio.
  onStatusChanged(bool isRecording) {
    isRecording ? _startRecording() : _stopRecording();
  }

  /// Start recording audio.
  Future<void> _startRecording() async {
    _clearText();
    await ref.read(audioRecordServiceProvider).startRecording();
  }

  /// Stop recording audio and transcribe the recorded audio.
  ///
  /// * The recorded audio will be converted to an mp3 file.
  /// * The mp3 file will be transcribed.
  ///
  Future<void> _stopRecording() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(audioRecordServiceProvider).stopRecording();
      final mp3 = await ref.read(convertToMp3Provider.future);
      final transcribedText = await _transcribe(mp3);
      return state.value!.copyWith(transcribedText: transcribedText);
    });
  }

  onLanguageSelected(Country? country) {
    _setLocale(country != null ? Locale(country.name, '') : null);
  }

  Future<String> _transcribe(File recordedFile) async {
    final isoCode = state.value!.locale?.isoCode;
    return await ref
        .read(openApiRepositoryProvider)
        .transcribe(recordedFile, targetLanguageCode: isoCode);
  }

  _setLocale(Locale? locale) {
    state = AsyncValue<HomeState>.data(state.value!.copyWith(
      locale: locale,
      transcribedText: null,
    ));
  }

  _clearText() => state = AsyncValue.data(
        HomeState(locale: state.value!.locale, transcribedText: null),
      );
}
