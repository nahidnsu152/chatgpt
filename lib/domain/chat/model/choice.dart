import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'message.dart';

class Choice extends Equatable {
  final Message message;
  final String finishReason;
  final int index;
  const Choice({
    required this.message,
    required this.finishReason,
    required this.index,
  });

  Choice copyWith({
    Message? message,
    String? finishReason,
    int? index,
  }) {
    return Choice(
      message: message ?? this.message,
      finishReason: finishReason ?? this.finishReason,
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message.toMap(),
      'finish_reason': finishReason,
      'index': index,
    };
  }

  factory Choice.fromMap(Map<String, dynamic> map) {
    return Choice(
      message: Message.fromMap(map['message']),
      finishReason: map['finish_reason'] ?? '',
      index: map['index']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Choice.fromJson(String source) => Choice.fromMap(json.decode(source));

  @override
  String toString() =>
      'Choice(message: $message, finish_reason: $finishReason, index: $index)';

  @override
  List<Object> get props => [message, finishReason, index];
}
