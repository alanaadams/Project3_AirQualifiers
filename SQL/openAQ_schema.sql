-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Drop tables if they exist
DROP TABLE IF EXISTS countries CASCADE;
DROP TABLE IF EXISTS parameters_cleaned CASCADE;
DROP TABLE IF EXISTS locations_cleaned CASCADE;
DROP TABLE IF EXISTS measurements_flattened CASCADE;

-- Create tables and import data
CREATE TABLE "countries" (
    "id" VARCHAR   NOT NULL,
    "name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_countries" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "parameters_cleaned" (
    "id" INT   NOT NULL,
    "name" VARCHAR   NOT NULL,
    "displayName" VARCHAR   NOT NULL,
    "description" VARCHAR   NOT NULL,
    "preferredUnit" VARCHAR   NOT NULL,
    CONSTRAINT "pk_parameters_cleaned" PRIMARY KEY (
        "name"
     )
);

CREATE TABLE "locations_cleaned" (
    "country" VARCHAR   NOT NULL,
    "coordinates" VARCHAR   NOT NULL,
    "location" VARCHAR   NOT NULL,
    CONSTRAINT "pk_locations_cleaned" PRIMARY KEY (
        "coordinates"
     )
);

CREATE TABLE "measurements_flattened" (
    "parameter" VARCHAR   NOT NULL,
    "value" FLOAT   NOT NULL,
    "lastUpdated" DATE   NOT NULL,
    "unit" VARCHAR   NOT NULL,
    "location" VARCHAR   NOT NULL,
    "country" VARCHAR   NOT NULL,
    "coordinates" VARCHAR   NOT NULL,
    "latitude" VARCHAR   NOT NULL,
    "longitude" VARCHAR   NOT NULL
);

ALTER TABLE "locations_cleaned" ADD CONSTRAINT "fk_locations_cleaned_country" FOREIGN KEY("country")
REFERENCES "countries" ("id");

ALTER TABLE "measurements_flattened" ADD CONSTRAINT "fk_measurements_flattened_parameter" FOREIGN KEY("parameter")
REFERENCES "parameters_cleaned" ("name");

ALTER TABLE "measurements_flattened" ADD CONSTRAINT "fk_measurements_flattened_country" FOREIGN KEY("country")
REFERENCES "countries" ("id");

ALTER TABLE "measurements_flattened" ADD CONSTRAINT "fk_measurements_flattened_coordinates" FOREIGN KEY("coordinates")
REFERENCES "locations_cleaned" ("coordinates");


-- Verify successful data import
SELECT * FROM countries;
SELECT * FROM parameters_cleaned;
SELECT * FROM locations_cleaned;
SELECT * FROM measurements_flattened;

