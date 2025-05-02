class Solution {
  String convert(String s, int numRows) {
    String result = "";
    List<String> rows = List<String>.generate(numRows, (str) => "");
    bool forward = true;
    int index = 0;

    if (numRows == 1) {
      return s;
    }

    for (int i = 0; i < s.length; i++) {
      rows[index] += s[i];
      if (index == numRows - 1) {
        forward = false;
      }
      if (index == 0) {
        forward = true;
      }

      if (forward) {
        index++;
      } else {
        index--;
      }
    }

    for (final str in rows) {
      result += str;
    }

    return result;
  }
}

void main() {
  final Solution solution = Solution();

  final String s = "PAYPALISHIRING";
  print(solution.convert(s, 3));
  print(solution.convert(s, 4));
}
