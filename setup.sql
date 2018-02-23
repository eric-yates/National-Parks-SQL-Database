-- Database: parks_db

-- DROP DATABASE parks_db;

CREATE DATABASE parks_db
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE TABLE parks(
park_id serial PRIMARY KEY,
y VARCHAR(50) NOT NULL,
x VARCHAR(50) NOT NULL,
park_name VARCHAR(255) UNIQUE NOT NULL,
state_abbr CHAR(2) NOT NULL,
park_type VARCHAR(255) NOT NULL,
visited SMALLINT);

CREATE TABLE states(
state_id serial PRIMARY KEY,
state_name VARCHAR(20) UNIQUE NOT NULL,
state_abbr CHAR(2) UNIQUE NOT NULL);

CREATE TABLE trails(
trail_id serial PRIMARY KEY,
park_id SMALLINT REFERENCES parks(park_id),
trail_name VARCHAR(100) NOT NULL,
distance FLOAT8,
elevation FLOAT8,
duration TIMESTAMP,
rating SMALLINT,
visited SMALLINT);

CREATE TABLE forests(
forest_id serial PRIMARY KEY,
forest_name VARCHAR(255) UNIQUE NOT NULL,
state_name VARCHAR(100) NOT NULL,
location VARCHAR(100) UNIQUE NOT NULL,
formation DATE,
area VARCHAR(255),
description VARCHAR(1000),
visited SMALLINT);

COPY parks(x, y, park_name, state_abbr, park_type)
FROM '/tmp/national_parks.csv'
WITH CSV HEADER DELIMITER AS ',';

COPY states(state_name, state_abbr) FROM '/tmp/states.csv'
WITH CSV HEADER DELIMITER AS ',';

INSERT INTO states(state_name, state_abbr)
VALUES
('Mariana Islands', 'MP'),
('Puerto Rico', 'PR'),
('Virgin Islands', 'VI'),
('Guam', 'GU'),
('American Samoa', 'AS');

COPY forests(forest_id, forest_name, state_name, location, formation, area, description)
FROM '/tmp/national_forests_cleaned.csv'
WITH CSV HEADER DELIMITER AS ',';

INSERT INTO parks
(x, y, park_name, state_abbr, park_type, visited)
(SELECT split_part(A.location, ' ', 1) AS x, split_part(A.location, ' ', 2) AS y,
A.forest_name park_name, B.state_abbr, 'National Forest' park_type, A.visited
FROM forests A
INNER JOIN states B ON A.state_name = B.state_name);

DROP TABLE forests;
