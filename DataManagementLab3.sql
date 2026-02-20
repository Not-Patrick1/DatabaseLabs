--Create Table Statements
CREATE TABLE student(
	student_ID int PRIMARY KEY,
	student_Name text
)


CREATE TABLE Club (
	club_ID int PRIMARY KEY,
	club_Name text
)


CREATE TABLE Enrollment(
	FOREIGN KEY (student_ID) REFERENCES student(student_ID),
	FOREIGN KEY (club_ID) REFERENCES club (club_ID),
	student_ID int,
	club_ID int,
	join_Date DATE,
	club_Role text,
	PRIMARY KEY (student_ID, club_ID, join_Date)
)


CREATE TABLE meeting (
	club_ID int,
	FOREIGN KEY (club_ID) REFERENCES club (club_ID),
	building text,
	room_Number int,
	meet_Date DATE,
	meet_Time TIME,
	activity text,
	PRIMARY KEY (club_ID, building, room_Number, meet_Date, meet_Time),
	constraint check_Room CHECK (room_Number<350),
	constraint check_Time CHECK (meet_Time<'22:00:00')
)

--Student Insertion:
INSERT INTO student (student_ID, student_Name)
Values(202456, 'Mary White');

INSERT INTO student (student_ID, student_Name)
Values(104455, 'Steve Pond');

INSERT INTO student (student_ID, student_Name)
Values(201567, 'Don Cheeter');

INSERT INTO student (student_ID, student_Name)
Values(303564, 'Todd Marist');

INSERT INTO student (student_ID, student_Name)
Values(670435, 'Greg Wall');

INSERT INTO student (student_ID, student_Name)
Values(890345, 'Peter Jacobsen');

INSERT INTO student (student_ID, student_Name)
Values(830545, 'Amy Morano');

INSERT INTO student (student_ID, student_Name)
Values(202345, 'Rock Jones');

--Club Insertion:
INSERT INTO club (club_ID, club_Name)
Values(201, 'Game Society');

INSERT INTO club (club_ID, club_Name)
Values(224, 'Rock Climbing');

INSERT INTO club (club_ID, club_Name)
Values(147, 'Baseball');

INSERT INTO club (club_ID, club_Name)
Values(507, 'Outing Club');

INSERT INTO club (club_ID, club_Name)
Values(123, 'Lacrosse');

INSERT INTO club (club_ID, club_Name)
Values(304, 'ESports Club');

INSERT INTO club (club_ID, club_Name)
Values(401, 'Lifting Club');

INSERT INTO club (club_ID, club_Name)
Values(187, 'Track');

--Meeting Insertion:

INSERT INTO meeting (club_ID, building, room_number, meet_date, meet_time, activity)
Values(201, 'Student Center', '004', '04/14/2026','16:00','Super Smash Tournament')

INSERT INTO meeting (club_ID, building, room_number, meet_date, meet_time, activity)
Values(401, 'McCann Center', '166', '03/19/2026','21:00','Group Lift')

INSERT INTO meeting (club_ID, building, room_number, meet_date, meet_time, activity)
Values(224, 'McCann Center', '102', '02/10/2026','19:00','Grip Training')

INSERT INTO meeting (club_ID, building, room_number, meet_date, meet_time, activity)
Values(123, 'McCann Center', '114', '01/10/2026','12:00','Practice')

INSERT INTO meeting (club_ID, building, room_number, meet_date, meet_time, activity)
Values(304, 'Hancock', '018', '05/22/2026','14:00','Practice')

INSERT INTO meeting (club_ID, building, room_number, meet_date, meet_time, activity)
Values(147, 'McCann Center', '001', '04/25/2026','15:00','Practice')

INSERT INTO meeting (club_ID, building, room_number, meet_date, meet_time, activity)
Values(507, 'Dyson', '342', '04/02/2026','15:00','Waiver Signing')

INSERT INTO meeting (club_ID, building, room_number, meet_date, meet_time, activity)
Values(401, 'McCann Center', '007', '03/02/2026','15:00','Group Cardio')

--Enrollment Insertion:

INSERT INTO enrollment (student_ID, club_ID, join_Date, club_Role)
Values(202345, 224, '09-04-2022','President')

INSERT INTO enrollment (student_ID, club_ID, join_Date, club_Role)
Values(670435, 401, '10-12-2022','President')

INSERT INTO enrollment (student_ID, club_ID, join_Date, club_Role)
Values(830545, 187, '11-15-2025', NULL)

INSERT INTO enrollment (student_ID, club_ID, join_Date, club_Role)
Values(890345, 147, '12-15-2025', NULL)

INSERT INTO enrollment (student_ID, club_ID, join_Date, club_Role)
Values(890345, 304, '12-15-2025', NULL)

INSERT INTO enrollment (student_ID, club_ID, join_Date, club_Role)
Values(890345, 123, '12-15-2025', 'Treasurer')

INSERT INTO enrollment (student_ID, club_ID, join_Date, club_Role)
Values(201567, 224, '04-02-2023', NULL)

INSERT INTO enrollment (student_ID, club_ID, join_Date, club_Role)
Values(201567, 201, '04-02-2023', 'Treasurer')


--Queries

SELECT c.club_Name, m.activity 
FROM club c
JOIN meeting m on c.club_ID = m.club_ID;

SELECT s.student_Name, c.club_Name, e.club_Role
FROM student s
JOIN enrollment e on s.student_ID = e.student_ID
JOIN club c on e.club_ID = c.club_ID;

SELECT s.student_Name, c.club_Name, e.club_Role
FROM student s
JOIN enrollment e on s.student_ID = e.student_ID
JOIN club c on e.club_ID = c.club_ID
WHERE  e.club_Role = 'President';

SELECT s.student_Name, c.club_Name, e.club_Role
FROM student s
JOIN enrollment e on s.student_ID = e.student_ID
JOIN club c on e.club_ID = c.club_ID
WHERE  c.club_Name like '%r%'
ORDER BY c.club_Name DESC;

SELECT s.student_Name, c.club_Name, e.club_Role
FROM student s
JOIN enrollment e on s.student_ID = e.student_ID
JOIN club c on e.club_ID = c.club_ID
WHERE  e.club_Role IS NULL;

INSERT INTO enrollment (student_ID, club_ID, join_Date, club_Role)
Values(222222, 224, '09-04-2022','President')
INSERT INTO meeting (club_ID, building, room_number, meet_date, meet_time, activity)
VALUES (401, 'McCann Center', '166', '03/19/2026', '23:00', 'Group Lift');













