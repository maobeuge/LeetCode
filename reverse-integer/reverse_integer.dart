class Solution {
  int reverse(int x) {
    final bool isNegative = x < 0;

    if (x == 0) {
      return 0;
    }

    String num = x.toString();
    if (isNegative) {
      num = num.substring(1);
    }
    List<String> nums = num.split("");
    List<String> reversed = nums.reversed.toList();
    while (reversed.first == '0') {
      reversed.removeAt(0);
    }

    final int result =
        isNegative
            ? int.parse("-" + reversed.join())
            : int.parse(reversed.join());
    if (result > 2147483648 - 1) return 0;
    if (result < -2147483648) return 0;
    return result;
  }
}

void main() {
  final Solution solution = Solution();
  final int x = 123;
  final int x1 = 120;
  final int x2 = -123;

  print(solution.reverse(x));
  print(solution.reverse(x1));
  print(solution.reverse(x2));
}
