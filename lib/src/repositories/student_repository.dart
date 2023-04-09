import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/student.dart';

class StudentRepository {
  Future<List<Student>> findAll() async {
    final studentsResponse = await http.get(
      Uri.parse('http://localhost:7777/students'),
    );

    if (studentsResponse.statusCode != 200) {
      throw Exception('Failed to load students');
    }

    final studentsList = jsonDecode(studentsResponse.body);
    return studentsList
        .map<Student>((student) => Student.fromMap(student))
        .toList();
  }

  Future<Student> findById(int id) async {
    final studentResponse = await http.get(
      Uri.parse('http://localhost:7777/students/$id'),
    );

    if (studentResponse.statusCode != 200) {
      throw Exception('Failed to load student');
    }

    if (studentResponse.body == '{}') {
      throw Exception('Student not found');
    }

    return Student.fromJson(studentResponse.body);
  }

  Future<Student> insert(Student student) async {
    final studentResponse = await http.post(
      Uri.parse('http://localhost:7777/students'),
      body: student.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (studentResponse.statusCode != 200) {
      throw Exception('Failed to insert student');
    }

    return Student.fromJson(studentResponse.body);
  }

  Future<Student> update(Student student) async {
    final studentResponse = await http.put(
      Uri.parse('http://localhost:7777/students/${student.id}'),
      body: student.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (studentResponse.statusCode != 200) {
      throw Exception('Failed to update student');
    }

    return Student.fromJson(studentResponse.body);
  }

  Future<void> deleteById(int id) async {
    await http.delete(
      Uri.parse('http://localhost:7777/students/$id'),
    );
  }
}
