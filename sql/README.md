# SQL Questions
- In this folder you'll find all the questions related to sql
- They are solved using MySQL query language in most of the cases

# Regexp Notes (Mysql) [Reference](https://www.geeksforgeeks.org/mysql-regular-expressions-regexp/)
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
