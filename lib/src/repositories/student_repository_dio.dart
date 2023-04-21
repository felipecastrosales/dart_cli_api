import 'package:dio/dio.dart';

import '../models/student.dart';

class StudentRepositoryDio {
  Future<List<Student>> findAll() async {
    try {
      final studentsResponse = await Dio().get(
        'http://localhost:7777/students',
      );

      return studentsResponse.data
          .map<Student>((student) => Student.fromMap(student))
          .toList();
    } catch (e) {
      print(e);
      throw Exception('Failed to load students');
    }
  }

  Future<Student> findById(int id) async {
    try {
      final studentResponse = await Dio().get(
        'http://localhost:7777/students/$id',
      );

      if (studentResponse.data == null) {
        throw Exception('Student not found');
      }

      return Student.fromMap(studentResponse.data);
    } on DioError catch (e) {
      print(e);
      throw Exception('Failed to load student');
    }
  }

  Future<Student> insert(Student student) async {
    try {
      final studentResponse = await Dio().post(
        'http://localhost:7777/students',
        data: student.toMap(),
      );

      return Student.fromMap(studentResponse.data);
    } on DioError catch (e) {
      print(e);
      throw Exception('Failed to insert student');
    }
  }

  Future<Student> update(Student student) async {
    try {
      final studentResponse = await Dio().put(
        'http://localhost:7777/students/${student.id}',
        data: student.toMap(),
      );

      return Student.fromMap(studentResponse.data);
    } on DioError catch (e) {
      print(e);
      throw Exception('Failed to update student');
    }
  }

  Future<void> deleteById(int id) async {
    try {
      await Dio().delete(
        'http://localhost:7777/students/$id',
      );
    } on DioError catch (e) {
      print(e);
      throw Exception('Failed to delete student');
    }
  }
}
