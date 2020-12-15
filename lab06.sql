CREATE DATABASE OrdProduct
CREATE TABLE Orde(
	Ord_Statut int ,
	CustomerID int,
	orderID int PRIMARY KEY,
	DateOrder date,
	CONSTRAINT Fk_Order FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
	)
CREATE TABLE OrderDetail(
	orderID int NOT NULL,
	ProductID int NOT NULL,
	Product_Quantity int,
	Product_Price float,
	CONSTRAINT FK_OrderID FOREIGN KEY(orderId) REFERENCES Orde(orderID),
	CONSTRAINT FK_ProductID FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
	)
CREATE TABLE Customer (
	CustomerID int PRIMARY KEY IDENTITY,
	CustomerName nvarchar (100),
	Addres nvarchar(100),
	Tell varchar(10),
		)
CREATE TABLE Product(
	ProductID int PRIMARY KEY IDENTITY,
	ProductName nvarchar(100),
	Product_Unit nvarchar(100) DEFAULT ('Chiếc'),
	Product_Price float,
	Product_Quantity int,
	Product_Statut int DEFAULT(0) CHECK(Product_Statut = 0 OR Product_Statut = 1),
	Category_ID int,
	CONSTRAINT Fk_Category FOREIGN KEY(Category_ID) REFERENCES Category(Category_ID),
	Descript nvarchar (100)
	)
CREATE TABLE Category(
	Category_ID  int PRIMARY KEY IDENTITY,
	Category_Name nvarchar (20)
	)

3-- Thêm dữ liệu vào bảng
	INSERT INTO Category(Category_Name)
		VALUES ('Máy tính'),('Điện Thoại'),('Máy In')
	SELECT * FROm Category
	
	INSERT INTO Product(ProductName,Product_Price,Product_Quantity) 
		VALUES('Máy tính T450',1000,1), ('Điện thoại Nokia 5670',200,2),('Máy in Samsum 450',100,1)

	INSERT INTO Customer(CustomerName,Addres,Tell)
		VALUES('Nguyễn Văn An','111 Nguyễn Trãi, Thanh Xuân , Hà Nội','0987654321'),
			INSERT INTO Customer(CustomerName,Addres,Tell) VALUES
		('Nguyễn Văn B','76 Duy Tân','0971548331')


	INSERT INTO Orde(Ord_Statut,CustomerID,orderID,DateOrder) VALUES (1,1,123,'09/11/18')
		INSERT INTO Orde(Ord_Statut,CustomerID,orderID,DateOrder) VALUES (1,1,122,'09/11/18')
			INSERT INTO Orde(Ord_Statut,CustomerID,orderID,DateOrder) VALUES (1,2,121,'09/11/18')

	INSERT INTO OrderDetail(orderID,ProductID,Product_Quantity,Product_Price) 
		VALUES ( 123,1,1,1000),(123,2,2,200),(123,3,1,100)
	
	INSERT INTO OrderDetail(orderID,ProductID,Product_Quantity,Product_Price) 
		VALUES ( 122,1,1,1000),(122,2,2,200)
	
	INSERT INTO OrderDetail(orderID,ProductID,Product_Quantity,Product_Price) 
		VALUES ( 121,1,1,1000)

4--
	a--
		SELECT * FROM Customer
			WHERE CustomerID IN
			( SELECT CustomerID FROM Orde)
	b--
		SELECT ProductName FROM Product
	c--
		SELECT * FROM  OrderDetail
5--
	a--
		
	b--
		SELECT ProductName FROM Product
		ORDER BY Product_Price DESC
	c--
		SELECT ProductName FROM Product
		WHERE ProductID IN
		( SELECT ProductID FROM OrderDetail
			WHERE orderID IN (
			SELECT orderID FROM Orde WHERE CustomerID IN (
			SELECT CustomerID FROM Customer
			WHERE CustomerName LIKE 'Nguyễn Văn B')))
6--
	a--
		SELECT COUNT(CustomerID) AS 'So luong khach da mua'
		FROM Customer WHERE CustomerID IN (
			SELECT CustomerID FROM Orde)
	b--
		SELECT COUNT(Category_ID) AS'So luong mat hang ban'
		FROM Category WHERE Category_ID IN
		(	SELECT Category_ID FROM Product)
	c--
		SELECT OrderID,SUM(Product_Quantity *Product_Price)
		FROM OrderDetail GROUP BY orderID ORDER BY SUM(Product_Quantity *Product_Price) DESC
7--
	a--
		ALTER TABLE Product
		ADD CONSTRAINT CK_Price CHECK(Product_Price > 0)
	b-
		Alter TABLE Orde
		ADD CONSTRAINT CK_datetime CHECK(DateOrder<getdate())
	c--
		ALTER TABLE Product
		ADD ReleaseTime date
