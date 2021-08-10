-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL);

CREATE TABLE orbital_stars(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL);

CREATE TABLE planets(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INT REFERENCES orbital_stars ON DELETE SET NULL,
  galaxy INTEGER REFERENCES galaxies ON DELETE CASCADE);

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbiting_planet INTEGER REFERENCES planets ON DELETE CASCADE);

INSERT INTO orbital_stars(name)
VALUES ('The Sun'), ('Proxima Centauri'), ('Gliese 876');

INSERT INTO galaxies (name)
VALUES ('Milky Way');

INSERT INTO planets 
(name, orbital_period_in_years, orbits_around, galaxy) VALUES
('Earth', 1.00, 1, 1), ('Mars', 1.88, 1, 1),
('Venus', 0.62, 1, 1), ('Neptune', 164.8, 1, 1),
('Proxima Centauri b', 0.03, 2, 1),
('Gliese 876 b', 0.23, 3, 1);

INSERT INTO moons 
(name, orbiting_planet) VALUES
('The Moon', 1), ('Phobos', 2), ('Deimos', 2),
('Naiad', 4), ('Thalassa', 4), ('Despina', 4), ('Galatea', 4),
('Larissa', 4), ('S/2004 N 1', 4), ('Proteus', 4), ('Triton', 4), 
('Nereid', 4), ('Halimede', 4), ('Sao', 4), ('Laomedeia', 4),
('Psamathe', 4), ('Neso', 4);
