# https://leetcode.com/problems/employees-earning-more-than-their-managers/submissions/

SELECT e1.name AS employee
FROM employee e1
INNER JOIN employee e2 ON e1.managerid = e2.id
AND e1.salary > e2.salary
