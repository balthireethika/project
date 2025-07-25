USE covid19_db;

#Total confirmed, deaths, recovered by WHO region
SELECT 
    who_region,
    SUM(confirmed) AS total_confirmed,
    SUM(deaths) AS total_deaths,
    SUM(recovered) AS total_recovered
FROM covid_country_latest
GROUP BY who_region
ORDER BY total_confirmed DESC;

#Average new cases by WHO region

SELECT 
    who_region,
    AVG(new_cases) AS avg_new_cases
FROM covid_country_latest
GROUP BY who_region
ORDER BY avg_new_cases DESC;

#Maximum weekly increase by region
SELECT 
    who_region,
    MAX(one_week_percent_increase) AS max_weekly_increase
FROM covid_country_latest
GROUP BY who_region
ORDER BY max_weekly_increase DESC;

#WINDOW EXAMPLE

# Rank countries by confirmed cases
SELECT 
    country_region,
    confirmed,
    RANK() OVER (ORDER BY confirmed DESC) AS confirmed_rank
FROM covid_country_latest
ORDER BY confirmed_rank;

