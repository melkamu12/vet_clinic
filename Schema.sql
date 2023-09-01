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

ALTER TABLE animals
    ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id),
    ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owners(id);

-- Vets table
CREATE TABLE vets(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	age INT NOT NULL,
	date_of_graduation DATE NOT NULL
);
-- Vets-Species join table
CREATE TABLE specializations(
	species_id INT,
	vets_id INT,
	CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id),
	CONSTRAINT fk_vets FOREIGN KEY (vets_id) REFERENCES vets(id),
	PRIMARY KEY (species_id, vets_id)
);
-- Animals-vets join table
CREATE TABLE visits(
	id SERIAL PRIMARY KEY,
    animal_id INTEGER REFERENCES animals(id),
    vet_id INTEGER REFERENCES vets(id),
    date_of_visit DATE
);