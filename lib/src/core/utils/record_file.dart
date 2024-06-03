import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'record_file.g.dart';

@riverpod
Future<File> recordFile(RecordFileRef ref) async {
  // Get the temporary directory
  final Directory tempDir = await getApplicationCacheDirectory();

  // Create a temporary file to store the MP3 data and return
  return File('${tempDir.path}/audio.wav');
}
