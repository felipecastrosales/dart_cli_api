import 'package:args/args.dart';
import 'package:args/command_runner.dart';

void main(List<String> arguments) {
  final argParser = ArgParser();
  argParser.addFlag('data', abbr: 'd');
  argParser.addOption('name', abbr: 'n');
  argParser.addOption('template', abbr: 't');
  final argResult = argParser.parse(arguments);
  // print(
  //   'data: ${argResult['d']}, name: ${argResult['n']}, template: ${argResult['t']}',
  // );
  print(
    'data: ${argResult['data']}, name: ${argResult['name']}, template: ${argResult['template']}',
  );

  final commandRunner = CommandRunner('dart_cli', 'A command-line app')
    ..addCommand(CommandExample())
    ..run(arguments);

  print('CommandRunner: ${commandRunner.commands}');
}

class CommandExample extends Command {
  @override
  String get name => 'command';

  @override
  String get description => 'A command example';

  CommandExample() {
    argParser.addFlag('data', abbr: 'd');
    argParser.addOption('name', abbr: 'n');
    argParser.addOption('template', abbr: 't', help: 'Template to use');
  }

  @override
  void run() {
    print(
      'data: ${argResults?['data']}, name: ${argResults?['name']}, template: ${argResults?['template']}',
    );
  }
}
