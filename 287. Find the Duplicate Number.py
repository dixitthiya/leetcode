# https://leetcode.com/problems/find-the-duplicate-number

# Find the Duplicate Number - Sorting Solution
# TC = O(nlogn)
# SC = O(1)

# - Sort the list first
# - Run a for loop to check if element at index i and i+1 are the same
# - If they are same return i or the element as per requirement

# Find the Duplicate Number - Hash Map Solution
# TC = O(n)
# SC = O(n)

class Solution(object):
    def findDuplicate(self, nums):
        seen = []
        for i in nums:
            if i in seen:
                return i
            else:
                seen.append(i)
                
#-----

# Find the Duplicate Number - In Place Solution
# TC = O(n)
# SC = O(1)
# The array is modified here.

class Solution(object):
    def findDuplicate(self, nums):
        while nums[0] <> nums[nums[0]]:
            next = nums[nums[0]]
            nums[nums[0]] = nums[0]
            nums[0] = next
        return nums[0]

#-----
      
# Find the Duplicate Number - Two pointer two while loops
# TC = O(n)
# SC = O(1)
# The array is not modified here.

class Solution(object):
    def findDuplicate(self, nums):
        slow = fast = nums[0]
        
        while True:
            slow = nums[slow]
            fast = nums[nums[fast]]
            if slow == fast:
#here we validate this at the end because the loop will break at first instance as fast and slow # # #both are nums[0]
                break
        slow = nums[0]        
        while True:
            if slow == fast:
#here we use it at the first because if slow and fast both are the same it is the answer
                break
            slow = nums[slow]
            fast = nums[fast]
        
        return fast
