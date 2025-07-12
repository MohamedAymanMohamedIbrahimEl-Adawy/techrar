import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techrar/features/dashboard/data/model/team_member_model.dart';

final teamMembersProvider = Provider<List<TeamMember>>(
  (ref) => const [
    TeamMember(name: 'Mohamed', role: 'Mobile Developer', online: false),
    TeamMember(name: 'Ayman', role: 'Frontend Developer', online: true),
    TeamMember(name: 'Ali', role: 'Backend Developer', online: true),
    TeamMember(name: 'Said', role: 'Quanilty Controller', online: false),
    TeamMember(name: 'Nour', role: 'UI UX', online: false),
  ],
);
