--SQLQuery1 - INSERT Directions.sql
USE PV_522_DDL;

--INSERT Directions
--			(direction_id, direction_name)
--VALUES		(1,		N'Разработка программного обеспечения'); -- N'Unicode string'

--INSERT Directions
--			(direction_id, direction_name)
--VALUES
--			(2,			N'Компьютерная графика и дизайн'),
--			(3,			N'Сетевые технологии и системное администрирование')
--			;

INSERT Directions
VALUES
			(4, N'Java development'),
			(4, N'C++ development'),
			(4, N'Python development'),
			(4, N'GameDev'),
			(4, N'Android development'),
			(4, N'.NET development'),
			(4, N'Web development')
			;
SELECT * FROM Directions;		-- * - все поля