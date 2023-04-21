import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/course.dart';

class CourseRepository {
  Future<Course> findByName(String name) async {
    final response = await http.get(
      Uri.parse('http://localhost:7777/products?title=$name'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load course');
    }

    final responseData = jsonDecode(response.body);

    if (responseData.isEmpty) {
      throw Exception('Course not found');
    }

    return Course.fromMap(responseData.first);
  }
}
