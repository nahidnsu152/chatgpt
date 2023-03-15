// import 'package:clean_api/clean_api.dart';
// import 'package:equatable/equatable.dart';

// import '../../domain/auth/model/user_model.dart';

// class AuthState extends Equatable {
//   final UserModel user;
//   final bool loading;
//   final CleanFailure failure;
//   final String token;
//   final String language;

//   const AuthState({
//     required this.user,
//     required this.loading,
//     required this.failure,
//     required this.token,
//     required this.language,
//   });

//   factory AuthState.init() => AuthState(
//         user: UserModel.init(),
//         loading: false,
//         failure: CleanFailure.none(),
//         token: '',
//         language: 'en',
//       );

//   AuthState copyWith({
//     UserModel? user,
//     bool? loading,
//     CleanFailure? failure,
//     String? token,
//     String? language,
//   }) {
//     return AuthState(
//       user: user ?? this.user,
//       loading: loading ?? this.loading,
//       failure: failure ?? this.failure,
//       token: token ?? this.token,
//       language: language ?? this.language,
//     );
//   }

//   @override
//   bool get stringify => true;

//   @override
//   List<Object> get props {
//     return [
//       user,
//       loading,
//       failure,
//       token,
//       language,
//     ];
//   }

//   @override
//   String toString() {
//     return 'AuthState(user: $user, loading: $loading, failure: $failure, token: $token, language: $language)';
//   }
// }
