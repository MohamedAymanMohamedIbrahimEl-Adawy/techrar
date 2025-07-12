import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final bool completed;
  const StatusBadge({super.key, required this.completed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: completed ? Colors.green : Colors.orange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        (completed ? 'completed' : 'incomplete').tr(),
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
