import 'package:dio/dio.dart';
import 'package:taskflow/core/network/interceptors/auth_interceptor.dart';
import 'package:taskflow/core/network/interceptors/error_interceptor.dart';
import 'package:taskflow/core/network/interceptors/retry_interceptor.dart';

/// Builds the configured Dio instance. Day 2 expands this with auth +
/// logging + retry interceptors.
Dio buildDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json'},
    ),
  );
  dio.interceptors.add(AuthInterceptor(() => 'fake-jwt-token-123'));

  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
  ));

  dio.interceptors.add(RetryInterceptor(dio, maxRetries: 2));

  dio.interceptors.add(ErrorInterceptor());
  return dio;
}
