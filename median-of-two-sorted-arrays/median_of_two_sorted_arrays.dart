class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    double median = 0.0;
    List<int> nums = nums1 + nums2;
    int i1 = 0;
    int i2 = 0;
    List<int> sortedNums = [];

    for (int i = 0; i < nums.length; i++) {
      if (i1 >= nums1.length) {
        sortedNums.add(nums2[i2]);
        i2++;
      } else if (i2 >= nums2.length) {
        sortedNums.add(nums1[i1]);
        i1++;
      } else if (nums1[i1] < nums2[i2]) {
        sortedNums.add(nums1[i1]);
        i1++;
      } else {
        sortedNums.add(nums2[i2]);
        i2++;
      }
    }

    if (sortedNums.length % 2 == 0) {
      median =
          (sortedNums[(sortedNums.length / 2 - 1).toInt()] +
              sortedNums[(sortedNums.length / 2).toInt()]) /
          2.0;
    } else {
      median = sortedNums[(sortedNums.length / 2).toInt()].toDouble();
    }

    return median;
  }
}

void main() {
  final Solution solution = Solution();
  final List<int> list1 = [1, 3, 4];
  final List<int> list2 = [2];
  print(solution.findMedianSortedArrays(list1, list2));
}
