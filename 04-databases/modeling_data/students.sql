CREATE DATABASE students;

CREATE TABLE student(
  sid integer PRIMARY KEY,
  transid integer REFERENCES transcript,
  last_name text NOT NULL,
  first_name text NOT NULL,
);

INSERT INTO student(
  VALUES
  (1021, 61021,  'One', 'Student'),
  (1022, 61022, 'Two', 'Student'),
  (1023, 61023, 'Three', 'Student'),
  (1024, 61024, 'Four', 'Student'),
  (1025, 61025, 'Five', 'Student'),
  (1026, 61026, 'Six', 'Student'),
  (1027, 61027, 'Seven', 'Student'),
  (1028, 61028, 'Eight', 'Student'),
  (1029, 61029, 'Nine', 'Student')
);

CREATE TABLE transcript(
  transid integer PRIMARY KEY,
  sid integer REFERENCES student,
  cid integer REFERENCES course,
  grade text
);

INSERT INTO transcript(
  VALUES
  (61021, 1021, 3, 'A'),
  (61022, 1022, 1, 'C'),
  (61023, 1023, 1, 'A'),
  (61024, 1024, 2, 'B'),
  (61025, 1025, 3, 'B'),
  (61026, 1026, 3, 'C'),
  (61027, 1027, 2, 'D'),
  (61028, 1028, 3, 'A'),
  (61029, 1029, 2, 'F'),
);


CREATE TABLE course(
  cid integer PRIMARY KEY,
  course_name text NOT NULL,
  instructor text
);

INSERT INTO course(
  VALUES
  (1, 'Calculus', 'Dr. Lisa Leslie'),
  (2, 'Anatomy', 'Dr. Lance Stevens '),
  (3, 'Computer Science', 'Dr. Schweiable')
);


# Queries:

-- 1. Find all students who have taken a particular class.
SELECT *
FROM student
JOIN transcript
ON student.transid = transcript.transid
WHERE course.cid = 1;

-- 2. Count the number of each grade (using letter grades A-F) earned in a particular class.
SELECT COUNT(transcript.grade), course.course_name
FROM transcript, course
GROUP BY cid, course_name
WHERE course.cid = 3;

-- 3. Find class names and the total number of students who have taken each class in the list.
SELECT COUNT(cid)
FROM course
JOIN transcript
ON course.cid = transcript.cid
GROUP BY course_name;

-- 4. Find the class taken by the largest number of students.
SELECT COUNT(sid), transcript.cid
FROM student
JOIN transcript
ON student.transid = transcript.transid
GROUP BY transcript.cid;
