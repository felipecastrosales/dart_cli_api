import 'dart:io';

import 'package:args/command_runner.dart';
import '../../../repositories/course_repository_dio.dart';
import '../../../repositories/student_repository_dio.dart';
import '../../../models/phone.dart';
import '../../../models/city.dart';
import '../../../models/address.dart';
import '../../../models/student.dart';

class UpdateCommand extends Command {
  UpdateCommand(this.repository) {
    argParser.addOption(
      'file',
      abbr: 'f',
      help: 'Path to the file',
      valueHelp: 'name',
    );
    argParser.addOption(
      'id',
      abbr: 'i',
      help: 'Id of the student',
      valueHelp: 'id',
    );
  }

  final StudentRepositoryDio repository;
  final courseRepository = CourseRepositoryDio();

  @override
  String get description => 'Update a student';

  @override
  String get name => 'update';

  @override
  Future<void> run() async {
    print('Awaiting...');
    final filePath = argResults?['file'];
    final id = argResults?['id'];
    if (id == null) {
      print(
        'Id is required!, inform the id of the student to be updated with: --id=0 or -i 0',
      );
      return;
    }
    final students = File(filePath).readAsLinesSync();
    print('------------------------------------------------------------------');
    print('Updating student with id: $id');

    if (students.length > 1) {
      print('Only one student can be updated at a time in the file $filePath');
      return;
    }

    var firstStudent = students.first;

    final studentData = firstStudent.split(';');
    final courseCSV =
        studentData[2].split(',').map((course) => course.trim()).toList();

    final futureCourse = courseCSV.map((e) async {
      final course = await courseRepository.findByName(e);
      course.isStudent = true;
      return course;
    }).toList();

    final courses = await Future.wait(futureCourse);

    final studentModel = Student(
      id: int.parse(id),
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

    print('------------------------------------------------------------------');
    print('Updated student successfully!');
  }
}
