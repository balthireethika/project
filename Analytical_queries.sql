USE covid19_db;

#Top 10 countries by confirmed cases
SELECT country_region, confirmed
FROM covid_country_latest
ORDER BY confirmed DESC
LIMIT 10;

#Top 10 countries by deaths
SELECT country_region, deaths
FROM covid_country_latest
ORDER BY deaths DESC
LIMIT 10;

#Top 10 countries by recovery rate
SELECT country_region,
       recovered_per_100_cases AS recovery_rate
FROM covid_country_latest
ORDER BY recovery_rate DESC
LIMIT 10;

#Region-wise summary (WHO Region)
SELECT who_region,
       SUM(confirmed) AS total_confirmed,
       SUM(deaths) AS total_deaths,
       SUM(recovered) AS total_recovered
FROM covid_country_latest
GROUP BY who_region
ORDER BY total_confirmed DESC;

#Countries with highest weekly increase

SELECT country_region,
       one_week_change,
       one_week_percent_increase
FROM covid_country_latest
ORDER BY one_week_percent_increase DESC
LIMIT 10;

# Daily new cases — top 10 countries
SELECT country_region,
       new_cases
FROM covid_country_latest
ORDER BY new_cases DESC
LIMIT 10;

#Deaths per 100 recovered — highest
SELECT country_region,
       deaths_per_100_recovered
FROM covid_country_latest
ORDER BY deaths_per_100_recovered DESC
LIMIT 10;


#Rank countries within each region by confirmed cases:
SELECT country_region,
       who_region,
       confirmed,
       RANK() OVER (PARTITION BY who_region ORDER BY confirmed DESC) AS rank_in_region
FROM covid_country_latest;

