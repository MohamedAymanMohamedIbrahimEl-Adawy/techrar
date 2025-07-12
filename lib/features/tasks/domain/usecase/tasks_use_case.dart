import '../../data/model/task_model.dart';
import '../repo/task_repository.dart';

class TasksUseCase {
  final TaskRepository repository;

  TasksUseCase({required this.repository});

  Future<List<TaskModel>> call() {
    return repository.getTasks();
  }
}
