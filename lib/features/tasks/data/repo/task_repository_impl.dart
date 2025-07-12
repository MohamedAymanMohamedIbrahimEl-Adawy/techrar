import 'package:techrar/core/data/constants/api_constants.dart';
import 'package:techrar/core/services/network/api_response_model.dart';
import 'package:techrar/core/services/network/network_interface.dart';

import '../../domain/repo/task_repository.dart';
import '../model/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final NetworkClientInterface networkClientInterface;

  TaskRepositoryImpl({required this.networkClientInterface});

  @override
  Future<List<TaskModel>> getTasks() async {
    final ApiResponseModel apiResponseModel = await networkClientInterface.get(
      endPoint: ApiConstants.tasks,
    );
    apiResponseModel.data;
    final list = apiResponseModel.data as List<dynamic>;

    return list.map((e) => TaskModel.fromMap(e)).toList();
  }
}
