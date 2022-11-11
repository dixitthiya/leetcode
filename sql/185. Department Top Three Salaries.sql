-- https://leetcode.com/problems/department-top-three-salaries/

WITH cte AS
  (SELECT id,
          name,
          salary,
          departmentid,
          DENSE_RANK() over(PARTITION BY departmentid
                            ORDER BY salary DESC) AS rnk
   FROM employee)

SELECT d.name AS Department,
       e.name AS Employee,
       e.salary AS Salary
FROM cte e
INNER JOIN department d ON e.departmentid = d.id
WHERE rnk <= 3
