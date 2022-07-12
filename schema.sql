/* Database schema to keep the structure of entire database. */

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

