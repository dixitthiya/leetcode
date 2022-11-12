# https://leetcode.com/problems/move-zeroes/

# Move Zeroes - Brut Force

def moveZeroes(self, nums: List[int]) -> None:
        for i in range(len(nums)):
            if nums[i]==0:
                nums.remove(nums[i])
                nums.append(0)
        return nums

# Move Zeroes - Two Pointer
# TC = O(n)
# SC = O(1)

class Solution(object):
    def moveZeroes(self, nums):              
        slow = fast = 0
        while fast < len(nums):
            if nums[fast] != 0:
                nums[slow], nums[fast] = nums[fast], nums[slow]
                slow += 1
                fast += 1
            else:
                fast += 1
        
