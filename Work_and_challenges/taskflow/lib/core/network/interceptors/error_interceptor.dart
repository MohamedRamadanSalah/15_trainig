import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 1. observe: log what kind of failure this is
    final code = err.response?.statusCode;
    // ignore: avoid_print
    print(
        '🔴 [ErrorInterceptor] type=${err.type} status=$code uri=${err.requestOptions.uri}');

    // 2. forward it down the chain so the data source still catches it
    handler.next(err);
  }
}
