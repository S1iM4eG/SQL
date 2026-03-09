--SQLQuery6 - SELECT Disciplines.sql
USE PV_522_Import

SELECT	discipline_id		AS [id дисциплины],
		discipline_name		AS [Наименовение дисциплины],
		number_of_lessons	AS [Количество пар]

FROM	Disciplines
