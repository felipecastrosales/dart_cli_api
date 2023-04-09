import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../repositories/student_repository.dart';

class FindAllCommand extends Command {
  FindAllCommand(this.repository);
  final StudentRepository repository;

  @override
  String get description => 'Find all students';

  @override
  String get name => 'findAll';

  @override
  Future<void> run() async {
    print('Finding all students...');
    final students = await repository.findAll();
    print('Present courses? (Y or N)');
    final showCourses = stdin.readLineSync();
    print('------------------------------------------------------------------');
    print('Students:');
    print('------------------------------------------------------------------');
    for (var student in students) {
      if (showCourses?.toLowerCase() == 'y') {
        print(
          'Id: ${student.id}, Name: ${student.name}, Courses: ${student.courses.where((course) => course.isStudent).map((course) => course.title).toList()}',
        );
      } else {
        print('Id: ${student.id}, Name: ${student.name}');
      }
    }
  }
}
