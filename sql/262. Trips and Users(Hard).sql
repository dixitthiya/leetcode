-- https://leetcode.com/problems/trips-and-users/

-- 1. Using Only Joins (Fastest)

SELECT t.request_at AS Day,
       Round(Sum(CASE
                   WHEN t.status != 'completed' THEN 1
                   ELSE 0
                 END) / Count(*), 2) AS 'Cancellation Rate'
FROM   trips t
       INNER JOIN users dr
               ON t.driver_id = dr.users_id
       INNER JOIN users cl
               ON t.client_id = cl.users_id
WHERE  dr.banned = 'No'
       AND cl.banned = 'No'
       AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP  BY t.request_at; 


-- 2. Using CTE (Second Fastest)

WITH cte1
     AS (SELECT request_at,
                Count(*) cnt1
         FROM   trips t
                INNER JOIN users dr
                        ON t.driver_id = dr.users_id
                INNER JOIN users cl
                        ON t.client_id = cl.users_id
         WHERE  request_at >= '2013-10-01 '
                AND request_at <= '2013-10-03'
                AND dr.banned = 'No'
                AND cl.banned = 'No'
         GROUP  BY request_at),
         
     cte2
     AS (SELECT t.request_at,
                COALESCE(Count(t.id), 0) AS cnt2
         FROM   trips t
                INNER JOIN users dr
                        ON t.driver_id = dr.users_id
                INNER JOIN users cl
                        ON t.client_id = cl.users_id
         WHERE  status IN ( 'cancelled_by_driver', 'cancelled_by_client' )
                AND dr.banned = 'No'
                AND cl.banned = 'No'
                AND t.request_at >= '2013-10-01 '
                AND t.request_at <= '2013-10-03'
         GROUP  BY t.request_at)
         
SELECT cte1.request_at                    AS Day,
       Round(COALESCE(cnt2 / cnt1, 0), 2) AS 'Cancellation Rate'
FROM   cte1
       LEFT JOIN cte2
              ON cte1.request_at = cte2.request_at 


-- 3. Using Subqueries (Slowest - Not Recommended)

SELECT t.request_at AS Day,
       Round(Sum(CASE
                   WHEN t.status != 'completed' THEN 1
                   ELSE 0
                 END) / Count(*), 2) AS 'Cancellation Rate'
FROM   trips t
WHERE  t.client_id IN (SELECT users_id
                       FROM   users
                       WHERE  banned = 'No')
       AND t.driver_id IN (SELECT users_id
                           FROM   users
                           WHERE  banned = 'No')
       AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP  BY t.request_at; 
