CREATE TABLE dogs (
  id integer NOT NULL UNIQUE REFERENCES adoptions(adopter),
  name varchar(60) NOT NULL,
  gender varchar(60),
  age integer,
  weight integer,
  intake_date date,
  breed text,
  in_foster date

);

CREATE TABLE cats (
  id integer NOT NULL UNIQUE REFERENCES adoptions(adopter),
  name text,
  gender varchar(60),
  age integer,
  intake_date date
  adoption_date date
);

CREATE TABLE adoptions (
  id integer NOT NULL UNIQUE,
  cid integer UNIQUE REFERENCES cats(id),
  did integer UNIQUE REFERENCES dogs(id),
  adopter integer UNIQUE REFERENCES adopters(id),
  cat boolean DEFAULT FALSE,
  dog boolean DEFAULT FALSE,
  date date
);

CREATE TABLE adopters (
  id integer NOT NULL PRIMARY KEY,
  aid integer UNIQUE REFERENCES adoptions(id),
  first_name text,
  last_name text NOT NULL,
  address text,
  phone text
);


CREATE TABLE volunteers(
  id integer NOT NULL PRIMARY KEY,
  name text NOT NULL,
  address text,
  phone_number text,
  available_to_foster boolean DEFAULT FALSE,
  foster_id integer NOT NULL UNIQUE
  CONSTRAINT fk_dogs FOREIGN KEY (id) REFERENCES dogs(id),
  CONSTRAINT fk_cats FOREIGN KEY (id) REFERENCES cats(id)
);



-- Create a list of all volunteers. If the volunteer is fostering a dog, include each dog as well.
SELECT v.name, d.name
FROM volunteers AS v
JOIN dogs AS d
ON v.id = d.id;

-- Create a list of adopters who have not yet chosen a dog to adopt

SELECT adopters.first_name, adopters.last_name, adoptions.adopter, SUM(adoptions.dog)
FROM adopters, adoptions
WHERE SUM(adoptions.dog) = 0;

-- Generate all possible combinations of adopters and available dogs.
SELECT
a.first_name AS first,
a.last_name AS last,
ad.id AS aid,
d.name AS dog,
FROM adopters AS a, adoptions AS ad, dogs AS d
WHERE a.aid = ad.id AND d.in_foster = NULL;

-- or

SELECT a.first_name As first, a.last_name As last , ad.id As aid, d.name AS name
FROM adopters AS a
INNER JOIN adoptions AS ad
ON a.aid = ad.id,
CROSS JOIN dogs AS d
WHERE d.in_foster = NULL;

-- Display a list of all cats and all dogs who have not been adopted.
SELECT d.name, c.name
FROM dogs AS d, cats AS c
WHERE d.in_foster = NULL
OR c.adoption_date = NULL;

-- List the adopter’s name and the pet’s name for each animal adopted within the past month to be
-- displayed as a ‘Happy Tail’ on social media.
SELECT a.name, d.name, c.name, ad.date
FROM adopters AS a, dogs AS d, cats AS c, adoptions AS ad
WHERE ad.date >= '2017-10-20' ;

-- Create a list of volunteers who are available to foster. If they currently are fostering a dog, include
-- the dog. Also include all dogs who are not currently in foster homes.

SELECT v.name, v.available_to_foster, dogs.name, d.in_foster
FROM volunteers AS v
LEFT JOIN dogs AS d
ON v.fk_dogs = d.id
WHERE available_to_foster = TRUE
OR d.in_foster = FALSE;

-- Write a query to find the name of the person who adopted Seashell
SELECT adopters.first_name, adopters.last_name, adoptions.adopter, cats.names
FROM adopters, adoptions
JOIN cats
ON adoptions.adopter = cats.id;
