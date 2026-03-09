--SQLQuery2-SELECT.sql
USE PV_522_DDL

ALTER TABLE		Groups
ALTER COLUMN	start_time TIME(0) NOT NULL;

SELECT	group_name		AS	N'Группа'
		directiom_name	AS	N'Направление обучения'
		
FROM Groups,Directioms;
Where direction=direction_id
;