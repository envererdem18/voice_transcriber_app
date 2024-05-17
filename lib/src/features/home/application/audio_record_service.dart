import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_record_service.g.dart';

class AudioRecordService {
  final AudioRecorder _audioRecorder = AudioRecorder();

  /// Check and request permission if needed
  Future<void> startRecording() async {
    if (await _audioRecorder.hasPermission()) {
      final Directory appDocumentsDir =
          await getApplicationDocumentsDirectory();
      print('appDocumentsDir.path: ${appDocumentsDir.path}');
      // // Start recording to file
      // await _audioRecorder.start(
      //   const RecordConfig(),
      //   path: 'aFullPath/myFile.m4a',
      // );
      // // ... or to stream
      // final stream = await _audioRecorder.startStream(
      //   const RecordConfig(encoder: AudioEncoder.pcm16bits),
      // );

      // stream.listen((event) {
      //   print(event);
      // });
    }
  }

  Future<void> stopRecording() async {
    // await _audioRecorder.stop();
  }

  Future<void> pauseRecording() async {
    await _audioRecorder.pause();
  }

  Future<void> resumeRecording() async {
    await _audioRecorder.resume();
  }

  Future<void> deleteRecording() async {
    await _audioRecorder.cancel();
    _audioRecorder.dispose();
  }
}

@Riverpod(keepAlive: true)
AudioRecordService audioRecordService(AudioRecordServiceRef ref) {
  return AudioRecordService();
}
