// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Class {
  final int id;
  final String name;
  final int? previousClassId;
  Class({
    required this.id,
    required this.name,
    this.previousClassId,
  });

  Class copyWith({
    int? id,
    String? name,
    int? previousClassId,
  }) {
    return Class(
      id: id ?? this.id,
      name: name ?? this.name,
      previousClassId: previousClassId ?? this.previousClassId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'previousClassId': previousClassId,
    };
  }

  factory Class.fromMap(Map<String, dynamic> map) {
    return Class(
      id: map['id'] as int,
      name: map['name'] as String,
      previousClassId:
          map['previousClassId'] != null ? map['previousClassId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Class.fromJson(String source) =>
      Class.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Class(id: $id, name: $name, previousClassId: $previousClassId)';

  @override
  bool operator ==(covariant Class other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.previousClassId == previousClassId;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ previousClassId.hashCode;
}
