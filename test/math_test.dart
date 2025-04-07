import 'package:test/test.dart';
import 'package:test_gen/sample/math.dart';

//Sample Test : AI Generated

void main() {
  group('Math Utility Tests', () {
    test('Add two positive numbers', () {
      expect(add(2, 3), equals(5));
    });

    test('Add a positive and a negative number', () {
      expect(add(5, -2), equals(3));
    });

    test('Add two negative numbers', () {
      expect(add(-5, -2), equals(-7));
    });

    test('Add zero to a number', () {
      expect(add(0, 5), equals(5));
      expect(add(5, 0), equals(5));
    });

    test('Subtract two positive numbers', () {
      expect(subtract(5, 2), equals(3));
    });

    test('Subtract a positive and a negative number', () {
      expect(subtract(5, -2), equals(7));
    });

    test('Subtract two negative numbers', () {
      expect(subtract(-5, -2), equals(-3));
    });

    test('Subtract zero from a number', () {
      expect(subtract(5, 0), equals(5));
    });
    
    test('Subtract a number from zero', () {
      expect(subtract(0, 5), equals(-5));
    });

    test('Multiply two positive numbers', () {
      expect(multiply(2, 3), equals(6));
    });

    test('Multiply a positive and a negative number', () {
      expect(multiply(5, -2), equals(-10));
    });

    test('Multiply two negative numbers', () {
      expect(multiply(-5, -2), equals(10));
    });

    test('Multiply by zero', () {
      expect(multiply(5, 0), equals(0));
      expect(multiply(0, 5), equals(0));
    });

    test('Divide two positive numbers', () {
      expect(divide(6, 3), equals(2.0));
    });

    test('Divide a positive and a negative number', () {
      expect(divide(6, -3), equals(-2.0));
    });

    test('Divide two negative numbers', () {
      expect(divide(-6, -3), equals(2.0));
    });

    test('Divide by zero', () {
      expect(() => divide(5, 0), throwsA(isA<ArgumentError>()));
    });

    test('Is even', () {
      expect(isEven(2), isTrue);
      expect(isEven(0), isTrue);
      expect(isEven(-2), isTrue);
      expect(isEven(3), isFalse);
      expect(isEven(-3), isFalse);
    });

    test('Factorial', () {
      expect(factorial(0), equals(1));
      expect(factorial(1), equals(1));
      expect(factorial(5), equals(120));
      expect(() => factorial(-1), throwsA(isA<ArgumentError>()));
    });

    test('Is prime', () {
      expect(isPrime(2), isTrue);
      expect(isPrime(3), isTrue);
      expect(isPrime(5), isTrue);
      expect(isPrime(7), isTrue);
      expect(isPrime(11), isTrue);
      expect(isPrime(1), isFalse);
      expect(isPrime(4), isFalse);
      expect(isPrime(6), isFalse);
      expect(isPrime(8), isFalse);
      expect(isPrime(9), isFalse);
      expect(isPrime(10), isFalse);
    });
  });
}
