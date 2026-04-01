--creation and insertion statements
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
--student insert
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
INSERT INTO student VALUES (11, 'Liam Turner', 'Computer Science', 2028);
INSERT INTO student VALUES (12, 'Olivia Harris', 'Mathematics', 2027);
INSERT INTO student VALUES (13, 'Noah Clark', 'Biology', 2029);
INSERT INTO student VALUES (14, 'Ava Lewis', 'Physics', 2028);
INSERT INTO student VALUES (15, 'William Walker', 'Chemistry', 2027);
INSERT INTO student VALUES (16, 'Sophia Hall', 'History', 2026);
INSERT INTO student VALUES (17, 'James Allen', 'Engineering', 2029);
INSERT INTO student VALUES (18, 'Isabella Young', 'Economics', 2028);
INSERT INTO student VALUES (19, 'Benjamin King', 'Computer Science', 2027);
INSERT INTO student VALUES (20, 'Mia Wright', 'Data Science', 2029);
INSERT INTO student VALUES (21, 'Elijah Scott', 'Physics', 2026);
INSERT INTO student VALUES (22, 'Charlotte Green', 'Biology', 2027);
INSERT INTO student VALUES (23, 'Lucas Adams', 'Mathematics', 2028);
INSERT INTO student VALUES (24, 'Amelia Baker', 'Chemistry', 2029);
INSERT INTO student VALUES (25, 'Mason Gonzalez', 'Engineering', 2027);
INSERT INTO student VALUES (26, 'Harper Nelson', 'History', 2026);
INSERT INTO student VALUES (27, 'Ethan Carter', 'Economics', 2028);
INSERT INTO student VALUES (28, 'Abigail Mitchell', 'Computer Science', 2029);
INSERT INTO student VALUES (29, 'Alexander Perez', 'Biology', 2027);
INSERT INTO student VALUES (30, 'Emily Roberts', 'Physics', 2026);
INSERT INTO student VALUES (31, 'Daniel Turner', 'Computer Science', 2028);
INSERT INTO student VALUES (32, 'Ella Phillips', 'Mathematics', 2027);
INSERT INTO student VALUES (33, 'Matthew Campbell', 'Biology', 2029);
INSERT INTO student VALUES (34, 'Avery Parker', 'Physics', 2028);
INSERT INTO student VALUES (35, 'Joseph Evans', 'Chemistry', 2027);
INSERT INTO student VALUES (36, 'Sofia Edwards', 'History', 2026);
INSERT INTO student VALUES (37, 'Samuel Collins', 'Engineering', 2029);
INSERT INTO student VALUES (38, 'Scarlett Stewart', 'Economics', 2028);
INSERT INTO student VALUES (39, 'David Sanchez', 'Computer Science', 2027);
INSERT INTO student VALUES (40, 'Victoria Morris', 'Data Science', 2029);
INSERT INTO student VALUES (41, 'Andrew Rogers', 'Physics', 2026);
INSERT INTO student VALUES (42, 'Lily Reed', 'Biology', 2027);
INSERT INTO student VALUES (43, 'Joshua Cook', 'Mathematics', 2028);
INSERT INTO student VALUES (44, 'Grace Morgan', 'Chemistry', 2029);
INSERT INTO student VALUES (45, 'Christopher Bell', 'Engineering', 2027);
INSERT INTO student VALUES (46, 'Chloe Murphy', 'History', 2026);
INSERT INTO student VALUES (47, 'Nathan Bailey', 'Economics', 2028);
INSERT INTO student VALUES (48, 'Zoey Rivera', 'Computer Science', 2029);
INSERT INTO student VALUES (49, 'Ryan Cooper', 'Biology', 2027);
INSERT INTO student VALUES (50, 'Hannah Richardson', 'Physics', 2026);
INSERT INTO student VALUES (51, 'Aaron Cox', 'Computer Science', 2028);
INSERT INTO student VALUES (52, 'Layla Howard', 'Mathematics', 2027);
INSERT INTO student VALUES (53, 'Jonathan Ward', 'Biology', 2029);
INSERT INTO student VALUES (54, 'Penelope Torres', 'Physics', 2028);
INSERT INTO student VALUES (55, 'Justin Peterson', 'Chemistry', 2027);
INSERT INTO student VALUES (56, 'Nora Gray', 'History', 2026);
INSERT INTO student VALUES (57, 'Brandon Ramirez', 'Engineering', 2029);
INSERT INTO student VALUES (58, 'Riley James', 'Economics', 2028);
INSERT INTO student VALUES (59, 'Kevin Watson', 'Computer Science', 2027);
INSERT INTO student VALUES (60, 'Aria Brooks', 'Data Science', 2029);
INSERT INTO student VALUES (61, 'Jason Kelly', 'Physics', 2026);
INSERT INTO student VALUES (62, 'Aubrey Sanders', 'Biology', 2027);
INSERT INTO student VALUES (63, 'Eric Price', 'Mathematics', 2028);
INSERT INTO student VALUES (64, 'Addison Bennett', 'Chemistry', 2029);
INSERT INTO student VALUES (65, 'Jacob Wood', 'Engineering', 2027);
INSERT INTO student VALUES (66, 'Stella Barnes', 'History', 2026);
INSERT INTO student VALUES (67, 'Tyler Ross', 'Economics', 2028);
INSERT INTO student VALUES (68, 'Natalie Henderson', 'Computer Science', 2029);
INSERT INTO student VALUES (69, 'Sean Coleman', 'Biology', 2027);
INSERT INTO student VALUES (70, 'Leah Jenkins', 'Physics', 2026);
INSERT INTO student VALUES (71, 'Zachary Perry', 'Computer Science', 2028);
INSERT INTO student VALUES (72, 'Hazel Powell', 'Mathematics', 2027);
INSERT INTO student VALUES (73, 'Kyle Long', 'Biology', 2029);
INSERT INTO student VALUES (74, 'Violet Patterson', 'Physics', 2028);
INSERT INTO student VALUES (75, 'Jordan Hughes', 'Chemistry', 2027);
INSERT INTO student VALUES (76, 'Aurora Flores', 'History', 2026);
INSERT INTO student VALUES (77, 'Dylan Washington', 'Engineering', 2029);
INSERT INTO student VALUES (78, 'Savannah Butler', 'Economics', 2028);
INSERT INTO student VALUES (79, 'Ian Simmons', 'Computer Science', 2027);
INSERT INTO student VALUES (80, 'Brooklyn Foster', 'Data Science', 2029);
INSERT INTO student VALUES (81, 'Adam Gonzales', 'Physics', 2026);
INSERT INTO student VALUES (82, 'Claire Bryant', 'Biology', 2027);
INSERT INTO student VALUES (83, 'Blake Alexander', 'Mathematics', 2028);
INSERT INTO student VALUES (84, 'Lucy Russell', 'Chemistry', 2029);
INSERT INTO student VALUES (85, 'Evan Griffin', 'Engineering', 2027);
INSERT INTO student VALUES (86, 'Paisley Diaz', 'History', 2026);
INSERT INTO student VALUES (87, 'Cole Hayes', 'Economics', 2028);
INSERT INTO student VALUES (88, 'Skylar Myers', 'Computer Science', 2029);
INSERT INTO student VALUES (89, 'Tristan Ford', 'Biology', 2027);
INSERT INTO student VALUES (90, 'Anna Hamilton', 'Physics', 2026);
INSERT INTO student VALUES (91, 'Marcus Graham', 'Computer Science', 2028);
INSERT INTO student VALUES (92, 'Julia Sullivan', 'Mathematics', 2027);
INSERT INTO student VALUES (93, 'Patrick Wallace', 'Biology', 2029);
INSERT INTO student VALUES (94, 'Elena Woods', 'Physics', 2028);
INSERT INTO student VALUES (95, 'Victor Cole', 'Chemistry', 2027);
INSERT INTO student VALUES (96, 'Ruby West', 'History', 2026);
INSERT INTO student VALUES (97, 'Oscar Jordan', 'Engineering', 2029);
INSERT INTO student VALUES (98, 'Maya Owens', 'Economics', 2028);
INSERT INTO student VALUES (99, 'Caleb Reynolds', 'Computer Science', 2027);
INSERT INTO student VALUES (100, 'Ivy Fisher', 'Data Science', 2029);
INSERT INTO student VALUES (101, 'Leo Ellis', 'Physics', 2026);
INSERT INTO student VALUES (102, 'Nina Harrison', 'Biology', 2027);
INSERT INTO student VALUES (103, 'Eli Gibson', 'Mathematics', 2028);
INSERT INTO student VALUES (104, 'Zoe McDonald', 'Chemistry', 2029);
INSERT INTO student VALUES (105, 'Aaron Cruz', 'Engineering', 2027);
INSERT INTO student VALUES (106, 'Luna Marshall', 'History', 2026);
INSERT INTO student VALUES (107, 'Connor Ortiz', 'Economics', 2028);
INSERT INTO student VALUES (108, 'Bella Gomez', 'Computer Science', 2029);
INSERT INTO student VALUES (109, 'Jason Murray', 'Biology', 2027);
INSERT INTO student VALUES (110, 'Sara Kim', 'Physics', 2026);




--course inserts
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
INSERT INTO course VALUES ('CMPT350', 'Software Engineering', 3);
INSERT INTO course VALUES ('CMPT410', 'Artificial Intelligence', 3);
INSERT INTO course VALUES ('CMPT420', 'Machine Learning', 3);
INSERT INTO course VALUES ('MATH310', 'Linear Algebra', 3);
INSERT INTO course VALUES ('MATH330', 'Statistics', 3);
INSERT INTO course VALUES ('BIO220', 'Genetics', 3);
INSERT INTO course VALUES ('CHEM210', 'Analytical Chemistry', 3);
INSERT INTO course VALUES ('PHY240', 'Electricity and Magnetism', 4);
INSERT INTO course VALUES ('ENG210', 'Thermodynamics', 3);
INSERT INTO course VALUES ('ECO320', 'Macroeconomics', 3);
INSERT INTO course VALUES ('CYBR310', 'Network Security', 4);
INSERT INTO course VALUES ('GAME420', 'Game Development II', 3);

--enrollment inserts
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
INSERT INTO enrollment VALUES ('Fall2025', 11, 'CMPT306', 'B');
INSERT INTO enrollment VALUES ('Fall2025', 12, 'MATH202', 'A');
INSERT INTO enrollment VALUES ('Fall2025', 13, 'BIO105', 'B+');
INSERT INTO enrollment VALUES ('Fall2025', 14, 'PHY230', 'C');
INSERT INTO enrollment VALUES ('Fall2025', 15, 'CHEM302', 'B');
INSERT INTO enrollment VALUES ('Fall2025', 16, 'HIST101', 'A');
INSERT INTO enrollment VALUES ('Fall2025', 17, 'ENG320', 'A-');
INSERT INTO enrollment VALUES ('Fall2025', 18, 'ECO309', 'B+');
INSERT INTO enrollment VALUES ('Fall2025', 19, 'CMPT308', 'A');
INSERT INTO enrollment VALUES ('Fall2025', 20, 'CYBR210', 'B');
INSERT INTO enrollment VALUES ('Spring2026', 21, 'CMPT350', 'A');
INSERT INTO enrollment VALUES ('Spring2026', 22, 'BIO220', 'B+');
INSERT INTO enrollment VALUES ('Spring2026', 23, 'MATH310', 'A-');
INSERT INTO enrollment VALUES ('Spring2026', 24, 'CHEM210', 'B');
INSERT INTO enrollment VALUES ('Spring2026', 25, 'ENG210', 'A');
INSERT INTO enrollment VALUES ('Spring2026', 26, 'HIST101', 'B');
INSERT INTO enrollment VALUES ('Spring2026', 27, 'ECO320', 'A-');
INSERT INTO enrollment VALUES ('Spring2026', 28, 'CMPT410', 'A');
INSERT INTO enrollment VALUES ('Spring2026', 29, 'BIO105', 'C+');
INSERT INTO enrollment VALUES ('Spring2026', 30, 'PHY240', 'B');
INSERT INTO enrollment VALUES ('Fall2026', 31, 'CMPT420', 'A');
INSERT INTO enrollment VALUES ('Fall2026', 32, 'MATH330', 'B+');
INSERT INTO enrollment VALUES ('Fall2026', 33, 'BIO220', 'A-');
INSERT INTO enrollment VALUES ('Fall2026', 34, 'PHY230', 'B');
INSERT INTO enrollment VALUES ('Fall2026', 35, 'CHEM302', 'C');
INSERT INTO enrollment VALUES ('Fall2026', 36, 'HIST101', 'B+');
INSERT INTO enrollment VALUES ('Fall2026', 37, 'ENG320', 'A');
INSERT INTO enrollment VALUES ('Fall2026', 38, 'ECO309', 'B');
INSERT INTO enrollment VALUES ('Fall2026', 39, 'CMPT306', 'A');
INSERT INTO enrollment VALUES ('Fall2026', 40, 'GAME420', 'A-');
INSERT INTO enrollment VALUES ('Spring2027', 41, 'CMPT350', 'B+');
INSERT INTO enrollment VALUES ('Spring2027', 42, 'BIO105', 'A');
INSERT INTO enrollment VALUES ('Spring2027', 43, 'MATH202', 'B');
INSERT INTO enrollment VALUES ('Spring2027', 44, 'CHEM210', 'A-');
INSERT INTO enrollment VALUES ('Spring2027', 45, 'ENG210', 'B+');
INSERT INTO enrollment VALUES ('Spring2027', 46, 'HIST101', 'A');
INSERT INTO enrollment VALUES ('Spring2027', 47, 'ECO320', 'B');
INSERT INTO enrollment VALUES ('Spring2027', 48, 'CMPT410', 'A');
INSERT INTO enrollment VALUES ('Spring2027', 49, 'BIO220', 'B+');
INSERT INTO enrollment VALUES ('Spring2027', 50, 'PHY240', 'B');
INSERT INTO enrollment VALUES ('Fall2027', 51, 'CMPT420', 'A');
INSERT INTO enrollment VALUES ('Fall2027', 52, 'MATH310', 'A-');
INSERT INTO enrollment VALUES ('Fall2027', 53, 'BIO105', 'B+');
INSERT INTO enrollment VALUES ('Fall2027', 54, 'PHY230', 'B');
INSERT INTO enrollment VALUES ('Fall2027', 55, 'CHEM302', 'A');
INSERT INTO enrollment VALUES ('Fall2027', 56, 'HIST101', 'B');
INSERT INTO enrollment VALUES ('Fall2027', 57, 'ENG320', 'A');
INSERT INTO enrollment VALUES ('Fall2027', 58, 'ECO309', 'B+');
INSERT INTO enrollment VALUES ('Fall2027', 59, 'CMPT308', 'A');
INSERT INTO enrollment VALUES ('Fall2027', 60, 'CYBR310', 'A-');
INSERT INTO enrollment VALUES ('Spring2028', 61, 'CMPT350', 'B');
INSERT INTO enrollment VALUES ('Spring2028', 62, 'BIO220', 'A');
INSERT INTO enrollment VALUES ('Spring2028', 63, 'MATH330', 'B+');
INSERT INTO enrollment VALUES ('Spring2028', 64, 'CHEM210', 'B');
INSERT INTO enrollment VALUES ('Spring2028', 65, 'ENG210', 'A');
INSERT INTO enrollment VALUES ('Spring2028', 66, 'HIST101', 'A');
INSERT INTO enrollment VALUES ('Spring2028', 67, 'ECO320', 'B');
INSERT INTO enrollment VALUES ('Spring2028', 68, 'CMPT410', 'A');
INSERT INTO enrollment VALUES ('Spring2028', 69, 'BIO105', 'B+');
INSERT INTO enrollment VALUES ('Spring2028', 70, 'PHY240', 'B');
INSERT INTO enrollment VALUES ('Fall2028', 71, 'CMPT420', 'A');
INSERT INTO enrollment VALUES ('Fall2028', 72, 'MATH202', 'B+');
INSERT INTO enrollment VALUES ('Fall2028', 73, 'BIO220', 'A-');
INSERT INTO enrollment VALUES ('Fall2028', 74, 'PHY230', 'B');
INSERT INTO enrollment VALUES ('Fall2028', 75, 'CHEM302', 'C+');
INSERT INTO enrollment VALUES ('Fall2028', 76, 'HIST101', 'B');
INSERT INTO enrollment VALUES ('Fall2028', 77, 'ENG320', 'A');
INSERT INTO enrollment VALUES ('Fall2028', 78, 'ECO309', 'B+');
INSERT INTO enrollment VALUES ('Fall2028', 79, 'CMPT306', 'A');
INSERT INTO enrollment VALUES ('Fall2028', 80, 'GAME420', 'A');
INSERT INTO enrollment VALUES ('Spring2029', 81, 'CMPT350', 'A');
INSERT INTO enrollment VALUES ('Spring2029', 82, 'BIO105', 'B+');
INSERT INTO enrollment VALUES ('Spring2029', 83, 'MATH310', 'A');
INSERT INTO enrollment VALUES ('Spring2029', 84, 'CHEM210', 'B');
INSERT INTO enrollment VALUES ('Spring2029', 85, 'ENG210', 'A-');
INSERT INTO enrollment VALUES ('Spring2029', 86, 'HIST101', 'B');
INSERT INTO enrollment VALUES ('Spring2029', 87, 'ECO320', 'A');
INSERT INTO enrollment VALUES ('Spring2029', 88, 'CMPT410', 'A');
INSERT INTO enrollment VALUES ('Spring2029', 89, 'BIO220', 'B+');
INSERT INTO enrollment VALUES ('Spring2029', 90, 'PHY240', 'B');


--Queries
EXPLAIN
SELECT *
FROM Enrollment
WHERE term = 'Spring2026' AND courseId = 'CMPT410';

EXPLAIN
SELECT *
FROM Enrollment
WHERE term = 'Spring2026' AND studentId = 10;

EXPLAIN
SELECT s.studentName , c.title ,  e.term
FROM Student s
JOIN Enrollment e ON s.studentID = e.studentID
JOIN Course c ON c.courseID = e.courseID
WHERE e.term = 'Spring2026';

EXPLAIN
SELECT *
FROM Student
WHERE major = 'Computer Science';


--Indexes
CREATE INDEX idx_termAndcourseID
ON Enrollment(term, courseID);

CREATE INDEX idx_termAndstudentID
ON Enrollment(term, studentID);

CREATE INDEX idx_studIDandCourseIDandTerm
ON Enrollment(studentID, courseID, term);



