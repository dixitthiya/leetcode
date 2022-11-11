-- https://leetcode.com/problems/trips-and-users/

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
