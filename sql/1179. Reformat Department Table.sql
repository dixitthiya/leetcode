--https://leetcode.com/problems/reformat-department-table/description/

-- Table: Department

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | revenue     | int     |
-- | month       | varchar |
-- +-------------+---------+
-- (id, month) is the primary key of this table.
-- The table has information about the revenue of each department per month.
-- The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].
 

-- Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.

-- Return the result table in any order.

-- The query result format is in the following example.

 

-- Example 1:

-- Input: 
-- Department table:
-- +------+---------+-------+
-- | id   | revenue | month |
-- +------+---------+-------+
-- | 1    | 8000    | Jan   |
-- | 2    | 9000    | Jan   |
-- | 3    | 10000   | Feb   |
-- | 1    | 7000    | Feb   |
-- | 1    | 6000    | Mar   |
-- +------+---------+-------+
-- Output: 
-- +------+-------------+-------------+-------------+-----+-------------+
-- | id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
-- +------+-------------+-------------+-------------+-----+-------------+
-- | 1    | 8000        | 7000        | 6000        | ... | null        |
-- | 2    | 9000        | null        | null        | ... | null        |
-- | 3    | null        | 10000       | null        | ... | null        |
-- +------+-------------+-------------+-------------+-----+-------------+
-- Explanation: The revenue from Apr to Dec is null.
-- Note that the result table has 13 columns (1 for the department id + 12 for the months).


SELECT id,
       Sum(CASE
             WHEN month = 'Jan' THEN revenue
             ELSE NULL
           END) AS Jan_Revenue,
       Sum(CASE
             WHEN month = 'Feb' THEN revenue
             ELSE NULL
           END) AS Feb_Revenue,
       Sum(CASE
             WHEN month = 'Mar' THEN revenue
             ELSE NULL
           END) AS Mar_Revenue,
       Sum(CASE
             WHEN month = 'Apr' THEN revenue
             ELSE NULL
           END) AS Apr_Revenue,
       Sum(CASE
             WHEN month = 'May' THEN revenue
             ELSE NULL
           END) AS May_Revenue,
       Sum(CASE
             WHEN month = 'Jun' THEN revenue
             ELSE NULL
           END) AS Jun_Revenue,
       Sum(CASE
             WHEN month = 'Jul' THEN revenue
             ELSE NULL
           END) AS Jul_Revenue,
       Sum(CASE
             WHEN month = 'Aug' THEN revenue
             ELSE NULL
           END) AS Aug_Revenue,
       Sum(CASE
             WHEN month = 'Sep' THEN revenue
             ELSE NULL
           END) AS Sep_Revenue,
       Sum(CASE
             WHEN month = 'Oct' THEN revenue
             ELSE NULL
           END) AS Oct_Revenue,
       Sum(CASE
             WHEN month = 'Nov' THEN revenue
             ELSE NULL
           END) AS Nov_Revenue,
       Sum(CASE
             WHEN month = 'Dec' THEN revenue
             ELSE NULL
           END) AS Dec_Revenue
FROM   department
GROUP  BY id
ORDER  BY id 
