# https://leetcode.com/problems/middle-of-the-linked-list/

# Middle of the Linked List - Brute Force

class Solution(object):
    def middleNode(self, head):
        itr = head
        count = 0
        while itr:
            itr = itr.next
            count += 1
        if count >= 1 and count % 2 == 0:
            start = (count/2) +1
        elif count >= 1 and count % 2 != 0:
            start = (count + 1) / 2 
        count = 0
        while head:
            if count == start -1:
                return head
            head = head.next
            count +=1
        return nodeList[start-1]


# Middle of the Linked List - Two Pointer
# TC = O(n)
# SC = O(1)

class Solution(object):
    def middleNode(self, head):
        slow = head
        fast = head
        
        while fast is not None and fast.next is not None:
            slow = slow.next
            fast = fast.next.next
        
        return slow
