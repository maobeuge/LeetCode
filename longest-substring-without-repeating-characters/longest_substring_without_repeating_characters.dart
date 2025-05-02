class Solution {
  int lengthOfLongestSubstring(String s) {
    int result = 0;
    String alphabet = '';
    int longest = 0;
    int left = 0;
    int right = 0;
    if (s.length > 0) {
      alphabet += s[0];
      result = 1;
    }

    while (right < s.length) {
      if (right == left) {
        right++;
      }
      if (right == s.length) {
        break;
      }
      if (!alphabet.contains(s[right])) {
        alphabet += s[right];
        longest = right - left + 1;
        right++;
        if (longest > result) {
          result = longest;
        }
      } else {
        alphabet += s[right];
        int lastPos = alphabet.indexOf(s[right]);
        alphabet = alphabet.substring(lastPos + 1);
        left += lastPos + 1;
        right++;
      }
    }

    return result;
  }
}

void main() {
  final String str = "abcabcabababzroinaozifoinofaosgf";
  final Solution solution = Solution();

  print(solution.lengthOfLongestSubstring(str));
}
