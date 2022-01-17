SELECT population FROM world WHERE name = 'Germany';

SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000;


/*query to find the country that starts with Y*/
SELECT name FROM world WHERE name LIKE 'Y%';

/*Find the countries that end with y*/
SELECT name FROM world WHERE name LIKE '%Y';

SELECT name FROM world WHERE name LIKE '%X%';

SELECT name FROM world WHERE name LIKE '%land'

SELECT name FROM world WHERE name LIKE 'c%' AND name LIKE '%ia'

SELECT name FROM world WHERE name LIKE '%oo%'

SELECT name FROM world WHERE name LIKE '%a%a%a%'


SELECT name FROM world WHERE name LIKE '_t%' ORDER BY name

SELECT name FROM world WHERE name LIKE '%o__o%'


SELECT name FROM world WHERE LENGTH(name) = 4

SELECT name FROM world WHERE name = capital

SELECT name FROM world WHERE capital LIKE '%city'

SELECT capital, name FROM world WHERE capital LIKE concat('%', name, '%')

SELECT capital, name FROM world WHERE capital LIKE concat('%', name, '%') AND LENGTH(capital) > LENGTH(name)

SELECT name, REPLACE(capital, name, '') FROM world WHERE capital LIKE concat('%', name, '%')  AND LENGTH(capital) > LENGTH(name)

SELECT yr, subject, winner FROM nobel WHERE yr = 1950

SELECT winner FROM nobel WHERE yr = 1962 AND subject = 'Literature'

SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein'

SELECT winner FROM nobel WHERE subject = 'Peace' AND yr >= 2000
   
SELECT * FROM nobel WHERE subject = 'Literature' AND yr >= 1980 AND yr <= 1989
   
SELECT * FROM nobel WHERE winner IN ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter', 'Barack Obama')
                  
SELECT winner FROM nobel WHERE winner LIKE 'John%'

SELECT yr, subject, winner FROM nobel WHERE subject = 'Chemistry' AND yr = 1984
UNION
SELECT yr, subject, winner FROM nobel WHERE subject = 'Physics' AND yr = 1980

SELECT yr, subject, winner FROM nobel WHERE subject not IN ('Chemistry', 'Medicine') AND yr = 1980

SELECT * FROM nobel WHERE subject = 'Literature' AND yr >= 2004
UNION
SELECT * FROM nobel WHERE subject = 'Medicine' AND yr < 1910

SELECT * FROM nobel where winner = 'PETER GRÜNBERG'

SELECT * FROM nobel where winner = 'Eugene O''Neill'

SELECT winner, yr, subject  FROM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC

SELECT winner, subject FROM nobel WHERE yr=1984 ORDER BY subject IN ('Physics','Chemistry'), subject, winner