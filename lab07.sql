CREATE DATABASE Lab07
GO
-- Copy data tu bang WorkOrder cua CSDL AdventuWorks sang  CSDL lab07 vua tao
USE AdventureWorks2019
SELECT * INTO Lab07.dbo.WorkOrder FROM Production.WorkOrder
-- Copy data tu bang WorkOrder cua CSDL lab07 sang bang WorkOrderIX cua CSDL lab07

USE Lab07
SELECT*INTO WorkOrderIX  FROM WorkOrder
GO
SELECT * FROM WorkOrder
SELECT * FROM WorkOrderIX
GO
-- Tao mot INDEX tren cot WorkOrderID cua bang WorkOrderIX bang cau lenh sau
CREATE INDEX IX_WorkOrderID ON WorkOrderIx(WorkOrderID)

SELECT * FROM WorkOrder Where WorkOrderID = 72000
SELECT * FROM WorkOrderIX Where WorkOrderID = 72000

--Phan II
CREATE DATABASE Aptech
USE Aptech
CREATE TABLE Classes
(
	ClassName char(6),
	Teacher varchar(30),
	TimeSlot varchar(30),
	Class int,
	Lab int
	)

CREATE CLUSTERED INDEX MyClusteredIndex ON Classes(ClassName)
WITH(Pad_Index = on,FillFactor=70)

CREATE INDEX TeacherIndex ON Classes(Teacher)
DROP INDEX TeacherIndex ON Classes

CREATE INDEX  CLASSLABINDEX ON CLASSES(Class,Lab)

DROP INDEX  * ON Aptech
--Phan IV
CREATE DATABASE QLSV
USE QLSV
CREATE TABLE Student
	(
	StudentNo int , CONSTRAINT PK_StudentNo PRIMARY KEY(StudentNo), 
	StudentName varchar(50),
	StudentAddress varchar(100),
	PhoneNo int
	)
	DROP TABLE Student
CREATE TABLE Department
	(
	DepNo int PRIMARY KEY,
	DepName varchar(50),
	ManagerName char(30),
	)
CREATE TABLE Assignment
	(
	AssignmentNo int PRIMARY KEY ,
	Description varchar(100),
	)
CREATE TABLE Works_Assign
	(
	JobID int PRIMARY KEY,
	StudentNo int,
	AssignmentNo int,
	TotalHours int,
	JobDetails XML,
	CONSTRAINT FK_StudentNo FOREIGN KEY(StudentNo) REFERENCES Student(StudentNo),
	CONSTRAINT FK_AssignmentNo FOREIGN KEY(AssignmentNo) REFERENCES Assignment(AssignmentNo)
	)
CREATE CLUSTERED INDEX IX_Student ON Student(StudentNo)
EXEC sp_helpindex 'Student'
