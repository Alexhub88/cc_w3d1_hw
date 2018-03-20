DROP TABLE lightsabers;
DROP TABLE characters;

CREATE TABLE characters (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  darkside BOOLEAN,
  age INT
);

CREATE TABLE lightsabers (
  id SERIAL8 PRIMARY KEY,
  colour VARCHAR(255),
  hilt_metal VARCHAR(255),
  owner_id INT8 REFERENCES characters(id)
);

INSERT INTO characters (name, darkside, age) VALUES ('Obi-Wan', false, 239);
INSERT INTO characters (name, darkside, age) VALUES ('Anakin', false, 29);
INSERT INTO characters (name, darkside, age) VALUES ('Darth Maul', true, 100);
INSERT INTO characters (name, darkside) VALUES ('Yoda', false);

-- UPDATE characters SET darkside = TRUE WHERE name = 'Anakin';
UPDATE characters
  SET (name, darkside) = ('Darth Vader', true )
  WHERE name = 'Anakin';


INSERT INTO characters (name, darkside, age) VALUES ('Stormtroopers', true, 25);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtroopers', true, 25);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtroopers', true, 25);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtroopers', true, 25);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtroopers', true, 25);

UPDATE characters
  SET (age) = (26)
  WHERE id = 9;

-- SELECT name, age, darkside FROM characters;
-- DELETE FROM characters WHERE name = 'Darth Maul';

SELECT * FROM characters;

INSERT INTO lightsabers (colour, hilt_metal, owner_id) VALUES ('Blue', 'Steel', 8);

SELECT * FROM lightsabers;
