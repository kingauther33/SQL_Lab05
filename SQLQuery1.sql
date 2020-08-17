USE master;
GO
ALTER DATABASE Lab05
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO
DROP DATABASE Lab05
CREATE DATABASE Lab05
GO


USE Lab05
GO

-- Tao bang PhongBan
CREATE TABLE PhongBan (
	MaPB varchar(7) PRIMARY KEY,
	TenPB nvarchar(50)
)
GO

CREATE TABLE NhanVien ( 
	MaNV varchar(7) PRIMARY KEY,
	TenNV nvarchar(50),
	NgaySinh datetime,
	CONSTRAINT chk_NgaySinh CHECK (NgaySinh <= GETDATE()),
	SoCMND char(9),
	-- CONSTRAINT chk_SoCMND CHECK ( ISNUMERIC(SoCMND) )
	CONSTRAINT chk_SoCMND CHECK (SoCMND NOT LIKE '%[^0-9]*%'),
	GioiTinh char(1) DEFAULT 'M',
	DiaChi nvarchar(100),
	NgayVaoLam datetime,
	-- CONSTRAINT chk_NgayVaoLam CHECK (NgayVaoLam > NgaySinh),
	MaPB varchar(7),
	CONSTRAINT fk_MaPB FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB)
)
GO

CREATE TABLE LuongDA (
	MaDA varchar(8),
	MaNV varchar(7),
	CONSTRAINT fk_MaNV FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
	NgayNhan datetime NOT NULL DEFAULT GETDATE(),
	SoTien money,
	CONSTRAINT chk_SoTien CHECK (SoTien > 0)
)
GO

INSERT INTO dbo.PhongBan
(
    MaPB,
    TenPB
)
VALUES
(
    '1', -- MaPB - varchar
    N'Ke Toan' -- TenPB - nvarchar
)

INSERT INTO dbo.PhongBan
(
    MaPB,
    TenPB
)
VALUES
(
    '2', -- MaPB - varchar
    N'Kinh Doanh' -- TenPB - nvarchar
)

INSERT INTO dbo.PhongBan
(
    MaPB,
    TenPB
)
VALUES
(
    '3', -- MaPB - varchar
    N'Tuyen Dung' -- TenPB - nvarchar
) 

INSERT INTO dbo.PhongBan
(
    MaPB,
    TenPB
)
VALUES
(
    '4', -- MaPB - varchar
    N'Nghien Cuu' -- TenPB - nvarchar
) 

INSERT INTO dbo.PhongBan
(
    MaPB,
    TenPB
)
VALUES
(
    '5', -- MaPB - varchar
    N'Ngoai Giao' -- TenPB - nvarchar
) 

INSERT INTO dbo.NhanVien
(
    MaNV,
    TenNV,
    NgaySinh,
    SoCMND,
	GioiTinh,
    DiaChi,
    NgayVaoLam,
    MaPB
)
VALUES
(
    '01', -- MaNV - varchar
    N'Thi', -- TenNV - nvarchar
    '1999-8-3 08:02:30', -- NgaySinh - datetime
    '19581239', -- SoCMND - char
	'F',
    N'So 10 A', -- DiaChi - nvarchar
    '2020-08-03 08:03:30', -- NgayVaoLam - datetime
    '1' -- MaPB - varchar
) 

INSERT INTO dbo.NhanVien
(
    MaNV,
    TenNV,
    NgaySinh,
    SoCMND,
	GioiTinh,
    DiaChi,
    NgayVaoLam,
    MaPB
)
VALUES
(
    '02', -- MaNV - varchar
    N'Thu', -- TenNV - nvarchar
    '1997-08-09', -- NgaySinh - datetime
    '27487817', -- SoCMND - char
	'F',
    N'So 10 B', -- DiaChi - nvarchar
    '2020-03-09', -- NgayVaoLam - datetime
    '2' -- MaPB - varchar
) 

INSERT INTO dbo.NhanVien
(
    MaNV,
    TenNV,
    NgaySinh,
    SoCMND,
    DiaChi,
    NgayVaoLam,
    MaPB
)
VALUES
(
    '03', -- MaNV - varchar
    N'Tien', -- TenNV - nvarchar
    '1998-09-30', -- NgaySinh - datetime
    '12341255', -- SoCMND - char
    N'So 10 C', -- DiaChi - nvarchar
    '2019-08-20', -- NgayVaoLam - datetime
    '3' -- MaPB - varchar
) 

INSERT INTO dbo.NhanVien
(
    MaNV,
    TenNV,
    NgaySinh,
    SoCMND,
    DiaChi,
    NgayVaoLam,
    MaPB
)
VALUES
(
    '04', -- MaNV - varchar
    N'Tung', -- TenNV - nvarchar
    '1991-08-09', -- NgaySinh - datetime
    '2551616', -- SoCMND - char
    N'So 10 D', -- DiaChi - nvarchar
    '2018-08-09', -- NgayVaoLam - datetime
    '4' -- MaPB - varchar
) 

INSERT INTO dbo.NhanVien
(
    MaNV,
    TenNV,
    NgaySinh,
    SoCMND,
    DiaChi,
    NgayVaoLam,
    MaPB
)
VALUES
(
    '05', -- MaNV - varchar
    N'Nhung', -- TenNV - nvarchar
    '1995-08-09', -- NgaySinh - datetime
    '1616239', -- SoCMND - char
    N'So 10 F', -- DiaChi - nvarchar
    '2019-08-15', -- NgayVaoLam - datetime
    '5' -- MaPB - varchar
) 

INSERT INTO dbo.LuongDA
(
    MaDA,
    MaNV,
    NgayNhan,
    SoTien
)
VALUES
	(
		'2000', -- MaDA - varchar
		'01', -- MaNV - varchar
		'2020-08-05 10:08:44', -- NgayNhan - datetime
		1000 -- SoTien - money
	),

	(
		'2005', -- MaDA - varchar
		'04', -- MaNV - varchar
		'2021-08-05 10:08:44', -- NgayNhan - datetime
		1100 -- SoTien - money
	),

	(
		'2003', -- MaDA - varchar
		'03', -- MaNV - varchar
		'2020-12-30 10:08:44', -- NgayNhan - datetime
		1400 -- SoTien - money
	),

	(
		'2002', -- MaDA - varchar
		'02', -- MaNV - varchar
		'2020-12-15 10:08:44', -- NgayNhan - datetime
		900 -- SoTien - money
	),
	
	(
		'2002', -- MaDA - varchar
		'05', -- MaNV - varchar
		'2020-11-19 10:08:44', -- NgayNhan - datetime
		1150 -- SoTien - money
	) 

SELECT * FROM dbo.LuongDA ld
SELECT * FROM dbo.NhanVien nv
SELECT * FROM dbo.PhongBan pb
SELECT * FROM dbo.NhanVien nv
	WHERE nv.GioiTinh = 'F'
SELECT MaDA FROM dbo.LuongDA ld
SELECT ld.SoTien, nv.TenNV FROM dbo.LuongDA ld
	INNER JOIN dbo.NhanVien nv ON ld.MaNV = nv.MaNV
	GROUP BY ld.SoTien, nv.TenNV;
SELECT nv.TenNV, pb.TenPB FROM dbo.NhanVien nv
	INNER JOIN dbo.PhongBan pb ON nv.MaPB = pb.MaPB
	WHERE pb.TenPB = 'Ke Toan'
SELECT ld.SoTien, nv.TenNV FROM dbo.LuongDA ld
	INNER JOIN dbo.NhanVien nv ON ld.MaNV = nv.MaNV
	INNER JOIN dbo.PhongBan pb ON nv.MaPB = pb.MaPB
	WHERE pb.TenPB = 'Ke Toan'
SELECT COUNT(nv.TenNV) AS SoLuongKeToanVien FROM dbo.NhanVien nv
	INNER JOIN dbo.PhongBan pb ON nv.MaPB = pb.MaPB
	WHERE pb.TenPB = 'Ke Toan'
SELECT COUNT(nv.SoCMND) AS SoCMNDKetThucSo9 FROM dbo.NhanVien nv
	WHERE nv.SoCMND LIKE '%9'
--SELECT ld.SoTien FROM dbo.NhanVien nv
--	INNER JOIN dbo.LuongDA ld ON nv.MaNV = ld.MaNV
--	WHERE ld.SoTien = MAX(ld.SoTien)
--	GROUP BY nv.TenNV
SELECT  TOP (1) nv.TenNV, ld.SoTien  FROM dbo.LuongDA ld
	INNER JOIN dbo.NhanVien nv ON ld.MaNV = nv.MaNV
	ORDER BY ld.SoTien DESC
SELECT nv.TenNV FROM dbo.NhanVien nv
	INNER JOIN dbo.LuongDA ld ON nv.MaNV = ld.MaNV
	INNER JOIN dbo.PhongBan pb ON nv.MaPB = pb.MaPB
	WHERE pb.TenPB = 'Ke Toan' AND ld.SoTien >= 1000
SELECT pb.TenPB, SUM(ld.SoTien) AS TongLuongPhongBan FROM dbo.NhanVien nv
	INNER JOIN dbo.LuongDA ld ON nv.MaNV = ld.MaNV
	INNER JOIN dbo.PhongBan pb ON nv.MaPB = pb.MaPB
	GROUP BY pb.TenPB
-- Du an it nhat 2 nguoi
SELECT ld.MaDA AS DuAn2Nguoi FROM dbo.LuongDA ld
	INNER JOIN dbo.NhanVien nv ON ld.MaNV = nv.MaNV
	GROUP BY ld.MaDA HAVING COUNT(nv.TenNV) >= 2
SELECT * FROM dbo.NhanVien nv
	WHERE nv.TenNV LIKE 'N%'
SELECT * FROM dbo.NhanVien nv
	JOIN dbo.LuongDA ld ON nv.MaNV = ld.MaNV
	WHERE ld.MaDA = 2003
SELECT nv.TenNV FROM dbo.NhanVien nv
	JOIN dbo.LuongDA ld ON nv.MaNV = ld.MaNV
	WHERE nv.MaNV NOT IN (SELECT ld2.MaNV FROM dbo.LuongDA ld2)
-- Xoa du an co ma DXD02
DELETE FROM dbo.LuongDA WHERE dbo.LuongDA.MaDA = 'DXD02'
-- Xoa Nhan Vien Luong 200000
DELETE FROM dbo.LuongDA WHERE dbo.LuongDA.SoTien >= 20000
-- update 10% luong
UPDATE dbo.LuongDA
	SET dbo.LuongDA.SoTien = dbo.LuongDA.SoTien * 1.1
	WHERE dbo.LuongDA.MaDA = 'XDX01'
DELETE dbo.NhanVien FROM dbo.NhanVien 
	INNER JOIN dbo.LuongDA ld ON dbo.NhanVien.MaNV = ld.MaNV
	WHERE dbo.NhanVien.MaNV NOT IN (SELECT ld2.MaNV FROM dbo.LuongDA ld2)
UPDATE dbo.NhanVien
	SET dbo.NhanVien.NgayVaoLam = '12/02/1999'
	FROM dbo.NhanVien nv
	INNER JOIN dbo.PhongBan pb ON nv.MaPB = pb.MaPB
	WHERE pb.TenPB = 'Ke Toan'

