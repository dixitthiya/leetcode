# SQL Questions
- In this folder you'll find all the questions related to sql
- They are solved using MySQL query language in most of the cases
- The number denotes the number as per leetcode. It is the question number on [leetcode](https://leetcode.com/problemset/all/).

# Regexp Notes (Mysql) - [reference](https://www.geeksforgeeks.org/mysql-regular-expressions-regexp/)
1. Find names of city that starts vowels - a,e,i,o,u
```
SELECT *
FROM countries
WHERE city regexp '^[aeiou]'
```
2. Find names of city that does not start with vowels - a,e,i,o,u
```
SELECT *
FROM countries
WHERE city regexp '^[^aeiou]'
```

# Solutions Explained
   1. [176. Second Highest Salary](https://github.com/dixitthiya/leetcode/blob/main/sql/176.%20Second%20Highest%20Salary(Tricky).sql)
      - So I was not aware of two thing which I learned out of this question those are given below:
         1. When we aggregate a column in a subquery and use the subquery as a filter, if subquery returns 0 rows then the final output of the whole query will return one row with `null` value. The example is given below.
``` sql
SELECT Max(salary) AS SecondHighestSalary
FROM   employee
WHERE  salary NOT IN(SELECT Max(salary)
                     FROM   employee);
```
   2. [1158. Market Analysis I](https://github.com/dixitthiya/leetcode/blob/main/sql/1158.%20Market%20Analysis%20I%20(Logical).sql)
      - In this question if you use `WHERE` instead of `AND` then the final output will cut the rows which doesn't satisfy the filter. Now if you want to aggregate a column such as count and you want to show count = 0 in the output then don't use `WHERE` instead use `AND` in the join function. That will show all the values and show count = 0 where the filter is not satisfied.
``` sql
SELECT
  u.user_id AS buyer_id,
  u.join_date,
  COUNT(o.order_id) AS orders_in_2019
FROM users u
LEFT JOIN orders o
  ON u.user_id = o.buyer_id
  AND YEAR(o.order_date) = 2019 -- if you use WHERE here instead of AND then the output will avoid rows with year 2019 date so using and is helpful here.
GROUP BY u.user_id;
```
