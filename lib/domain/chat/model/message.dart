import 'dart:convert';

import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String role;
  final String content;
  const Message({
    required this.role,
    required this.content,
  });

  Message copyWith({
    String? role,
    String? content,
  }) {
    return Message(
      role: role ?? this.role,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'content': content,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      role: map['role'] ?? '',
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));

  @override
  String toString() => 'Message(role: $role, content: $content)';

  @override
  List<Object> get props => [role, content];
}
