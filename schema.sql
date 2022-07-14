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