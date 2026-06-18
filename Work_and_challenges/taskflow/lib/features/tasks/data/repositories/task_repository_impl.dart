import 'package:fpdart/fpdart.dart' hide Task;
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_remote_datasource.dart';
import '../mappers/task_mapper.dart';

/// Implements the domain contract. This is where exceptions become Failures
/// and where remote + local sources are coordinated (local source added Day 4/5).
class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl(this._remote);
  final TaskRemoteDataSource _remote;

  @override
  Future<Either<Failure, List<Task>>> getTasks({String? cursor}) async {
    try {
      final dtos = await _remote.getTasks(cursor: cursor);
      return Right(dtos.map((d) => d.toEntity()).toList());
    } on UnauthorizedException {
      return const Left(UnauthorizedFailure());
    } on NetworkException {
      return const Left(NetworkFailure());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Task>> createTask(Task task) async {
    try {
      final dto = await _remote.createTask(task.toDto());
      return Right(dto.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Task>> toggleDone(String id) async {
    // TODO(Day 4): implement via remote + local update.
    return const Left(ServerFailure('Not implemented yet'));
  }

  @override
  Future<Either<Failure, Unit>> deleteTask(String id) async {
    // TODO(Day 4): implement.
    return const Left(ServerFailure('Not implemented yet'));
  }
}
