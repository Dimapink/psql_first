CREATE SCHEMA music;
CREATE TABLE IF NOT EXISTS music.genres (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(255) NOT NULL UNIQUE
  );

CREATE TABLE IF NOT EXISTS music.artist (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(255) NOT NULL UNIQUE
  );

CREATE TABLE IF NOT EXISTS music.genre_to_artist(
  genre_id INTEGER REFERENCES music.genres(id),
  artist_id INTEGER REFERENCES music.artist(id)
  );

CREATE TABLE IF NOT EXISTS music.album (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(255) NOT NULL,
  published DATE NOT NULL CHECK (published BETWEEN '1900-01-01' and now())
  );

CREATE TABLE IF NOT EXISTS music.artist_to_album(
  artist_id INTEGER REFERENCES music.artist(id),
  album_id INTEGER REFERENCES music.album(id)
  );

CREATE TABLE IF NOT EXISTS music.song (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(255) NOT NULL,
  duration INTEGER NOT NULL CHECK (duration BETWEEN 0 and 99999),
  album INTEGER REFERENCES music.album(id)
  );

CREATE TABLE IF NOT EXISTS music.collection (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  published DATE NOT NULL CHECK (published BETWEEN '1900-01-01' and now())
  ); 

CREATE TABLE IF NOT EXISTS music.song_to_collection(
  collection_id INTEGER REFERENCES music.collection(id),
  song_id INTEGER REFERENCES music.song(id)
  );
