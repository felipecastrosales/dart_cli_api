import 'package:args/command_runner.dart';

import '../../repositories/student_repository_dio.dart';

import 'subcommands/delete_command.dart';
import 'subcommands/find_all_command.dart';
import 'subcommands/find_by_id.dart';
import 'subcommands/insert_command.dart';
import 'subcommands/update_command.dart';

class StudentsCommand extends Command {
  @override
  String get description => 'Students Operations';

  @override
  String get name => 'students';

  StudentsCommand() {
    final studentRepository = StudentRepositoryDio();
    addSubcommand(FindAllCommand(studentRepository));
    addSubcommand(FindById(studentRepository));
    addSubcommand(InsertCommand(studentRepository));
    addSubcommand(UpdateCommand(studentRepository));
    addSubcommand(DeleteCommand(studentRepository));
  }
}
