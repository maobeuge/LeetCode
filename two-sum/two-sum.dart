import 'dart:math';

class Solution {
  List<int> twoSum(List<int> nums, int target) {
    List<int> result = [];
    Map<int, int> hash = {};

    for (int i = 0; i < nums.length; i++) {
      hash[nums[i]] = i;
    }

    for (int i = 0; i < nums.length; i++) {
      int complement = target - nums[i];
      if (hash.containsKey(complement) && hash[complement] != i) {
        print(hash[complement]);
        return [i, hash[complement]!];
      }
    }

    return result;
  }
}

void main() {
  final Solution solution = Solution();
  final List<int> nums = List.generate(10000, (_) => Random().nextInt(1000000));
  final int target = Random().nextInt(1000000);
  final stopwatch = Stopwatch()..start();
  final List<int> result = solution.twoSum(nums, target);
  print('Temps écoulé : ${stopwatch.elapsedMilliseconds} ms');
  print(result);
  print(target);
  print("${nums[result[0]]} ${nums[result[1]]}");

  stopwatch.stop();
}
