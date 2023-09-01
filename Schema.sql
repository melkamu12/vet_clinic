CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(5, 2)
)
ALTER TABLE animals ADD COLUMN species VARCHAR(150);

CREATE TABLE owners (
	id SERIAL PRIMARY KEY,
	full_name VARCHAR(100),
	age INT
);	
CREATE TABLE species (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);

ALTER TABLE animals
    DROP COLUMN species,
    ADD COLUMN species_id INT,
    ADD COLUMN owner_id INT;