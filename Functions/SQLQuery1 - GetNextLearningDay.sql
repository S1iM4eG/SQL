--SQLQuery1 - GetNextLearningDay.sql -возвращает день недели, в который должн опройти следующее занятие.
USE PV_522_Import
SET DATEFIRST 1;
GO

ALTER FUNCTION GetNextLearningDay (@group_name AS NCHAR(10), @last_learning_date AS DATE) RETURNS TINYINT
AS
BEGIN
	DECLARE @group_id			AS	INT		= (SELECT group_id	FROM Groups	WHERE group_name = @group_name);
	DECLARE	@learning_days		AS	TINYINT	= (SELECT learning_days FROM Groups WHERE group_id=@group_id);
	DECLARE @last_learning_day	AS	TINYINT	= DATEPART(WEEKDAY, @last_learning_date);
	DECLARE @next_learning_day	AS	TINYINT	= 0;
	DECLARE @day				AS	TINYINT	= @last_learning_day + 1;
	WHILE @day < 7
	BEGIN
		IF	@learning_days & POWER(2, @day%7 - 1) <> 0  -- POWER(Основание_степени, показатель_степени). <> - НЕ равно
		BEGIN
			SET @next_learning_day = @day;
			RETURN @next_learning_day;
		END
		SET @day +=1;
	END
	RETURN @next_learning_day
END
