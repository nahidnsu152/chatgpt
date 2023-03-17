import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';

import '../home/home_screen.dart';
import '../settings/settings_screen.dart';

final bottomNavigatorKey = GlobalKey<State<BottomNavigationBar>>();

class MainNav extends HookConsumerWidget {
  static const route = '/mainNav';

  const MainNav({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = useState(0);
    final navWidget = [
      const HomeScreen(),
      const Center(child: Text("Profile Screen")),
      const SettingsScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: navWidget[navIndex.value],

      //* Navigation Bar
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        key: bottomNavigatorKey,
        selectedIndex: navIndex.value,
        onDestinationSelected: (index) {
          navIndex.value = index;
        },
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        animationDuration: const Duration(milliseconds: 500),
        destinations: const [
          NavigationDestination(
            icon: Icon(IconlyLight.home),
            selectedIcon: Icon(
              IconlyBold.home,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(IconlyLight.profile),
            selectedIcon: Icon(IconlyBold.profile),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(IconlyLight.setting),
            selectedIcon: Icon(IconlyBold.setting),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
