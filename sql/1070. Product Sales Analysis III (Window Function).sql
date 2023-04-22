-- https://leetcode.com/problems/product-sales-analysis-iii/description/

-- Table: Sales

-- +-------------+-------+
-- | Column Name | Type  |
-- +-------------+-------+
-- | sale_id     | int   |
-- | product_id  | int   |
-- | year        | int   |
-- | quantity    | int   |
-- | price       | int   |
-- +-------------+-------+
-- (sale_id, year) is the primary key of this table.
-- product_id is a foreign key to Product table.
-- Each row of this table shows a sale on the product product_id in a certain year.
-- Note that the price is per unit.
 

-- Table: Product

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- +--------------+---------+
-- product_id is the primary key of this table.
-- Each row of this table indicates the product name of each product.
 

-- Write an SQL query that selects the product id, year, quantity, and price for the first year of every product sold.

-- Return the resulting table in any order.

-- The query result format is in the following example.

 

-- Example 1:

-- Input: 
-- Sales table:
-- +---------+------------+------+----------+-------+
-- | sale_id | product_id | year | quantity | price |
-- +---------+------------+------+----------+-------+ 
-- | 1       | 100        | 2008 | 10       | 5000  |
-- | 2       | 100        | 2009 | 12       | 5000  |
-- | 7       | 200        | 2011 | 15       | 9000  |
-- +---------+------------+------+----------+-------+
-- Product table:
-- +------------+--------------+
-- | product_id | product_name |
-- +------------+--------------+
-- | 100        | Nokia        |
-- | 200        | Apple        |
-- | 300        | Samsung      |
-- +------------+--------------+
-- Output: 
-- +------------+------------+----------+-------+
-- | product_id | first_year | quantity | price |
-- +------------+------------+----------+-------+ 
-- | 100        | 2008       | 10       | 5000  |
-- | 200        | 2011       | 15       | 9000  |
-- +------------+------------+----------+-------+

-- 1. Using Multiple Joins
SELECT p.product_id,
       s.year AS first_year,
       s.quantity,
       s.price
FROM   product p
       JOIN sales s
         ON p.product_id = s.product_id
       JOIN (SELECT p1.product_id,
                    Min(year) AS year
             FROM   product p1
                    JOIN sales s1
                      ON p1.product_id = s1.product_id
             GROUP  BY product_id) a
         ON a.product_id = p.product_id
            AND a.year = s.year
WHERE  a.product_id IS NOT NULL
GROUP  BY p.product_id,
          s.quantity,
          price

-- 2. Using Window Function(Fastest run time)
SELECT product_id,
       year AS first_year,
       quantity,
       price
FROM   (SELECT p.product_id       AS product_id,
               year,
               quantity,
               price,
               Rank()
                 OVER(
                   partition BY p.product_id
                   ORDER BY year) AS rnk
        FROM   product p
               JOIN sales s
                 ON p.product_id = s.product_id) a
WHERE  rnk = 1 
