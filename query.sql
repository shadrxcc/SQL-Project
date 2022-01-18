SELECT population FROM world WHERE name = 'Germany';

SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000;

/*SELECT names*/
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


/* Select from Nobel*/
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

SELECT continent, COUNT(name) FROM world WHERE population >= 10000000 GROUP BY continent;

SELECT continent FROM world GROUP BY continent HAVING SUM(population) > 100000000;

/*JOIN*/
SELECT matchid, player FROM goal WHERE teamid = 'GER';

SELECT id,stadium,team1,team2 FROM game WHERE id = 1012

SELECT player, teamid, stadium, mdate FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER'

SELECT team1, team2, player FROM game JOIN goal ON id = matchid WHERE player LIKE 'Mario%'

SELECT player, teamid, coach, gtime FROM goal JOIN eteam ON id = teamid WHERE gtime <= 10;

SELECT mdate, teamname FROM game JOIN eteam ON (team1=eteam.id) WHERE coach = 'Fernando Santos'

SELECT player FROM goal JOIN game ON id = matchid WHERE stadium = 'National Stadium, Warsaw'

SELECT DISTINCT player FROM game JOIN goal ON matchid = id WHERE (team1='GER' OR team2='GER') AND teamid!='GER';

SELECT teamname, COUNT(matchid) FROM eteam JOIN goal ON id=teamid GROUP BY teamname ORDER BY teamname

SELECT stadium, COUNT(*) FROM game JOIN goal ON (id=matchid) GROUP BY stadium;

SELECT matchid,mdate, COUNT(*) FROM game JOIN goal ON matchid = id WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid, mdate;

SELECT matchid, mdate, COUNT(*) FROM game JOIN goal ON id=matchid WHERE teamid='GER' GROUP BY matchid, mdate

SELECT mdate,team1, SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2 FROM game LEFT JOIN goal ON matchid = id GROUP BY mdate, matchid, team1, team2

/*1962 movies*/

SELECT id, title FROM movie WHERE yr=1962

SELECT yr FROM movie WHERE title = 'Citizen Kane';

SELECT id, title, yr FROM movie WHERE title  LIKE '%Star Trek%' ORDER BY yr;

SELECT id FROM actor WHERE name = 'Glenn Close';

SELECT id FROM movie WHERE title = 'Casablanca';

SELECT name FROM actor JOIN casting ON id = actorid WHERE movieid = 11768;

SELECT name FROM movie, actor, casting WHERE movie.title = 'Alien' AND movie.id = movieid AND actor.id = actorid;

SELECT title FROM movie, actor, casting WHERE name='Harrison Ford' AND movie.id = movieid AND actor.id = actorid;

SELECT title FROM movie, actor, casting WHERE name ='Harrison Ford' AND movie.id = movieid AND actor.id = actorid AND ord!=1;

SELECT title, name FROM movie, actor, casting WHERE yr = 1962 AND movie.id = movieid AND actor.id = actorid AND ord=1;

SELECT yr,COUNT(title) FROM movie JOIN casting ON movie.id=movieid JOIN actor ON actorid=actor.id WHERE name='Rock Hudson' GROUP BY yr HAVING COUNT(title) > 2;

SELECT title, name FROM movie JOIN casting ON movie.id=movieid JOIN actor ON actorid=actor.id WHERE movieid IN (SELECT movieid 
FROM movie, actor, casting WHERE name='Julie Andrews' AND movie.id=movieid AND actor.id=actorid) AND ord=1;

SELECT name FROM casting JOIN actor ON (actor.id = actorid AND casting.ord = 1) JOIN movie ON (movie.id = movieid) GROUP BY name HAVING COUNT(ord) >= 15 ORDER BY name;

SELECT title, COUNT(actorid) FROM casting JOIN actor ON (actor.id = actorid) JOIN movie ON (movie.id = movieid) WHERE yr = 1978 GROUP BY title ORDER BY COUNT(actorid) DESC, title ASC;

SELECT DISTINCT name FROM actor, casting WHERE actor.id = actorid AND movieid IN (SELECT movieid  FROM casting, actor
WHERE actor.id = actorid AND name='Art Garfunkel') AND name!='Art Garfunkel';

/*Using Null*/
SELECT name FROM teacher WHERE dept IS NULL;

SELECT teacher.name, dept.name FROM teacher INNER JOIN dept ON (teacher.dept=dept.id);

SELECT teacher.name, dept.name FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id);

SELECT teacher.name, dept.name FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id);

SELECT name, COALESCE(mobile,'07986 444 2266') FROM teacher;

SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id);

SELECT COUNT(name), COUNT(mobile) FROM teacher;

SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id) GROUP BY dept.name;

SELECT name, 
CASE 
WHEN dept=1 THEN 'Sci'
WHEN dept=2 THEN 'Sci'
ELSE 'Art'
END AS dept
FROM teacher;

SELECT name, 
CASE 
WHEN dept=1 THEN 'Sci'
WHEN dept=2 THEN 'Sci'
ELSE 'None'
END AS dept
FROM teacher;

/*Self Join*/
SELECT COUNT(id) FROM stops;

SELECT id FROM stops WHERE name = 'Craiglockhart'

SELECT id, name FROM stops JOIN route ON (stops.id=route.stop)
WHERE num='4' and company='LRT';

SELECT company, num, COUNT(*) FROM route WHERE stop = 149 OR stop = 53 GROUP BY company, num HAVING COUNT(*) = 2;

SELECT a.company, a.num, a.stop, b.stop FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num) WHERE a.stop = 53 AND b.stop = 149;

SELECT a.company, a.num, stopa.name, stopb.name FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id) WHERE stopa.name='Craiglockhart' AND stopb.name= 'London Road';

SELECT DISTINCT a.company,a.num FROM route a JOIN route b 
ON (a.company = b.company AND a.num = b.num) WHERE a.stop = 115 AND b.stop = 137;

SELECT a.company, a.num FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross';

SELECT DISTINCT stopb.name, a.company, a.num FROM stops stopa, stops stopb, route a, route b WHERE a.company=b.company
AND a.num=b.num AND stopa.id = a.stop AND stopb.id = b.stop
AND stopa.name = 'Craiglockhart';
