-- Verify successful data import
SELECT * FROM countries;
SELECT * FROM parameters_cleaned;
SELECT * FROM locations_cleaned;
SELECT * FROM measurements_flattened;

-- List the parameter, value, unit, country, latitude and longitude of each US location for 5 select parameters (temperature, humidity, pressure, pm10, and pm25)
CREATE VIEW US_measurements AS
SELECT measurements_flattened.country, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.country = 'US'
AND measurements_flattened.parameter = 'temperature'
AND measurements_flattened.parameter = 'humidity'
AND measurements_flattened.parameter = 'pressure'
AND measurements_flattened.parameter = 'pm10'
AND measurements_flattened.parameter = 'pm25';
-- Query the table view created
SELECT *
FROM US_measurements;
-- Drop view
DROP VIEW US_measurements;


-- List the parameter, value, unit, country, latitude and longitude of each Canadian location for 5 select parameters (temperature, humidity, pressure, pm10, and pm25)
CREATE VIEW CA_measurements AS
SELECT measurements_flattened.country, parameters_cleaned.description, measurements_flattened.value, measurements_flattened.unit, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.country = 'CA'
AND measurements_flattened.parameter = 'temperature'
AND measurements_flattened.parameter = 'humidity'
AND measurements_flattened.parameter = 'pressure'
AND measurements_flattened.parameter = 'pm10'
AND measurements_flattened.parameter = 'pm25';
-- Query the table view created
SELECT *
FROM CA_measurements;
-- Drop view
DROP VIEW CA_measurements;


-- List the parameter, value, unit, country, latitude and longitude of each Mexican location for 5 select parameters (temperature, humidity, pressure, pm10, and pm25)
CREATE VIEW MX_measurements AS
SELECT measurements_flattened.country, parameters_cleaned.displayName, measurements_flattened.value, measurements_flattened.unit, salaries.salary, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN parameters_cleaned ON
measurements_flattened.parameter=parameters_cleaned.name
WHERE measurements_flattened.country = 'MX'
AND measurements_flattened.parameter = 'temperature'
AND measurements_flattened.parameter = 'humidity'
AND measurements_flattened.parameter = 'pressure'
AND measurements_flattened.parameter = 'pm10'
AND measurements_flattened.parameter = 'pm25';
-- Query the table view created
SELECT *
FROM MX_measurements;
-- Drop view
DROP VIEW MX_measurements;


--List the latitude and longitude of each US location
CREATE VIEW US_locations AS
SELECT locations_cleaned.name, locations_cleaned.country, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN locations_cleaned ON
locations_cleaned.coordinates=measurements_flattened.coordinates
WHERE measurements_flattened.country = 'US';
-- Query the table view created
SELECT *
FROM US_locations;
-- Drop view
DROP VIEW US_locations;

--List the latitude and longitude of each Canadian location
CREATE VIEW CA_locations AS
SELECT locations_cleaned.name, locations_cleaned.country, measurements_flattened.latitude, measurements_flattened.longitude
FROM measurements_flattened
INNER JOIN locations_cleaned ON
locations_cleaned.coordinates=measurements_flattened.coordinates
WHERE measurements_flattened.country = 'CA';
-- Query the table view created
SELECT *
FROM CA_locations;
-- Drop view
DROP VIEW CA_locations;

