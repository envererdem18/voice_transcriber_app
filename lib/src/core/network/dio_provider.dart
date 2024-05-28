import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_transcriber_app/src/core/network/constants.dart';
import 'package:voice_transcriber_app/src/core/network/env/env.dart';

import 'logger_interceptor.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  final dio = Dio();
  dio.options = BaseOptions(
    baseUrl: baseUrl,
    headers: {
      HttpHeaders.contentTypeHeader: 'multipart/form-data',
      HttpHeaders.authorizationHeader: 'Bearer ${Env.openAiKey}',
    },
  );
  dio.interceptors.add(LoggerInterceptor());
  return dio;
}
