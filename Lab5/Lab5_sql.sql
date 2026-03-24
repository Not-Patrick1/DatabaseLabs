--Creation and insertion statements

CREATE TABLE student(
	studentID int PRIMARY KEY,
	studentName varChar,
	major varChar,
	graduationYear int
);

CREATE TABLE course (
	courseID varChar PRIMARY KEY,
	title varChar,
	credits int,
	CONSTRAINT checkCredits CHECK (credits>0)
);

CREATE TABLE enrollment(
	term VARCHAR,
	studentID int,
	FOREIGN KEY (studentID) REFERENCES student (studentID), 
	courseID varChar,
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





INSERT INTO course VALUES ('CMPT306', 'Database Systems', 3);
INSERT INTO course VALUES ('MATH202', 'Calculus I', 4);
INSERT INTO course VALUES ('BIO105', 'General Biology', 3);
INSERT INTO course VALUES ('PHY230', 'Physics I', 4);
INSERT INTO course VALUES ('CHEM302', 'Organic Chemistry', 3);
INSERT INTO course VALUES ('HIST101', 'World History', 3);
INSERT INTO course VALUES ('ENG320', 'Engineering Design', 3);
INSERT INTO course VALUES ('ECO309', 'Microeconomics', 3);
INSERT INTO course VALUES ('GAME370', 'Intro to Unity',3);
INSERT INTO course VALUES ('CMPT308', 'Database Management' , 4);
INSERT INTO course VALUES ('CYBR210', 'Cyber Security',4);


INSERT INTO enrollment VALUES ('Fall2025', 1, 'CMPT306', 'A');
INSERT INTO enrollment VALUES ('Fall2025', 2, 'MATH202', 'B+');
INSERT INTO enrollment VALUES ('Fall2025', 3, 'BIO105', 'A-');
INSERT INTO enrollment VALUES ('Fall2025', 5, 'GAME370' ,'D');
INSERT INTO enrollment VALUES ('Fall2025', 7, 'ENG320', 'A');
INSERT INTO enrollment VALUES ('Spring2026', 4, 'PHY230', 'B');
INSERT INTO enrollment VALUES ('Spring2026', 5, 'CHEM302', 'A');
INSERT INTO enrollment VALUES ('Spring2026', 6, 'HIST101', 'B-');
INSERT INTO enrollment VALUES ('Spring2026', 8, 'ECO309', 'A-');
INSERT INTO enrollment VALUES ('Spring2026', 9, 'CMPT306', 'A');
INSERT INTO enrollment VALUES ('Spring2026', 2, 'CMPT306', 'B');
INSERT INTO enrollment VALUES ('Spring2026', 3, 'CMPT306', 'C');
INSERT INTO enrollment VALUES ('Spring2026', 10, 'CHEM302', 'A');
INSERT INTO enrollment VALUES ('Spring2026', 10, 'CMPT308', 'A');
INSERT INTO enrollment VALUES ('Spring2026',3, 'CYBR210','A');
INSERT INTO enrollment VALUES ('Spring2026',3, 'CMPT308','A');

--Queries

SELECT s.studentID, s.studentName 
FROM students s
WHERE s.studentID IN (
	SELECT e.studentID 
	FROM enrollment e
	WHERE e.term = 'Spring2026' AND e.courseID = 'CMPT308'
)

SELECT c.courseID, c.title
FROM course c
WHERE EXISTS (
	SELECT 1
	FROM enrollment e
	WHERE e.courseID = c.courseID AND e.term = 'Spring2026'
)

SELECT s.studentID, s.studentName
FROM student s
WHERE NOT EXISTS (
	SELECT 1 
	FROM enrollment e
	WHERE e.studentID = s.studentID AND e.term = 'Spring2026'
)

SELECT e.studentID 
FROM enrollment e
WHERE e.courseID = 'CMPT308' AND e.term = 'Spring2026'
UNION
SELECT e.studentID 
FROM enrollment e
WHERE e.courseID = 'CYBR210' AND e.term = 'Spring2026'

SELECT e.studentID 
FROM enrollment e
WHERE e.courseID = 'CMPT308' AND e.term = 'Spring2026'
INTERSECT
SELECT e.studentID 
FROM enrollment e
WHERE e.courseID = 'CYBR210' AND e.term = 'Spring2026'

SELECT e.studentID 
FROM enrollment e
WHERE e.courseID = 'CMPT308' AND e.term = 'Spring2026'
EXCEPT
SELECT e.studentID 
FROM enrollment e
WHERE e.courseID = 'CYBR210' AND e.term = 'Spring2026'