import 'dart:convert';

class Course {
  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.isStudent,
  });

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isStudent: map['isStudent'] ?? false,
    );
  }

  factory Course.fromJson(String json) => Course.fromMap(jsonDecode(json));

  final int id;
  final String title;
  final String description;
  final bool isStudent;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isStudent': isStudent,
    };
  }

  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return 'Course(id: $id, title: $title, description: $description, isStudent: $isStudent)';
  }
}
