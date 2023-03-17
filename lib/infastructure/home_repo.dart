import 'dart:convert';

import 'package:chatgpt/domain/chat/chat_body.dart';
import 'package:chatgpt/domain/chat/chat_response.dart';
import 'package:chatgpt/domain/chat_model/model_response.dart';
import 'package:flutter_easylogger/flutter_logger.dart';

import '../server/api_routes.dart';
import '../utils/utils.dart';

class HomeRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, ModelResponse>> getModel() async {
    final data = await api.get(
      fromData: (json) => ModelResponse.fromMap(json),
      endPoint: APIRoute.models,
      withToken: false,
    );

    Logger.v("data: $data");

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']);
      return left(failure);
    }, (r) => right(r));
  }

  Future<Either<CleanFailure, ChatResponse>> login(ChatBody body) async {
    final data = await api.post(
      fromData: (json) => ChatResponse.fromMap(json),
      endPoint: APIRoute.chatCompletions,
      body: body.toMap(),
      withToken: false,
    );

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) {
      Logger.v("data: $data");
      return right(r);
    });
  }
}
