--SQLQuery4 - CREATE Schadule branch
USE PV_522_DDL;

CREATE TABLE Schedule
(
	lesson_id		BIGINT				PRIMARY KEY,
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
	PRIMARY KEY(lesson, [group]),
	[data]			VARBINARY(2000),
	discription		VARCHAR(255),
	CONSTRAINT		CK_Payload	CHECK([description] IS NOT NULL OR [data] IS NOT NULL)
);