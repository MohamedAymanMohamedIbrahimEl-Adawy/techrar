import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../data/model/task_model.dart';
import 'status_badge.dart';

class TaskCard extends StatelessWidget {
  final TaskModel taskModel;
  const TaskCard({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(
          taskModel.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        subtitle: Text(
          '${'userId'.tr()} : ${taskModel.userId}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        trailing: StatusBadge(completed: taskModel.completed),
      ),
    );
  }
}
