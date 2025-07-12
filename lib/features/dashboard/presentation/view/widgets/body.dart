import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../tasks/presentation/view/widgets/task_card.dart';
import '../../../../tasks/presentation/viewmodel/task_viewmodel.dart';
import '../../viewmodel/team_viewmodel.dart';
import 'team_member_card.dart';

class Body extends ConsumerWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final members = ref.watch(teamMembersProvider);
    final tasksAsync = ref.watch(taskProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'teamMembers'.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: members.length,
                itemBuilder: (context, i) => TeamMemberCard(member: members[i]),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'recentTasks'.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            tasksAsync.when(
              data:
                  (tasks) => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: tasks.take(10).length,
                    itemBuilder: (context, i) => TaskCard(taskModel: tasks[i]),
                  ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error:
                  (e, st) => Text(
                    'Error: $e',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddTaskSheet extends StatelessWidget {
  const AddTaskSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('addTask'.tr(), style: Theme.of(context).textTheme.titleLarge),
          TextField(decoration: InputDecoration(labelText: 'title'.tr())),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('save'.tr()),
          ),
        ],
      ),
    );
  }
}
