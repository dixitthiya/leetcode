# https://leetcode.com/problems/consecutive-numbers/

WITH cte AS
  (SELECT id,
          lag(num) over(
                        ORDER BY id) AS lagging,
          num,
          lead(num) over(
                         ORDER BY id) AS leadin
   FROM logs)
SELECT DISTINCT num AS ConsecutiveNums
FROM cte
WHERE lagging = num
  AND leadin = num
