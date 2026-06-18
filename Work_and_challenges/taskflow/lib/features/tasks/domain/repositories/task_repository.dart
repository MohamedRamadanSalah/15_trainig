import 'package:fpdart/fpdart.dart' hide Task;
import '../../../../core/error/failures.dart';
import '../entities/task.dart';

/// Domain CONTRACT. Defined in the domain layer; implemented in the data layer.
/// This is the dependency-inversion seam: domain depends on this abstraction,
/// data depends on domain. The arrow points inward.
abstract interface class TaskRepository {
  Future<Either<Failure, List<Task>>> getTasks({String? cursor});

  Future<Either<Failure, Task>> createTask(Task task);

  Future<Either<Failure, Task>> toggleDone(String id);

  Future<Either<Failure, Unit>> deleteTask(String id);
}
