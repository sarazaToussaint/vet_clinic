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

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT
 REFERENCES species(id)
 ON DELETE CASCADE;
 
ALTER TABLE animals ADD COLUMN owner_id INT
 REFERENCES owners(id)
 ON DELETE CASCADE;
