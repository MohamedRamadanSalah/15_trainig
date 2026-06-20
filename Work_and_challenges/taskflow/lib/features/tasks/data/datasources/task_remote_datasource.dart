import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../dtos/task_dto.dart';

/// Talks to the network only. Returns DTOs. Throws raw exceptions —
/// the repository is responsible for turning those into Failures.
abstract interface class TaskRemoteDataSource {
  Future<List<TaskDto>> getTasks({String? cursor});
  Future<TaskDto> createTask(TaskDto dto);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  TaskRemoteDataSourceImpl(this._dio);
  final Dio _dio;
  @override
  Future<List<TaskDto>> getTasks({String? cursor}) async {
    try {
      final res = await _dio.get<Map<String, dynamic>>(
        '/todos',
        queryParameters: {if (cursor != null) 'cursor': cursor},
      );
      final list = (res.data?['todos'] as List? ?? []);
      return list
          .map((e) => TaskDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) throw UnauthorizedException();
      if (e.type == DioExceptionType.connectionError) throw NetworkException();
      throw ServerException(e.message ?? 'Request failed');
    }
  }

  @override
  Future<TaskDto> createTask(TaskDto dto) async {
    try {
      final res = await _dio.post<Map<String, dynamic>>(
        '/tasks',
        data: dto.toJson(),
      );
      return TaskDto.fromJson(res.data!);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) throw UnauthorizedException();
      throw ServerException(e.message ?? 'Create failed');
    }
  }
}
