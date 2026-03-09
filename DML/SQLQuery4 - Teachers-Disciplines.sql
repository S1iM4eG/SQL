--SQLQuery4 - SELECT Teachers-Disciplines.sql
USE PV_522_Import

SELECT	last_name	AS	[Фамилия], 
		first_name	AS	[Имя],
		middle_name	AS	[Отчество],
		birth_date	AS	[Дата рождения],
		discipline_name AS [Наименовение дисциплины],
		number_of_lessons AS [Количество пар]

FROM	Teachers,Disciplines,TeachersDisciplinesRelation
WHERE	last_name = 'Ковтун' --discipline_name = 'JavaScript'
AND		discipline_id = discipline
AND		teacher = teacher_id
