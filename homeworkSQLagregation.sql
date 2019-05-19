1.
SELECT  COUNT (DISTINCT t."name")
FROM public."Departments" d,public."Faculties" f, public."Groups" g, public."Groups_lectures" gl,
	public."Lectures" l, public."Teachers" t
WHERE d."name" like 'Software Development' AND g.department_id = d.id AND d.faculty_id = f.id AND
	gl.group_id = g.id AND gl.lecture_id = l.id AND l.teacher_id = t.id;

2.
SELECT COUNT( l.teacher_id)
FROM  public."Lectures" l, public."Teachers" t, public."Subject" s
WHERE l.teacher_id = t.id 
	AND l.subject_id = s.id 
	AND t."name" LIKE 'Dave' 
	AND t.surname LIKE 'McQueen';
3.
SELECT COUNT (*)  
FROM public."Lectures" l
WHERE l.lecture_room LIKE 'D201';

4.
SELECT l.lecture_room, count(l.lecture_room)
FROM public."Lectures" l
GROUP BY l.lecture_room;

6.
SELECT SUM( t.salary)/COUNT(t.id) AS average_salary
FROM public."Faculties" f, public."Departments" d,
	 public."Groups" g, public."Groups_lectures" gl,
	 public."Lectures" l, public."Teachers" t
WHERE f."name" LIKE 'Computer Science' AND d.faculty_id = f.id 
	 AND g.department_id = d.id AND gl.group_id = g.id 
	 AND gl.lecture_id = l.id AND l.teacher_id = t.id;

8.
SELECT SUM(d.financing)/COUNT (d.id)
FROM public."Departments" d;

9.
SELECT t.name||' '||t.surname AS fullname, count( s.id)
FROM public."Teachers" t, public."Lectures" l,public."Subject" s
WHERE l.teacher_id=t.id AND l.subject_id=s.id
GROUP BY fullname;

10.
SELECT l.day_of_week, count(l.id)
FROM public."Lectures" l
GROUP BY l.day_of_week
ORDER BY l.day_of_week ASC;

11.
SELECT DISTINCT l.lecture_room, COUNT (d.name)  
FROM public."Lectures" l, public."Departments" d, public."Groups_lectures" gl, public."Groups" g
WHERE gl.lecture_id=l.id AND gl.group_id = g.id AND g.department_id = d.id
GROUP BY l.lecture_room
ORDER BY count;

12.
SELECT f."name", COUNT (DISTINCT s."name")
FROM public."Faculties" f, public."Departments" d,
	 public."Groups" g, public."Groups_lectures" gl,
	 public."Lectures" l, public."Subject" s
WHERE d.faculty_id = f.id 
	  AND g.department_id = d.id AND gl.group_id = g.id 
 	  AND gl.lecture_id = l.id AND l.subject_id = s.id
GROUP BY f."name";

13.
SELECT distinct t."name" || ' ' || t.surname AS fullname,l.lecture_room, count(s.id)
FROM public."Lectures" l, public."Subject" s, public."Teachers" t
WHERE l.subject_id = s.id AND l.teacher_id = t.id
GROUP BY fullname, l.lecture_room;