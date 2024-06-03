import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:record/record.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_transcriber_app/src/core/utils/record_file.dart';

part 'audio_record_service.g.dart';

class AudioRecordService {
  final Ref ref;

  /// A service that records audio.
  ///
  /// * The [ref] is the reference to the current provider.
  ///
  /// The service uses the [AudioRecorder] to record audio.
  /// The recorded audio will be saved to a temporary file.
  /// The temporary file will be provided by the [recordFileProvider].
  ///
  AudioRecordService(this.ref);

  final AudioRecorder _audioRecorder = AudioRecorder();

  /// Check and request permission if needed
  Future<void> startRecording() async {
    if (await _audioRecorder.hasPermission()) {
      // Get the path of the temporary file
      var path = (await ref.read(recordFileProvider.future)).path;
      // Start recording to file
      await _audioRecorder
          .start(
        const RecordConfig(encoder: AudioEncoder.wav),
        path: path,
      )
          .onError(
        (error, stackTrace) {
          debugPrint('Error: $error');
          debugPrint('Stacktrace: $stackTrace');
          throw Exception(error);
        },
      );
    }
  }

  Future<void> stopRecording() async => await _audioRecorder.stop();
}

@Riverpod(keepAlive: true)
AudioRecordService audioRecordService(AudioRecordServiceRef ref) {
  return AudioRecordService(ref);
}
