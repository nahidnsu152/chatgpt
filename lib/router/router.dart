import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../presentation/main_nav/main_nav.dart';
import '../presentation/main_nav/main_nav_with_rive.dart';
import '../presentation/onborad/onboard_screen.dart';
import '../presentation/splash/splash_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  final listenable = ValueNotifier<bool>(true);

  // ref.listen<AuthState>(authProvider, (oldUser, next) {
  //   // This is just to trigger `notifyListeners` within the `ValueNotifier`
  //   listenable.value = !listenable.value;
  // });

  return GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: listenable,
    //redirect: router._redirectLogic,
    routes: router._routes,
    // initialLocation: SignInScreen.route,
    errorPageBuilder: router._errorPageBuilder,
    observers: [
      // BotToastNavigatorObserver(),
    ],
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref ref;

  // RouterNotifier(this._ref) {
  //   _ref.listen<String?>(
  //     authProvider.select((value) => value.token),
  //     (_, __) => notifyListeners(),
  //   );
  // }
  RouterNotifier(this.ref) {
    // _ref.listen<String?>(
    //   authProvider.select((value) => value.token),
    //   (_, __) => notifyListeners(),
    // );
  }

  // String? _redirectLogic(GoRouterState state) {
  //   final token = _ref.watch(loggedInProvider).token;
  //   final user = _ref.watch(loggedInProvider).user;

  //   Logger.i('RouterNotifier: $user - $token');

  //   bool isUserIn() => token.isNotEmpty && user != UserModel.init();

  //   final areWeLoggingIn = state.location == SignInScreen.route;
  //   final areWeRegistering = state.location == SignInScreen.route;

  //   if (!isUserIn() && areWeLoggingIn) {
  //     return areWeLoggingIn ? null : SignInScreen.route;
  //   }
  //   if (!isUserIn() && areWeRegistering) {
  //     return areWeRegistering ? null : SignUpScreen.route;
  //   }

  //   if (areWeLoggingIn || areWeRegistering) return MainNav.route;

  //   return null;
  // }

  List<GoRoute> get _routes => [
        GoRoute(
          path: SplashScreen.route,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: OnboardScreen.route,
          builder: (context, state) => const OnboardScreen(),
        ),
        GoRoute(
          path: MainNav.route,
          builder: (context, state) => const MainNav(),
        ),
        GoRoute(
          path: MainNavwithRive.route,
          builder: (context, state) => const MainNavwithRive(),
        ),
        // GoRoute(
        //   path: ApplicationInfoScreen.route,
        //   pageBuilder: (context, state) => CustomTransitionPage<void>(
        //     key: state.pageKey,
        //     child: const ApplicationInfoScreen(),
        //     transitionsBuilder: (BuildContext context,
        //             Animation<double> animation,
        //             Animation<double> secondaryAnimation,
        //             Widget child) =>
        //         SlideTransition(
        //       position: animation.drive(
        //         Tween(
        //           begin: const Offset(1, 0),
        //           end: Offset.zero,
        //         ).chain(
        //           CurveTween(curve: Curves.easeIn),
        //         ),
        //       ),
        //       child: child,
        //     ),
        //   ),
        // ),
      ];
  Page<void> _errorPageBuilder(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          // backgroundColor: Theme.of(context).errorColor.withOpacity(.1),
          body: Center(
            child: Text('Error: ${state.error.toString()}'),
          ),
        ),
      );
}
