import 'dart:io';

import 'package:args/command_runner.dart';
import '../../../repositories/course_repository_dio.dart';
import '../../../repositories/student_repository_dio.dart';
import '../../../models/phone.dart';
import '../../../models/city.dart';
import '../../../models/address.dart';
import '../../../models/student.dart';

class InsertCommand extends Command {
  InsertCommand(this.repository) {
    argParser.addOption(
      'file',
      abbr: 'f',
      help: 'Path to the file',
      valueHelp: 'name',
    );
  }

  final StudentRepositoryDio repository;
  final courseRepository = CourseRepositoryDio();

  @override
  String get description => 'Insert a student';

  @override
  String get name => 'insert';

  @override
  Future<void> run() async {
    print('Awaiting...');
    final filePath = argResults?['file'];
    final students = File(filePath).readAsLinesSync();
    print('------------------------------------------------------------------');
    print('Inserting a student...');
    for (var student in students) {
      final studentData = student.split(';');
      final courseCSV =
          studentData[2].split(',').map((course) => course.trim()).toList();

      final futureCourse = courseCSV.map((e) async {
        final course = await courseRepository.findByName(e);
        course.isStudent = true;
        return course;
      }).toList();

      final courses = await Future.wait(futureCourse);

      final studentModel = Student(
        name: studentData[0],
        age: int.tryParse(studentData[1]),
        nameCourses: courseCSV,
        courses: courses,
        address: Address(
          street: studentData[3],
          number: int.parse(studentData[4]),
          zipCode: studentData[5],
          city: City(
            id: 1,
            name: studentData[6],
          ),
          phone: Phone(
            ddd: studentData[7],
            phone: studentData[8],
          ),
        ),
      );

      await repository.insert(studentModel);
    }
    print('------------------------------------------------------------------');
    print('Inserted students');
  }
}
