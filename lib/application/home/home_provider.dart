import 'package:chatgpt/domain/chat/chat_body.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/chat/model/message.dart';
import '../../infastructure/home_repo.dart';
import '../global.dart';
import 'home_state.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(HomeRepo(), ref);
}, name: "homeProvider");

class HomeNotifier extends StateNotifier<HomeState> {
  final HomeRepo repo;
  final Ref _ref;

  HomeNotifier(
    this.repo,
    this._ref,
  ) : super(HomeState.init());

  void getModels() async {
    state = state.copyWith(loading: true);
    final result = await repo.getModel();

    Logger.d("result: $result");
    result.fold(
      (l) {
        _ref.watch(snackBarProvider(l.error));
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) => state = state.copyWith(modelResponse: r, loading: false),
    );
  }

  Future<bool> getChatResponse(ChatBody body) async {
    state = state.copyWith(loading: true);
    final result = await repo.chatResponse(body);
    bool success = false;

    //Logger.d("result: $result");
    result.fold(
      (l) {
        success = false;
        _ref.watch(snackBarProvider(l.error));
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) {
        success = true;
        return state =
            state.copyWith(loading: false, chatResponse: r, messages: [
          ...state.messages,
          r.choices[0].message,
        ]);
      },
    );
    return success;
  }

  addToList(String role, String content) {
    state = state.copyWith(messages: [
      ...state.messages,
      Message(role: role, content: content),
    ]);
  }
}
