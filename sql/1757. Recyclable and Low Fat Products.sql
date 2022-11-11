# https://leetcode.com/problems/recyclable-and-low-fat-products/?envType=study-plan&id=sql-i

SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y'
