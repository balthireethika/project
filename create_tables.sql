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