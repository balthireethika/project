CREATE DATABASE IF NOT EXISTS covid19_db;
USE covid19_db;

CREATE TABLE IF NOT EXISTS covid_country_latest (
    country_region VARCHAR(100) PRIMARY KEY,
    confirmed INT,
    deaths INT,
    recovered INT,
    actives INT,
    new_cases INT,
    new_deaths INT,
    new_recovered INT,
    deaths_per_100_cases FLOAT,
    recovered_per_100_cases FLOAT,
    deaths_per_100_recovered FLOAT,
    confirmed_last_week INT,
    one_week_change INT,
    one_week_percent_increase FLOAT,
    who_region VARCHAR(100)
);

SELECT COUNT(*) FROM covid_country_latest;

SELECT 'Afghanistan' NOT IN (SELECT country_region FROM covid_country_latest) AS missing_Afghanistan;

DESCRIBE covid_country_latest;
SELECT * FROM  covid_country_latest LIMIT 10;

SELECT 
    SUM(CASE WHEN Confirmed IS NULL THEN 1 ELSE 0 END) AS null_confirmed,
    SUM(CASE WHEN Deaths IS NULL THEN 1 ELSE 0 END) AS null_deaths,
    SUM(CASE WHEN Recovered IS NULL THEN 1 ELSE 0 END) AS null_recovered
FROM covid_country_latest;

SELECT 
    SUM(country_region IS NULL) AS null_country_region,
    SUM(confirmed IS NULL) AS null_confirmed,
    SUM(deaths IS NULL) AS null_deaths,
    SUM(recovered IS NULL) AS null_recovered,
    SUM(actives IS NULL) AS null_actives,
    SUM(new_cases IS NULL) AS null_new_cases,
    SUM(new_deaths IS NULL) AS null_new_deaths,
    SUM(new_recovered IS NULL) AS null_new_recovered,
    SUM(deaths_per_100_cases IS NULL) AS null_deaths_per_100_cases,
    SUM(recovered_per_100_cases IS NULL) AS null_recovered_per_100_cases,
    SUM(deaths_per_100_recovered IS NULL) AS null_deaths_per_100_recovered,
    SUM(confirmed_last_week IS NULL) AS null_confirmed_last_week,
    SUM(one_week_change IS NULL) AS null_one_week_change,
    SUM(one_week_percent_increase IS NULL) AS null_one_week_percent_increase,
    SUM(who_region IS NULL) AS null_who_region
FROM covid_country_latest;

/*UPDATE country_covid
SET Confirmed = 0
WHERE Confirmed IS NULL;*/

SELECT country_region, COUNT(*) 
FROM covid_country_latest
GROUP BY country_region
HAVING COUNT(*) > 1;

/*DELETE FROM country_covid
WHERE id NOT IN (
    SELECT MIN(id)
    FROM country_covid
    GROUP BY Country
);*/

SET SQL_SAFE_UPDATES = 0;

UPDATE covid_country_latest
SET country_region = LOWER(TRIM(country_region));


SET SQL_SAFE_UPDATES = 0;

UPDATE covid_country_latest
SET who_region = LOWER(TRIM(who_region));

SET SQL_SAFE_UPDATES = 1;






