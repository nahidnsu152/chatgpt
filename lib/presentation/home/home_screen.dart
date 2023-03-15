import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/utils.dart';
import '../../widgets/k_app_bar.dart';
import '../../widgets/widgets.dart';
import '../drawer/side_menu.dart';


class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const KAppBar(
        titleText: 'Home',
      ),
      drawer: const Drawer(
        width: 288,
        child: SideMenu(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Home Screen',
              style: context.titleLarge,
            ),
          ),
          KElevatedButton(
            onPressed: () {
              // showNotification(title: "Nahid");
              // showToast("Nahid");
              // showTimePicker(context: context, initialTime: TimeOfDay.now());
              // showFloatBottomSheet(
              //   context,
              //   builder: (context) => Container(
              //     height: 200,
              //     color: Colors.white,
              //     child: const Center(
              //       child: Text('This is a modal'),
              //     ),
              //   ),
              // );

              // showBotToastDialog(cancel: () {
              //   Navigator.pop(context);
              //   return null;
              // }, confirm: () {
              //   return null;
              // });
            },
            text: "Press ME",
          )
        ],
      ),
    );
  }
}
