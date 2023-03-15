import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rive/rive.dart';

import '../../domain/drawer/menu_btn.dart';
import '../../domain/drawer/rive_asset.dart';
import '../../utils/rive_utils.dart';
import '../drawer/animated_bar.dart';
import '../drawer/side_menu.dart';
import '../home/home_screen.dart';
import '../settings/settings_screen.dart';

final bottomNavigatorKey = GlobalKey<State<BottomNavigationBar>>();

const Color backgroundColor2 = Color(0xFF17203A);
const Color backgroundColorLight = Color(0xFFF2F6FF);
const Color backgroundColorDark = Color(0xFF25254B);
const Color shadowColorLight = Color(0xFF4A5367);
const Color shadowColorDark = Colors.black;

class MainNavwithRive extends HookConsumerWidget {
  static const route = '/mainNavWithRive';

  const MainNavwithRive({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = useState(0);
    final navWidget = [
      const HomeScreen(),
      const Center(child: Text("Profile Screen")),
      const SettingsScreen(),
    ];

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final animation = useAnimation(Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn),
    ));
    final scalAnimation =
        useAnimation(Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final selectedBottomNav = useState(bottomNavs.first);
    final isSideBarClosed = useState(true);
    final isSideMenuClosed = useState(true);

    return Scaffold(
      // body: navWidget[navIndex.value],
      body: Stack(
        // It's time to add the SideMenu
        children: [
          // It shows nothing
          // because now it's under the HomeScreen
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            width: 288,
            left: isSideMenuClosed.value ? -288 : 0,
            height: MediaQuery.of(context).size.height,
            child: const SideMenu(),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation - 30 * animation * pi / 180),
            child: Transform.translate(
              offset: Offset(animation * 265, 0),
              child: Transform.scale(
                scale: scalAnimation,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: navWidget[navIndex.value],
                ),
              ),
            ),
          ),
          // As you can see it's an ANimated button
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideMenuClosed.value ? 0 : 220,
            top: 16,
            child: MenuBtn(
              riveOnInit: (artboard) {
                StateMachineController controller = RiveUtils.getRiveController(
                    artboard,
                    stateMachineName: "State Machine");
                isSideBarClosed.value = controller.findSMI("isOpen");
                // Now it's easy to understand
                isSideBarClosed.value = true;
              },
              // Let's fixed the scal animation
              press: () {
                isSideBarClosed.value = !isSideBarClosed.value;
                if (isSideMenuClosed.value) {
                  animationController.forward();
                } else {
                  animationController.reverse();
                }

                isSideMenuClosed.value = isSideBarClosed.value;
              },
            ),
          ),
        ],
      ),

      //* Navigation Bar
      // bottomNavigationBar: NavigationBar(
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   elevation: 0,
      //   key: bottomNavigatorKey,
      //   selectedIndex: navIndex.value,
      //   onDestinationSelected: (index) {
      //     navIndex.value = index;
      //   },
      //   labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      //   animationDuration: const Duration(milliseconds: 500),
      //   destinations: const [
      //     NavigationDestination(
      //       icon: Icon(IconlyLight.home),
      //       selectedIcon: Icon(
      //         IconlyBold.home,
      //       ),
      //       label: 'Home',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(IconlyLight.profile),
      //       selectedIcon: Icon(IconlyBold.profile),
      //       label: 'Profile',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(IconlyLight.setting),
      //       selectedIcon: Icon(IconlyBold.setting),
      //       label: 'Settings',
      //     ),

      //   ],
      // ),

      //* BottomNavigationBar

      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: backgroundColor2.withOpacity(0.8),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  bottomNavs.length,
                  (index) => GestureDetector(
                    onTap: () {
                      bottomNavs[index].input!.change(true);
                      if (bottomNavs[index] != selectedBottomNav.value) {
                        selectedBottomNav.value = bottomNavs[index];
                      }
                      Future.delayed(const Duration(seconds: 1), () {
                        bottomNavs[index].input!.change(false);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBar(
                            isActive:
                                bottomNavs[index] == selectedBottomNav.value),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: Opacity(
                            opacity:
                                bottomNavs[index] == selectedBottomNav.value
                                    ? 1
                                    : 0.5,
                            child: RiveAnimation.asset(
                              bottomNavs.first.src,
                              artboard: bottomNavs[index].artboard,
                              onInit: (artboard) {
                                StateMachineController controller =
                                    RiveUtils.getRiveController(artboard,
                                        stateMachineName:
                                            bottomNavs[index].stateMachineName);

                                bottomNavs[index].input =
                                    controller.findSMI("active") as SMIBool;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
