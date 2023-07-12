-- Verify successful data import
SELECT * FROM countries;
SELECT * FROM parameters_cleaned;
SELECT * FROM locations_cleaned;
SELECT * FROM measurements_flattened;

-- Drop view
DROP VIEW US_temperature;
DROP VIEW US_humidity;
DROP VIEW US_pressure;
DROP VIEW US_pm10;
DROP VIEW US_pm25;

DROP VIEW CA_temperature;
DROP VIEW CA_humidity;
DROP VIEW CA_pressure;
DROP VIEW CA_pm10;
DROP VIEW CA_pm25;

DROP VIEW MX_temperature;
DROP VIEW MX_humidity;
DROP VIEW MX_pressure;
DROP VIEW MX_pm10;
DROP VIEW MX_pm25;

DROP VIEW US_locations;
DROP VIEW CA_locations;
DROP VIEW MX_locations;

-- List the relevant data of each US location for 5 select parameters (temperature, humidity, pressure, pm10, and pm25)
CREATE VIEW US_temperature AS
SELECT measurements_flattened.country, measurements_flattened.location, measurements_flattened.parameter, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.parameter = 'temperature'
AND measurements_flattened.country = 'US';
-- Query the table view created
SELECT *
FROM US_temperature;

CREATE VIEW US_humidity AS
SELECT measurements_flattened.country, measurements_flattened.location, measurements_flattened.parameter, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.parameter = 'humidity'
AND measurements_flattened.country = 'US';
-- Query the table view created
SELECT *
FROM US_humidity;

CREATE VIEW US_pressure AS
SELECT measurements_flattened.country, measurements_flattened.location, measurements_flattened.parameter, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.parameter = 'pressure'
AND measurements_flattened.country = 'US';
-- Query the table view created
SELECT *
FROM US_pressure;

CREATE VIEW US_pm10 AS
SELECT measurements_flattened.country, measurements_flattened.location, measurements_flattened.parameter, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.parameter = 'pm10'
AND measurements_flattened.country = 'US';
-- Query the table view created
SELECT *
FROM US_pm10;

CREATE VIEW US_pm25 AS
SELECT measurements_flattened.country, measurements_flattened.location, measurements_flattened.parameter, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.parameter = 'pm25'
AND measurements_flattened.country = 'US';
-- Query the table view created
SELECT *
FROM US_pm25;


-- List the relevant data of each Canadian location for 5 select parameters (temperature, humidity, pressure, pm10, and pm25)
CREATE VIEW CA_temperature AS
SELECT measurements_flattened.country, measurements_flattened.location, measurements_flattened.parameter, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.parameter = 'temperature'
AND measurements_flattened.country = 'CA';
-- Query the table view created
SELECT *
FROM CA_temperature;

CREATE VIEW CA_humidity AS
SELECT measurements_flattened.country, measurements_flattened.location, measurements_flattened.parameter, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.parameter = 'humidity'
AND measurements_flattened.country = 'CA';
-- Query the table view created
SELECT *
FROM CA_humidity;

CREATE VIEW CA_pressure AS
SELECT measurements_flattened.country, measurements_flattened.location, measurements_flattened.parameter, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.parameter = 'pressure'
AND measurements_flattened.country = 'CA';
-- Query the table view created
SELECT *
FROM CA_pressure;

CREATE VIEW CA_pm10 AS
SELECT measurements_flattened.country, measurements_flattened.location, measurements_flattened.parameter, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.parameter = 'pm10'
AND measurements_flattened.country = 'CA';
-- Query the table view created
SELECT *
FROM CA_pm10;

CREATE VIEW CA_pm25 AS
SELECT measurements_flattened.country, measurements_flattened.location, measurements_flattened.parameter, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.parameter = 'pm25'
AND measurements_flattened.country = 'CA';
-- Query the table view created
SELECT *
FROM CA_pm25;

-- List the relevant data of each Mexican location for 5 select parameters (temperature, humidity, pressure, pm10, and pm25)
CREATE VIEW MX_temperature AS
SELECT measurements_flattened.country, measurements_flattened.location, measurements_flattened.parameter, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.parameter = 'temperature'
AND measurements_flattened.country = 'MX';
-- Query the table view created
SELECT *
FROM MX_temperature;

CREATE VIEW MX_humidity AS
SELECT measurements_flattened.country, measurements_flattened.location, measurements_flattened.parameter, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.parameter = 'humidity'
AND measurements_flattened.country = 'MX';
-- Query the table view created
SELECT *
FROM MX_humidity;

CREATE VIEW CA_pressure AS
SELECT measurements_flattened.country, measurements_flattened.location, measurements_flattened.parameter, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.parameter = 'pressure'
AND measurements_flattened.country = 'MX';
-- Query the table view created
SELECT *
FROM MX_pressure;

CREATE VIEW MX_pm10 AS
SELECT measurements_flattened.country, measurements_flattened.location, measurements_flattened.parameter, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.parameter = 'pm10'
AND measurements_flattened.country = 'MX';
-- Query the table view created
SELECT *
FROM MX_pm10;

CREATE VIEW MX_pm25 AS
SELECT measurements_flattened.country, measurements_flattened.location, measurements_flattened.parameter, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.parameter = 'pm25'
AND measurements_flattened.country = 'MX';
-- Query the table view created
SELECT *
FROM MX_pm25;

--List the latitude and longitude of each US location
CREATE VIEW US_locations AS
SELECT locations_cleaned.location, locations_cleaned.country, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN locations_cleaned ON
locations_cleaned.coordinates=measurements_flattened.coordinates
WHERE measurements_flattened.country = 'US';
-- Query the table view created
SELECT *
FROM US_locations;


--List the latitude and longitude of each Canadian location
CREATE VIEW CA_locations AS
SELECT locations_cleaned.location, locations_cleaned.country, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN locations_cleaned ON
locations_cleaned.coordinates=measurements_flattened.coordinates
WHERE measurements_flattened.country = 'CA';
-- Query the table view created
SELECT *
FROM CA_locations;


--List the latitude and longitude of each Mexican location
CREATE VIEW MX_locations AS
SELECT locations_cleaned.location, locations_cleaned.country, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN locations_cleaned ON
locations_cleaned.coordinates=measurements_flattened.coordinates
WHERE measurements_flattened.country = 'MX';
-- Query the table view created
SELECT *
FROM MX_locations;
