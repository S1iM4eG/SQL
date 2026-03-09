--SQLQuery5 - SELECT CountDisciplines.sql
USE PV_522_Import

SELECT	COUNT (first_name) AS [Количество преподавателей дисциплины]
	
FROM	Teachers,Disciplines,TeachersDisciplinesRelation
WHERE	/*last_name = 'Твердохлеб'*/ discipline_name = 'Процедурное программирование на языке C++'
AND		discipline_id = discipline
AND		teacher = teacher_id
