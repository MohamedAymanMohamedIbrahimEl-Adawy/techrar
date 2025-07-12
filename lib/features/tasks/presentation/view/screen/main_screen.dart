import 'package:flutter/material.dart';
import '../../../../../core/componenet/layout_builder/custom_layout_builder.dart';
import 'desktop_screen.dart';
import 'mobile_screen.dart';
import 'web_screen.dart';

class TasksScreen extends StatelessWidget {
  static const String routeName = 'Tasks  Screen';
  static const String routePath = '/tasks-screen';
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomLayoutBuilder(
      mobileView: MobileScreen(),
      webView: WebScreen(),
      desktopView: DesktopScreen(),
    );
  }
}
