--Table creation statements
CREATE TABLE students(
	student_ID int PRIMARY KEY,
	student_Name varChar,
	student_Phone varChar,
	CONSTRAINT checkStudentID CHECK (student_ID>0)
);

CREATE TABLE clubs(
	club_ID int PRIMARY KEY,
	club_Title varChar,
	CONSTRAINT checkClubID1 CHECK (club_ID>0) 
);

CREATE TABLE events(
	FOREIGN KEY (club_ID) REFERENCES clubs(club_ID),
	club_ID int,
	event_ID int,
	event_Date date,
	PRIMARY KEY (event_ID),
	CONSTRAINT checkDate CHECK (event_Date BETWEEN DATE '2024-08-23' AND CURRENT_DATE)
);


CREATE TABLE enrollments(
	FOREIGN KEY (club_ID) REFERENCES clubs(club_ID),
	FOREIGN KEY (student_ID) REFERENCES students(student_ID),
	club_ID int,
	student_ID int,
	enrollment_Date date,
	club_Role varChar,
	PRIMARY KEY (student_ID, club_ID),
	CONSTRAINT checkDate CHECK (enrollment_Date BETWEEN DATE '2024-08-23' AND CURRENT_DATE)
);



CREATE TABLE attendances(
	FOREIGN KEY (event_ID) REFERENCES events(event_ID),
	FOREIGN KEY (student_ID) REFERENCES students(student_ID),
	event_ID int,
	student_ID int,
	PRIMARY KEY (event_ID,student_ID)
);


--Insertion statements and data

-- Data for students table
INSERT INTO students (student_ID, student_Name, student_Phone) VALUES
(1, 'Alice Smith', '555-1234'),
(2, 'Bob Johnson', '555-5678'),
(3, 'Charlie Brown', '555-9012'),
(4, 'Diana Davis', '555-3456'),
(5, 'Ethan Miller', '555-7890'),
(6, 'Fiona Wilson', '555-2345'),
(7, 'George Taylor', '555-6789'),
(8, 'Hannah Moore', '555-0123'),
(9, 'Isaac Green', '555-4567'),
(10, 'Julia White', '555-8901'),
(11, 'Kevin Black', '555-2468'),
(12, 'Laura Grey', '555-9123');


-- Data for clubs table
INSERT INTO clubs (club_ID, club_Title) VALUES
(1, 'Chess Club'),
(2, 'Debate Team'),
(3, 'Drama Club'),
(4, 'Coding Club'),
(5, 'Music Club'),
(6, 'Robotics Club'),
(7, 'Volunteer Group'),
(8, 'Outdoor Adventures'),
(9, 'Photography Club'),
(10, 'Book Club');



-- Data for events table
INSERT INTO events (club_ID, event_ID, event_Date) VALUES
(1, 101, DATE '2024-09-01'),
(1, 103, DATE '2024-09-15'),
(2, 102, DATE '2024-09-08'),
(2, 104, DATE '2024-09-22'),
(4, 105, DATE '2024-09-29'),
(5, 106, DATE '2024-10-06'),
(6, 107, DATE '2024-10-13'),
(7, 108, DATE '2024-10-20'),
(8, 109, DATE '2024-10-27'),
(9, 110, DATE '2024-11-03'),
(10, 111, DATE '2024-11-10');



-- Data for enrollments table 
INSERT INTO enrollments (club_ID, student_ID, enrollment_Date, club_Role) VALUES
(1, 1, DATE '2024-08-23', 'President'),
(1, 2, DATE '2024-08-23', 'Member'),
(1, 3, DATE '2024-08-23', 'Member'),  
(1, 5, DATE '2024-08-23', 'Member'),
(2, 1, DATE '2024-08-23', 'Captain'),
(2, 3, DATE '2024-08-23', 'Member'),
(2, 6, DATE '2024-08-23', 'Member'),
(3, 2, DATE '2024-08-23', 'Stage Manager'),
(3, 4, DATE '2024-08-23', 'Actor'),
(3, 8, DATE '2024-08-23', 'Actor'),
(4, 5, DATE '2024-08-23', 'Lead Developer'),
(4, 9, DATE '2024-08-23', 'Member'),
(5, 7, DATE '2024-08-23', 'Conductor'),
(5, 8, DATE '2024-08-23', 'Member'),
(6, 9, DATE '2024-08-23', 'Engineer'),
(6, 12, DATE '2024-08-23', 'Member'),
(7, 1, DATE '2024-09-01', 'Volunteer'),
(7, 2, DATE '2024-09-01', 'Volunteer'),
(8, 3, DATE '2024-09-08', 'Member'),
(8, 6, DATE '2024-09-08', 'Member'),
(9, 7, DATE '2024-09-08', 'Member'),
(9, 10, DATE '2024-09-08', 'Member'),
(10, 8, DATE '2024-09-22', 'Member'),
(10, 12, DATE '2024-09-22', 'Member');


-- Data for attendances table 
INSERT INTO attendances (event_ID, student_ID) VALUES
(101, 1),
(101, 2),
(101, 3),
(101, 5),
(102, 1),
(102, 2),
(102, 3),
(102, 6),
(102, 7),
(103, 1),
(103, 2),
(103, 3),
(103, 4),
(104, 5),
(104, 6),
(104, 7),
(105, 8),
(105, 9),
(106, 10),
(106, 11),
(107, 1),
(107, 2),
(108, 3),
(108, 4),
(109, 5),
(109, 6),
(109, 7),
(110, 8),
(110, 9),
(110, 10);

--Query 1
SELECT * FROM enrollments e
WHERE e.club_Role LIKE '%Member%'
ORDER BY e.student_ID ASC;


--Query 2
SELECT e.club_Role, c.club_ID, s.student_ID FROM students s
JOIN enrollments e ON s.student_ID = e.student_ID
JOIN clubs c ON c.club_ID = e.club_ID
WHERE e.club_ID = 2;


--Query 3
SELECT s.student_Name, s.student_ID,s.student_Phone, c.club_Title, e.event_ID, e.event_Date FROM students s
LEFT JOIN attendances a ON s.student_ID = a.student_ID
LEFT JOIN events e ON a.event_ID = e.event_ID
LEFT JOIN clubs  c ON e.club_ID = c.club_ID;


--Query 4
SELECT  c.club_Title, COUNT (e.enrollment_Date) AS enrollCount FROM enrollments e
JOIN clubs c ON c.club_ID = e.club_ID
GROUP BY c.club_Title, e.enrollment_Date;

--Query 5
SELECT * FROM students s
WHERE s.student_ID IN (
	SELECT e.student_ID
	FROM enrollments e
	WHERE e.club_Role LIKE 'Volunteer'
)

--Query 6
SELECT e.student_ID FROM enrollments e
WHERE e.club_ID =1
UNION
SELECT e.student_ID FROM enrollments e
WHERE e.club_ID = 8;

--Query 7
INSERT INTO events (club_ID, event_ID, event_Date) VALUES
(1, 120, DATE '2022-09-01');

--Query 8

INSERT INTO enrollments (club_ID, student_ID, enrollment_Date, club_Role) VALUES
(1, 1, DATE '2024-09-24', 'President');




--Index
CREATE INDEX idx_clubID_AND_role
ON enrollments (club_ID, club_Role);





