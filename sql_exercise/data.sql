INSERT INTO ecole.Students (student_id, name, age, gender)
VALUES 
(1, 'Eva Depaepe', 20, 'Femme'),
(2, 'Simon Devoille ', 22, 'Homme'),
(3, 'Cléa Garcia', 21, 'Femme'),
(4, 'Isaac Cuesta', 23, 'Homme'),
(5, 'Geoffrey Johnson', 24, 'Homme');

INSERT INTO ecole.Courses (course_id, course_name, credits, capacity)
VALUES 
(101, 'mathématiques', 3, 30), 
(102, 'physique ', 4, 25),      
(103, 'chimie ', 3, 40),   
(104, 'Informatique', 4, 20);

-- Inscrire les étudiants aux cours
INSERT INTO ecole.Enrollments (student_id, course_id)
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
