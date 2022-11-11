-- https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/

-- 1. Using Subquery

SELECT customer_number
FROM   (
                SELECT   customer_number,
                         Count(order_number)
                FROM     orders
                GROUP BY customer_number
                ORDER BY Count(order_number) ) a limit 1;

-- 2. Using CTE

WITH cte AS
(
         SELECT   customer_number,
                  Count(order_number)
         FROM     orders
         GROUP BY customer_number
         ORDER BY Count(order_number) DESC)
         
SELECT customer_number
FROM   cte limit 1;
