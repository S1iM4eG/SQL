--SQLQuery0 - CHECK.sql
USE PV_522_Import

--Print dbo.GetLastLearningDate(N'PV_522');
--EXEC sp_SelectSchedule;

PRINT dbo.GetNextLearningDay(N'PV_522', N'2026-03-19')