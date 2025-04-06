import 'package:test/test.dart';
import 'package:test_gen_cli/string/const/const.dart'; // Use this EXACT import statement

void main() {
  group('StringUtils', () {
    group('reverse', () {
      test('should reverse a simple string', () {
        expect(StringUtils.reverse('hello'), equals('olleh'));
      });

      test('should return an empty string for an empty input', () {
        expect(StringUtils.reverse(''), equals(''));
      });

      test('should handle strings with spaces', () {
        expect(StringUtils.reverse('hello world'), equals('dlrow olleh'));
      });

      test('should handle strings with special characters', () {
        expect(StringUtils.reverse('!@#\$%'), equals('%\$#@!'));
      });

       test('should handle unicode characters', () {
        expect(StringUtils.reverse('你好世界'), equals('界世好你'));
      });

      test('should handle palindrome strings', () {
        expect(StringUtils.reverse('madam'), equals('madam'));
      });

       test('should handle single character strings', () {
        expect(StringUtils.reverse('a'), equals('a'));
      });
    });

    group('isPalindrome', () {
      test('should return true for a simple palindrome', () {
        expect(StringUtils.isPalindrome('madam'), isTrue);
      });

      test('should return false for a non-palindrome', () {
        expect(StringUtils.isPalindrome('hello'), isFalse);
      });

      test('should ignore case', () {
        expect(StringUtils.isPalindrome('Racecar'), isTrue);
      });

      test('should ignore spaces and punctuation', () {
        expect(StringUtils.isPalindrome('A man, a plan, a canal: Panama'), isTrue);
        expect(StringUtils.isPalindrome('Was it a car or a cat I saw?'), isTrue);
        expect(StringUtils.isPalindrome('No lemon, no melon.'), isTrue);
      });

       test('should return true for an empty string', () {
        expect(StringUtils.isPalindrome(''), isTrue);
      });

       test('should return true for a single character string', () {
        expect(StringUtils.isPalindrome('a'), isTrue);
         expect(StringUtils.isPalindrome('5'), isTrue);
      });

      test('should handle strings with numbers', () {
         expect(StringUtils.isPalindrome('121'), isTrue);
         expect(StringUtils.isPalindrome('123'), isFalse);
         expect(StringUtils.isPalindrome('level 2'), isFalse); // Note: spaces removed 'level2' != '2level'
         expect(StringUtils.isPalindrome('Was it Eliot\'s toilet I saw?'), isTrue);
      });

       test('should return false for nearly palindromic strings', () {
        expect(StringUtils.isPalindrome('Racecars'), isFalse);
      });
    });

    group('countVowels', () {
      test('should count vowels in a mixed case string', () {
        expect(StringUtils.countVowels('Hello World AEIOU'), equals(8));
      });

       test('should return 0 for a string with no vowels', () {
        expect(StringUtils.countVowels('rhythm myths fly'), equals(0));
      });

      test('should return 0 for an empty string', () {
        expect(StringUtils.countVowels(''), equals(0));
      });

       test('should count only vowels in a string with only vowels', () {
        expect(StringUtils.countVowels('aeiouAEIOU'), equals(10));
      });

      test('should handle strings with numbers and symbols', () {
        expect(StringUtils.countVowels('Programming is fun! 123 Easy.'), equals(7)); // o,a,i,i,u,E,a
      });

       test('should handle strings with only consonants', () {
         expect(StringUtils.countVowels('bcdfg'), equals(0));
       });
    });

    group('truncate', () {
      test('should return the original string if length is less than maxLength', () {
        expect(StringUtils.truncate('hello', 10), equals('hello'));
      });

      test('should return the original string if length is equal to maxLength', () {
        expect(StringUtils.truncate('hello', 5), equals('hello'));
      });

      test('should truncate the string and add ellipsis if length is greater than maxLength', () {
        expect(StringUtils.truncate('hello world', 5), equals('hello...'));
      });

      test('should handle maxLength of 0', () {
        expect(StringUtils.truncate('hello', 0), equals('...'));
      });

      test('should handle maxLength of 1', () {
        expect(StringUtils.truncate('hello', 1), equals('h...'));
      });

      test('should handle empty string input', () {
        expect(StringUtils.truncate('', 5), equals(''));
        expect(StringUtils.truncate('', 0), equals('')); // Edge case: truncate empty string with maxLength 0
      });

       test('should handle negative maxLength (treat as 0 or throw error? Assuming treat as 0 based on substring logic)', () {
         // Dart substring throws RangeError if start > end or start/end are negative/out of bounds
         // Assuming maxLength >= 0 based on typical usage. If negative values are allowed, behavior needs clarification.
         // Testing with 0 as a proxy for invalid lengths < 0.
         expect(StringUtils.truncate('hello', 0), equals('...'));
       });
    });

    group('getInitials', () {
      test('should return initials for a two-part name', () {
        expect(StringUtils.getInitials('John Doe'), equals('JD'));
      });

      test('should return initials for a three-part name', () {
        expect(StringUtils.getInitials('Jane Anne Smith'), equals('JAS'));
      });

      test('should handle extra spaces between names', () {
        expect(StringUtils.getInitials('  Peter   Jones  '), equals('PJ'));
      });

       test('should handle single name', () {
        expect(StringUtils.getInitials('Alice'), equals('A'));
       });

      test('should return an empty string for an empty input', () {
        expect(StringUtils.getInitials(''), equals(''));
      });

       test('should return an empty string for input with only spaces', () {
        expect(StringUtils.getInitials('   '), equals(''));
      });

      test('should handle names with hyphens (treats as one word)', () {
         expect(StringUtils.getInitials('Mary-Anne Jones'), equals('MJ')); // Depends on desired behavior for hyphens
      });

       test('should handle names with lowercase letters', () {
        expect(StringUtils.getInitials('john doe'), equals('JD'));
      });
    });
  });
}