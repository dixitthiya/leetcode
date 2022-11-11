-- https://leetcode.com/problems/rising-temperature/

SELECT w1.id
FROM weather w1
INNER JOIN weather w2 ON w1.recorddate = DATE_SUB(w2.recorddate, INTERVAL -1 DAY)
WHERE w1.temperature > w2.temperature
