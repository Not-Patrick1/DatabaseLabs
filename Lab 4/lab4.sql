--Patrick Murray, 2/26/2026
--I used my creation statements from Week 2 with data insertion statements
CREATE TABLE student(
	studentID int PRIMARY KEY,
	studentName varChar,
	major varChar,
	graduationYear int
);

CREATE TABLE course (
	courseID Int PRIMARY KEY,
	title varChar,
	credits int,
	CONSTRAINT checkCredits CHECK (credits>0)
);

CREATE TABLE enrollment(
	term VARCHAR,
	studentID int,
	FOREIGN KEY (studentID) REFERENCES student (studentID), 
	courseID int,
	FOREIGN KEY (courseID) REFERENCES  course (courseID),
	grade varChar,
	primary key  (studentID, courseID, term)
);

INSERT INTO student VALUES (1, 'Alice Johnson', 'Computer Science', 2029);
INSERT INTO student VALUES (2, 'Brian Smith', 'Mathematics', 2028);
INSERT INTO student VALUES (3, 'Carla Gomez', 'Biology', 2027);
INSERT INTO student VALUES (4, 'David Lee', 'Physics', 2026);
INSERT INTO student VALUES (5, 'Emma Brown', 'Chemistry', 2027);
INSERT INTO student VALUES (6, 'Frank Wilson', 'History', 2026);
INSERT INTO student VALUES (7, 'Grace Kim', 'Engineering', 2029);
INSERT INTO student VALUES (8, 'Henry Davis', 'Economics', 2026);
INSERT INTO student VALUES (9, 'Todd Barn','Computer Science', 2029);
INSERT INTO student VALUES (10, 'John Shorts','Data Science', 2029);



INSERT INTO course VALUES (101, 'Database Systems', 3);
INSERT INTO course VALUES (102, 'Calculus I', 4);
INSERT INTO course VALUES (103, 'General Biology', 3);
INSERT INTO course VALUES (104, 'Physics I', 4);
INSERT INTO course VALUES (105, 'Organic Chemistry', 3);
INSERT INTO course VALUES (106, 'World History', 3);
INSERT INTO course VALUES (107, 'Engineering Design', 3);
INSERT INTO course VALUES (108, 'Microeconomics', 3);
INSERT INTO course VALUES (109, 'Intro to Unity',3);
INSERT INTO course VALUES (110, 'Database Management' ,4);


INSERT INTO enrollment VALUES ('Fall2025', 1, 101, 'A');
INSERT INTO enrollment VALUES ('Fall2025', 2, 102, 'B+');
INSERT INTO enrollment VALUES ('Fall2025', 3, 103, 'A-');
INSERT INTO enrollment VALUES ('Fall2025', 5, 109 ,'D');
INSERT INTO enrollment VALUES ('Fall2025', 7, 107, 'A');
INSERT INTO enrollment VALUES ('Spring2026', 4, 104, 'B');
INSERT INTO enrollment VALUES ('Spring2026', 5, 105, 'A');
INSERT INTO enrollment VALUES ('Spring2026', 6, 106, 'B-');
INSERT INTO enrollment VALUES ('Spring2026', 8, 108, 'A-');
INSERT INTO enrollment VALUES ('Spring2026', 9, 101, 'A');
INSERT INTO enrollment VALUES ('Spring2026', 2, 101, 'B');
INSERT INTO enrollment VALUES ('Spring2026', 3, 101, 'C');
INSERT INTO enrollment VALUES ('Spring2026', 10, 105, 'A');
INSERT INTO enrollment VALUES ('Spring2026', 10, 110, 'A');


--queries A
SELECT s.studentName, e.courseID
FROM student s
INNER JOIN enrollment e ON s.studentID = e.studentID
WHERE e.term = 'Spring2026'


SELECT s.studentName, c.title, e.term
FROM student s
JOIN enrollment e ON s.studentID = e.studentID
JOIN course c ON e.courseID = c.courseID
WHERE e.term = 'Spring2026'

SELECT c.courseID, c.title, COUNT (e.courseID) AS enrollments
FROM course c
Left join enrollment e
ON c.courseID = e.courseID
AND e.term = 'Spring2026'
GROUP BY c.courseID, c.title

--queries B
SELECT s.major, COUNT (s.studentID) as majorCount
FROM student s
GROUP BY s.major 
ORDER BY majorCount desc



SELECT c.courseID, c.title, COUNT (*) as  num_enrollments
FROM course c
INNER JOIN enrollment e
ON c.courseID = e.courseID
WHERE e.term = 'Spring2026'
GROUP BY c.courseID, c.title


SELECT c.courseID, COUNT (*) as num_enrollments
FROM course c
INNER JOIN enrollment e
ON c.courseID = e.courseID
WHERE e.term = 'Spring2026'
GROUP BY c.courseID
HAVING COUNT(*)>=3


--queries C

SELECT s.studentName from student s
WHERE s.studentID IN (
	SELECT e.studentID
	FROM enrollment e
	WHERE e.courseID = 110 AND e.term = 'Spring2026'
)

SELECT c.courseID, c.title 
FROM course c
WHERE EXISTS (
	SELECT 1 
	FROM enrollment e
	WHERE c.courseID = e.courseID AND e.term = 'Spring2026'
	
)


SELECT studentID FROM enrollment
WHERE term = 'Spring2026'
GROUP BY studentID
HAVING COUNT (*) >=2

--queries d

SELECT studentID, studentName
FROM student
WHERE major = 'Computer Science'
UNION 
SELECT studentID, studentName
FROM student
WHERE major = 'Data Science'
ORDER BY studentID desc

SELECT studentID, studentName
FROM student
WHERE major = 'Computer Science'
EXCEPT
SELECT s.studentID, s.studentName
FROM student s
JOIN enrollment e
ON e.studentID = s.studentID
WHERE e.courseID = '110' AND e.term ='Spring2026'







