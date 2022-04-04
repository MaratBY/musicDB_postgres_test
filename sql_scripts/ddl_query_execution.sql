-- Table that stores the countries data (used in musicians table)
CREATE TABLE IF NOT EXISTS countries(
    id SERIAL NOT NULL PRIMARY KEY ,
    country_name VARCHAR(50) NOT NULL ,
    country_region VARCHAR(50) NOT NULL
);

-- Table for genres information (used in musicians table)
CREATE TABLE IF NOT EXISTS genres(
    id SERIAL NOT NULL PRIMARY KEY ,
    genre VARCHAR(50) NOT NULL
);

-- "Main" table for storing information about musicians
CREATE TABLE IF NOT EXISTS musicians(
    id SERIAL NOT NULL PRIMARY KEY ,
    country_id INTEGER REFERENCES countries(id) ,
    genre_id INTEGER REFERENCES genres(id) ,
    lname VARCHAR(80) NOT NULL ,
    fname VARCHAR(80) NOT NULL ,
    nickname VARCHAR(50) NULL ,
    bday DATE NOT NULL ,
    photo BYTEA
);

-- Table for information about albums
CREATE TABLE IF NOT EXISTS albums(
    id SERIAL NOT NULL PRIMARY KEY ,
    musician_id INTEGER REFERENCES musicians(id) ,
    release_date DATE NOT NULL ,
    album_name VARCHAR(50) NOT NULL
);

-- Table for information about songs
CREATE TABLE IF NOT EXISTS songs(
    id SERIAL NOT NULL PRIMARY KEY ,
    musician_id INTEGER REFERENCES musicians(id),
    album_id INTEGER REFERENCES albums(id),
    duration_sec BIGINT NOT NULL
);
