--SQLQuery0 - CHECK.sql
USE PV_522_Import
SET DATEFIRST 1;

--Print dbo.GetNextLearningDate(N'PV_522');
EXEC sp_SelectSchedule;

--PRINT dbo.GetNextLearningDay(N'PV_522', N'2026-03-19')
--PRINT dbo.GetNextLearningDate(N'PV_522', N'2026-03-21')

--PRINT dbo.GetNewYearHolidaysStartDate(2025);
--PRINT dbo.GetSummerHolidaysStartDate(2025);
--PRINT dbo.GetEasterDate(2022);

--PRINT dbo.GetHolidayStartDate(2026, N'Новогодние');
--PRINT dbo.GetHolidayStartDate(2026, N'23%');
--PRINT dbo.GetHolidayStartDate(2026, N'8%');
--PRINT dbo.GetHolidayStartDate(2026, N'Пасха');
--PRINT dbo.GetHolidayStartDate(2026, N'Майские%');
--PRINT dbo.GetHolidayStartDate(2026, N'Летние');

--EXEC sp_InsertAllHolidaysFor 2026;
--SELECT [date], holiday_name FROM DaysOFF,Holidays WHERE holiday=holiday_id;