import 'package:test/test.dart';
import 'package:test_gen_cli/math.dart';

void main() {
  group('add', () {
    test('should return the sum of two positive integers', () {
      expect(add(2, 3), equals(5));
    });

    test('should return the sum of a positive and a negative integer', () {
      expect(add(5, -3), equals(2));
      expect(add(-5, 3), equals(-2));
    });

    test('should return the sum of two negative integers', () {
      expect(add(-2, -3), equals(-5));
    });

    test('should return the number when adding zero', () {
      expect(add(5, 0), equals(5));
      expect(add(0, 5), equals(5));
      expect(add(-5, 0), equals(-5));
      expect(add(0, -5), equals(-5));
      expect(add(0, 0), equals(0));
    });
  });

  group('subtract', () {
    test('should return the difference of two positive integers', () {
      expect(subtract(5, 3), equals(2));
      expect(subtract(3, 5), equals(-2));
    });

    test('should return the difference involving negative integers', () {
      expect(subtract(5, -3), equals(8));
      expect(subtract(-5, 3), equals(-8));
      expect(subtract(-5, -3), equals(-2));
    });

    test('should return the correct result when subtracting zero', () {
      expect(subtract(5, 0), equals(5));
      expect(subtract(0, 5), equals(-5));
      expect(subtract(-5, 0), equals(-5));
      expect(subtract(0, -5), equals(5));
      expect(subtract(0, 0), equals(0));
    });
  });

  group('multiply', () {
    test('should return the product of two positive integers', () {
      expect(multiply(2, 3), equals(6));
    });

    test('should return the product of a positive and a negative integer', () {
      expect(multiply(5, -3), equals(-15));
      expect(multiply(-5, 3), equals(-15));
    });

    test('should return the product of two negative integers', () {
      expect(multiply(-2, -3), equals(6));
    });

    test('should return zero when multiplying by zero', () {
      expect(multiply(5, 0), equals(0));
      expect(multiply(0, 5), equals(0));
      expect(multiply(-5, 0), equals(0));
      expect(multiply(0, -5), equals(0));
      expect(multiply(0, 0), equals(0));
    });

    test('should return the number when multiplying by one', () {
      expect(multiply(5, 1), equals(5));
      expect(multiply(1, 5), equals(5));
      expect(multiply(-5, 1), equals(-5));
      expect(multiply(1, -5), equals(-5));
    });
  });

  group('divide', () {
    test('should return the quotient of two positive integers', () {
      expect(divide(6, 3), equals(2.0));
      expect(divide(5, 2), equals(2.5));
    });

    test('should return the quotient involving negative integers', () {
      expect(divide(6, -3), equals(-2.0));
      expect(divide(-6, 3), equals(-2.0));
      expect(divide(-6, -3), equals(2.0));
      expect(divide(5, -2), equals(-2.5));
    });

    test('should return zero when dividing zero by a non-zero integer', () {
      expect(divide(0, 5), equals(0.0));
      expect(divide(0, -5), equals(0.0));
    });

    test('should throw ArgumentError when dividing by zero', () {
      expect(() => divide(5, 0), throwsA(isA<ArgumentError>()));
      expect(() => divide(0, 0), throwsA(isA<ArgumentError>()));
      expect(() => divide(-5, 0), throwsA(isA<ArgumentError>()));
    });

     test('should return the number when dividing by one', () {
      expect(divide(5, 1), equals(5.0));
      expect(divide(-5, 1), equals(-5.0));
    });

     test('should return the negative number when dividing by minus one', () {
      expect(divide(5, -1), equals(-5.0));
      expect(divide(-5, -1), equals(5.0));
    });
  });

  group('isEven', () {
    test('should return true for positive even numbers', () {
      expect(isEven(2), isTrue);
      expect(isEven(100), isTrue);
    });

    test('should return false for positive odd numbers', () {
      expect(isEven(1), isFalse);
      expect(isEven(99), isFalse);
    });

    test('should return true for zero', () {
      expect(isEven(0), isTrue);
    });

    test('should return true for negative even numbers', () {
      expect(isEven(-2), isTrue);
      expect(isEven(-100), isTrue);
    });

    test('should return false for negative odd numbers', () {
      expect(isEven(-1), isFalse);
      expect(isEven(-99), isFalse);
    });
  });

  group('factorial', () {
    test('should return 1 for factorial of 0', () {
      expect(factorial(0), equals(1));
    });

    test('should return 1 for factorial of 1', () {
      expect(factorial(1), equals(1));
    });

    test('should return the correct factorial for positive integers', () {
      expect(factorial(5), equals(120)); // 5 * 4 * 3 * 2 * 1
      expect(factorial(3), equals(6)); // 3 * 2 * 1
    });

    test('should throw ArgumentError for negative numbers', () {
      expect(() => factorial(-1), throwsA(isA<ArgumentError>()));
      expect(() => factorial(-5), throwsA(isA<ArgumentError>()));
    });
  });

   group('isPrime', () {
    test('should return false for numbers less than or equal to 1', () {
      expect(isPrime(1), isFalse);
      expect(isPrime(0), isFalse);
      expect(isPrime(-1), isFalse);
      expect(isPrime(-10), isFalse);
    });

    test('should return true for prime numbers', () {
      expect(isPrime(2), isTrue);
      expect(isPrime(3), isTrue);
      expect(isPrime(5), isTrue);
      expect(isPrime(7), isTrue);
      expect(isPrime(11), isTrue);
      expect(isPrime(13), isTrue);
      expect(isPrime(97), isTrue); // A larger prime
    });

    test('should return false for non-prime (composite) numbers', () {
      expect(isPrime(4), isFalse);
      expect(isPrime(6), isFalse);
      expect(isPrime(8), isFalse);
      expect(isPrime(9), isFalse);
      expect(isPrime(10), isFalse);
      expect(isPrime(12), isFalse);
       expect(isPrime(100), isFalse); // A larger composite
    });
  });
}