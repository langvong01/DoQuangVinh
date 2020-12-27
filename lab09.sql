CREATE DATABASE LAB09
GO
USE LAB09

CREATE VIEW ProductList
AS
SELECT ProductID,Name FROM AdventureWorks2019.Production.Product
go
SELECT * FROM ProductList

CREATE VIEW SaleOrderDetail
AS
	Select pr.ProductID,pr.name,od.UnitPrice,od.OrderQty,
od.UnitPrice*od.orderQty as[Total price]
	FROm AdventureWorks2019.Sales.SalesOrderDetail od
	Join AdventureWorks2019.Production.Product pr
	ON od.ProductID = pr.ProductID
GO

CREATE TABLE Customer(
	CustomerID int  PRIMARY KEY IDENTITY,
	CustomerName varchar(50),
	Addresss varchar(100),
	Phone varchar(12)
	)
CREATE TABLE Books(
	BookCode int PRIMARY KEY IDENTITY,
	Category varchar(50),
	Author varchar(50),
	Publisher varchar(50),
	Title varchar(100),
	Price int,
	InStore int
	)
CREATE TABLE BookSold(
	BookSoldID int PRIMARY KEY,
	CustomerID int,
	BookCode int,
	Date datetime,
	Price int,
	Amount int,
	CONSTRAINT FK_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
	CONSTRAINT FK_Bookcode FOREIGN KEY (BookCode) REFERENCES Book(BookCode)
	)
1--
INSERT INTO Customer(CustomerName,Addresss,Phone)
	VALUES('Nguyen Van A','Ha Noi','0123456789'),
INSERT INTO Customer(CustomerName,Addresss,Phone) VALUES
	('Nguyen Van B','Ha Noi','0123456788'),
	('Nguyen Van C','Ha Nam','0143456789'),
	('Nguyen Van A','Ha Noi','0223456789'),
	('Nguyen Van A','Ha Noi','0223366789')
INSERT INTO Customer(CustomerName,Addresss,Phone) VALUES('Nguyen Van D','Ha Noi','0224366789')


	INSERT INTO Books(Category,Author,Publisher,Title,PriceBook,InStore)
		VALUES('Van hoc','Nam Cao','Kim Dong','Truyen Kieu',1000,200),
			('Van hoc','Nguyen Anh','Kim Dong','Hai dua tre',800,300),
			('Van hoc','Nam Cao','Kim Dong','Vo chong A phu',900,400),
			('Van hoc','Huy Can','Kim Dong','Vo chong A phu',700,500),
			('Van hoc','Thach Lam','Kim Dong','Nho rung',600,100)
	INSERT INTO BookSold VALUES
	(1,1,2,'2020-12-15',700,5),
	(2,1,3,'2020-12-16',500,10),
	(3,1,4,'2020-12-17',400,6),
	(4,2,1,'2020-12-18',600,7),
	(5,3,1,'2020-12-19',700,8),
	(6,4,1,'2020-12-20',600,9),
	(7,5,1,'2020-12-21',800,11),
	(8,1,3,'2020-12-22',900,20),
	(9,2,3,'2020-12-23',400,15),
	(10,3,3,'2020-12-24',300,5)
2--
	CREATE VIEW  BookSoldDetai
	AS
	SELECT b.BookCode,b.Title,b.PriceBook, bs.Amount
	FROM Books b
	JOIN BookSold Bs
	ON b.BookCode = Bs.BookCode	
	SELECT * FROM BookSoldDetai
3--
	CREATE VIEW  V_Cus_BookSoldDetail
	AS
	SElect  c.CustomerID,c.CustomerName,c.Addresss,bs.Amount,Sum(bs.Amount) AS 'Tong so sach mua'
	FROM Customer c
	Join BookSold bs 
	ON c.CustomerID = bs.CustomerID
	GROUP BY c.CustomerID,c.CustomerName,c.Addresss

	SELECT * FROM Cus_BookSoldDetail 
	
	DROP VIEW Cus_BookSoldDetail
4--
	CREATE VIEW  Cus_BookSoldDetail_Date
	AS
	SElect  c.CustomerID,c.CustomerName,c.Addresss,bs.Date , bs.BookCode
	FROM Customer c
	Join BookSold bs
	ON c.CustomerID = bs.CustomerID 
	WHERE DATEPART(mm,bs.Date) < DATEPART(mm,GETDATE()) AND DATEPART(mm,bs.Date) >  DATEPART(mm,DATEADD(mm,-2,GETDATE()))
	
	CREATE VIEW V_Cus_BookSoldDetail_Date_Title
	AS 
	SELECT cbsdd.Addresss, cbsdd.CustomerID,cbsdd.CustomerName,cbsdd.Date,Books.Title
	FROM Cus_BookSoldDetail_Date cbsdd
	JOIN Books
	ON cbsdd.BookCode = Books.BookCode
	
	SELECT * FROM V_Cus_BookSoldDetail_Date_Title
5--
	CREATE VIEW V_Cus_Book_Purchase 
	AS
	SELECT c.CustomerID,c.CustomerName,c.Addresss,bs.Amount * bs.Price as [Total Purchase]
	FROM Customer c
	JOIN BookSold bs
 	ON c.CustomerID = bs.CustomerID 

	SELECT * FROM V_Cus_Book_Purchase
		SELECT * FROM BookSold 

--Phần IV

	CREATE TABLE Class(
		ClassCode varchar(10) PRIMARY KEY,
		HeadTeacher varchar(30),
		Room varchar(30),
		TimeSlot char,
		CloseDate datetime
		)
		CREATE TABLE Student(
			RollNo varchar(10) PRIMARY KEY,
			ClassCode varchar(10),
			FullName varchar(30),
			Male bit CHECK(Male = 1 OR Male = 0),
			BirthDate datetime,
			Address varchar(30),
			Provice char(2) ,
			Email varchar(30),
			CONSTRAINT FK_ClassCode FOREIGN KEY(ClassCode) REFERENCES Class(ClassCode)
			)
		CREATE TABLE Subject(
			SubjectCode varchar(10) PRIMARY KEY,
			SubjectName varchar(40),
			WMark bit CHECK( WMARK = 1 OR WMark = 0),
			PMark bit CHECK ( PMark = 1 OR PMark = 0),
			WTest_per int ,
			PTest_per int
			)
		CREATE TABLE Mark(
			RollNo varchar(10),
			SubjectCode varchar(10),
			WMark_Exam float,
			PMark_Exam float,
			Mark float,
			CONSTRAINT Fk_RollNo FOREIGN KEY(RollNo) REFERENCES Student(RollNo),
			CONSTRAINT Fk_SubjectCode FOREIGN KEY(SubjectCode) REFERENCES Subject(SubjectCode),
			CONSTRAINT PK_Student_SubjectCode PRIMARY KEY(SubjectCode,RollNo)
			)
		
		INSERT INTO Class 
		VALUES('C1','Thi','P200','S',NULL),
				('C2','Thu','P200','S',NULL),
				('C3','Thuy','P200','C',NULL),
				('C4','Thi','P201','C',NULL),
				('C5','Thuy','P202','T',NULL)

		INSERT INTO Student
		VALUES ('S1','C1','Alan',1,'1997-8-5','LonDon','LD','Alan@gmail.com'),
				('S2','C2','Blan',0,'1997-7-5','LonDon','LD','Alan@gmail.com'),
				('S3','C3','Clan',1,'1997-6-5','LonDon','LD','Alan@gmail.com'),
				('S4','C4','Dlan',0,'1997-5-5','LonDon','LD','Alan@gmail.com'),
				('S5','C5','Elan',1,'1997-4-5','LonDon','LD','Alan@gmail.com')
				
		INSERT INTO Subject
		VALUES ('M01','Math',1,1,5,5),
				('G01','Geography',1,1,5,5),
				('H01','History',1,1,5,5),
				('P01','Physical',1,1,5,5),
				('CH01','Chemisty',1,1,5,5)
		INSERT INTO Mark
		VALUES ('S1','M01',5,6,55),
				('S2','M01',7,6,65),
				('S3','M01',6,6,60),
				('S4','M01',8,7,75),
				('S5','M01',9,7,80),
				('S2','CH01',6,6,60)

CREATE VIEW V_Student_TwoMark_TwoSubject
AS
SELECT 
