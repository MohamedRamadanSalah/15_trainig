import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio _dio;
  final int maxRetries;
  RetryInterceptor(this._dio, {this.maxRetries = 2});
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    final retries = options.extra['retries'] ?? 0;

    if (_shouldRetry(err) && retries < maxRetries) {
      // ignore: avoid_print
      print('🔁 [RetryInterceptor] retrying... attempt #${retries + 1}');

      try {
        final response =
            await _dio.fetch(options..extra['retries'] = retries + 1);
        handler.resolve(response);
      } catch (e) {
        handler.next(e is DioException
            ? e
            : DioException(requestOptions: options, error: e));
      }
    } else {
      // ignore: avoid_print
      print('❌ [RetryInterceptor] max retries reached. No more attempts.');
      handler.next(err);
    }
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout;
  }
}
