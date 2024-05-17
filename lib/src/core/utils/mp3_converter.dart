// part 'date_formatter.g.dart';

// @riverpod
// DateFormat dateFormatter(DateFormatterRef ref) {
//   /// Date formatter to be used in the app.
//   return DateFormat.MMMEd();
// }

import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

Future<File> convertToMp3(List<Uint8List> data) async {
  // Get the application documents directory
  final Directory appDocumentsDir = await getTemporaryDirectory();

  // Create a temporary file to store the MP3 data
  final tempFile = File('${appDocumentsDir.path}/audio.mp3');

  // Open the file in write mode
  final file = await tempFile.open(mode: FileMode.write);

  // Write the data to the file
  for (final chunk in data) {
    await file.writeFrom(chunk);
  }

  // Close the file
  await file.close();

  // Return the converted MP3 file
  return tempFile;
}
