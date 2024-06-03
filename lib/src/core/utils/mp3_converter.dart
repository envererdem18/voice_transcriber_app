import 'dart:io';
import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'record_file.dart';

part 'mp3_converter.g.dart';

@riverpod
Future<File> convertToMp3(ConvertToMp3Ref ref) async {
  final tempFile = await ref.read(recordFileProvider.future);
  final bytes = await tempFile.readAsBytes();
  final mp3File = File(tempFile.path.replaceFirst('wav', 'mp3'));
  await mp3File.writeAsBytes(Uint8List.fromList(bytes));
  return mp3File;
}
