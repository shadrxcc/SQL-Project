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

/* Select from select section*/
SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name='Russia')

SELECT name FROM world WHERE continent = 'Europe' AND  gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom')

SELECT name, continent FROM world WHERE continent IN (SELECT continent FROM world WHERE name = 'Argentina' OR name = 'Australia') ORDER BY name

SELECT name, population FROM world WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND population < (SELECT population FROM world WHERE name = 'Poland')

SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name='Germany')*100, 0),'%') FROM world WHERE continent='Europe'

SELECT name FROM world WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent = 'Europe')

SELECT continent, name, area FROM world x WHERE area >= ALL (SELECT area FROM world y WHERE y.continent=x.continent AND area > 0)

SELECT continent, name FROM world x WHERE name <= ALL (SELECT name FROM world y WHERE x.continent=y.continent);

SELECT name, continent, population FROM world x WHERE 25000000 >= ALL(SELECT population FROM world y WHERE x.continent=y.continent)

SELECT name, continent FROM world x WHERE population >= ALL(SELECT population * 3 FROM world y WHERE y.continent = x.continent AND y.name != x.name)

/*SUM and COUNT*/

SELECT SUM(population) FROM world;

SELECT DISTINCT continent FROM world;

SELECT SUM(gdp) FROM world WHERE continent = 'Africa';

SELECT COUNT(*) FROM world WHERE area >= 1000000;

SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

SELECT continent, COUNT(name) FROM world GROUP BY continent;

