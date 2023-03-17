import 'dart:convert';

import 'package:equatable/equatable.dart';

class Permission extends Equatable {
  final String id;
  final String object;
  final int created;
  final bool allowCreateEngine;
  final bool allowSampling;
  final bool allowLogprobs;
  final bool allowSearchIndices;
  final bool allowView;
  final bool allowFineTuning;
  final String organization;
  final String group;
  final bool isBlocking;
  const Permission({
    required this.id,
    required this.object,
    required this.created,
    required this.allowCreateEngine,
    required this.allowSampling,
    required this.allowLogprobs,
    required this.allowSearchIndices,
    required this.allowView,
    required this.allowFineTuning,
    required this.organization,
    required this.group,
    required this.isBlocking,
  });

  Permission copyWith({
    String? id,
    String? object,
    int? created,
    bool? allowCreateEngine,
    bool? allowSampling,
    bool? allowLogprobs,
    bool? allowSearchIndices,
    bool? allowView,
    bool? allowFineTuning,
    String? organization,
    String? group,
    bool? isBlocking,
  }) {
    return Permission(
      id: id ?? this.id,
      object: object ?? this.object,
      created: created ?? this.created,
      allowCreateEngine: allowCreateEngine ?? this.allowCreateEngine,
      allowSampling: allowSampling ?? this.allowSampling,
      allowLogprobs: allowLogprobs ?? this.allowLogprobs,
      allowSearchIndices: allowSearchIndices ?? this.allowSearchIndices,
      allowView: allowView ?? this.allowView,
      allowFineTuning: allowFineTuning ?? this.allowFineTuning,
      organization: organization ?? this.organization,
      group: group ?? this.group,
      isBlocking: isBlocking ?? this.isBlocking,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'created': created,
      'allow_create_engine': allowCreateEngine,
      'allow_sampling': allowSampling,
      'allow_logprobs': allowLogprobs,
      'allow_search_indices': allowSearchIndices,
      'allow_view': allowView,
      'allow_fine_tuning': allowFineTuning,
      'organization': organization,
      'group': group,
      'is_blocking': isBlocking,
    };
  }

  factory Permission.fromMap(Map<String, dynamic> map) {
    return Permission(
      id: map['id'] ?? '',
      object: map['object'] ?? '',
      created: map['created']?.toInt() ?? 0,
      allowCreateEngine: map['allow_create_engine'] ?? false,
      allowSampling: map['allow_sampling'] ?? false,
      allowLogprobs: map['allow_logprobs'] ?? false,
      allowSearchIndices: map['allow_search_indices'] ?? false,
      allowView: map['allow_view'] ?? false,
      allowFineTuning: map['allow_fine_tuning'] ?? false,
      organization: map['organization'] ?? '',
      group: map['group'] ?? '',
      isBlocking: map['is_blocking'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Permission.fromJson(String source) =>
      Permission.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Permission(id: $id, object: $object, created: $created, allow_create_engine: $allowCreateEngine, allow_sampling: $allowSampling, allow_logprobs: $allowLogprobs, allow_search_indices: $allowSearchIndices, allow_view: $allowView, allow_fine_tuning: $allowFineTuning, organization: $organization, group: $group, is_blocking: $isBlocking)';
  }

  @override
  List<Object> get props {
    return [
      id,
      object,
      created,
      allowCreateEngine,
      allowSampling,
      allowLogprobs,
      allowSearchIndices,
      allowView,
      allowFineTuning,
      organization,
      group,
      isBlocking,
    ];
  }
}
