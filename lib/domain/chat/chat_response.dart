import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/choice.dart';
import 'model/usage.dart';


class ChatResponse extends Equatable {
  final String id;
  final String object;
  final int created;
  final String model;
  final Usage usage;
  final List<Choice> choices;
  const ChatResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.usage,
    required this.choices,
  });

  ChatResponse copyWith({
    String? id,
    String? object,
    int? created,
    String? model,
    Usage? usage,
    List<Choice>? choices,
  }) {
    return ChatResponse(
      id: id ?? this.id,
      object: object ?? this.object,
      created: created ?? this.created,
      model: model ?? this.model,
      usage: usage ?? this.usage,
      choices: choices ?? this.choices,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'created': created,
      'model': model,
      'usage': usage.toMap(),
      'choices': choices.map((x) => x.toMap()).toList(),
    };
  }

  factory ChatResponse.fromMap(Map<String, dynamic> map) {
    return ChatResponse(
      id: map['id'] ?? '',
      object: map['object'] ?? '',
      created: map['created']?.toInt() ?? 0,
      model: map['model'] ?? '',
      usage: Usage.fromMap(map['usage']),
      choices: List<Choice>.from(map['choices']?.map((x) => Choice.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatResponse.fromJson(String source) =>
      ChatResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatResponse(id: $id, object: $object, created: $created, model: $model, usage: $usage, choices: $choices)';
  }

  @override
  List<Object> get props {
    return [
      id,
      object,
      created,
      model,
      usage,
      choices,
    ];
  }
}
