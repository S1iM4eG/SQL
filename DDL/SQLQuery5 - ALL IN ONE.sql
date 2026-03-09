--SQLQuery5 - ALL IN ONE.sql
USE master;

CREATE DATABASE PV_522_DDL_ALL_IN_ONE
ON
(
	NAME		=	PV_522_DDL_ALL_IN_ONE,
	FILENAME	=	'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PV_522_DDL_ALL_IN_ONE.mdf',
	SIZE		=	8 MB,
	MAXSIZE		=	500 MB,
	FILEGROWTH	=	8 MB
)
LOG ON
(
	NAME		=	PV_522_DDL_ALL_IN_ONE_LOG,
	FILENAME	=	'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PV_522_DDL_ALL_IN_ONE.ldf',
	SIZE		=	8 MB,
	MAXSIZE		=	500 MB,
	FILEGROWTH	=	8 MB
);
GO

USE PV_522_DDL_ALL_IN_ONE;

CREATE TABLE Directions
(
	direction_id	SMALLINT	PRIMARY KEY,
	direction_name	NVARCHAR(50)NOT NULL
);

CREATE TABLE Groups
(
	group_id		INT			PRIMARY KEY,
	group_name		NVARCHAR(24)NOT NULL,
	[start_date]	DATE		NOT NULL,
	start_time		TIME		NOT NULL,
	learning_days	INT			NOT NULL,
	direction		SMALLINT	NOT NULL
	CONSTRAINT	FK_Groups_Directions	FOREIGN KEY REFERENCES Directions(direction_id)
);

CREATE TABLE Students
(
	student_id		INT			PRIMARY KEY,
	last_name		NVARCHAR(50)NOT NULL,
	first_name		NVARCHAR(50)NOT NULL,
	middle_name		NVARCHAR(50),
	birthday		DATE		NOT NULL,
	[group]			INT			NOT NULL
	CONSTRAINT	FK_Students_Groups		FOREIGN KEY REFERENCES Groups(group_id)
);

CREATE TABLE Teachers
(
	teacher_id		INT			PRIMARY KEY,
	last_name		NVARCHAR(50)NOT NULL,
	first_name		NVARCHAR(50)NOT NULL,
	middle_name		NVARCHAR(50),
	birthday		DATE		NOT NULL,
	rate			MONEY		NOT NULL	DEFAULT 50
);

CREATE TABLE Disciplines
(
	discipline_id		SMALLINT		PRIMARY KEY,
	discipline_name		NVARCHAR(150)	NOT NULL,
	number_of_lesson	TINYINT			NOT NULL,
);
--PJT - Pure Join Table
CREATE TABLE TeachersDisciplinesRelation
(
	teacher		INT,
	discipline	SMALLINT,
	PRIMARY KEY (teacher,discipline),
	CONSTRAINT FK_TDR_Teachers FOREIGN KEY (teacher) REFERENCES Teachers(teacher_id),
	CONSTRAINT FK_TDR_Discipline FOREIGN KEY (discipline) REFERENCES Disciplines(discipline_id)
);
CREATE TABLE DisciplinesDirectionRelation
(
	discipline SMALLINT,
	direction SMALLINT,
	PRIMARY KEY(discipline,direction),
	CONSTRAINT FK_DDR_Discipline FOREIGN KEY (discipline) REFERENCES Disciplines(discipline_id),
	CONSTRAINT FK_DDR_Directions FOREIGN KEY (direction) REFERENCES Directions(direction_id)
);

CREATE TABLE Schedule
(
	lesson_id		BIGINT				PRIMARY KEY IDENTITY(1,1),--IDENTITY - Autoincrement
	[group]			INT					NOT NULL
	CONSTRAINT	FK_Schedule_Groups		FOREIGN KEY REFERENCES Groups(group_id),
	discipline		SMALLINT			NOT NULL
	CONSTRAINT	FK_Schedule_Discipline	FOREIGN KEY REFERENCES Disciplines(discipline_id),
	[date]			DATE				NOT NULL,
	[time]			TIME(0)				NOT NULL,
	teacher			INT					NOT NULL
	CONSTRAINT	FK_Schedule_Teachers	FOREIGN KEY REFERENCES Teachers(teacher_id),
	[subject]		NVARCHAR(255)			NULL,
	spent			BIT					NOT NULL
	
);

CREATE TABLE Grades
(
	student			INT
	CONSTRAINT	FK_Grades_Students		FOREIGN KEY REFERENCES Students(student_id),
	lesson			BIGINT
	CONSTRAINT	FK_Grades_Shcedule		FOREIGN KEY REFERENCES Schedule(lesson_id),
	PRIMARY KEY(student, lesson),
	grade_1			TINYINT	CONSTRAINT CK_Grade_1 CHECK (grade_1 > 0 AND grade_1 <= 12)	NULL,
	grade_2			TINYINT					NULL,
	CONSTRAINT CK_Grade_2 CHECK (grade_2 > 0 AND grade_2 <= 12)
);

CREATE TABLE HomeWorks
(
	lesson			BIGINT
	CONSTRAINT	FK_HomeWorks_Schedule	FOREIGN KEY REFERENCES Schedule(lesson_id),
	[group]			INT
	CONSTRAINT	FK_HomeWorks_Groups		FOREIGN KEY REFERENCES Groups(group_id),
	PRIMARY KEY([group], lesson),
	[data]			VARBINARY(2000),
	[description]	VARCHAR(255),
	CONSTRAINT		CK_Payload	CHECK([description] IS NOT NULL OR [data] IS NOT NULL)
);

CREATE TABLE HWResults
(
	lesson			BIGINT,
	[group]			INT,
	--CONSTRAINT	FK_HWResult_Groups		FOREIGN KEY REFERENCES Groups(group_id),
	CONSTRAINT	FK_HWResult_HomeWorks	FOREIGN KEY ([group], lesson) REFERENCES HomeWorks([group], lesson),
	student			INT,
	--CONSTRAINT	FK_HWResult_Students	FOREIGN KEY REFERENCES Students(student_id),
	PRIMARY KEY([group], lesson, student),
	[description]	VARCHAR(255),
	[data]			VARBINARY(2000),
	CONSTRAINT		CK_HWR_Payload	CHECK([description] IS NOT NULL OR [data] IS NOT NULL),
	grade			TINYINT					NULL,
	upload	DATETIME2(0)					NULL,
	CONSTRAINT FK_HWResults_Students FOREIGN KEY (student) 
        REFERENCES Students(student_id)
);

CREATE TABLE Exam
(
	teacher			INT
	CONSTRAINT	FK_Exam_Teachers		FOREIGN KEY REFERENCES Teachers(teacher_id),
	student			INT
	CONSTRAINT	FK_Exam_Students		FOREIGN KEY REFERENCES Students(student_id),
	discipline		SMALLINT
	CONSTRAINT	FK_Exam_Disciplines		FOREIGN KEY REFERENCES Disciplines(discipline_id),
	PRIMARY KEY(teacher, student, discipline),
	grade			INT,
	CONSTRAINT		CK_Grade CHECK (grade > 0 AND grade <= 12),
	completed		DATETIME2(0)
);