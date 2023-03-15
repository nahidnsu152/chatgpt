import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/local_storage/storage_handler.dart';
import '../../utils/utils.dart';
import '../main_nav/main_nav.dart';
import '../onborad/onboard_screen.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});
  static const route = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnboardChecked = ref.watch(hiveProvider).get(
          KStrings.onboardStorageKey,
          defaultValue: false,
        );
    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () {
        isOnboardChecked
            ? context.pushReplacement(MainNav.route)
            : context.pushReplacement(OnboardScreen.route);
      });
      return null;
    }, []);

    return const Scaffold(
      body: Center(child: Text("Splash Screen")),
    );
  }
}
