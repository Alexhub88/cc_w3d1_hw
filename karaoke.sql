DROP TABLE rooms_songs;
DROP TABLE guests;
DROP TABLE songs;
DROP TABLE rooms;

CREATE TABLE rooms (
  id SERIAL8 PRIMARY KEY,
  name INT,
  max_occupants INT,
  entry_fee INT
);

CREATE TABLE songs (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  artist VARCHAR(255)
);

CREATE TABLE rooms_songs (
  id SERIAL8 PRIMARY KEY,
  room_id INT8 REFERENCES rooms(id),
  song_id INT8 REFERENCES songs(id)
);

CREATE TABLE guests (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  favourite_song VARCHAR(255),
  cash INT,
  tab INT,
  guest_room_id INT8 REFERENCES rooms (id),
  guest_song_id INT8 REFERENCES songs (id)
);

INSERT INTO rooms (name, max_occupants, entry_fee) VALUES (8, 5, 100);
INSERT INTO rooms (name, max_occupants, entry_fee) VALUES (4, 3, 50);
INSERT INTO rooms (name, max_occupants, entry_fee) VALUES (7, 25, 84);
SELECT * FROM rooms;

UPDATE rooms
  SET (name, entry_fee) = (1, 67)
  WHERE name = 8;

SELECT * FROM rooms;
SELECT (name, max_occupants) FROM rooms;
SELECT * FROM rooms WHERE max_occupants = 25;

INSERT INTO songs (title, artist) VALUES ('Ruby Tuesday', 'Rolling Stones');
INSERT INTO songs (title, artist) VALUES ('Airbag', 'Radiohead');
INSERT INTO songs (title, artist) VALUES ('Everywhere', 'Fleetwood Mac');
SELECT * FROM songs;

UPDATE songs
  SET (title, artist)  = ('Sunday Morning', 'Velvet Underground')
  WHERE title = 'Airbag';

SELECT * FROM songs;
SELECT title FROM songs;
SELECT artist FROM songs WHERE title = 'Ruby Tuesday';

INSERT INTO rooms_songs (room_id, song_id) VALUES (1, 1);
INSERT INTO rooms_songs (room_id, song_id) VALUES (1, 3);
INSERT INTO rooms_songs (room_id, song_id) VALUES (2, 1);
INSERT INTO rooms_songs (room_id, song_id) VALUES (2, 2);
INSERT INTO rooms_songs (room_id, song_id) VALUES (3, 1);
INSERT INTO rooms_songs (room_id, song_id) VALUES (3, 2);
INSERT INTO rooms_songs (room_id, song_id) VALUES (3, 3);
SELECT * FROM rooms_songs;

SELECT * FROM rooms_songs WHERE room_id = 3;

INSERT INTO guests (name, favourite_song, cash, tab, guest_room_id, guest_song_id) VALUES ('Kirk', 'Ruby Tuesday', 200, 20, 3, 2);
INSERT INTO guests (name, favourite_song, cash, tab, guest_room_id, guest_song_id) VALUES ('Picard', 'Airbag', 150, 50, 1, 3);
INSERT INTO guests (name, favourite_song, cash, tab, guest_room_id, guest_song_id) VALUES ('Archer', 'Everywhere', 100, 500, 2, 1);
INSERT INTO guests (name, favourite_song, cash, tab, guest_room_id, guest_song_id) VALUES ('Spock', 'The Chain', 457, 281, 3, 1);
INSERT INTO guests (name, favourite_song, cash, tab, guest_room_id, guest_song_id) VALUES ('Riker', 'Bohemian Rhapsody', 123, 456, 3, 1);
SELECT * FROM guests;

SELECT * FROM guests WHERE guest_room_id = 2;

UPDATE guests
  SET (name, favourite_song, cash, tab) = ('Janeway', 'Requiem', 234, 567)
  WHERE name = 'Archer';

SELECT * FROM guests;
SELECT (name, favourite_song) FROM guests;
SELECT favourite_song FROM guests WHERE name = 'Picard';

-- Guests in room with ID 1
SELECT * FROM guests WHERE guest_room_id = 1;

-- Guests with favourite song with ID 1
SELECT * FROM guests WHERE guest_song_id = 1;

-- Guests in room with ID 3 plus room information
SELECT * FROM guests, rooms
 WHERE guests.guest_room_id = 3
 AND guests.guest_room_id = rooms.id;

 -- Guests with favourite song with ID 1 plus song information
 SELECT * FROM guests, songs
  WHERE guests.guest_song_id = 1
  AND guests.guest_song_id = songs.id;

  -- Guests in Room 3 with favourite song with ID 1 plus room and song information
  SELECT * FROM guests, rooms, songs
   WHERE guests.guest_room_id = 3
   AND guests.guest_room_id = rooms.id
   AND guests.guest_song_id = 1
   AND guests.guest_song_id = songs.id;

   -- Check that song 1 is on the playlist for room 3 (will return empty result if not)
   SELECT * FROM rooms_songs, rooms, songs
    WHERE rooms_songs.room_id = 3
    AND rooms_songs.room_id  = rooms.id
    AND rooms_songs.song_id = 1
    AND rooms_songs.song_id  = songs.id;
