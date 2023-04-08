import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:dart_api_v2/models/student.dart';

class StudentRepository {
  Future<List<Student>> getStudents() async {
    final studentsResponse = await http.get(
      Uri.parse('http://localhost:7777/students'),
    );
    final studentsList = jsonDecode(studentsResponse.body);
    return studentsList
        .map<Student>((student) => Student.fromMap(student))
        .toList();
  }

  Future<Student> getById(int id) async {
    final studentResponse = await http.get(
      Uri.parse('http://localhost:7777/students/$id'),
    );
    return Student.fromJson(studentResponse.body);
  }
}
