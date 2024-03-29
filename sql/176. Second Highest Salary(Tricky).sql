-- https://leetcode.com/problems/second-highest-salary/

-- Table: Employee
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- id is the primary key column for this table.
-- Each row of this table contains information about the salary of an employee.
-- Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.
-- The query result format is in the following example.
-- Example 1:
-- Input: 
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- Output: 
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | 200                 |
-- +---------------------+
-- Example 2:
-- Input: 
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- +----+--------+
-- Output: 
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | null                |
-- +---------------------+

-- 1. Using Aggregation

SELECT Max(salary) AS SecondHighestSalary
FROM   employee
WHERE  salary NOT IN(SELECT Max(salary)
                     FROM   employee);

-- 2. Using Subquery

SELECT (SELECT DISTINCT salary
        FROM   employee
        ORDER  BY salary DESC                 -- If you don't use subquery and there is no second highest value then the result will be blank, if you
        LIMIT  1, 1 ) AS SecondHighestSalary; -- want null in return then put it in the subquery.
