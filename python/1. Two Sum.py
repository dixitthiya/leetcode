#https://leetcode.com/problems/two-sum/

#Two Sum not sorted - Hash map

class Solution(object):
    def twoSum(self, nums, target):
        numtoindex = dict()
        for i, ele in enumerate(nums):
            if target - ele in numtoindex:
                return [numtoindex[target-ele], i]
            else:
                numtoindex[ele] = i
