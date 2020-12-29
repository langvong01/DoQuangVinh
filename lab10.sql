CREATE DATABASE LAB10
USE LAB10

CREATE TABLE Toyz(
	ProductCode int PRIMARY KEY IDENTITY,
	[Name] varchar(30),
	Category varchar(30),
	Manufacturer varchar(40),
	AgeRange varchar(15),
	UnitPrice money,
	NetWeight int,
	QtyOnHand int
	)
--1
	INSERT INTO Toyz(Name,Category,Manufacturer,AgeRange,UnitPrice,NetWeight,QtyOnHand)
		VALUES ('Superman','logo','DC','1-10',100,500,50),
				('Batman','logo','DC','1-10',200,660,40),
				('Jorker','logo','DC','2-10',300,700,50),
				('Aquamen','logo','DC','1-10',200,500,60),
				('IronMan','logo','MV','1-10',400,800,50),
				('Hulk','logo','MV','1-10',200,800,50),
				('Captain','logo','MV','1-10',100,500,50),
				('Goku','logo','JAV','1-10',1000,500,50),
				('Cadic','logo','JAV','1-10',100,500,50),
				('Mabu','logo','jav','1-10',100,500,50),
				('Vi','logo','LOL','1-10',100,500,50),
				('Akali','logo','LOL','1-10',100,500,50),
				('Lucian','logo','LOL','1-10',100,500,50),
				('Miku','logo','Wibu','1-10',100,500,50),
				('Ban','logo','Wibu','1-10',100,500,50),
				('Meliodas','logo','Wibu','1-10',100,500,50)
INSERT INTO Toyz(Name,Category,Manufacturer,AgeRange,UnitPrice,NetWeight,QtyOnHand)
		VALUES 
				('Magic','card','yugi','1-10',100,700,50),
				('Anime','Film','JAV','1-10',200,600,50)
--2
	CREATE PROCEDURE sp_HeavyToys
	@NetHeavy int
	AS
	SELECT  distinct Category FROM Toyz
	WHERE NetWeight > @NetHeavy
	GO
	EXECUTE sp_HeavyToys 500
--3
	
	CREATE PROCEDURE sp_PriceIncrease
	@IncreasePrice money
	AS
	UPDATE Toyz 
	SET UnitPrice += @IncreasePrice
	GO
	EXECUTE sp_PriceIncrease 5
	SELECT  UnitPrice FROM Toyz
--4
	CREATE PROCEDURE sp_QtyOnHand
	@DecreaseQty int
	AS
	UPDATE Toyz
	SET QtyOnHand -= @DecreaseQty
	GO
	EXECUTE sp_QtyOnHand 5
	SELECT  QtyOnHand FROM Toyz

--Phan IV : Bài tập về nhà
--1
--Xem định nghĩa thủ tục bằng sp_helptext
	EXECUTE sp_helptext sp_QtyOnHand
	EXECUTE sp_helptext sp_HeavyToys
	EXECUTE sp_helptext sp_PriceIncrease
--Xem định nghĩa thủ tục bằng OBJECT_DEFINITION
	SELECT OBJECT_DEFINITION(OBJECT_ID('sp_QtyOnHand')) AS DEFINITION
	SELECT OBJECT_DEFINITION(OBJECT_ID('sp_HeavyToys'))  AS DEFINITION
	SELECT OBJECT_DEFINITION(OBJECT_ID('sp_PriceIncrease'))  AS DEFINITION
--XEM định nghĩa thủ tục bằng sys.sql_modules
	SELECT definition  FROM sys.sql_modules
	WHERE object_id = object_id('sp_QtyOnHand')

	SELECT definition  FROM sys.sql_modules
	WHERE object_id = object_id('sp_HeavyToys')
	
	SELECT definition  FROM sys.sql_modules
	WHERE object_id = object_id('sp_PriceIncrease')
--2
	sp_depends 'sp_QtyOnHand'
	sp_depends 'sp_HeavyToys'
	sp_depends 'sp_PriceIncrease'
--3
	ALTER PROCEDURE sp_PriceIncrease
	@IncreasePrice money
	AS BEGIN
	UPDATE Toyz 
	SET UnitPrice += @IncreasePrice
	SELECT UnitPrice FROM Toyz
	END
	GO
	
	ALTER PROCEDURE sp_QtyOnHand
	@DecreaseQty int
	AS BEGIN
	UPDATE Toyz
	SET QtyOnHand -= @DecreaseQty
	SELECT QtyOnHand FROM Toyz
	END
	GO
--4
	CREATE PROCEDURE sp_SpecificPriceincrease
	AS
	UPDATE Toyz
	SET UnitPrice +=QtyOnHand
	
--5
	ALTER  PROCEDURE sp_SpecificPriceincrease
	@Count int OUTPUT
	AS BEGIN
	UPDATE Toyz
	SET UnitPrice +=QtyOnHand
	SELECT @Count = COUNT(UnitPrice) FROM Toyz
	END

	DECLARE @Number int 
	EXECUTE sp_SpecificPriceincrease @Number OUTPUT
	PRINT @Number
--6
	ALTER PROCEDURE sp_SpecificPriceincrease
	AS BEGIN
	UPDATE Toyz
	SET UnitPrice +=QtyOnHand
	SELECT UnitPrice FROM Toyz
	EXECUTE sp_HeavyToys 500
	END

	EXECUTE  sp_SpecificPriceincrease
--7
	BEGIN TRY
			EXECUTE sp_SpecificPriceincrease
			EXECUTE sp_QtyOnHand 5
			EXECUTE sp_HeavyToys 500,'123'
	END TRY
	BEGIN CATCH
		SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_MESSAGE() AS ErrorMessage;  
		BEGIN
		PRINT N'Có lỗi xảy ra trong quá trình thực hiện thủ tục lưu trữ'
		END
	END CATCH;  
--8
DROP PROCEDURE sp_HeavyToys
DROP PROCEDURE sp_SpecificPriceincrease
DROP PROCEDURE sp_QtyOnHand
DROP PROCEDURE sp_PriceIncrease



		
	

