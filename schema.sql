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

