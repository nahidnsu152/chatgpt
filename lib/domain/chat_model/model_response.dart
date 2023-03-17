import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'models/model_data.dart';

class ModelResponse extends Equatable {
  final String object;
  final List<ModelData> data;
  const ModelResponse({
    required this.object,
    required this.data,
  });

  factory ModelResponse.init() => const ModelResponse(
        object: '',
        data: [],
      );

  ModelResponse copyWith({
    String? object,
    List<ModelData>? data,
  }) {
    return ModelResponse(
      object: object ?? this.object,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'object': object,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory ModelResponse.fromMap(Map<String, dynamic> map) {
    return ModelResponse(
      object: map['object'] ?? '',
      data: List<ModelData>.from(map['data']?.map((x) => ModelData.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelResponse.fromJson(String source) =>
      ModelResponse.fromMap(json.decode(source));

  @override
  String toString() => 'ModelResponse(object: $object, data: $data)';

  @override
  List<Object> get props => [object, data];
}
