-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT,
  date_of_birth DATE
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  main_artist_id INTEGER REFERENCES artists ON DELETE SET NULL,
  name TEXT NOT NULL,
  release_date DATE
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT
);

CREATE TABLE songs(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE song_artists(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs ON DELETE CASCADE,
  artist_id INTEGER REFERENCES artists ON DELETE CASCADE
);

CREATE TABLE song_producers(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs ON DELETE CASCADE,
  producer_id INTEGER REFERENCES producers ON DELETE CASCADE
);

CREATE TABLE songs_albums(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs ON DELETE CASCADE,
  album_id INTEGER REFERENCES albums ON DELETE CASCADE
);

INSERT INTO artists (first_name, last_name) VALUES
('Hanson', NULL), ('Queen', NULL), ('Mariah', 'Cary'), ('Boyz II Men', NULL), ('Lady Gaga', NULL), ('Bradley', 'Cooper'),
('Nickelback', NULL), ('Jay Z', NULL), ('Alicia', 'Keys'), ('Katy', 'Perry'), ('Juicy J', NULL), ('Maroon 5', NULL), ('Christina', 'Aguilera'),
('Avril', 'Lavigne'), ('Destiny''s Child', NULL);

INSERT INTO albums (name, main_artist_id) VALUES
('Middle of Nowhere', 1), ('A Night at the Opera', 2), ('Daydream', 3), ('A Star Is Born', 5), ('Silver Side Up', 7),
('The Blueprint 3', 8), ('Prism', 10), ('Hands All Over', 12), ('Let Go', 14), ('The Writing''s on the Wall', 15);

INSERT INTO producers (first_name, last_name) VALUES
('Dust Brothers', NULL), ('Stephen', 'Lironi'), ('Roy Thomas', 'Baker'), ('Walter', 'Afanasieff'), ('Benjamin', 'Rice'),
('Rick', 'Parashar'), ('Al', 'Shux'), ('Max', 'Martin'), ('Cirkut', NULL), ('Shellback', NULL), ('Benny', 'Blanco'),
('The Matrix', NULL), ('Darkchild', NULL);

INSERT INTO songs (title, duration_in_seconds, release_date) VALUES
('MMMBop', 238, '04-15-1997'), ('Bohemian Rhapsody', 355, '10-31-1975'), ('One Sweet Day', 282, '11-14-1995'), ('Shallow', 216, '09-27-2018'),
('How You Remind Me', 223, '08-21-2001'), ('New York State of Mind', 276, '10-20-2009'), ('Dark Horse', 215, '12-17-2013'), 
('Moves Like Jagger', 201, '06-21-2011'), ('Complicated', 244, '05-14-2002'), ('Say My Name', 240, '11-07-1999');

INSERT INTO song_artists(song_id, artist_id) VALUES
(1, 1), (2, 2), (3, 3), (3, 4), (4, 5), (4, 6), (5, 7), (6, 8), (6, 9), (7, 10), (7, 11), (8, 12), (8, 13), (9, 14), (10, 15);

INSERT INTO song_producers(song_id, producer_id) VALUES
(1, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 7), (7, 8), (7, 9), (8, 10), (8, 11), (9, 12), (10, 13);

INSERT INTO songs_albums (song_id, album_id) VALUES
(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8), (9,9), (10,10);

