import 'address.dart';
import 'course.dart';

class Student {
  Student({
    required this.id,
    required this.name,
    this.age,
    required this.coursesName,
    required this.courses,
    required this.address,
  });

  final int id;
  final String name;
  final int? age;
  final List<String> coursesName;
  final List<Course> courses;
  final Address address;
}
