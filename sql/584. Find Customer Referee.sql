# https://leetcode.com/problems/find-customer-referee/?envType=study-plan&id=sql-i

SELECT name
FROM customer
WHERE referee_id != 2
  OR referee_id IS NULL
