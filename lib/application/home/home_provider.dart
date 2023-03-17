import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


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

}
