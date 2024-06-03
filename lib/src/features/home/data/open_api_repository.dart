import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_transcriber_app/src/core/network/dio_provider.dart';

import '../../../core/network/endpoints.dart';

part 'open_api_repository.g.dart';

class OpenApiRepository {
  final Dio dio;

  OpenApiRepository(this.dio);

  Future<String> transcribe(
    File recordedFile, {
    String? targetLanguageCode,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(recordedFile.path),
        'model': 'whisper-1',
        'response_format': 'text',
        'language': targetLanguageCode,
      });
      final response = await dio.post(
        EndPoint.transcriptions.path,
        data: formData,
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to transcribe audio: $e');
    }
  }
}

@Riverpod(keepAlive: true)
OpenApiRepository openApiRepository(OpenApiRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return OpenApiRepository(dio);
}
