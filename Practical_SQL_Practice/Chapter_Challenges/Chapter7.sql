-- Chapter 7: Table Design That Works For You
-- Challenge Questions

/*

CREATE TABLE albums (
    album_id bigserial,
    album_catalog_code varchar(100),
    album_title text,
    album_artist text,
    album_time interval,
    album_release_date date,
    album_genre varchar(40),
    album_description text
);

CREATE TABLE songs (
    song_id bigserial,
    song_title text,
    song_artist text,
    album_id bigint
);

-- Use the tables to answer these questions:

Question 1: Modify these CREATE TABLE statements to include primary and foreign keys plus
additional constraints on both tables.
*/

-- Answer: 

CREATE TABLE albums (
    album_id bigserial,
    album_catalog_code varchar(80) NOT NULL,
    album_title text NOT NULL,
    album_artist text NOT NULL,
    album_release_date date,
    album_genre varchar(30),
    album_description text,
    CONSTRAINT album_id_key PRIMARY KEY (album_id),
    CONSTRAINT release_date_check CHECK (album_release_date > '1/1/1925')
);

CREATE TABLE songs (
    song_id bigserial,
    song_title text NOT NULL,
    song_artist text NOT NULL,
    album_id bigint REFERENCES albums (album_id),
    CONSTRAINT song_id_key PRIMARY KEY (song_id)
);

/*
Question 2: Instead of using column_id as a surrogate key for your primary key, are there any columns in 
albums that could be useful as a natural key? What would you have to know to decide?

Answer: Album_catalogue_code may be a viable primary key however we would have to know if it is unique across
multiple companies or if it is always provided.


Question 3: To speed up queries, which columns are good candidates for indexes?

Answer: Any column that is designated as a primary key should be indexed and so should columns used as foreign keys.
In these tables, we should consider indexing the album_id, titles, artists, and album_release_date columns.
*/



