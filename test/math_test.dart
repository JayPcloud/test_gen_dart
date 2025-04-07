import 'package:test/test.dart';
import 'package:test_gen/sample/math.dart';

void main() {
  group('add', () {
    test('positive numbers', () => expect(add(2, 3), 5));
    test('negative numbers', () => expect(add(-2, -3), -5));
    test('zero', () => expect(add(0, 5), 5));
  });

  group('subtract', () {
    test('positive numbers', () => expect(subtract(5, 3), 2));
    test('negative numbers', () => expect(subtract(-5, -3), -2));
    test('zero', () => expect(subtract(5, 0), 5));
  });

  group('multiply', () {
    test('positive numbers', () => expect(multiply(2, 3), 6));
    test('negative numbers', () => expect(multiply(-2, 3), -6));
    test('zero', () => expect(multiply(5, 0), 0));
  });

  group('divide', () {
    test('positive numbers', () => expect(divide(6, 3), 2.0));
    test('negative numbers', () => expect(divide(-6, 3), -2.0));
    test('divide by zero', () => expect(() => divide(6, 0), throwsA(isA<ArgumentError>())));
  });

  group('isEven', () {
    test('even number', () => expect(isEven(4), true));
    test('odd number', () => expect(isEven(5), false));
    test('zero', () => expect(isEven(0), true));
    test('negative even', ()=> expect(isEven(-4), true));
    test('negative odd', ()=> expect(isEven(-5), false));

  });

  group('factorial', () {
    test('positive number', () => expect(factorial(5), 120));
    test('zero', () => expect(factorial(0), 1));
    test('one', () => expect(factorial(1), 1));
    test('negative number', () => expect(() => factorial(-5), throwsA(isA<ArgumentError>())));
  });


  group('isPrime', () {
    test('prime number', () => expect(isPrime(7), true));
    test('non-prime number', () => expect(isPrime(9), false));
    test('zero', () => expect(isPrime(0), false));
    test('one', () => expect(isPrime(1), false));
    test('two', () => expect(isPrime(2), true));
    test('negative number', () => expect(isPrime(-7), false));
  });
}
