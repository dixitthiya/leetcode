-- https://leetcode.com/problems/department-highest-salary/submissions/

 WITH cte AS
  (SELECT departmentId,
          d.name,
          max(salary) AS max_sal
   FROM employee e
   INNER JOIN department d ON d.id = e.departmentId
   GROUP BY e.departmentId)
   
SELECT c.name AS Department,
       e.name AS Employee,
       e.salary AS Salary
FROM employee e
INNER JOIN cte c ON e.departmentId = c.departmentid
AND e.salary = c.max_sal
