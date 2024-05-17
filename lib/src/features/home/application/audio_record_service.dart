import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:record/record.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_transcriber_app/src/core/utils/record_file.dart';

part 'audio_record_service.g.dart';

class AudioRecordService {
  final Ref ref;
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
          // TODO: implement error handling
          print('Error: $error');
          print('Stacktrace: $stackTrace');
        },
      );
    }
  }

  Future<void> stopRecording() async => await _audioRecorder.stop();

  // TODO: if you dont need, remove this method
  Future<void> deleteRecording() async {
    await _audioRecorder.cancel();
    _audioRecorder.dispose();
  }
}

@Riverpod(keepAlive: true)
AudioRecordService audioRecordService(AudioRecordServiceRef ref) {
  return AudioRecordService(ref);
}
