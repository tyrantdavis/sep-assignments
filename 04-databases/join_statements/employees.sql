CREATE TABLE employees(
id integer NOT NULL PRIMARY KEY,
employee text NOT NULL,
dept_id integer NOT NULL);

INSERT INTO employees (id, employee, dept_id)
VALUES
(1, 'Jane Right', 5),
(2, 'Cary Moss', 7),
(3, 'Jenny Jones', 1),
(4, 'Karen Mason', 3),
(5, 'Terry Crews', 2),
(6, 'Anna Houz', 4),
(7, 'Jason Kiddz', 6);

CREATE TABLE shifts(
shiftid integer NOT NULL,
schedule varchar(30),
id integer REFERENCES employees(id) );

INSERT INTO shifts (shiftid, schedule, id)
VALUES
(1, '4:00am-12:30pm', 7),
(1, '4:15am-12:45pm', 1),
(3, '8:15pm-4:45am', 6),
(1, '4:00am-12:30pm', 2),
(2, '12:15pm-8:45pm', 4),
(2, '12:00pm-8:30pm', 5),
(3, '8:00pm-4:00am', 3);


SELECT e.employee, s.shiftid
FROM employees AS e
JOIN shifts AS s
ON e.id = s.id;

SELECT DISTINCT schedule
FROM shifts
ORDER BY schedule;
