select * from HumanResources.Employee
GO
DECLARE @deptID int --khai bao bien cuc bo ten la depID kieu int 
SELECT @deptID = 1 --gan gia tri cho bien bang 1
SELECT	Name,GroupName From	HumanResources.Department Where	DepartmentID = @deptID
GO

SELECT	@@LANGUAGE
--hien thi thong tin cua bien toan cuc @@langueage
SELECT @@VERSION
--hien thi thong tin cua bien toan cuc @@Version
GO

--Lay tong  tat ca gia tri cac ban ghi truong StadardCost thuoc bang ProductCostHistory
SELECT SUM(StandardCost) From Production.ProductCostHistory
--tinh gia tri trung binh cua truong StandardCost thuoc bang ProductCostHistory
SELECT AVG(StandardCost) FROM Production.ProductCostHistory
SELECT MAX(StandardCost) FROM Production.ProductCostHistory
--dem tong so ban ghi trong bang ProductPhoto
SELECT COUNT(*) FROM Production.ProductPhoto
SELECT * FROM Production.ProductPhoto

--lay ngay gio he thong
SELECT GETDATE()
--lay ra gio he thong
SELECT DATEPART(hh,GETDATE())
--dinh dang ngay dung ham CONVERT
SELECT CONVERT(varchar(50),GETDATE(),103)

--lay ra dinh danh cua co so du lieu
select	DB_ID('AdventureWorks2019')

--tao co so du lieu
CREATE DATABASE EXAMPLE3
USE EXAMPLE3
--tao bang trong co so du lieu
CREATE TABLE Contacts
(MailID varchar(20),
Name NTEXT,
TelephoneNumber INT)

--them 1 cot vao bang da co
ALTER TABLE Contacts ADD Address NVARCHAR(50)

--them du lieu vao bang Contacts
Insert INTO Contacts values('dqv058971@gmail.com',N'Đỗ Quang VInh',0971548331,N'Hà Nội')
Insert INTO Contacts values('dqv058972@gmail.com',N'Đỗ Quang VInh',0971548331,N'Hà Nội')
Insert INTO Contacts values('dqv058973@gmail.com',N'Đỗ Quang VInh',0971548331,N'Hà Nội')
Insert INTO Contacts values('dqv058974@gmail.com',N'Đỗ Quang VInh',0971548331,N'Hà Nội')
-- Lay ra tất cả các bản ghi trong bảng
SELECT * FROM Contacts
--Xoa ban ghi co mail id = dqv058971@gmail.com
DELETE FROM Contacts Where MailID='dqv058971@gmail.com'
-- Sua ban ghi co mailid = dqv058972@gmail.com'
UPDATE	Contacs SET Name=N'Do Quang Vinh' Where MailID='dqv058972@gmail.com'
--Tao login account de test Grant
CREATE LOGIN EXAMPLE3 WITH PASSWORD='123456'
-- Huy bo tat ca  cac quyen cua user example3 tren bang Contact
REVOKE All ON Contacts FROM Example3
--Disconnect va conect lai voi user example3/123456, thuc hien cau lenh select de demo cho sinh vien thay user ko con bat ky quyen truy cap

--Gan quyen SELECT cho example3 tren bang Contacts
Grant select ON Contacts to Example3