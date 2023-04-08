import 'dart:convert';

class Course {
  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.isStudent,
  });

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      isStudent: map['is_active'] ?? false,
    );
  }

  factory Course.fromJson(String json) => Course.fromMap(jsonDecode(json));

  final int id;
  final String name;
  final String description;
  final bool isStudent;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'is_active': isStudent,
    };
  }

  String toJson() => jsonEncode(toMap());
}
