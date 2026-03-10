--SQLQuery5 - SELECT CountDisciplines.sql
USE PV_522_Import

SELECT	--COUNT (teacher_id) AS [Количество преподавателей дисциплины]
		COUNT (discipline_id)	AS [Количество преподаваемых дисциплины]
FROM	Teachers,Disciplines,TeachersDisciplinesRelation
WHERE	last_name = 'Твердохлеб' --discipline_name = 'Процедурное программирование на языке C++'
--AND		first_name = 'Александр'
AND		discipline_id = discipline
AND		teacher = teacher_id
