CREATE DATABASE Lab05
GO
CREATE TABLE PhongBan(
	MaPb varchar(7) PRIMARY KEY,
	TenPB nvarchar(50)
	)
CREATE TABLE NhanVien(
	MaNV varchar(7) PRIMARY KEY,
	TenNV nvarchar(50),
	NgaySinh Datetime, CONSTRAINT CK_date CHECK (NgaySinh<getDate()),
	SoCMND char(9),
	GioiTinh char(1) DEFAULT('M'),CONSTRAINT CK_gioitinh CHECK (GioiTinh ='M' OR GioiTinh = 'F'),
	DiaChi nvarchar (100),
	NgayVaoLam Datetime, CONSTRAINT CK_NgayVaoLam CHECK (DATEDIFF(yy,NgaySinh,NgayVaoLam)>20),
	MaPB varchar(7), CONSTRAINT FK_PhongBan FOREIGN KEY(MaPb) REFERENCES PhongBan(MaPb)
	)
	DROP TABLE NhanVien
	
CREATE TABLE LuongDA(
	MaDA varchar(8) PRIMARY KEY,
	MaNV varchar(7) unique, CONSTRAINT FK_NhanVien FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNV),
	NgayNhan DATETIME NOT NULL DEFAULT(getDate()),
	SoTien money CHECK (SoTien>0)
	)

--1
	--Chen du lieu vao bang PhongBan
	INSERT INTO PhongBan VALUES('D01','Sale')
	INSERT INTO PhongBan VALUES('D02','Ky Thuat')
	INSERT INTO PhongBan VALUES('D03','KeToan')
	INSERT INTO PhongBan VALUES('D04','TaiChinh')
	INSERT INTO PhongBan VALUES('D05','CSKH')

	--Chen Du lieu cho bang Nhan Vien
	INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,DiaChi,NgayVaoLam,MaPb) VALUES('T01','Vinh','1997-8-5','013399159','HN','2018-8-5','D02')
	INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,DiaChi,NgayVaoLam,MaPb) VALUES('T02','Nam','1996-8-15','013399149','HN','2018-8-5','D01')
	INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,DiaChi,NgayVaoLam,MaPb) VALUES('T03','Hai','1999-6-9','013399147','HN','2020-8-5','D01')
	INSERT INTO NhanVien VALUES('T04','Linh','2000-2-14','013399142','F','HN','2021-3-15','D03')
	INSERT INTO NhanVien VALUES('T05','Xinh','1995-2-15','013399144','F','HN','2020-12-5','D04')

	--Chen du lieu vao bang LuongDA
		INSERT INTO LuongDA VALUES('P01','T01','2015-3-14',2000000)
		INSERT INTO LuongDA VALUES('P02','T03','2015-3-15',3000000)
		INSERT INTO LuongDA VALUES('P03','T04','2015-3-11',6000000)
		INSERT INTO LuongDA VALUES('P04','T05','2015-3-16',4000000)
		INSERT INTO LuongDA VALUES('P05','T02','2015-3-17',8000000)
2--
	SELECT * FROM PhongBan
	SELECT * FROM NhanVien
	SELECT * FROM LuongDA
3--
	SELECT TenNV,MaNv,GioiTinh FROM NhanVien
	WHERE GioiTinh LIKE 'F'
4--
	SELECT MaDA FROM LuongDA
5--
	SELECT MaNV , SUM(SoTien) AS 'TongLuong'
	FROM LuongDA GROUP BY MaNV
6--
	SELECT * FROM NhanVien
	WHERE MaPb LIKE 'D01'
7--
	SELECT SoTien,MaNv From LuongDA
	WHERE MaNV LIKE 'T0[23]'
8--
	SELECT MaPb, COUNT(TenNv) AS 'SoLuongNhanVien'
	FROM NhanVien  GROUP BY MaPb 
9--
	SELECT MaNv,MaDA FROM LuongDA
10--
	
	SELECT MaPb ,COUNT(TenNv) AS'SoLuongNhanVien'
	FROM NhanVien   GROUP BY MaPB HAVING COUNT(TenNv) = Max(2)
11-
	SELECT MaPb, COUNT(TenNv) AS 'SoLuongNhanVien'
	FROM NhanVien WHERE MaPb LIKE 'D04'  GROUP BY MaPb 
12-
	SELECT MaNv FROM NhanVien
	WHERE SoCMND LIKE '0[1-9][1-9][1-9][1-9][1-9][1-9][1-9]9'

	SELECT MaNv, SUM(SoTien) As'TongLuongDA'
	FROM LuongDA WHERE MaNv LIKE 'T0[12]' GROUP BY MaNV
13--
	
14-
	SELECT MaNv FROM NhanVien
	WHERE GioiTinh = 'F' AND MaPb = 'D04'
	
	SELECT MaNV,SoTien FROM LuongDA
	WHERE SoTien > 1200000 AND MaNv = 'T05'
15--
	SELECT MaNV FROM NhanVien
	WHERE MaPb = 'D01'
	SELECT MaNv, SUM(SoTien) AS'Tong Luong Cua Phong'
	FROM LuongDA WHERE MaNV LIKE 'T0[23]' GROUP BY MaNV
16-
	SELECT MaDA,COUNT(MaNV) AS'So luong nhan  vien'
	FROM LuongDA  GROUP BY MaDA HAVING Count(MaNV)>2
17-
	SELECT TenNV,MaNv,NgaySinh,SoCMND,GioiTinh,DiaChi,NgayVaoLam,MaPb
	FROM NhanVien WHERE TenNV LIKE 'N%'
18-
SELECT MaNV FROM LuongDA
	SELECT TenNV,MaNv,NgaySinh,SoCMND,GioiTinh,DiaChi,NgayVaoLam,MaPb
	FROM NhanVien WHERE MaNV LIKE 'T0[1-5]'
19-
	SELECT MaNV , COUNT(MaNv) AS 'So du an tham gia'
	FROM LuongDA GROUP BY MaNV HAVING COUNT(MaNv)<1
20- DELETE FROM LuongDA
	WHERE MaDA = 'P02'
21-
	DELETE FROM LuongDA
	WHERE SoTien > 2000000
22-
	UPDATE LuongDA
	SET SoTien *=1.1
	WHERE MaDA LIKE 'P01'
23-
	SELECT MaNV , COUNT(MaNv) AS 'So du an tham gia'
	FROM LuongDA GROUP BY MaNV

	DELETE FROM NhanVien
	WHERE MaNV Like 'T0[^134]'
24-
	UPDATE NhanVien
	SET NgayVaoLam = '2029-8-5'
	WHERE MaPB LIKE 'D04'