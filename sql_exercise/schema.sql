CREATE SCHEMA ecole;

CREATE TABLE ecole.Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE ecole.Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT,
    capacity INT
);

CREATE TABLE ecole.Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES ecole.Students(student_id),
    FOREIGN KEY (course_id) REFERENCES ecole.Courses(course_id)
);

INSERT INTO ecole.Students (student_id, name, age, gender)
VALUES 
(1, 'Eva Depaepe', 20, 'Femme'),
(2, 'Simon Devoille ', 22, 'Homme'),
(3, 'Cléa Garcia', 21, 'Femme'),
(4, 'Isaac Cuesta', 23, 'Homme'),
(5, 'Geoffrey Johnson', 24, 'Homme');

INSERT INTO university.Courses (course_id, course_name, credits, capacity)
VALUES 
(101, 'mathématiques', 3, 30), 
(102, 'physique ', 4, 25),      
(103, 'chimie ', 3, 40),   
(104, 'Informatique', 4, 20);

-- Inscrire les étudiants aux cours
INSERT INTO university.Enrollments (student_id, course_id)
VALUES
(1, 101),
(2, 101),
(3, 101),
(4, 101),
(5, 101),
(1, 102),
(2, 102),
(3, 103),
(4, 103),
(5, 104);
