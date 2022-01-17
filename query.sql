SELECT population FROM world WHERE name = 'Germany';

SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000;


/*query to find the country that starts with Y*/
SELECT name FROM world WHERE name LIKE 'Y%';

SELECT name FROM world WHERE name LIKE '%Y';

SELECT name FROM world WHERE name LIKE '%X%';



SELECT name FROM world
  WHERE name LIKE 'c%' AND name LIKE '%ia'

  SELECT name FROM world
  WHERE name LIKE '%oo%'




  SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

SELECT name FROM world
 WHERE name LIKE '%o__o%'


SELECT name FROM world
 WHERE LENGTH(name) = 4