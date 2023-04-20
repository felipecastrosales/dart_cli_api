import 'dart:io';

import 'package:args/command_runner.dart';
import '../../../repositories/course_repository_dio.dart';
import '../../../repositories/student_repository_dio.dart';

class DeleteCommand extends Command {
  DeleteCommand(this.repository) {
    argParser.addOption(
      'id',
      abbr: 'i',
      help: 'Id of the student',
      valueHelp: 'id',
    );
  }

  // final StudentRepository repository;
  // final courseRepository = CourseRepository();

  final StudentRepositoryDio repository;
  final courseRepository = CourseRepositoryDio();

  @override
  String get description => 'Delete a student';

  @override
  String get name => 'delete';

  @override
  Future<void> run() async {
    print('Awaiting...');
    final id = int.tryParse(argResults?['id']);
    if (id == null) {
      print(
        'Id is required!, inform the id of the student to be deleted with: --id=0 or -i 0',
      );
      return;
    }

    print('------------------------------------------------------------------');

    final studentData = await repository.findById(id);
    print(
        'You confirm the deletion of the student: ${studentData.name}? (y/n)');
    final confirmDelete = stdin.readLineSync();
    if (confirmDelete?.toLowerCase() == 'y') {
      print(
        '------------------------------------------------------------------',
      );
      await repository.deleteById(id);
      print('Student ${studentData.name} deleted!');
      return;
    } else {
      print(
        '------------------------------------------------------------------',
      );
      print('Student ${studentData.name} not deleted!');
      return;
    }
  }
}
