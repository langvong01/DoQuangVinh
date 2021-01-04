CREATE DATABASE SellingPoint
USE SellingPoint
GO
CREATE TABLE Categories(
	CateID char(6) PRIMARY KEY,
	CateName nvarchar(100) NOT NULL,
	Description nvarchar(200)
	)
CREATE TABLE Parts(
	PartID int PRIMARY KEY IDENTITY,
	PartName nvarchar(100) NOT NULL,
	CateID char(6),
	Description nvarchar(1000),
	Price money NOT NULL default(0),
	Quantity int default(0),
	Warranty int default(1),
	Photo nvarchar(200) default('photo/nophoto.png'),
	CONSTRAINT FK_CateID FOREIGN KEY(CateID) REFERENCES Categories(CateID)
	)
SELECT * FROM Parts
SELECT * FROM Categories

INSERT INTO Categories(CateID,CateName) VALUES
			('S1','RAM'),
			('S2','CPU'),
			('S3','HDD')
INSERT INTO Parts(PartName,CateID,Price,Quantity) VALUES
			('Ram 2gb', 'S1',200,10),
			('CPU 2ghz', 'S2',300,10),
			('HDD 500gb', 'S3',400,10)
INSERT INTO Parts(PartName,CateID,Price,Quantity) VALUES
			('Ram 4gb', 'S1',700,10),
			('Ram 8gb', 'S1',800,10),
			('CPU 3ghz', 'S2',200,10),
			('CPU 4ghz', 'S2',600,10),
			('HDD 100gb', 'S3',500,10),
			('HDD 400gb', 'S3',900,10)

--4
SELECT *
FROM Parts
WHERE Price > 100 AND CateID IN (
SELECT CateID FROM Categories
)
--5
SELECT *
FROM Parts
WHERE CateID IN(
SELECT CateID FROM Categories
WHERE CateName LIKE'CPU')
--6
CREATE VIEW v_Parts AS
SELECT  PartID,PartName,Categories.CateName
FROM Parts
JOIN Categories
ON Parts.CateID = Categories.CateID

SELECT * FROM v_Parts
--7
CREATE VIEW v_TopParts AS
SELECT TOP 5 * 
FROM Parts ORDER BY Price DESC

SELECT * FROM v_TopParts