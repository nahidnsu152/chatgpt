import 'dart:convert';

import 'package:equatable/equatable.dart';

class Permission extends Equatable {
  final String id;
  final String object;
  final int created;
  final bool allow_create_engine;
  final bool allow_sampling;
  final bool allow_logprobs;
  final bool allow_search_indices;
  final bool allow_view;
  final bool allow_fine_tuning;
  final String organization;
  final String group;
  final bool is_blocking;
  Permission({
    required this.id,
    required this.object,
    required this.created,
    required this.allow_create_engine,
    required this.allow_sampling,
    required this.allow_logprobs,
    required this.allow_search_indices,
    required this.allow_view,
    required this.allow_fine_tuning,
    required this.organization,
    required this.group,
    required this.is_blocking,
  });

  Permission copyWith({
    String? id,
    String? object,
    int? created,
    bool? allow_create_engine,
    bool? allow_sampling,
    bool? allow_logprobs,
    bool? allow_search_indices,
    bool? allow_view,
    bool? allow_fine_tuning,
    String? organization,
    String? group,
    bool? is_blocking,
  }) {
    return Permission(
      id: id ?? this.id,
      object: object ?? this.object,
      created: created ?? this.created,
      allow_create_engine: allow_create_engine ?? this.allow_create_engine,
      allow_sampling: allow_sampling ?? this.allow_sampling,
      allow_logprobs: allow_logprobs ?? this.allow_logprobs,
      allow_search_indices: allow_search_indices ?? this.allow_search_indices,
      allow_view: allow_view ?? this.allow_view,
      allow_fine_tuning: allow_fine_tuning ?? this.allow_fine_tuning,
      organization: organization ?? this.organization,
      group: group ?? this.group,
      is_blocking: is_blocking ?? this.is_blocking,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'created': created,
      'allow_create_engine': allow_create_engine,
      'allow_sampling': allow_sampling,
      'allow_logprobs': allow_logprobs,
      'allow_search_indices': allow_search_indices,
      'allow_view': allow_view,
      'allow_fine_tuning': allow_fine_tuning,
      'organization': organization,
      'group': group,
      'is_blocking': is_blocking,
    };
  }

  factory Permission.fromMap(Map<String, dynamic> map) {
    return Permission(
      id: map['id'] ?? '',
      object: map['object'] ?? '',
      created: map['created']?.toInt() ?? 0,
      allow_create_engine: map['allow_create_engine'] ?? false,
      allow_sampling: map['allow_sampling'] ?? false,
      allow_logprobs: map['allow_logprobs'] ?? false,
      allow_search_indices: map['allow_search_indices'] ?? false,
      allow_view: map['allow_view'] ?? false,
      allow_fine_tuning: map['allow_fine_tuning'] ?? false,
      organization: map['organization'] ?? '',
      group: map['group'] ?? '',
      is_blocking: map['is_blocking'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Permission.fromJson(String source) => Permission.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Permission(id: $id, object: $object, created: $created, allow_create_engine: $allow_create_engine, allow_sampling: $allow_sampling, allow_logprobs: $allow_logprobs, allow_search_indices: $allow_search_indices, allow_view: $allow_view, allow_fine_tuning: $allow_fine_tuning, organization: $organization, group: $group, is_blocking: $is_blocking)';
  }

  @override
  List<Object> get props {
    return [
      id,
      object,
      created,
      allow_create_engine,
      allow_sampling,
      allow_logprobs,
      allow_search_indices,
      allow_view,
      allow_fine_tuning,
      organization,
      group,
      is_blocking,
    ];
  }
}