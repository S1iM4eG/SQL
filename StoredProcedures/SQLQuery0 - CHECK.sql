--SQLQuery0 - CHECK.sql
USE PV_522_Import;
SET DATEFIRST 1;
SET LANGUAGE RUSSIAN;

--DELETE FROM Schedule --WHERE discipline = (SELECT discipline_id FROM Disciplines WHERE discipline_name=N'HTML/CSS')
--EXEC sp_SelectSchedule;
--EXECUTE sp_SelectSchedule;

EXEC	sp_InsertSchedule N'PV_522', N'%Win%C++', N'Олег', N'2025-12-09'
EXEC	sp_InsertSchedule N'PV_522', N'%Win%C#', N'Олег', N'2025-12-30'
--EXEC	sp_InsertSchedule N'PV_522', N'%программирование MS SQL Server', N'Олег', N'2026-01-20'
--EXEC	sp_SelectSchedule;
EXECUTE	sp_SelectSchedule;
--EXEC	sp_SelectDisciplineFromSchedule N'%ADO.NET%'