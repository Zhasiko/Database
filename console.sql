--1.Write the following queries in SQL, using the university schema:
--a
SELECT * from course
where credits>3

--b
SELECT room_number from classroom
where building = 'Watson' or building = 'Packard'

--c
SELECT * FROM course
WHERE dept_name = 'Comp. Sci.'

--d
SELECT course_id FROM section
where semester = 'Fall'

--e
SELECT * FROM student
WHERE tot_cred > 45 and tot_cred < 90

--f
SELECT name FROM student
WHERE RIGHT(name,1) = 'a' or RIGHT(name,1) = 'e' or RIGHT(name,1) = 'i' or RIGHT(name,1) = 'o' or RIGHT(name,1) = 'u' or RIGHT(name,1) = 'y'

--g
SELECT course_id FROM prereq
WHERE prereq_id ='CS-101'


-----------------------------------------------------------------------------------------------------------------------------------
--2.Write the following queries in SQL, using the university schema:
--a
SELECT dept_name, AVG(salary) AS AVG
FROM instructor GROUP BY dept_name

--b
SELECT building, count( course_id ) cnt
FROM section
GROUP BY building
ORDER BY cnt DESC
LIMIT 1;

--с
SELECT dept_name, count(course_id) cnt
FROM course
GROUP BY dept_name
ORDER BY cnt ASC
LIMIT 1;

--d
SELECT takes.id,student.name, count(takes.id) as cnt
FROM takes
INNER JOIN student
      ON takes.id = student.id
INNER JOIN course
      ON takes.course_id=course.course_id
WHERE course.dept_name = 'Comp. Sci.'
GROUP BY takes.id, student.name
HAVING count(*) > 3

--e
SELECT name from instructor
Where dept_name = 'Music' or dept_name = 'Biology' or dept_name = 'Philosophy'

--f
Select instructor.id,name
FROM instructor
INNER JOIN teaches
ON instructor.id = teaches.id
WHERE year = 2018 and not year = 2017
group by instructor.id

----------------------------------------------------------------------------------------------------------------------------------
--3.Write the following queries in SQL, using the university schema:
--a
SELECT student.name
FROM takes
INNER JOIN course
ON takes.course_id = course.course_id
INNER JOIN student
ON takes.id = student.id
WHERE course.dept_name = 'Comp. Sci.' and (grade = 'A' or grade = 'A-')
GROUP BY student.name
ORDER BY student.name

--b
SELECT name
FROM instructor
INNER JOIN advisor
ON instructor.id = advisor.i_id
INNER JOIN takes
ON advisor.s_id = takes.id
WHERE not takes.grade = 'A' AND not takes.grade = 'A-' AND not takes.grade = 'B' AND not takes.grade = 'B+'
GROUP BY name

--c
SELECT student.dept_name
FROM student
GROUP BY student.dept_name
EXCEPT
SELECT student.dept_name
FROM student
INNER JOIN takes on student.id = takes.id
WHERE grade = 'F' or grade = 'C'
GROUP BY student.dept_name

--d
SELECT teaches.id
FROM teaches
GROUP BY teaches.id
EXCEPT
SELECT teaches.id
FROM teaches
INNER JOIN takes  on teaches.course_id = takes.course_id
WHERE grade = 'A'
GROUP BY teaches.id

--e
SELECT course_id,end_hr,end_min
FROM section
INNER JOIN time_slot on section.time_slot_id = time_slot.time_slot_id
WHERE end_hr < 13
group by course_id,end_hr,end_min
ORDER BY end_hr
--------------------------------------------------------------------------------------------------------------------------