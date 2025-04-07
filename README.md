# TestGen AI 🤖🧪

[![Pub Version](https://img.shields.io/pub/v/test_gen_ai)](https://pub.dev/packages/test_gen)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

An AI-powered CLI tool that automatically generates Dart unit tests using Google's Gemini AI. Improve your test coverage with intelligent test case generation!

## Features ✨

- 🚀 Generate tests for Dart functions/classes
- 🧠 AI-powered edge case detection
- ⚙️ Simple CLI interface
- 📊 Integrates with `package:coverage` (future update)


## Quick Start
### 1. Install
```dart
dart pub add test_gen
```

### 2. Configuration
i. Get Gemini API Key

ii. Set environment variable:
#### Linux/macOS
```dart
export GEMINI_API_KEY="your_key"
```
#### Windows
```dart
$env:GEMINI_API_KEY="your_key"
```

### 3. Generate tests
dart run test_gen -i lib/subfolder(if any)/file_name.dart
#### E.g:
```dart
dart run test_gen -i lib/math.dart
```

## Example 🧪
Input File (lib/math.dart)
```dart
int add(int a, int b) => a + b;
```
Generated Test (test/math_test.dart):
```dart
import 'package:test/test.dart';
import '../lib/math.dart';

void main() {
  test('adds two numbers', () {
    expect(add(2, 3), 5);
  });
}
```

## CLI Options

| Option         | Short | Description                  | Default     |
|----------------|-------|------------------------------|-------------|
| `--input`      | `-i`  | Input Dart file (**required**) | -           |
| `--output`     | `-o`  | Output directory             | `test/`     |
| `--verbose`    | `-v`  | Show detailed output         | `false`     |

## Troubleshooting 🚨
### Common Issues
`Missing API Key`: Ensure GEMINI_API_KEY is set

`Invalid Input Path`: Verify file exists and is a Dart file

`Test Validation Errors`: Review generated tests for AI hallucinations

## Features Roadmap 🗺️
- Coverage analysis integration

- Batch processing for entire directories

- Test validation system

- Custom prompt templates

## Building from Source 🛠️
### Clone repository
```bash
git clone https://github.com/JayPcloud/test_gen_dart.git
cd test_gen_dart
```

### Install dependencies
```bash
dart pub get
```
### Run development version
```bash
dart run test_gen -i lib/example.dart
```
### Project Structure

| Path                          | Type             | Purpose                                                                 |
|-------------------------------|------------------|-------------------------------------------------------------------------|
| `bin/test_gen.dart`           | CLI Entry        | Command line interface handling and argument parsing                    |
| `lib/test_generator.dart`     | Core Logic       | Contains implementation of test generation logic                        |
| `lib/sample/`                 | Examples         | Sample input files                                                      |
| `test/`                       | Unit Tests       | Sample output tests for verification                                    |


#### Disclaimer: Generated tests should be reviewed and may require manual adjustment. Critical systems should not rely solely on AI-generated tests.
