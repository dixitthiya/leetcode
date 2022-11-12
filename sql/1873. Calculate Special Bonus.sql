-- https://leetcode.com/problems/calculate-special-bonus/

-- 1. Using LIKE

SELECT employee_id,
       CASE
         WHEN MOD(employee_id, 2) <> 0
              AND name NOT LIKE 'M%' THEN salary
         ELSE 0
       end AS bonus
FROM   employees
ORDER  BY employee_id;

-- 2. Using Regexp

SELECT employee_id,
       CASE
         WHEN MOD(employee_id, 2) <> 0
              AND name REGEXP '^[^M]' THEN salary
         ELSE 0
       end AS bonus
FROM   employees
ORDER  BY employee_id; 
