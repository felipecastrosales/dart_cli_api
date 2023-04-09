import 'package:args/command_runner.dart';
import 'package:dart_api_v2/src/commands/students/subcommands/find_by_id.dart';

import '../../repositories/student_repository.dart';

import 'subcommands/find_all_command.dart';

class StudentsCommand extends Command {
  @override
  String get description => 'Students Operations';

  @override
  String get name => 'students';

  StudentsCommand() {
    final studentRepository = StudentRepository();
    addSubcommand(FindAllCommand(studentRepository));
    addSubcommand(FindById(studentRepository));
  }
}
