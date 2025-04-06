import 'package:test/test.dart';
import 'package:test_gen_cli/utils/math_utils.dart';

void main() {
  group('add', () {
    test('should return the sum of two positive numbers', () {
      expect(add(2, 3), equals(5));
    });

    test('should return the sum of two negative numbers', () {
      expect(add(-2, -3), equals(-5));
    });

    test('should return the sum of a positive and a negative number', () {
      expect(add(5, -3), equals(2));
      expect(add(-5, 3), equals(-2));
    });

    test('should return the number when adding zero', () {
      expect(add(5, 0), equals(5));
      expect(add(0, 5), equals(5));
    });

    test('should return zero when adding zero to zero', () {
      expect(add(0, 0), equals(0));
    });

    test('should handle large numbers', () {
      expect(add(1000000000, 2000000000), equals(3000000000));
    });
  });

  group('subtract', () {
    test('should return the difference of two positive numbers', () {
      expect(subtract(5, 2), equals(3));
    });

    test('should return the difference of two negative numbers', () {
      expect(subtract(-5, -2), equals(-3));
    });

    test('should return the difference of a positive and a negative number',
        () {
      expect(subtract(5, -2), equals(7));
      expect(subtract(-5, 2), equals(-7));
    });

    test('should return the number when subtracting zero', () {
      expect(subtract(5, 0), equals(5));
    });

    test('should return the negative number when subtracting from zero', () {
      expect(subtract(0, 5), equals(-5));
    });

    test('should return zero when subtracting zero from zero', () {
      expect(subtract(0, 0), equals(0));
    });

    test('should return zero when subtracting a number from itself', () {
      expect(subtract(5, 5), equals(0));
      expect(subtract(-5, -5), equals(0));
    });

     test('should handle large numbers', () {
      expect(subtract(3000000000, 1000000000), equals(2000000000));
    });
  });

  group('multiply', () {
    test('should return the product of two positive numbers', () {
      expect(multiply(3, 4), equals(12));
    });

    test('should return the product of two negative numbers', () {
      expect(multiply(-3, -4), equals(12));
    });

    test('should return the product of a positive and a negative number', () {
      expect(multiply(3, -4), equals(-12));
      expect(multiply(-3, 4), equals(-12));
    });

    test('should return zero when multiplying by zero', () {
      expect(multiply(5, 0), equals(0));
      expect(multiply(0, 5), equals(0));
      expect(multiply(0, 0), equals(0));
    });

    test('should return the number when multiplying by one', () {
      expect(multiply(5, 1), equals(5));
      expect(multiply(1, 5), equals(5));
    });

    test('should return the negative number when multiplying by negative one', () {
      expect(multiply(5, -1), equals(-5));
       expect(multiply(-1, 5), equals(-5));
    });

     test('should handle large numbers', () {
      expect(multiply(100000, 20000), equals(2000000000));
    });
  });

  group('divide', () {
    test('should return the quotient of two positive numbers', () {
      expect(divide(10, 2), equals(5.0));
      expect(divide(5, 2), equals(2.5));
    });

    test('should return the quotient of two negative numbers', () {
      expect(divide(-10, -2), equals(5.0));
       expect(divide(-5, -2), equals(2.5));
    });

    test('should return the quotient of a positive and a negative number', () {
      expect(divide(10, -2), equals(-5.0));
      expect(divide(-10, 2), equals(-5.0));
       expect(divide(5, -2), equals(-2.5));
       expect(divide(-5, 2), equals(-2.5));
    });

    test('should return zero when dividing zero by a non-zero number', () {
      expect(divide(0, 5), equals(0.0));
      expect(divide(0, -5), equals(0.0));
    });

    test('should return 1.0 when dividing a number by itself', () {
      expect(divide(5, 5), equals(1.0));
      expect(divide(-5, -5), equals(1.0));
    });

     test('should return -1.0 when dividing a number by its negative', () {
      expect(divide(5, -5), equals(-1.0));
      expect(divide(-5, 5), equals(-1.0));
    });


    test('should throw ArgumentError when dividing by zero', () {
      expect(() => divide(5, 0), throwsArgumentError);
      expect(() => divide(0, 0), throwsArgumentError);
      expect(() => divide(-5, 0), throwsArgumentError);
    });
  });

  group('isEven', () {
    test('should return true for positive even numbers', () {
      expect(isEven(2), isTrue);
      expect(isEven(100), isTrue);
    });

    test('should return false for positive odd numbers', () {
      expect(isEven(3), isFalse);
      expect(isEven(101), isFalse);
    });

    test('should return true for negative even numbers', () {
      expect(isEven(-2), isTrue);
      expect(isEven(-100), isTrue);
    });

    test('should return false for negative odd numbers', () {
      expect(isEven(-3), isFalse);
      expect(isEven(-101), isFalse);
    });

    test('should return true for zero', () {
      expect(isEven(0), isTrue);
    });
  });

  group('factorial', () {
    test('should return 1 for factorial of 0', () {
      expect(factorial(0), equals(1));
    });

    test('should return 1 for factorial of 1', () {
      expect(factorial(1), equals(1));
    });

    test('should return the correct factorial for small positive numbers', () {
      expect(factorial(2), equals(2));
      expect(factorial(3), equals(6));
      expect(factorial(5), equals(120));
    });

     test('should return the correct factorial for larger positive numbers', () {
      expect(factorial(10), equals(3628800));
    });

    test('should throw ArgumentError for negative numbers', () {
      expect(() => factorial(-1), throwsArgumentError);
      expect(() => factorial(-5), throwsArgumentError);
    });
  });

  group('isPrime', () {
    test('should return false for numbers less than or equal to 1', () {
      expect(isPrime(1), isFalse);
      expect(isPrime(0), isFalse);
      expect(isPrime(-1), isFalse);
      expect(isPrime(-10), isFalse);
    });

    test('should return true for small prime numbers', () {
      expect(isPrime(2), isTrue);
      expect(isPrime(3), isTrue);
      expect(isPrime(5), isTrue);
      expect(isPrime(7), isTrue);
      expect(isPrime(11), isTrue);
      expect(isPrime(13), isTrue);
    });

    test('should return false for small composite numbers', () {
      expect(isPrime(4), isFalse);
      expect(isPrime(6), isFalse);
      expect(isPrime(8), isFalse);
      expect(isPrime(9), isFalse);
      expect(isPrime(10), isFalse);
      expect(isPrime(12), isFalse);
    });

    test('should return true for larger prime numbers', () {
      expect(isPrime(97), isTrue);
      expect(isPrime(7919), isTrue); // A known large prime
    });

    test('should return false for larger composite numbers', () {
       expect(isPrime(100), isFalse);
       expect(isPrime(7917), isFalse); // 7917 = 3 * 2639
    });
  });
}