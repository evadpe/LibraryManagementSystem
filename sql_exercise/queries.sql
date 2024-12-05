-- Requête 1 : Récupérer la liste de tous les étudiants et des cours auxquels ils sont inscrits, y compris le nom du cours et les crédits.

SELECT 
    s.student_id,
    s.name AS student_name,
    c.course_name,
    c.credits
FROM 
    ecole.Students s
JOIN 
    ecole.Enrollments e ON s.student_id = e.student_id
JOIN 
    ecole.Courses c ON e.course_id = c.course_id

-- Requête 2 : Rechercher les étudiants qui ne sont inscrits à aucun cours.

SELECT 
    s.student_id,
    s.name AS student_name
FROM 
    ecole.Students s
LEFT JOIN 
    ecole.Enrollments e ON s.student_id = e.student_id
WHERE 
    e.student_id IS NULL;

-- Requête 3 : Énumérez tous les cours et le nombre d’étudiants inscrits à chaque cours.

SELECT 
    c.course_name,
    COUNT(e.student_id) AS num_students
FROM 
    ecole.Courses c
LEFT JOIN 
    ecole.Enrollments e ON c.course_id = e.course_id
GROUP BY 
    c.course_id, c.course_name
ORDER BY 
    num_students DESC;

--Requête 4 : Identifier les cours où le nombre d’inscriptions dépasse la moitié de la capacité du cours.

SELECT 
    c.course_name,
    c.capacity,
    COUNT(e.student_id) AS num_students
FROM 
    ecole.Courses c
LEFT JOIN 
    ecole.Enrollments e ON c.course_id = e.course_id
GROUP BY 
    c.course_id, c.course_name, c.capacity
HAVING 
    COUNT(e.student_id) > c.capacity / 2
ORDER BY 
    num_students DESC;

--Requête 5 : Trouver les étudiants inscrits au nombre maximal de cours.
SELECT 
    s.student_id,
    s.name AS student_name,
    COUNT(e.course_id) AS num_courses
FROM 
    ecole.Students s
JOIN 
    ecole.Enrollments e ON s.student_id = e.student_id
GROUP BY 
    s.student_id, s.name
HAVING 
    COUNT(e.course_id) = (
        SELECT 
            MAX(course_count)
        FROM 
            (
                SELECT 
                    COUNT(e.course_id) AS course_count
                FROM 
                    ecole.Enrollments e
                GROUP BY 
                    e.student_id
            ) AS subquery
    )
ORDER BY 
    s.student_id;

--Requête 6 : Calculez le total des crédits que chaque étudiant suit actuellement.

SELECT 
    s.student_id,
    s.name AS student_name,
    SUM(c.credits) AS total_credits
FROM 
    ecole.Students s
JOIN 
    ecole.Enrollments e ON s.student_id = e.student_id
JOIN 
    ecole.Courses c ON e.course_id = c.course_id
GROUP BY 
    s.student_id, s.name
ORDER BY 
    total_credits DESC;

--Requête 7 : Identifier les cours sans inscription.

SELECT 
    c.course_id,
    c.course_name,
    c.capacity
FROM 
    ecole.Courses c
LEFT JOIN 
    ecole.Enrollments e ON c.course_id = e.course_id
WHERE 
    e.student_id IS NULL
ORDER BY 
    c.course_id;

-- Supprimez toutes les inscriptions à un cours spécifique sans supprimer le cours lui-même.
DELETE FROM ecole.Enrollments
WHERE course_id = 101;

-- Supprimer tous les étudiants qui ne se sont inscrits à aucun cours.

DELETE FROM ecole.Students
WHERE student_id NOT IN (
    SELECT DISTINCT student_id
    FROM ecole.Enrollments
);
