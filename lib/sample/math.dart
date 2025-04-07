/// Adds two numbers
int add(int a, int b) => a + b;

/// Subtracts two numbers
int subtract(int a, int b) => a - b;

/// Multiplies two numbers
int multiply(int a, int b) => a * b;

/// Divides two numbers. Throws [ArgumentError] if b is zero.
double divide(int a, int b) {
  if (b == 0) throw ArgumentError('Cannot divide by zero');
  return a / b;
}

/// Checks if a number is even
bool isEven(int number) => number % 2 == 0;

/// Calculates the factorial of a number. Throws for negative inputs.
int factorial(int n) {
  if (n < 0) throw ArgumentError('Negative numbers not allowed');
  return n <= 1 ? 1 : n * factorial(n - 1);
}

/// Checks if a number is prime
bool isPrime(int number) {
  if (number <= 1) return false;
  for (int i = 2; i * i <= number; i++) {
    if (number % i == 0) return false;
  }
  return true;
}
