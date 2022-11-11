--https://leetcode.com/problems/combine-two-tables/

SELECT firstname,
       lastname,
       city,
       state
FROM Person p
LEFT JOIN address a ON p.personid = a.personid
