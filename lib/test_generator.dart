import 'dart:async';
import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';

void generateTests(String inputPath, String outputDir, bool verbose) async {
  final apiKey = Platform.environment['GEMINI_API_KEY'];
  if (apiKey == null) {
    throw Exception('''
Missing Gemini API key. Please set it as environment variable:
  \n# Linux/macOS
  export GEMINI_API_KEY="your_key_here"
  \n# Windows
  \$env:GEMINI_API_KEY="your_key_here"
''');
  }

  // 1. Read input file
  final code = File(inputPath).readAsStringSync();

  // 2. Initialize Gemini
  final model = GenerativeModel(
    model: 'gemini-1.5-pro-latest',
    apiKey: apiKey,
  );

  // 3. Build prompt
  final importPath = _getImportPath(inputPath);
  final prompt = '''

  Generate ONLY Dart test code using the test package for this Dart code.
  Follow these rules STRICTLY:
  1. Output ONLY the test code, no explanations
  2. Use proper test package syntax
  3. Include edge cases
  5. Never include the original code
  6. Add all required imports
  7. NEVER include markdown code blocks (```)
  8. Use this EXACT import statement:
   import '$importPath';
  Code to test:
  $code
  ''';

  final stopwatch = Stopwatch()..start();

  print('🔄 Generating tests for: $importPath');
  print('⏳ This may take 10-30 seconds...');
  final cancelSpinner = showSpinner();

  // 4. Generate tests
  if (verbose) print('[VERBOSE] Calling Gemini...');
  final response = await model.generateContent([Content.text(prompt)]);

  // 5. Save output
  final testFile = File('$outputDir/${_getTestFileName(inputPath)}');
  testFile.writeAsStringSync(response.text!);

  if (verbose) print('[VERBOSE] Tests saved to: ${testFile.path}');

  cancelSpinner();
  print('\n✅ Success! Generated tests in ${stopwatch.elapsed.inSeconds}s');
  print('📁 Tests generated at: ${testFile.path}');
}

String _getTestFileName(String path) =>
    '${path.split('/').last.replaceAll('.dart', '')}_test.dart';

String _getImportPath(String inputPath) {
  try {
    final pubspec = File('pubspec.yaml').readAsStringSync();
    final packageName = loadYaml(pubspec)['name'] as String;

    final relativePath =
        path.relative(inputPath, from: 'lib').replaceAll(r'\', '/');
    final importPath = 'package:$packageName/$relativePath';

    return importPath;
  } catch (e) {
    final path = inputPath.replaceFirst('lib/', '');
    return "package:your_package_name/$path";
  }
}

Function() showSpinner() {
  const chars = r'-\|/';
  int i = 0;
  Timer? timer; // Make timer nullable

  timer = Timer.periodic(Duration(milliseconds: 100), (_) {
    stdout.write('\r${chars[i++ % chars.length]} Generating...');
  });

  // Return a closure that cancels the timer
  return () => timer?.cancel();
}
