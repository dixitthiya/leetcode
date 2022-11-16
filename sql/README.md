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
         1. When we aggregate a column and filter it and the filter returns 0 rows then the find output will return one row with `null` value. The xample is given below.
``` sql
SELECT Max(salary) AS SecondHighestSalary
FROM   employee
WHERE  salary NOT IN(SELECT Max(salary)
                     FROM   employee);
```
