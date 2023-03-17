import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'permission.dart';

class ModelData extends Equatable {
  final String id;
  final String object;
  final int created;
  final String ownedBy;
  final List<Permission> permission;
  final String root;
  final String parent;
  const ModelData({
    required this.id,
    required this.object,
    required this.created,
    required this.ownedBy,
    required this.permission,
    required this.root,
    required this.parent,
  });

  ModelData copyWith({
    String? id,
    String? object,
    int? created,
    String? ownedBy,
    List<Permission>? permission,
    String? root,
    String? parent,
  }) {
    return ModelData(
      id: id ?? this.id,
      object: object ?? this.object,
      created: created ?? this.created,
      ownedBy: ownedBy ?? this.ownedBy,
      permission: permission ?? this.permission,
      root: root ?? this.root,
      parent: parent ?? this.parent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'created': created,
      'owned_by': ownedBy,
      'permission': permission.map((x) => x.toMap()).toList(),
      'root': root,
      'parent': parent,
    };
  }

  factory ModelData.fromMap(Map<String, dynamic> map) {
    return ModelData(
      id: map['id'] ?? '',
      object: map['object'] ?? '',
      created: map['created']?.toInt() ?? 0,
      ownedBy: map['owned_by'] ?? '',
      permission: List<Permission>.from(
          map['permission']?.map((x) => Permission.fromMap(x))),
      root: map['root'] ?? '',
      parent: map['parent'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelData.fromJson(String source) =>
      ModelData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, object: $object, created: $created, owned_by: $ownedBy, permission: $permission, root: $root, parent: $parent)';
  }

  @override
  List<Object> get props {
    return [
      id,
      object,
      created,
      ownedBy,
      permission,
      root,
      parent,
    ];
  }
}
