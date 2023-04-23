--https://leetcode.com/problems/product-price-at-a-given-date/description/

-- Table: Products

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+
-- (product_id, change_date) is the primary key of this table.
-- Each row of this table indicates that the price of some product was changed to a new price at some date.
 

-- Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

-- Return the result table in any order.

-- The query result format is in the following example.

 

-- Example 1:

-- Input: 
-- Products table:
-- +------------+-----------+-------------+
-- | product_id | new_price | change_date |
-- +------------+-----------+-------------+
-- | 1          | 20        | 2019-08-14  |
-- | 2          | 50        | 2019-08-14  |
-- | 1          | 30        | 2019-08-15  |
-- | 1          | 35        | 2019-08-16  |
-- | 2          | 65        | 2019-08-17  |
-- | 3          | 20        | 2019-08-18  |
-- +------------+-----------+-------------+
-- Output: 
-- +------------+-------+
-- | product_id | price |
-- +------------+-------+
-- | 2          | 50    |
-- | 1          | 35    |
-- | 3          | 10    |
-- +------------+-------+


-- 1. Using Union and Subquery 838,697,912,1311,1383
SELECT product_id,
       new_price AS price
FROM  (SELECT p.*,
              Max(change_date)
                OVER (
                  partition BY product_id) AS maxdate
       FROM   products p
       WHERE  change_date <= '2019-08-16') a
WHERE  change_date = maxdate
UNION
SELECT product_id,
       10 AS price
FROM   products
GROUP  BY product_id
HAVING Min(change_date) > '2019-08-16' 

-- 2. Using Join and Subquery/CTE (This query runs faster than above)

WITH cte
     AS (SELECT *,
                Rank()
                  OVER(
                    partition BY product_id
                    ORDER BY change_date DESC) AS change_rnk
         FROM   products
         WHERE  change_date <= Date('2019-08-16'))
SELECT DISTINCT p.product_id,
                CASE
                  WHEN a.new_price IS NULL THEN 10
                  ELSE a.new_price
                END AS price
FROM   products p
       LEFT JOIN cte AS a
              ON p.product_id = a.product_id
                 AND change_rnk = 1 
