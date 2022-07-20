/* Create database named vet_clinic*/
 CREATE DATABASE vet_clinic;

 /* Accessing vet_clinic database */
  \c vet_clinic;
 
 /* Create animals table with 6 columns */
 CREATE TABLE animals(
    id int, 
    name varchar(20),
    date_of_birth date,
    escape_attemps int, 
    neutered bool, 
    weight_kg decimal
    );

 -- Add a column species of type string to your animals table
  ALTER TABLE animals
  ADD COLUMN species varchar(20)

-- Create a table named owners with id, full_name, age.
CREATE TABLE owners(
 id INT GENERATED ALWAYS AS IDENTITY,
 full_name VARCHAR(100),
 age INT,
 PRIMARY KEY(id)
);

-- Create a table named species with id, name 
CREATE TABLE species(
 id INT GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(80),
 PRIMARY KEY(id)
);

/* Modify animals table:
Make sure that id is set as autoincremented PRIMARY KEY
Remove column species
Add column species_id which is a foreign key referencing species table
Add column owner_id which is a foreign key referencing the owners table
 */

 ALTER TABLE animals ADD PRIMARY KEY(id)

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT
 REFERENCES species(id)
 ON DELETE CASCADE;
 
ALTER TABLE animals ADD COLUMN owner_id INT
 REFERENCES owners(id)
 ON DELETE CASCADE;

/*
  Modify your inserted animals so it includes the species_id value:
  If the name ends in "mon" it will be Digimon
  All other animals are Pokemon
 */

 UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
 UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

 /* Modify inserted animals to include owner information (owner_id) */
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon','Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon','Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon','Boarmon');

 -- Create a table named vets.
CREATE TABLE vets (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(50),
	age INT,
	date_of_graduation DATE
);

-- Create a "join table" called specializations.
CREATE TABLE specializations (
	vets_id INT NOT NULL,
	species_id INT NOT NULL,
	FOREIGN KEY (vets_id) REFERENCES vets (id) ON UPDATE CASCADE,
	FOREIGN KEY (species_id) REFERENCES species (id) ON UPDATE CASCADE
);

-- Create a "join table" called visits.
CREATE TABLE visits (
    animals_id INT NOT NULL,
    vets_id INT NOT NULL,
    date_of_visit DATE,
    FOREIGN KEY (animals_id) REFERENCES animals(id) ON UPDATE CASCADE,
    FOREIGN KEY (vets_id) REFERENCES vets(id) ON UPDATE CASCADE
);

/* Run the following query to add an extra column to the owners table: */

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

--Add index for animals_id to visits table
CREATE INDEX animal_id_asc ON visits(animal_id ASC); 
--Add index for vets_id to visits table
CREATE INDEX vet_id_asc ON visits(vet_id ASC); 
--Add index for email_id to visits table
CREATE INDEX email_asc ON owners(email ASC); 