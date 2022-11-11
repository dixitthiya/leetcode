# https://leetcode.com/problems/customers-who-never-order/?envType=study-plan&id=sql-i

SELECT name AS Customers
FROM Customers
WHERE id not in
    (SELECT customerid
     FROM orders)
