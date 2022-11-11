-- https://leetcode.com/problems/human-traffic-of-stadium/

-- 1. Using Subquery and CTEs

WITH cte1 
     AS (SELECT id,
                visit_date,
                people,
                Row_number()
                  OVER(
                    ORDER BY id)      AS rownum,
                id - Row_number()
                       OVER(
                         ORDER BY id) AS grpnum
         FROM   stadium
         WHERE  people >= 100)
         
SELECT id,
       visit_date,
       people
FROM   cte1
WHERE  grpnum IN (SELECT grpnum
                  FROM   cte1
                  GROUP  BY grpnum
                  HAVING Count(id) >= 3);
                  
-- 2. Using Join and CTEs

WITH cte1
     AS (SELECT id,
                visit_date,
                people,
                Row_number()
                  OVER(
                    ORDER BY id)      AS rownum,
                id - Row_number()
                       OVER(
                         ORDER BY id) AS grpnum
         FROM   stadium
         WHERE  people >= 100),
     cte2
     AS (SELECT grpnum,
                Count(id) AS cnt
         FROM   cte1
         GROUP  BY grpnum)
         
SELECT id,
       visit_date,
       people
FROM   cte1 c1
       INNER JOIN cte2 c2
               ON c1.grpnum = c2.grpnum
                  AND c2.cnt >= 3; 
