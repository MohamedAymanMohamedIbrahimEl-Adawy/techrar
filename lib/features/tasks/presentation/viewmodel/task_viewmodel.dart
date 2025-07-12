import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techrar/core/services/network/dio_client.dart';
import '../../../../service_locator.dart';
import '../../data/model/task_model.dart';
import '../../data/repo/task_repository_impl.dart';
import '../../domain/repo/task_repository.dart';
import '../../domain/usecase/tasks_use_case.dart';

final tasksRepositoryProvider = Provider<TaskRepository>(
  (ref) =>
      TaskRepositoryImpl(networkClientInterface: serviceLocator<DioClient>()),
);
final tasksUseCaseProvider = Provider<TasksUseCase>(
  (ref) => TasksUseCase(repository: ref.read(tasksRepositoryProvider)),
);
final taskProvider = FutureProvider<List<TaskModel>>((ref) {
  final useCase = ref.read(tasksUseCaseProvider);
  return useCase();
});
