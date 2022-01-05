create database SHOPGIAY
ON 
(Name = SHOPGIAY, 
FILENAME = 'E:\SHOPGIAY.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON
(NAME = 'SHOPGIAY_Log',
FILENAME = 'E:\SHOPGIAY.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB)
go
---------------------------
----Tao Table--------------
use SHOPGIAY
-----------------------------------------------------------------------------
--------------->TAO TABLE ADMIN
-----------------------------------------------------------------------------
CREATE TABLE NHANVIEN(
	[MANV] [INT] IDENTITY(1,1) NOT NULL,
	[HOTENNV] [NVARCHAR] (20) NOT NULL,
	[GIOITINH] [NVARCHAR] (3) NOT NULL,
	[NGAYSINH] [DATETIME] NOT NULL,
	[DIACHI] [NVARCHAR] (200) NOT NULL,
	[DIENTHOAI] [NVARCHAR] (11) NOT NULL,
	[LUONG] [INT] check (LUONG >=0),
	[TENLOAINV] [NVARCHAR] (100) NOT NULL,
	[TENDN] [NVARCHAR] (30) NOT NULL,
	[MATKHAU] [VARCHAR] (20) NOT NULL,
	[HINHANH] [NVARCHAR] (200) NOT NULL,
	CONSTRAINT P_NHANVIEN PRIMARY KEY (MANV)
)
GO
----------------------------------------------------------------
-------THEM DU LIEU----------------
--------------------------------------------------------------
INSERT INTO NHANVIEN(HOTENNV,GIOITINH,NGAYSINH,DIACHI,DIENTHOAI,LUONG,TENLOAINV,TENDN,MATKHAU,HINHANH)
	VALUES(N'Vũ Quang Long',N'Nam',17/12/2000,N'HCM','036172382',0,'Admin','admin','abc123','avata.jpg')

-----------------------------------------------------------------------------
--------------->TAO TABLE KHACHHANG 
-----------------------------------------------------------------------------
CREATE TABLE KHACHHANG(
	[MAKH] [INT] IDENTITY(1,1)  NOT NULL,
	[HOTENKH] [NVARCHAR] (20) NOT NULL,
	[DIENTHOAI] [NVARCHAR](11) NOT NULL,
	[DIACHI][NVARCHAR] (200),
	[TENDNKH] [NVARCHAR] (30) NOT NULL,
	[MATKHAUKH] [NVARCHAR] (20) NOT NULL,
	[EMAIL][NVARCHAR](50),
	[NGAYSINH][DATETIME],
	[HINHANH] [NVARCHAR] (200),
	CONSTRAINT P_KHACHHANG PRIMARY KEY (MAKH),
)
GO
----------------------------------------------------------------
-------THEM DU LIEU----------------
--------------------------------------------------------------
INSERT INTO KHACHHANG(HOTENKH,DIENTHOAI,DIACHI,TENDNKH,MATKHAUKH,EMAIL,NGAYSINH,HINHANH)
	VALUES(N'Nguyễn Minh Triết','036172382',N'200 Nguyễn Hữu Tiến, Q.Tân Phú, TP.Hồ Chí Minh','a','123',N'long.pepssi@gmail.com',12/17/2000,'avata.jpg')

-----------------------------------------------------------------------------
--------------->TAO TABLE LOAIGIAY 
-----------------------------------------------------------------------------
CREATE TABLE LOAI(
	[MALOAI]  [INT] IDENTITY(1,1)   NOT NULL,
	[TENLOAI] [NVARCHAR] (max) NOT NULL,
	CONSTRAINT P_GAME PRIMARY KEY (MALOAI),
)
GO
----------------------------------------------------------------
-------THEM DU LIEU----------------
--------------------------------------------------------------
INSERT INTO LOAI(TENLOAI)
	VALUES(N'Giày Thể Thao Nam')
INSERT INTO LOAI(TENLOAI)
	VALUES(N'Giày Thể Thao Nữ')
INSERT INTO LOAI(TENLOAI)
	VALUES(N'Giày Đôi')
INSERT INTO LOAI(TENLOAI)
	VALUES(N'Giày Bitis')
INSERT INTO LOAI(TENLOAI)
	VALUES(N'Giày Thời Trang')
INSERT INTO LOAI(TENLOAI)
	VALUES(N'Giày Lười Da')
INSERT INTO LOAI(TENLOAI)
	VALUES(N'Giày Công Sở')
INSERT INTO LOAI(TENLOAI)
	VALUES(N'Giày Boot Da')


-----------------------------------------------------------------------------
--------------->TAO TABLE THUONG HIEU 
-----------------------------------------------------------------------------
CREATE TABLE THUONGHIEU(
	[MATH]  [INT] IDENTITY(1,1)   NOT NULL,
	[TENTH] [NVARCHAR] (20) NOT NULL,
	[LOGO]	[NVARCHAR] (100),
	CONSTRAINT P_XEPHANG PRIMARY KEY (MATH),
)
GO
----------------------------------------------------------------
-------THEM DU LIEU----------------
--------------------------------------------------------------
INSERT INTO THUONGHIEU(TENTH,LOGO)
	VALUES (N'Converse',N'Converse.png')
INSERT INTO THUONGHIEU(TENTH,LOGO)
	VALUES (N'Adidas',N'Adidas.png')
INSERT INTO THUONGHIEU(TENTH,LOGO)
	VALUES (N'Nike',N'Nike.png')
INSERT INTO THUONGHIEU(TENTH,LOGO)
	VALUES (N'Puma',N'puma.png')
INSERT INTO THUONGHIEU(TENTH,LOGO)
	VALUES (N'Vans',N'vans.jpg')
INSERT INTO THUONGHIEU(TENTH,LOGO)
	VALUES (N'Fila',N'fila.png')
-----------------------------------------------------------------------------
--------------->TAO TABLE KICHTHUOC 
-----------------------------------------------------------------------------
CREATE TABLE KICHTHUOC(
	[MAKICHTHUOC]  [INT] IDENTITY(1,1)   NOT NULL,
	[TENKICHTHUOC] [INT] NOT NULL,
	CONSTRAINT P_KICHTHUOC PRIMARY KEY (MAKICHTHUOC),
)
GO
----------------------------------------------------------------
-------THEM DU LIEU----------------
--------------------------------------------------------------
INSERT INTO KICHTHUOC(TENKICHTHUOC)
	VALUES (36)
INSERT INTO KICHTHUOC(TENKICHTHUOC)
	VALUES (37)
INSERT INTO KICHTHUOC(TENKICHTHUOC)
	VALUES (38)
INSERT INTO KICHTHUOC(TENKICHTHUOC)
	VALUES (39)
INSERT INTO KICHTHUOC(TENKICHTHUOC)
	VALUES (40)
INSERT INTO KICHTHUOC(TENKICHTHUOC)
	VALUES (41)
INSERT INTO KICHTHUOC(TENKICHTHUOC)
	VALUES (42)
INSERT INTO KICHTHUOC(TENKICHTHUOC)
	VALUES (43)
-----------------------------------------------------------------------------
--------------->TAO TABLE MÀU
-----------------------------------------------------------------------------
CREATE TABLE MAUSAC(
	[MAMAUSAC]  [INT] IDENTITY(1,1)   NOT NULL,
	[TENMAUSAC] [NVARCHAR](20) NOT NULL,
	CONSTRAINT P_MAUSAC PRIMARY KEY (MAMAUSAC),
)
GO
----------------------------------------------------------------
-------THEM DU LIEU----------------
--------------------------------------------------------------
INSERT INTO MAUSAC(TENMAUSAC)
	VALUES (N'Đen')
INSERT INTO MAUSAC(TENMAUSAC)
	VALUES (N'Trắng')
INSERT INTO MAUSAC(TENMAUSAC)
	VALUES (N'Đỏ')
INSERT INTO MAUSAC(TENMAUSAC)
	VALUES (N'Xanh Biển')
-----------------------------------------------------------------------------
--------------->TAO TABLE HINH ANH 
-----------------------------------------------------------------------------


-----------------------------------------------------------------------------
--------------->TAO TABLE GIAY 
-----------------------------------------------------------------------------
CREATE TABLE GIAY(
	[MAGIAY] [INT] IDENTITY(1,1)  NOT NULL,
	[TENGIAY] [NVARCHAR] (100) NOT NULL,
	[DONGIAMUA] [INT] CHECK (DONGIAMUA>=0),
	[DONGIABAN] [INT] check (DONGIABAN>=0),
	[MATH][INT] NOT NULL,
	[MALOAI] [INT]NOT NULL,
	[MAKICHTHUOC] [INT] NOT NULL,
	[MAMAUSAC] [INT] NOT NULL,
	[SOLUONG] [INT] NOT NULL,
	[HINHANH] [NVARCHAR] (100),
	[MOTA] [NVARCHAR] (MAX) NOT NULL,
	CONSTRAINT P_GIAY PRIMARY KEY (MAGIAY),
	CONSTRAINT F_GIAY_THUONGHIEU FOREIGN KEY (MATH) REFERENCES THUONGHIEU(MATH),
	CONSTRAINT F_GIAY_LOAI FOREIGN KEY (MALOAI) REFERENCES LOAI(MALOAI),
	CONSTRAINT F_GIAY_KICHTHUOC FOREIGN KEY (MAKICHTHUOC) REFERENCES KICHTHUOC(MAKICHTHUOC),
	CONSTRAINT F_GIAY_MAUSAC FOREIGN KEY (MAMAUSAC) REFERENCES MAUSAC(MAMAUSAC)
)
GO
----------------------------------------------------------------
-------THEM DU LIEU----------------
--------------------------------------------------------------
INSERT INTO GIAY(TENGIAY,DONGIAMUA,DONGIABAN,MATH,MALOAI,MAKICHTHUOC,MAMAUSAC,SOLUONG,HINHANH,MOTA)
	VALUES (N'Giày Thể Thao FanSport Alpha ĐEN SF',699000,950000,3,1,4,2,10,N'75f46b38bb8e1649c0c86a41f49dbbe2-2725792953093682255.jpg',N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.')
INSERT INTO GIAY(TENGIAY,DONGIAMUA,DONGIABAN,MATH,MALOAI,MAKICHTHUOC,MAMAUSAC,SOLUONG,HINHANH,MOTA)
	VALUES (N'Giày Thể Thao XSPORT MLB Chunky P Boston HỒNG REP',493000,550000,3,1,4,2,10,N'f42_7ebe1b59a6db44d8975b238d1be98ba2.jpg',N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.')
INSERT INTO GIAY(TENGIAY,DONGIAMUA,DONGIABAN,MATH,MALOAI,MAKICHTHUOC,MAMAUSAC,SOLUONG,HINHANH,MOTA)
	VALUES (N'GIày Tể Thao Nam Thoáng Kí',235000,320000,1,2,3,1,30,N'825ab5b5336f243173f298c116076340.jpg',N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.')
INSERT INTO GIAY(TENGIAY,DONGIAMUA,DONGIABAN,MATH,MALOAI,MAKICHTHUOC,MAMAUSAC,SOLUONG,HINHANH,MOTA)
	VALUES (N'Giày Adidas X9000L4 new 100%',2000000,3500000,3,4,1,1,15,N'671bf789547d2874dc0a1c0ea538393f-2722833391967129865.jpg',N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.')
INSERT INTO GIAY(TENGIAY,DONGIAMUA,DONGIABAN,MATH,MALOAI,MAKICHTHUOC,MAMAUSAC,SOLUONG,HINHANH,MOTA)
	VALUES (N'Giày Bitis hunter sọc caro đen',300000 ,250000,3,1,4,2,10,N'caeb9b4d53eebc238e07167e73cc6e04-2725400027013924436.jpg',N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.')
INSERT INTO GIAY(TENGIAY,DONGIAMUA,DONGIABAN,MATH,MALOAI,MAKICHTHUOC,MAMAUSAC,SOLUONG,HINHANH,MOTA)
	VALUES (N'Giày bitis hunter street đẹp ngon',390000 ,450000,6,5,4,3,50,N'f42_7ebe1b59a6db44d8975b238d1be98ba2.jpg',N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.')
INSERT INTO GIAY(TENGIAY,DONGIAMUA,DONGIABAN,MATH,MALOAI,MAKICHTHUOC,MAMAUSAC,SOLUONG,HINHANH,MOTA)
	VALUES (N'Gìay Da Nam Cao Cấp',480000,600000,6,7,4,2,10,N'giay-luoi-nam-da-bo-cao-cap-gnta5501-d..jpg',N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.')
INSERT INTO GIAY(TENGIAY,DONGIAMUA,DONGIABAN,MATH,MALOAI,MAKICHTHUOC,MAMAUSAC,SOLUONG,HINHANH,MOTA)
	VALUES (N'Giày Chelsea Boots',2150000,3150000,4,8,8,1,5,N'giay-chelsea-boots-den-40-footwear-leonardo-15699549028457_600x.png',N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.')
INSERT INTO GIAY(TENGIAY,DONGIAMUA,DONGIABAN,MATH,MALOAI,MAKICHTHUOC,MAMAUSAC,SOLUONG,HINHANH,MOTA)
	VALUES (N' Giày Sneaker Thể Thao Nam',299000 ,950000,3,4,5,3,60,N'shopping.png',N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.')
INSERT INTO GIAY(TENGIAY,DONGIAMUA,DONGIABAN,MATH,MALOAI,MAKICHTHUOC,MAMAUSAC,SOLUONG,HINHANH,MOTA)
	VALUES (N'Mẫu Giày Lười Nam Trẻ Trung',299000,369000,5,3,1,2,100,N'0744522dfac1a917eb61035bc7c93388.jpg',N'Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.')

-----------------------------------------------------------------------------
--------------->TAO TABLE HT_THANHTOAN 
-----------------------------------------------------------------------------
CREATE TABLE HT_THANHTOAN(
	[MATT] [INT] IDENTITY(1,1)  NOT NULL,
	[TENTT] [NVARCHAR] (100) NOT NULL,
	CONSTRAINT P_HT_THANHTOAN PRIMARY KEY (MATT)
)
GO
-----------------------------------------------------------------------------
--------------->TAO TABLE PHIEUDATHANG
-----------------------------------------------------------------------------
CREATE TABLE PHIEUMUA(
	[MAPHIEUDH] [INT] IDENTITY(1,1)  NOT NULL,
	[MAKH] [INT]  NOT NULL,
	[MATT] [INT]  NOT NULL,
	[MAGIAY] [INT]  NOT NULL,
	[NGAYLAP] [DATETIME] NOT NULL,
	[TONGTIEN] [INT] NULL,
	[DATHANHTOAN] [BIT],
	CONSTRAINT P_PHIEUDATHANG PRIMARY KEY (MAPHIEUDH),
	CONSTRAINT F_PHIEUDATHANG_MAKH FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH),
	CONSTRAINT F_PHIEUDATHANG_MAGIAY FOREIGN KEY (MAGIAY) REFERENCES GIAY(MAGIAY),
	CONSTRAINT F_PHIEUDATHANG_MATT FOREIGN KEY (MATT) REFERENCES HT_THANHTOAN(MATT),
)
GO


-----------------------------------------------------------------------------
--------------->TAO TABLE PHIEUNHAPKHO 
-----------------------------------------------------------------------------
CREATE TABLE PHIEUNHAPKHO(
	[MAPHIEUNK] [INT] IDENTITY(1,1)  NOT NULL,
	[NGAYNK] [DATETIME] NOT NULL,
	[MANV] [INT]  NOT NULL,
	[MAGIAY] [INT]  NOT NULL,
	CONSTRAINT P_PHIEUNHAPKHO PRIMARY KEY (MAPHIEUNK),
	CONSTRAINT F_PHIEUNHAPKHO_MANV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
	CONSTRAINT F_PHIEUNHAPKHO_MAGIAY FOREIGN KEY (MAGIAY) REFERENCES GIAY(MAGIAY)
) 
go
-----------------------------------------------------------------------------
--------------->TAO TABLE  LOAITHANHLI
-----------------------------------------------------------------------------
CREATE TABLE LOAITHANHLI(
	[MALOAITL] [INT]  IDENTITY(1,1) NOT NULL,
	[TENLOAITL] [NVARCHAR] (MAX) NOT NULL,
	[GIA] [INT] NOT NULL,
	CONSTRAINT P_LOAITHANHLI PRIMARY KEY (MALOAITL),

)
GO
-----------------------------------------------------------------------------
--------------->TAO TABLE PHIEUTHANHLI
-----------------------------------------------------------------------------
CREATE TABLE PHIEUTHANHLI(
	[MAPHIEUTL] [INT]  IDENTITY(1,1) NOT NULL,
	[MAGIAY] [INT]   NOT NULL,
	[MAKH] [INT] NOT NULL,
	[MALOAITL] [INT]   NOT NULL,
	[NGAYTHANHLI] [DATETIME] NOT NULL,
	CONSTRAINT P_PHIEUTHANHLI PRIMARY KEY (MAPHIEUTL),
	CONSTRAINT F_PHIEUTHANHLI_MAGIAY FOREIGN KEY (MAGIAY) REFERENCES GIAY(MAGIAY),
	CONSTRAINT F_PHIEUTHANHLI_MALOAITL FOREIGN KEY (MALOAITL) REFERENCES LOAITHANHLI(MALOAITL),
	CONSTRAINT F_PHIEUTHANHLI_MAKH FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)
)
GO
CREATE TABLE HINH(
	[MAHINH]  [INT] IDENTITY(1,1)   NOT NULL,
	[MAGIAY] [INT]  NOT NULL,
	[HINH] [NVARCHAR] (100),
	CONSTRAINT P_HINH PRIMARY KEY (MAHINH,MAGIAY),
	CONSTRAINT F_HINH_MAGIAY FOREIGN KEY (MAGIAY) REFERENCES GIAY(MAGIAY)
)
GO
-----------------------------------------------------------------------------
--------------->NHAP DU LIEU 
-----------------------------------------------------------------------------
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(1,N'sp1-hinh1.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(1,N'sp1-hinh2.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(1,N'sp1-hinh3.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(1,N'sp1-hinh4.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(1,N'sp1-hinh5.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(2,N'sp2-hinh1.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(2,N'sp2-hinh2.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(2,N'sp2-hinh3.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(2,N'sp2-hinh4.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(2,N'sp2-hinh5.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(3,N'sp3-hinh1.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(3,N'sp3-hinh2.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(3,N'sp3-hinh3.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(3,N'sp3-hinh4.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(3,N'sp3-hinh5.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(4,N'sp4-hinh1.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(4,N'sp4-hinh2.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(4,N'sp4-hinh3.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(4,N'sp4-hinh4.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(4,N'sp4-hinh5.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(5,N'sp5-hinh1.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(5,N'sp5-hinh2.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(5,N'sp5-hinh3.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(5,N'sp5-hinh4.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(5,N'sp5-hinh5.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(6,N'sp6-hinh1.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(6,N'sp6-hinh2.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(6,N'sp6-hinh3.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(6,N'sp6-hinh4.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(6,N'sp6-hinh5.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(7,N'sp7-hinh1.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(7,N'sp7-hinh2.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(7,N'sp7-hinh3.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(7,N'sp7-hinh4.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(7,N'sp7-hinh5.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(8,N'sp8-hinh1.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(8,N'sp8-hinh2.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(8,N'sp8-hinh3.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(8,N'sp8-hinh4.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(8,N'sp8-hinh5.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(9,N'sp9-hinh1.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(9,N'sp9-hinh2.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(9,N'sp9-hinh3.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(9,N'sp9-hinh4.jpg')
INSERT INTO HINH(MAGIAY,HINH)
	VALUES(9,N'sp9-hinh5.jpg')







