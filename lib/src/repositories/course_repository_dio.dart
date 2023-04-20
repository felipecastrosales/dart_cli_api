import 'package:dio/dio.dart';

import '../models/course.dart';

class CourseRepositoryDio {
  Future<Course> findByName(String name) async {
    try {
      final response = await Dio().get(
        'http://localhost:7777/products',
        queryParameters: {
          'title': name,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load course');
      }

      if (response.data.isEmpty) {
        throw Exception('Course not found');
      }

      return Course.fromMap(response.data.first);
    } on DioError catch (e) {
      print(e);
      throw Exception('Failed to load course');
    }
  }
}
