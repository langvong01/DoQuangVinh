CREATE DATABASE LAB11
GO
USE LAB11
CREATE TABLE Customer(
	CusID int PRIMARY KEY IDENTITY,
	CusName nvarchar(100),
	[Address] nvarchar(100),
	BirthDath datetime
	)
CREATE TABLE Custell(
	TellNumber varchar(10),
	CusID int, 
	CONSTRAINT FK_CusID FOREIGN KEY(CusID) REFERENCES Customer(CusID)
	)
INSERT INTO Customer(CusName,Address,BirthDath) 
	VALUES ('Albert','LonDon','1997-8-5'),
	 ('Blbert','Manchester','1996-7-6'),
	('Clbert','Liverpool','1995-12-7'),
	('Dlbert','LonDon','1999-8-5'),
	('Elbert','LonDon','2000-8-5')
		)
INSERT INTO Customer(CusName,Address,BirthDath) 
	VALUES ('Angel','LONDON','2020-12-31')
		 ('Binz','Manchester','1996-7-6')
INSERT INTO Customer(CusName,Address,BirthDath) 
	VALUES ('Jonas','Kentucky','2009-12-12')
INSERT INTO Custell VALUES ('0971548331',1),
							('0971568331',1),
							('0971578331',2),
							('0361588331',3),
							('0361598331',3),
							('036458331',4),
							('0121548332',5),
							('0121548331',4)
--4
SELECT * FROM Customer					
SELECT  distinct TellNumber , CusID FROM Custell
--5
SELECT * FROM Customer
ORDER BY CusName

SELECT TellNumber
FROM Custell
WHERE CusID IN
( SELECT CusID  FROM Customer
	WHERE CusName LIKE 'A%')

SELECT * FROM Customer
WHERE  convert(varchar(100),BirthDath) LIKE 'Dec 12%'
--6
	SELECT  distinct CusID , COUNT(TellNumber)  AS' Num of Tell'
	FROM  Custell
	GROUP BY CusID

SELECT distinct COUNT(CusID) AS'Tong so nguoi sinh vao thang 12' FROM Customer
WHERE convert(varchar(100),BirthDath) LIKE 'Dec %'

SELECT *  
FROM Customer
WHERE CusID IN (
SELECT CusID FROM Custell
WHERE  TellNumber LIKE '097%'
)
--7
ALTER TABLE Customer
ADD CONSTRAINT Ck_BirthDate CHECK (DATEDIFF(dd,BirthDath,getdate())>0 AND DATEDIFF(mm,BirthDath,getdate())>0 AND DATEDIFF(yy,BirthDath,getdate())>0 )

EXECUTE sp_help FK_CusID
EXECUTE sp_help Ck_BirthDate

ALTER TABLE Customer
ADD  DateStart datetime
--8
--a
	CREATE INDEX IX_HoTen ON Customer(CusID)
	
	CREATE INDEX IX_SoDienThoai ON Custell(TellNumber)
--b
	CREATE VIEW IX_SoDienThoai AS
	SELECT Customer.CusName , Custell.TellNumber
	FROM Customer
	JOIN Custell
	ON Customer.CusID = Custell.CusID
	
	CREATE VIEW IX_SinhNhat AS
	SELECT CusName, Custell.TellNumber,BirthDath
	FROM Customer
	JOIN Custell
	ON Customer.CusID = Custell.CusID
	WHERE DATEPART(mm,BirthDath) = DATEPART(mm,getdate())

	SELECT * FROm  IX_SinhNhat 
--c
	CREATE PROCEDURE SP_Them_DanhBa
	@Name nvarchar(100), @Address nvarchar(100),@BirthDath datetime
	 AS BEGIN
	INSERT INTO Customer(CusName,Address,BirthDath) VALUES
		(@Name,@Address,@BirthDath)
	END

	EXECUTE SP_Them_DanhBa 'Saka','England','2003-8-5'

	CREATE PROCEDURE SP_Tim_DanhBa
	@FindName nvarchar(100)
	AS BEGIN
	SELECT TellNumber,Customer.Address,Customer.CusName
	FROM Custell
	INNER JOIN Customer
	ON Customer.CusID = Custell.CusID
	WHERE Custell.CusID IN(
	SELECT CusID FROM Customer
	WHERE CusName LIKE  @FindName)
	END
	
	EXECUTE	SP_Tim_DanhBa '%Al%' 
	
	

