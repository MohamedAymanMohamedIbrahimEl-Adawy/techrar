import '../../data/model/task_model.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> getTasks();
}
