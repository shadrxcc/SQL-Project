SELECT population FROM world WHERE name = 'Germany';

SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000;

SELECT name FROM world WHERE name LIKE 'Y%';