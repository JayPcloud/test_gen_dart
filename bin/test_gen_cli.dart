import 'package:args/args.dart';
import 'package:test_gen_cli/test_generator.dart';

void main(List<String> arguments) {
  // 1. Set up argument parser
  final parser = ArgParser()
    ..addOption('input',
        abbr: 'i',                  // Short flag (-i)
        help: 'Path to Dart file', // Help text
        mandatory: true)            // Must be provided
    ..addOption('output',
        abbr: 'o',
        help: 'Output directory',
        defaultsTo: 'test')         // Default: 'test/'
    ..addFlag('verbose',
        abbr: 'v',                  // -v flag
        help: 'Show debug logs')
    ..addFlag('version',            // --version
        help: 'Print version');

  try {
    // 2. Parse user input
    final results = parser.parse(arguments);

    // 3. Handle --version
    if (results['version'] as bool) {
      print('TestGen CLI v1.0.0');
      return;
    }

    // 4. Get required values
    final inputFile = results['input'] as String;
    final outputDir = results['output'] as String;
    final isVerbose = results['verbose'] as bool;

    // 5. Validate input
    if (!inputFile.endsWith('.dart')) {
      throw FormatException('Input must be a .dart file');
    }

    // 6. Core logic (will implement next)
    generateTests(inputFile, outputDir, isVerbose);

  } catch (e) {
    // 7. Error handling
    print('Error: $e');
    print(parser.usage);  // Show help text
  }
}