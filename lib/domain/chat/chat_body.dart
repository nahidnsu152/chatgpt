import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/message.dart';

class ChatBody extends Equatable {
  final String model;
  final List<Message> messages;
  final double temperature;
  const ChatBody({
    required this.model,
    required this.messages,
    required this.temperature,
  });

  ChatBody copyWith({
    String? model,
    List<Message>? messages,
    double? temperature,
  }) {
    return ChatBody(
      model: model ?? this.model,
      messages: messages ?? this.messages,
      temperature: temperature ?? this.temperature,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'messages': messages.map((x) => x.toMap()).toList(),
      'temperature': temperature,
    };
  }

  factory ChatBody.fromMap(Map<String, dynamic> map) {
    return ChatBody(
      model: map['model'] ?? '',
      messages:
          List<Message>.from(map['messages']?.map((x) => Message.fromMap(x))),
      temperature: map['temperature']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatBody.fromJson(String source) =>
      ChatBody.fromMap(json.decode(source));

  @override
  String toString() =>
      'ChatBody(model: $model, messages: $messages, temperature: $temperature)';

  @override
  List<Object> get props => [model, messages, temperature];
}
