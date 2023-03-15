// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:visa/utils/strings.dart';

// import '../../domain/auth/model/user_model.dart';

// final loggedInProvider = ChangeNotifierProvider<LoggedInNotifier>((ref) {
//   return LoggedInNotifier();
// });

// class LoggedInNotifier extends ChangeNotifier {
//   LoggedInNotifier();

//   final box = Hive.box(KStrings.cacheBox);

//   bool _loggedIn = false;

//   void deleteCache() {
//     Hive.box(KStrings.cacheBox).delete(KStrings.token);
//     Hive.box(KStrings.cacheBox).delete(KStrings.user);
//     notifyListeners();
//   }

//   void saveCache(String token, UserModel user) {
//     saveToken(token);
//     saveUser(user);
//     notifyListeners();
//   }

//   void saveUser(UserModel user) {
//     box.put(KStrings.user, user.toJson());
//   }

//   void saveToken(String token) {
//     box.put(KStrings.token, token);
//   }

//   String get token {
//     return Hive.box(KStrings.cacheBox).get(KStrings.token, defaultValue: '');
//   }

//   UserModel get user {
//     final user = Hive.box(KStrings.cacheBox).get(KStrings.user);
//     return user != null ? UserModel.fromJson(user) : UserModel.init();
//   }

//   bool get loggedIn => _loggedIn;

//   void isLoggedIn() {
//     // final String? token = Hive.box(CACHE_BOX).get(TOKEN);
//     // final String? user = Hive.box(CACHE_BOX).get(USER);

//     _loggedIn = token.isEmpty && user == UserModel.init() ? false : true;
//     notifyListeners();
//   }
// }
