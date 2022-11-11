-- https://leetcode.com/problems/duplicate-emails/

 WITH cte AS
  (SELECT email,
          count(email) AS ct
   FROM person
   GROUP BY email)
SELECT email
FROM cte
WHERE ct >1
