import 'dart:convert';

import 'address.dart';
import 'course.dart';

class Student {
  Student({
    required this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      nameCourses: List<String>.from(map['courses_names'] ?? <String>[]),
      courses: map['courses'] != null
          ? List<Course>.from(
              map['courses'].map((course) => Course.fromMap(course)))
          : <Course>[],
      address: Address.fromMap(map['address'] ?? {}),
    );
  }

  factory Student.fromJson(String json) => Student.fromMap(jsonDecode(json));

  final int id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<Course> courses;
  final Address address;

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'name': name,
      'courses_names': nameCourses,
      'courses': courses.map((course) => course.toMap()).toList(),
      'address': address.toMap(),
    };
    if (age != null) {
      map['age'] = age;
    }
    return map;
  }

  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return 'Student(id: $id, name: $name, age: $age, nameCourses: $nameCourses, courses: $courses, address: $address)';
  }
}
