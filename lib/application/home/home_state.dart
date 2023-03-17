import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:chatgpt/domain/chat/chat_response.dart';
import 'package:chatgpt/domain/chat_model/model_response.dart';

import '../../utils/network_util/network_handler.dart';

class HomeState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final ModelResponse modelResponse;
  final ChatResponse chatResponse;

  const HomeState({
    required this.loading,
    required this.failure,
    required this.modelResponse,
    required this.chatResponse,
  });

  factory HomeState.init() => HomeState(
        loading: false,
        failure: CleanFailure.none(),
        modelResponse: ModelResponse.init(),
        chatResponse: ChatResponse.init(),
      );

  HomeState copyWith({
    bool? loading,
    CleanFailure? failure,
    ModelResponse? modelResponse,
    ChatResponse? chatResponse,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      modelResponse: modelResponse ?? this.modelResponse,
      chatResponse: chatResponse ?? this.chatResponse,
    );
  }

  @override
  String toString() {
    return 'HomeState(loading: $loading, failure: $failure, modelResponse: $modelResponse, chatResponse: $chatResponse)';
  }

  @override
  List<Object> get props => [loading, failure, modelResponse, chatResponse];

  Map<String, dynamic> toMap() {
    return {
      'loading': loading,
      'failure': failure,
      'modelResponse': modelResponse.toMap(),
      'chatResponse': chatResponse.toMap(),
    };
  }

  factory HomeState.fromMap(Map<String, dynamic> map) {
    return HomeState(
      loading: map['loading'] ?? false,
      failure: map['failure'],
      modelResponse: ModelResponse.fromMap(map['modelResponse']),
      chatResponse: ChatResponse.fromMap(map['chatResponse']),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeState.fromJson(String source) =>
      HomeState.fromMap(json.decode(source));
}
