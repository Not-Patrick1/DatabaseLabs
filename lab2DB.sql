CREATE TABLE student(
	studentID int PRIMARY KEY,
	studentName varChar,
	major varChar,
	graduationYear int
)

CREATE TABLE course (
	courseID Int PRIMARY KEY,
	title varChar,
	credits int,
	CONSTRAINT checkCredits CHECK (credits>0)
)

CREATE TABLE enrollment(
	term VARCHAR,
	studentID int,
	FOREIGN KEY (studentID) REFERENCES student (studentID), 
	courseID int,
	FOREIGN KEY (courseID) REFERENCES  course (courseID),
	grade varChar,
	primary key  (studentID, courseID, term)
)

INSERT INTO students


SELECT student FROM student
WHERE major = 'CS';

SELECT studentid, studentname
FROM student

SELECT * FROM student
WHERE studentname  LIKE 'J%'

SELECT course FROM course
WHERE credits>=3

SELECT * FROM enrollment
WHERE grade IS NULL

SELECT * FROM student
ORDER BY graduationyear, studentname