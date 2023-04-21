import 'package:args/command_runner.dart';
import '../../../repositories/student_repository_dio.dart';

class FindById extends Command {
  FindById(this.repository) {
    argParser.addOption(
      'id',
      abbr: 'i',
      help: 'The id of the student',
      valueHelp: 'id',
    );
  }

  final StudentRepositoryDio repository;

  @override
  String get description => 'Find a student by id';

  @override
  String get name => 'findById';

  @override
  Future<void> run() async {
    final argId = argResults?['id'];
    if (argId == null) {
      print('Id is required, pass id with --id or -i flag');
      return;
    }
    final id = int.parse(argId);
    print('Finding all datas...');
    final student = await repository.findById(id);
    print('------------------------------------------------------------------');
    print('Students:');
    print('------------------------------------------------------------------');
    print(
      'Id: ${student.id}, Name: ${student.name}, courses: ${student.courses.map((course) => '${student.courses.indexOf(course) + 1} - ${course.title}').toList()}',
    );
  }
}
