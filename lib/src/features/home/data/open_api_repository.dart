import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_transcriber_app/src/core/network/dio_provider.dart';

part 'open_api_repository.g.dart';

class OpenApiRepository {
  final Dio dio;

  OpenApiRepository(this.dio);

  Future<String> transcribe() async {
    // try {
    //   final response = await dio.post(EndPoint.transcriptions.path);
    //   print(response.data);
    // } catch (e) {
    //   print(e);
    // }

    return 'Transcribed text';
  }
}

@Riverpod(keepAlive: true)
OpenApiRepository openApiRepository(OpenApiRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return OpenApiRepository(dio);
}
