import 'package:flutter/material.dart';
import 'package:techrar/features/dashboard/data/model/team_member_model.dart';

class TeamMemberCard extends StatelessWidget {
  final TeamMember member;
  const TeamMemberCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            CircleAvatar(radius: 28, child: Text(member.name[0])),
            const SizedBox(height: 4),
            Text(member.name, style: const TextStyle(fontSize: 12)),
            Text(
              member.role,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(color: Colors.grey),
            ),
          ],
        ),
        Positioned(
          top: 0,
          right: 14,
          child: Icon(
            member.online ? Icons.circle : Icons.circle_outlined,
            color: member.online ? Colors.green : Colors.red,
            size: 10,
          ),
        ),
      ],
    );
  }
}
