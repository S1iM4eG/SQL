--SQLQuery5 - COUNT-Disciplines.sql
USE PV_522_Import

SELECT	discipline_name

FROM	Teachers, Disciplines, TeachersDisciplinesRelation
WHERE	teacher = teacher_id AND discipline = discipline_id AND last_name = N'Глазунов'