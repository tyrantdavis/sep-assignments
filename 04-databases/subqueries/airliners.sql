CREATE DATABASE airliners;

CREATE TABLE airplanes(
  aid varchar(6),
  model varchar(7) NOT NULL,
  capacity integer,
  range varchar
  PRIMARY KEY (aid, model)
);

INSERT INTO airplanes(aid, model, capacity, range)
VALUES
  ('JA8080', '747-400', 416, '6,089 mi'  )
  ('N340LV', '777-500', 524, '5,967 mi' )
  ('R282DF', '737 MAX', 660, '6,523 mi')
  ('S498NX', '727-100', 390, '6,789 mi')
  ('XN2320', '707-300', 360, '5,867 mi')
  ('MT2431', '737-800', 300, '5, 323 mi');

CREATE TABLE flights(
  flight_number integer PRIMARY KEY,
  destination text,
  origin text,
  comapny text,
  distance text,
  flight_time text,
  model varchar(7),
  aid varchar(6) REFERENCES airplanes;
);

INSERT INTO flights(flight_number, destination, origin, company, distance, flight_time, model
aid )
VALUES
  (6143, 'Miami', 'Los Angeles', 'American',  '2,733 mi', '4h 37min', '737 MAX',
    'R282DF'),
  (2491, 'Atlanta', 'Memphis' , 'Delta', '384 mi', '1h 10min', '777-500', 'N340LV'),
  (3765, 'Houston', 'New York', 'Frontier', '1,628 mi', '2h 56min', '747-400', 'JA8080'),
  (4223, 'Milwaukee', 'Atlanta', 'Delta','1,949 mi', '2h 34min', '727-100', 'S498NX')
  (1453, 'Chicago', 'Phoenix', 'Jet Blue','1,753', '3h 30min', '707-300', 'XN2320')
  (7564, 'Atlanta', 'Charrlotte', 'Delta', '226 mi', '1h 21min', '737-800', 'MT2431');

CREATE TABLE transactions(
  id serial PRIMARY KEY,
  seats_sold integer,
  trevenue text,
  tcost text,
  flight_number REFERENCES flights,
  aid REFERENCES airplanes,
  date date
);

INSERT INTO transactions(id, seats_sold, trevenue, tcost, flight_number, aid, date)
VALUES
(337, '67,184', '16, 850', 2491,  'N340LV', '2017-11-23'),
(660, '231,000', '52,800', 6143, 'R282DF', '2017-12-01'),
(101,  '29,795', '9,595', 3765, 'JA8080', '2017-11-17')
(99, '11,880', '4,950', 7564, 'MT2431', '2017-11-20'),
(295, '82,600', '23,600', 1453,'XN2320', '2017-12-01'),
(87, '21,750', '6,960',4223, 'S498NX', '2017-12-10');

--a. To determine the most profitable airplanes, find all airplane models where each flight has had
--    over 100 paying customers in the past month.
SELECT model
FROM airplanes
  WHERE aid = ANY
    (SELECT seats_sold
    FROM transactions
    WHERE seats_sold > 100 );
--b. To determine the most profitable flights, find all destination-origin pairs where 90% or more of
--    the seats have been sold in the past month.
SELECT f.destination, f.origin, f.flight_number AS flight
FROM flights f
WHERE date >= '2017-11-15'
  (SELECT a.capacity AS capacity, t.seats_sold AS sold
  FROM airplanes a, transactions t
  WHERE a.aid = t.aid
  AND (t.seatsold / a.capacity) >= (a.capacity * 0.9) );


--c. The airline is looking to expand its presence in the US Southeast and globally. Find the total
--    revenue of any flight arriving at or departing from Atlanta.
SELECT t.revenue, t.flight_number AS flight
FROM transactions t
  (SELECT f.flight_number
  FROM flights f
  WHERE f.origin = 'Atlanta'
  OR f.destination = 'Atlanta')
ORDER BY t.date DESC;
