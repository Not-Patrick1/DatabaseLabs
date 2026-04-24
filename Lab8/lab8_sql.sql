--Patrick Murray, 4/24/2026, Lab 8

--base table creation stuff
DROP TABLE IF EXISTS lab8_enrollment_audit;
DROP TABLE IF EXISTS lab8_enrollments;
DROP TABLE IF EXISTS lab8_courses;
DROP TABLE IF EXISTS lab8_students;

CREATE TABLE lab8_students (
  student_id INT PRIMARY KEY,
  student_name TEXT NOT NULL
);

CREATE TABLE lab8_courses (
  course_id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  capacity INT NOT NULL CHECK (capacity > 0),
  enrolled_count INT NOT NULL DEFAULT 0 CHECK (enrolled_count >= 0 AND enrolled_count <= capacity)
);

CREATE TABLE lab8_enrollments (
  student_id INT NOT NULL REFERENCES lab8_students(student_id),
  course_id TEXT NOT NULL REFERENCES lab8_courses(course_id),
  enrolled_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (student_id, course_id)
);

CREATE TABLE lab8_enrollment_audit (
  audit_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  action_type TEXT NOT NULL,
  student_id INT NOT NULL,
  course_id TEXT NOT NULL,
  action_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--insertion statements

INSERT INTO lab8_students (student_id, student_name) VALUES
  (1, 'Alice Johnson'),
  (2, 'Brian Smith'),
  (3, 'Carla Martinez'),
  (4, 'Daniel Wu'),
  (5, 'Emily Davis'),
  (6, 'Franklin Moore'),
  (7, 'Grace Lee'),
  (8, 'Henry Thompson'),
  (9, 'Isabella Clark'),
  (10, 'Jacob Wilson');

INSERT INTO lab8_courses (course_id, title, capacity, enrolled_count) VALUES
  ('CS101', 'Intro to Computer Science', 30, 3),
  ('MATH201', 'Calculus II', 25, 2),
  ('ENG150', 'English Literature', 20, 1),
  ('BIO110', 'General Biology', 40, 2),
  ('ART100', 'Foundations of Art', 1, 1);  -- tiny capacity


INSERT INTO lab8_enrollments (student_id, course_id) VALUES
  (1, 'CS101'),
  (2, 'CS101'),
  (3, 'CS101'),

  (4, 'MATH201'),
  (5, 'MATH201'),

  (6, 'ENG150'),

  (7, 'BIO110'),
  (8, 'BIO110'),

  (9, 'ART100');  -- only 1 allowed


INSERT INTO lab8_enrollment_audit (action_type, student_id, course_id) VALUES
  ('ENROLL', 1, 'CS101'),
  ('ENROLL', 2, 'CS101'),
  ('ENROLL', 3, 'CS101'),

  ('ENROLL', 4, 'MATH201'),
  ('ENROLL', 5, 'MATH201'),

  ('ENROLL', 6, 'ENG150'),

  ('ENROLL', 7, 'BIO110'),
  ('ENROLL', 8, 'BIO110'),

  ('ENROLL', 9, 'ART100'),

  ('DROP', 3, 'CS101'),
  ('DROP', 6, 'ENG150');


--Create both roles

CREATE ROLE advisor_role;
CREATE ROLE registrar_role;

--Grant statements
GRANT SELECT ON lab8_students,lab8_courses,lab8_enrollments TO advisor_role;

GRANT SELECT ON lab8_students,lab8_courses,lab8_enrollments TO registrar_role;

GRANT INSERT ON lab8_enrollments TO registrar_role;

GRANT UPDATE ON lab8_enrollments TO registrar_role;

REVOKE DELETE ON lab8_enrollments FROM registrar_role;

--query for privileges
SELECT grantee, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE grantee IN ('advisor_role', 'registrar_role')
  AND table_name IN ('lab8_students', 'lab8_courses', 'lab8_enrollments')
ORDER BY grantee, table_name, privilege_type;

--stored procedure

CREATE OR REPLACE PROCEDURE register_student(
    procStudent_id INT,
    procCourse_id TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- 1. Check if student exists
    IF NOT EXISTS (
        SELECT 1 FROM lab8_students s WHERE s.student_id = procStudent_id
    ) THEN
        RAISE NOTICE 'Student does not exist';
        RETURN;
    END IF;

    -- 2. Check if course exists
    IF NOT EXISTS (
        SELECT 1 FROM lab8_courses c WHERE c.course_id = procCourse_id
    ) THEN
        RAISE NOTICE 'Course does not exist';
        RETURN;
    END IF;

    -- 3. Check if already enrolled
    IF EXISTS (
        SELECT 1 FROM lab8_enrollments e
        WHERE e.student_id = procStudent_id
          AND e.course_id = procCourse_id
    ) THEN
        RAISE NOTICE 'Student is already enrolled';
        RETURN;
    END IF;

    -- 4. Check if course is full
    IF (
        SELECT COUNT(*) FROM lab8_enrollments e WHERE e.course_id = procCourse_id
    ) >= (
        SELECT c.capacity FROM lab8_courses c WHERE c.course_id = procCourse_id)
		THEN
        RAISE NOTICE 'No room in the class';
        RETURN;
    END IF;

    -- 5. Insert enrollment
    INSERT INTO lab8_enrollments(student_id, course_id)
    VALUES (procStudent_id, procCourse_id);
    UPDATE lab8_courses set enrolled_count = enrolled_count+1 
    WHERE course_id = procCourse_id;

    RAISE NOTICE 'Student successfully enrolled';
END;
$$;

--First call
CALL register_student(4,'MATH201');

--Dupe call
CALL register_student(4,'MATH201');

--Full class call
CALL register_student(7, 'ART100');

--create function
CREATE OR REPLACE FUNCTION audit_enrollment_insert()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO lab8_enrollment_audit(student_id, course_id, action_type)
    VALUES (NEW.student_id, NEW.course_id, 'INSERT');
    RETURN NEW;
END;
$$;

--create trigger
CREATE TRIGGER audit_enroll
	AFTER INSERT ON lab8_enrollments
	FOR EACH ROW
	EXECUTE FUNCTION audit_enrollment_insert();
 
--call enrollment
CALL register_student(2, 'MATH201');

--check audit
SELECT * FROM lab8_enrollment_audit;

--queries
SELECT * FROM lab8_enrollments;

SELECT course_id, title, capacity, enrolled_count, capacity-enrolled_count AS seats_left FROM lab8_courses;

SELECT * FROM lab8_enrollment_audit
ORDER BY action_time DESC;


SELECT grantee, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE grantee IN ('advisor_role', 'registrar_role')
AND table_name IN ('lab8_students', 'lab8_courses', 'lab8_enrollments')
ORDER BY grantee, table_name, privilege_type;
