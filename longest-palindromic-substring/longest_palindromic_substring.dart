class Solution {
  String checkPalindrome(String s, int left, int right) {
    while (left > -1 && right < s.length && s[left] == s[right]) {
      left--;
      right++;
    }

    return s.substring(left + 1, right);
  }

  String longestPalindrome(String s) {
    String palindrome = '';
    int maxLength = s.length;

    for (int i = 0; i < maxLength; i++) {
      final String longestOdd = checkPalindrome(s, i, i);
      if (longestOdd.length > palindrome.length) {
        palindrome = longestOdd;
      }
      final String longestEven = checkPalindrome(s, i, i + 1);
      if (longestEven.length > palindrome.length) {
        palindrome = longestEven;
      }
    }

    return palindrome != '' ? palindrome : s[0];
  }
}

void main() {
  final Solution solution = Solution();
  final String s = "babad";
  final String s1 = "cbbd";
  final String s2 = "kayakaa";

  print("babad: " + solution.longestPalindrome(s));
  print("cbbd: " + solution.longestPalindrome(s1));
  print("kayakaa: " + solution.longestPalindrome(s2));
}
