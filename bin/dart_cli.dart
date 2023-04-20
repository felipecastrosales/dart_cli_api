import 'package:args/command_runner.dart';
import 'package:dart_cli_api/src/commands/students/students_command.dart';

void main(List<String> arguments) {
  CommandRunner('dart_cli', 'A command-line app')
    ..addCommand(StudentsCommand())
    ..run(arguments);
}
