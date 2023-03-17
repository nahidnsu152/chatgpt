import 'dart:convert';

import 'package:equatable/equatable.dart';

class Usage extends Equatable {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;
  const Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  Usage copyWith({
    int? promptTokens,
    int? completionTokens,
    int? totalTokens,
  }) {
    return Usage(
      promptTokens: promptTokens ?? this.promptTokens,
      completionTokens: completionTokens ?? this.completionTokens,
      totalTokens: totalTokens ?? this.totalTokens,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'prompt_tokens': promptTokens,
      'completion_tokens': completionTokens,
      'total_tokens': totalTokens,
    };
  }

  factory Usage.fromMap(Map<String, dynamic> map) {
    return Usage(
      promptTokens: map['prompt_tokens']?.toInt() ?? 0,
      completionTokens: map['completion_tokens']?.toInt() ?? 0,
      totalTokens: map['total_tokens']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Usage.fromJson(String source) => Usage.fromMap(json.decode(source));

  @override
  String toString() =>
      'Usage(prompt_tokens: $promptTokens, completion_tokens: $completionTokens, total_tokens: $totalTokens)';

  @override
  List<Object> get props => [promptTokens, completionTokens, totalTokens];
}
