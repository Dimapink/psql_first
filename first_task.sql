CREATE SCHEMA music;
CREATE TABLE IF NOT EXISTS music.genres (
	id SERIAL PRIMARY KEY, 
	name VARCHAR(255) UNIQUE NOT NULL
	);

CREATE TABLE IF NOT EXISTS music.artist (
	id SERIAL PRIMARY KEY, 
	name VARCHAR(255) NOT NULL
	);

CREATE TABLE IF NOT EXISTS music.genre_to_artist(
	genre_id INTEGER REFERENCES music.genres(id),
	artist_id INTEGER REFERENCES music.artist(id),
	CONSTRAINT pk PRIMARY KEY (genre_id, artist_id)
	);


CREATE TABLE IF NOT EXISTS music.album (
	id SERIAL PRIMARY KEY, 
	name VARCHAR(255) NOT NULL,
	published DATE NOT NULL
	);

CREATE TABLE IF NOT EXISTS music.artist_to_album(
	artist_id INTEGER REFERENCES music.artist(id),
	album_id INTEGER REFERENCES music.album(id),
	CONSTRAINT fk PRIMARY KEY (artist_id, album_id)
	);

CREATE TABLE IF NOT EXISTS music.song (
	id SERIAL PRIMARY KEY, 
	name VARCHAR(255) NOT NULL,
	duration TIME NOT NULL,
	album INTEGER REFERENCES music.album(id)
	);