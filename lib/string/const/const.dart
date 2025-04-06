/// String manipulation utilities
class StringUtils {
  /// Reverses a string
  static String reverse(String input) {
    return input.split('').reversed.join();
  }

  /// Checks if a string is a palindrome
  static bool isPalindrome(String input) {
    final cleaned = input.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    return cleaned == reverse(cleaned);
  }

  /// Counts vowel occurrences
  static int countVowels(String input) {
    return input.toLowerCase().replaceAll(RegExp(r'[^aeiou]'), '').length;
  }

  /// Truncates with ellipsis
  static String truncate(String input, int maxLength) {
    if (input.length <= maxLength) return input;
    return '${input.substring(0, maxLength)}...';
  }

  /// Extracts initials from a name
  static String getInitials(String fullName) {
    final parts = fullName.split(' ');
    return parts.map((p) => p.isNotEmpty ? p[0] : '').join('').toUpperCase();
  }
}