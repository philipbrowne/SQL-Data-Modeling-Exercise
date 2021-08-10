-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries ON DELETE SET NULL
);

CREATE TABLE airlines(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
)

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines ON DELETE SET NULL,
  from_city_id INTEGER REFERENCES cities ON DELETE SET NULL,
  from_country_id INTEGER REFERENCES countries ON DELETE SET NULL,
  to_city_id INTEGER REFERENCES cities ON DELETE SET NULL,
  to_country_id INTEGER REFERENCES countries ON DELETE SET NULL
);

CREATE TABLE passengers(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  passenger_id INTEGER REFERENCES passengers ON DELETE SET NULL,
  flight_id INTEGER REFERENCES flights ON DELETE CASCADE
);

INSERT INTO countries (name) VALUES 
('United States'), ('Japan'), ('United Kingdom'), ('Mexico'), ('France'), ('Morocco'), ('UAE'), ('China'),
('Brazil'), ('Chile');

INSERT INTO cities (name, country_id) VALUES
('Washington DC', 1), ('Seattle', 1), ('Los Angeles', 1), ('Las Vegas', 1), ('New York', 1), ('Charlotte', 1), ('Cedar Rapids', 1), ('Chicago', 1),
('New Orleans', 1), ('Tokyo', 2), ('London', 3), ('Mexico City', 4), ('Paris', 5), ('Casablanca', 6), ('Dubai', 7), ('Beijing', 8), ('Sao Paolo', 9),
('Santiago', 10);

INSERT INTO airlines (name) VALUES
('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('Air China'), ('American Airlines'), ('Avianca Brazil');

INSERT INTO flights (departure, arrival, airline_id, from_city_id, from_country_id, to_city_id, to_country_id) VALUES
('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2, 1),
('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 10, 2, 11, 3),
('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 1, 4, 1),
('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 1, 12, 4),
('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 13, 5, 14, 6),
('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 15, 7, 16, 8),
('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 5, 1, 6, 1),
('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 7, 1, 8, 1),
('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 6, 1, 9, 1), 
('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 9, 18, 10);

INSERT INTO passengers (first_name, last_name) VALUES
  ('Jennifer', 'Finch'), ('Thadeus', 'Gathercoal'), ('Sonja', 'Pauley'), ('Jennifer', 'Finch'), ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'), ('Berkie', 'Wycliff'), ('Alvin', 'Leathes'), ('Berkie', 'Wycliff'), ('Cory', 'Squibbes');

INSERT INTO tickets (seat, passenger_id, flight_id) VALUES
('33B', 1, 1), ('8A', 2, 2), ('12F', 3, 3), ('20A', 4, 4), ('23D', 5, 5), ('18C', 6, 6), ('9E', 7, 7), ('1A', 8, 8), ('32B', 9, 9), ('10D', 10, 10);

