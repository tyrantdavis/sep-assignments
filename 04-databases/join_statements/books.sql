--  Books (isbn, title, author)

CREATE TABLE books(
  isbn integer Primary Key,
  title text NOT NULL,
  author text NOT NULL
);

-- Transactions(id, checked_out_date, checked_in_date, user_id, isbn)
CREATE TABLE transactions(
  id integer NOT NULL,
  checked_out_date date,
  checked_in_date date,
  user_id integer REFERENCES patrons(id),
  isbn integer REFERENCES books(id)
);

-- Holds(id, isbn, user_id, rank, date)
CREATE TABLE holds(
id integer NOT NULL,
isbn integer REFERENCES books(id),
user_id integer REFERENCES transactions,
rank integer,
date date;
);

-- Patrons(id, name, fine_amount)
CREATE TABLE patrons(
id integer NOT NULL PRIMARY KEY ,
name text  NOT NULL,
fine_amount numeric(2)
);

--a. provide the names and position, in order, of all of the patrons waiting in line for Harry Potter
-- and the Sorcerer’s Stone.

SELECT *
FROM patrons, holds, books
WHERE title = 'Harry Potter and the Sorcerer’s Stone'
GROUP BY name
ORDER BY rank;
);

--b. Make a list of all book titles and denote whether or not a copy of that book is checked out.

SELECT b.title, t.checked_out_date
FROM books AS b
JOIN transactions AS t
ON b.isbn = t.isbn
WHERE checked_in_date = NULL ;

-- create a list of total checked out time by book name in the past month.

SELECT DATE_PART ('DAY', t.checked_in_date - t.checked_out_date As DateDiff), b.title
FROM transactions AS t, books As b
WHERE t.checked_in_date <= current_date - '30'
GROUP BY title
ORDER BY checked_in_date;

--d. make a list of all books that have not been checked out in the past 5 years.
SELECT b.title, t.checked_out_date
FROM books AS b, transactions AS t
WHERE t.checked_out_date > "2012-11-20"
GROUP BY title
ORDER BY checked_out_date;



--e. List all of the library patrons. If they have one or more books checked out, correspond the books
-- to the patrons.
SELECT SUM(transactions.checked_out_date) AS books_checked_out, patrons.name
FROM transactions
JOIN patrons
ON transactions.user_id = patrons.id
GROUP BY SUM(transactions.checked_out_date)
HAVING checked_out_date >= 1 ;
