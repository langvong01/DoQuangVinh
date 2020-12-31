--ASM 03
CREATE DATABASE Lab08
USE Lab08
CREATE TABLE Servicess
(
 ServiceID int PRIMARY KEY  IDENTITY,
 ServiceName nvarchar(100) NOT NULL,
 Description nvarchar(100)
 )
CREATE TABLE Customer
(
	Cus_ID int PRIMARY KEY IDENTITY,
	Cus_Name nvarchar(100) NOT NULL,
	CMND varchar(20) NOT NULL unique,
	Address nvarchar(100)
	)
CREATE TABLE CusTel
	(
	ServiceID int,
	Cus_ID int,
	Tell   varchar(20),
	StartDate datetime NOT NULL,
	EndDate datetime  DEFAULT NULL,
	CONSTRAINT FK_CusID FOREIGN KEY(Cus_ID) REFERENCES Customer(Cus_ID),
	CONSTRAINT FK_ServiceID FOREIGN KEY(ServiceID) REFERENCES Servicess(ServiceID),
	CONSTRAINT PK_Tell_StartDate PRIMARY KEY(Tell,StartDate)
	)
	DROP TABLE Custel
3--
INSERT INTO Servicess(ServiceName,Description) VALUES('4G','Tra truoc')
INSERT INTO Servicess(ServiceName,Description) VALUES('4G','Tra truoc')
INSERT INTO Servicess(ServiceName,Description) VALUES('3G','Tra truoc')

INSERT INTO Customer(Cus_Name,CMND,Address) VALUES('Nguyễn Nguyệt Nga','123456789','HàNội')
INSERT INTO Customer(Cus_Name,CMND,Address) VALUES('Nguyễn Nguyệt Ngân','223456789','HàNội')
INSERT INTO CusTel(ServiceID,Cus_ID,Tell,StartDate) VALUES('2','1','0987654321','2002-12-12')
INSERT INTO CusTel(ServiceID,Cus_ID,Tell,StartDate) VALUES('4','2','0987654321','2002-12-13') 

4--
	SELECT * FROM Customer
	SELECT * FROM CusTel
	SELECT* FROM Servicess
5--
	SELECT * FROM Customer
	WHERE Cus_ID IN
	( SELECT Cus_ID FROM CusTel
		WHERE Tell LIKE '0123456789')
GO	
	SELECT * FROM Customer
	WHERE CMND  LIKE '123456789'
GO
	SELECT Tell FROM CusTel
	WHERE  Cus_ID IN(
		Select Cus_ID FROM Customer
		WHERE CMND  LIKE '123456789')
GO	
	SELECT Tell FROM CusTel
		WHERE StartDate LIKE '09-12-12'
GO	
	SELECT Tell FROM CusTel
	WHERE Cus_ID IN
	( SELECT Cus_ID FROM Customer
		WHERE Address  LIKE 'HàNội'
		)
6--**
	SELECT COUNT(Cus_ID) AS' Num of Cus'
	FROM Customer
GO
	SELECT COUNT(Tell) AS 'Num of Tell'
	FROM Custel GROUP BY ServiceID
GO
SELECT COUNT(Tell) AS 'Num of Tell'
	FROM Custel  WHERE StartDate LIKE '09-12-12' GROUP BY ServiceID
GO
	SELECT c.Cus_ID,c.Cus_Name,c.CMND,c.Address,
			ct.ServiceID,ct.Tell,ct.StartDaTe,ct.EndDate
	FROM Customer AS c 
	INNER JOIN CusTel AS ct
	ON ( c.Cus_ID = ct.Cus_ID)
--7
	ALTER TABLE Custel
	ALTER COLUMN StartDate datetime NOT NULL

	ALTER TABLE Custel
	ADD CONSTRAINT CK_StartDate CHECK(StartDate < getdate() OR StartDate = getdate())

	ALTER TABLE CusTel
	ADD CONSTRAINT CK_Tell CHECK(Tell LIKE '09[1-9]%')


	ALTER TABLE Custel
	ADD Bounus int

--ASM 2
	CREATE TABLE CATEGORY(
		CateID int  PRIMARY KEY  IDENTITY,	
		CateName nvarchar(100)
		)
GO
	CREATE TABLE Product(
		ProductID int PRIMARY KEY IDENTITY,
		ProductName nvarchar(100),
		Descript nvarchar (100),
		ProductUnit nvarchar(100) DEFAULT('Chiếc'),
		ProductPrice float,
		ProductQuantity int,
		CateID int,
		CONSTRAINT FK_CateID FOREIGN KEY(CateID) REFERENCES Category(CateID)
		)
GO
	CREATE TABLE ProductCom(
		ComId  varchar(10),
		ProductID int,
		ComName nvarchar(100),
		Addresss varchar(100),
		Tell varchar(10),
		CONSTRAINT Fk_ProductId FOREIGN KEY(ProductId) REFERENCES Product(ProductId),
		CONSTRAINT PK_ProductCom PRIMARY KEY(ComId,ProductID)
		)
INSERT INTO CATEGORY(CateName) VALUES('Máy Tính'),('Điện Thoại'),('Máy In')
INSERT INTO Product(ProductName,Descript,ProductPrice,ProductQuantity,CateID) VALUES
	('Máy Tính Asus','Máy nhập cũ',1000,10,1),
	('Điện thoại Asus','Điện thoại đang hot',200,200,2),
	('Máy In Asus','Máy in đang loại bình',100,10,3),

	('Máy Tính Samsung','Máy đang hot',800,20,1),
	('Điện thoại Samsung','Máy nhập cũ',900,50,2),
	('Máy In SAM SUNG','Máy nhập cũ',500,30,3),

	('Máy Tính LG','Máy nhập cũ',1000,10,1),
	('Điện thoại LG','Máy đang hot',600,30,2)
	('Máy IN LG','Máy đang hot',1000,100,3)

SELECT * FROM CATEGORY
SELECT * FROM Product
	INSERT INTO ProductCom(ComId,ProductID,ComName,Addresss,Tell) VALUES
		( '123',2,'Asus','USA','0983232'),
		( '123',3,'Asus','USA','0983232'),
		( '123',4,'Asus','USA','0983232'),
		( '456',5,'SamSung','Korea','0980581'),
		( '456',6,'SamSung','Korea','0980581'),
		( '456',7,'SamSung','Korea','0980581'),
		( '789',8,'LG','Japan','0981480'),
		( '789',9,'LG','Japan','0981480'),
		( '789',10,'LG','Japan','0981480')
--4
	SELECT distinct ComName  FROM ProductCom
	SELECT distinct ProductName FROm Product
--5
		SELECT distinct ComName  FROM ProductCom
		ORDER BY Comname DESC
		
		SELECT distinct ProductName,ProductPrice FROm Product
		ORDER BY ProductPrice DESC
		
		SELECT ComName,Addresss,Tell FROM ProductCom
		WHERE ComName Like 'Asus'
--6
--a
	SELECT COUNT(CateID) AS ' So hang san pham'
	FROM CATEGORY
--b
	SELECT COUNT(CateName) AS ' So  mat hang '
	FROM CATEGORY
--c
	SELECT ComName, COUNT(CATEGORY.CateID) AS 'so loai san pham'
	FROM ProductCom
	INNER JOIN Product ON Product.ProductID = ProductCom.ProductID
	Inner Join CATEGORY ON CATEGORY.CateID = Product.CateID
	GROUP BY ComName
--d
	SELECT COUNT(ProductName) AS N'Tổng số đầu sản phẩm của toàn cửa hàng' FROM Product 
--7
--a
	ALTER TABLE Product
	ADD CONSTRAINT Ck_Price CHECK(ProductPrice > 0)
--b
	ALTER TABLE ProductCom
	ADD CONSTRAINT Ck_TellNumber CHECK(Tell  LIKE '0%')
--c
	EXECUTE sp_help Pk_ProductCom
	EXEC sp_help Fk_CusiD
	EXEC sp_help Fk_CateID
--8
--a
	CREATE index IX_ProductName ON Product(ProductName)
	CREATE index IX_ProductDescripion ON Product(Descript)
--b
	CREATE PROCEDURE SP_SanPham_TenHang
	AS
	SELECT Product.ProductName,ProductCom.ComName
	FROM Product
	JOIN ProductCom
	ON Product.ProductID = ProductCom.ProductID
--c
	CREATE PROCEDURE SP_SanPham_Gia
	@Price money
	AS
	SELECT Product.ProductName , Product.ProductPrice FROM Product
	WHERE ProductPrice >= @Price
	
	EXECUTE SP_SanPham_Gia 500
--d
	CREATE PROCEDURE SP_SanPham_HetHang
	AS
	SELECT Product.ProductName FROM Product
	WHERE ProductQuantity = 0
	

