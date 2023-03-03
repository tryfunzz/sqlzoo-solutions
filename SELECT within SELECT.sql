/*
Fourth section of sqlzoo, SELECT in SELECT
*/

--#1
/*
List each country name where the population is larger than that of 'Russia'.
world(name, continent, area, population, gdp)
*/
SELECT name 
FROM world
WHERE population >
     (SELECT population FROM world WHERE name='Russia')
     
--#2
/*
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
*/
SELECT name 
FROM world
WHERE continent = 'Europe ' AND GDP/population > 
      (SELECT GDP/population FROM world WHERE name='United Kingdom')
      
--#3
/*
List the name and continent of countries in the continents containing either Argentina or Australia. 
Order by name of the country.
*/
SELECT name,continent  
FROM world
WHERE continent = 'South America 'OR continent = 'Oceania'
ORDER BY name

--#4
/*
Which country has a population that is more than United Kingom but less than Germany? 
Show the name and the population.
*/
SELECT name,population
FROM world
WHERE population > 
     (SELECT population FROM world WHERE name = ' United Kingom') 
 AND population < 
     (SELECT population FROM world WHERE name = ' Germany ')
     
--#5
/*
Germany (population 80 million) has the largest population of the countries in Europe.
Austria (population 8.5 million) has 11% of the population of Germany.
Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
*/
SELECT name, CONCAT(CAST(100*ROUND((population / (SELECT population 
                                                  FROM world WHERE name ='Germany')), 2) AS INT), '%')
FROM world
WHERE continent = 'Europe'
     
