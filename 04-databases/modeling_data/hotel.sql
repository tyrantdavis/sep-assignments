CREATE DATABASE hotel;

CREATE TABLE guest(
  gid SERIAL PRIMARY KEY,
  last_name text NOT NULL,
  first_name text NOT NULL,
  email text NOT NULL,
  phone text NOT NULL,
  address text NOT NULL
);

INSERT INTO guest(
  VALUES
  ('Davis', 'Miles', 'miles@thegreatest.com', '333-666-9999', '1122 I Am Jazz Blvd.'),
  ('Hancock', 'Jane', 'jane@hancock.com', '555-444-3322', '123 Somewhere St.'),
  ('Williams', 'Lilo', 'lilo@williams.com', '555-222-3475', '345 Way Out Ave.'),
  ('Whoami', 'Jason', 'jason@whoami.com', '222-456-0913', 'No Idea Ave.')
);

CREATE TABLE room(
  rid SERIAL PRIMARY KEY,
  bid integer REFERENCES booking,
  room_num integer NOT NULL,
  floor_num integer NOT NULL UNIQUE,
  price numeric(5, 2) CONSTRAINT positve_price CHECK(price >= 0) -- per night
);

INSERT INTO room(
  VALUES
  (100, 1, 99.99),
  (101, 1, 110.99),
  (102, 1, 115.99),
  (200, 2, 124.99),
  (201, 2, 120.99),
  (202, 2, 185.99),
  (300, 3, 200.00),
  (301, 3, 190.99),
  (302, 3, 233.99)
);

CREATE TABLE booking(
  bid SERIAL PRIMARY KEY,
  gid integer  REFERENCES guest,
  rid REFERENCES room,
  check_in date NOT NULL,  -- yyyy-mm-dd
  check_out date NOT NULL
);

INSERT INTO booking(
  VALUES
  (4, 100, 2017-12-23, 2018-01-02),
  (4, 103, 2017-12-23, 2018-01-02),
  (1, 301, 2017-11-29, 2017-11-30),
  (2, 202, 2018-02-19, 2017-02-25),
  (1, 301, 2017-01-20, 2018-01-23),
  (1, 301, 2018-02-13, 2018-02-14)
);

-- Find a guest who exists in the database and has not booked a room.
SELECT g.last_name, g.first_name, b.bid
FROM guest AS g
JOIN booking AS b
ON g.gid = b.gid
WHERE b.bid = NULL;

SELECT *
FROM guest
LEFT OUTER JOIN booking ON booking.gid = guest.gid;

SELECT *
FROM guest
WHERE gid NOT IN(SELECT gid FROM booking);

-- Find bookings for a guest who has booked two rooms for the same dates.

SELECT COUNT(rid)
FROM booking
GROUP BY check_in, gid;


-- Find bookings for a guest who has booked one room several times on different dates.
SELECT COUNT(check_in)
FROM booking
GROUP BY rid, gid
WHERE COUNT(check_in) > 1;


-- Count the number of unique guests who have booked the same room.
SELECT COUNT(gid)
FROM booking
GROUP BY rid;
