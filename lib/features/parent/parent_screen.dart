import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../dashboard/presentation/view/screen/main_screen.dart';
import '../dashboard/presentation/view/widgets/body.dart';
import '../profile/presentation/view/screen/main_screen.dart';
import '../tasks/presentation/view/screen/main_screen.dart';
import 'widget/language_switcher.dart';
import 'widget/theme_switcher.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  int _currentIndex = 0;
  final _pages = const [DashboardScreen(), TasksScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [LanguageSwitcher(), Divider(), ThemeSwitcherButton()],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          (_currentIndex == 0
                  ? 'projectTeamDashboard'
                  : _currentIndex == 1
                  ? 'tasks'
                  : 'profile')
              .tr(),
        ),
        actions: [
          _currentIndex == 0
              ? IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              )
              : SizedBox.shrink(),
        ],
      ),
      floatingActionButton:
          _currentIndex == 0
              ? FloatingActionButton(
                onPressed:
                    () => showModalBottomSheet(
                      context: context,
                      builder: (context) => const AddTaskSheet(),
                    ),
                child: const Icon(Icons.add),
              )
              : null,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'dashboard'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'tasks'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile'.tr(),
          ),
        ],
      ),
    );
  }
}
