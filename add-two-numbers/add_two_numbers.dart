class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    bool l1Done = false;
    bool l2Done = false;
    int overLap = 0;
    ListNode headNode = ListNode();
    ListNode navigate = headNode;

    while (!l1Done || !l2Done) {
      ListNode tmpNode = ListNode();
      if (l1Done) {
        if (l2!.val + overLap > 9) {
          overLap = 1;
          tmpNode.val = 0;
        } else {
          tmpNode.val = l2.val + overLap;
          overLap = 0;
        }
      } else if (l2Done) {
        if (l1!.val + overLap > 9) {
          overLap = 1;
          tmpNode.val = 0;
        } else {
          tmpNode.val = l1.val + overLap;
          overLap = 0;
        }
      } else {
        int tmpRes = l1!.val + l2!.val + overLap;
        if (tmpRes > 9) {
          tmpNode.val = tmpRes - 10;
          overLap = 1;
        } else {
          tmpNode.val = tmpRes;
          overLap = 0;
        }
      }

      navigate.next = ListNode(tmpNode.val);
      navigate = navigate.next!;

      if (l1?.next == null) {
        l1Done = true;
      } else {
        l1 = l1!.next;
      }

      if (l2?.next == null) {
        l2Done = true;
      } else {
        l2 = l2!.next;
      }
      if (!l1Done || !l2Done) {
        navigate.next = ListNode();
      } else if (overLap > 0) {
        navigate.next = ListNode(overLap);
      }
    }
    return headNode.next;
  }
}

void main() {
  final Solution solution = Solution();
  ListNode? l1 = ListNode(
    9,
    ListNode(
      9,
      ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9))))),
    ),
  );
  ListNode? l2 = ListNode(9, ListNode(9, ListNode(9, ListNode(9))));
  ListNode? result = solution.addTwoNumbers(l1, l2);
  print(result?.val);
  while (result?.next != null) {
    result = result?.next!;
    print(result?.val);
  }
}
