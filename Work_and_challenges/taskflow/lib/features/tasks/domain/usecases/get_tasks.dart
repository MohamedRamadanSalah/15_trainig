import 'package:fpdart/fpdart.dart' hide Task;
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class GetTasksParams {
  const GetTasksParams({this.cursor});
  final String? cursor;
}

/// One use case = one business action. It orchestrates the repository and
/// is the ONLY thing the presentation layer calls into the domain with.
class GetTasks implements UseCase<List<Task>, GetTasksParams> {
  const GetTasks(this._repository);
  final TaskRepository _repository;

  @override
  Future<Either<Failure, List<Task>>> call(GetTasksParams params) {
    return _repository.getTasks(cursor: params.cursor);
  }
}
