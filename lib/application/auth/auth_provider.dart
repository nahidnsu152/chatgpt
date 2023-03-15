// import 'package:flutter_easylogger/flutter_logger.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../global.dart';
// import 'auth_state.dart';
// import 'loggedin_provider.dart';

// final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
//   return AuthNotifier(AuthRepo(), ref);
// });

// class AuthNotifier extends StateNotifier<AuthState> {
//   final AuthRepo authRepo;
//   final Ref _ref;

//   AuthNotifier(this.authRepo, this._ref) : super(AuthState.init());

//   Future<void> signUp(SignupBody body) async {
//     state = state.copyWith(loading: true);

//     final res = await authRepo.signUp(body);

//     _ref.read(snackBarProvider(res.match((l) {
//       return l.error;
//     }, (r) => r.message)));

//     state = res.fold(
//       (l) {
//         return state.copyWith(failure: l, loading: false);
//       },
//       (r) {
//         _ref.read(loggedInProvider.notifier).saveCache(r.token, r.user);
//         _ref.read(loggedInProvider.notifier).isLoggedIn();
//         return state.copyWith(user: r.user, loading: false);
//       },
//     );
//   }

//   Future<void> login(LoginBody body) async {
//     state = state.copyWith(loading: true);

//     Logger.v('body: $body');
//     final res = await authRepo.login(body);

//     _ref.read(
//       snackBarProvider(
//         res.fold((l) {
//           return l.error;
//         }, (r) => r.message),
//       ),
//     );

//     state = res.fold(
//       (l) {
//         return state.copyWith(failure: l, loading: false);
//       },
//       (r) {
//         _ref.read(loggedInProvider.notifier).saveCache(r.token, r.user);
//         _ref.read(loggedInProvider.notifier).isLoggedIn();
//         return state.copyWith(user: r.user, loading: false, token: r.token);
//       },
//     );
//   }

//   void logout() {
//     _ref.read(loggedInProvider.notifier).deleteCache();
//     _ref.read(snackBarProvider('${state.user.name} logging out'));
//     state = state.copyWith(user: UserModel.init(), token: '');
//   }

//   void changePassword(PasswordChangeBody body) async {
//     state = state.copyWith(loading: true);

//     Logger.v('body: $body');
//     final res = await authRepo.changePassword(body);

//     _ref.read(
//       snackBarProvider(
//         res.fold((l) {
//           return l.error;
//         }, (r) => r.message),
//       ),
//     );

//     state = res.fold(
//       (l) => state.copyWith(failure: l, loading: false),
//       (r) => state.copyWith(loading: false),
//     );
//   }
// }

