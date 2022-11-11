# https://leetcode.com/problems/valid-palindrome/

# Valid Palindrome - Two Pointer
# TC = O(n)
# SC = O(1)

class Solution(object):
    def isPalindrome(self, s):
        left = 0
        right = len(s) -1
        while left < right:
            while left < right and s[left].isalnum() == False:
                    left += 1
            while left < right and s[right].isalnum() == False:
                    right -=1
            if s[left].lower() != s[right].lower():
                return False
            left += 1
            right -=1
        return True
