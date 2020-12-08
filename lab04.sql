CREATE DATABASE StudentData
GO
CREATE TABLE StudentInfo(
	StudenID int, CONSTRAINT PK_StundentID PRIMARY KEY(StudenId),
	Name varchar(50) NOT NULL,
	NgaySinh datetime  NULL,
	Email varchar(50) unique NULL
	)
GO
CREATE TABLE ClassInfo(
	ClassID bigint NOT NULL,
	Teacher varchar(50) NOT NULL,
	Fee money NOT NULL
	)
GO
CREATE TABLE StudentClass
	StudenID int,
	CONSTRAINT FK_StudentId FOREIGN KEY(StudentID) REFERENCES StudentInfo(StudentId),
	ClassID bigint NOT NULL,
	CONSTRAINT FK_ClassID FOREIGN KEY(ClassID) REFERENCES ClassInfo(ClassID),
	Status varchar(100)DEFAULT(Dang hoc) NULL,
	Mark bigint NOT NULL
	)