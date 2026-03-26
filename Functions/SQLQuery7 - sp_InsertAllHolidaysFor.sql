--SQLQuery7 - sp_InsertAllHolidaysFor.sql
USE PV_522_Import;
SET DATEFIRST 1;
GO

CREATE OR ALTER PROCEDURE sp_InsertAllHolidaysFor @year AS SMALLINT
AS
BEGIN
	EXEC sp_insertHolidays @year, N'Новогодние%';
	EXEC sp_insertHolidays @year, N'23%';
	EXEC sp_insertHolidays @year, N'8%';
	EXEC sp_insertHolidays @year, N'Пасха';
	EXEC sp_insertHolidays @year, N'Майские%';
	EXEC sp_insertHolidays @year, N'Летние%';
END