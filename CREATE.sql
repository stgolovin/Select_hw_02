CREATE TABLE IF NOT EXISTS Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS artistsGenres (
    artist_id INTEGER REFERENCES Artist(id),
    genre_id INTEGER REFERENCES Genre(id)
);

CREATE TABLE IF NOT EXISTS Album (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    year_of_release INTEGER NOT NULL 
);

CREATE TABLE IF NOT EXISTS albumsArtists (
    album_id INTEGER REFERENCES Album (id),
    artist_id INTEGER REFERENCES Artist (id)
);

CREATE TABLE IF NOT EXISTS Song (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    duration DECIMAL(8,2) NOT NULL,
    album_id INTEGER REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS mixTape (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    year_of_release INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS mixTapeSongs (
    mix_tape_id INTEGER REFERENCES mixTape(id),
    song_id INTEGER REFERENCES Song(id)
);