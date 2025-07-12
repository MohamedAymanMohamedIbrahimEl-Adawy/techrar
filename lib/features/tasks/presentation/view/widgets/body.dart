import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/componenet/custom_drop_down/custom_drop_down.dart';
import '../../viewmodel/task_viewmodel.dart';
import 'task_card.dart';

class Body extends ConsumerStatefulWidget {
  const Body({super.key});

  @override
  ConsumerState<Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<Body> {
  String filter = 'all';

  @override
  Widget build(BuildContext context) {
    final tasksAsync = ref.watch(taskProvider);

    return tasksAsync.when(
      data: (tasks) {
        var filtered = tasks;
        if (filter == 'completed') {
          filtered = tasks.where((t) => t.completed).toList();
        } else if (filter == 'incomplete') {
          filtered = tasks.where((t) => !t.completed).toList();
        }
        return RefreshIndicator(
          onRefresh: () => ref.refresh(taskProvider.future),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${'numberOfTasks'.tr()}: ${filtered.length}",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    MyCustomDropDown(
                      width: 150,
                      dropdownLabel: "filter",
                      options: ["all", "completed", "incomplete"],
                      onChange: (value) {
                        setState(
                          () =>
                              filter = value?.toString().toLowerCase() ?? 'all',
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder:
                        (context, i) => TaskCard(taskModel: filtered[i]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error:
          (e, st) => Center(
            child: Text(
              '${"error".tr()}: $e',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
    );
  }
}
