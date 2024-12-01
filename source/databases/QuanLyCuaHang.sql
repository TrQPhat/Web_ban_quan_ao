CREATE DATABASE QuanLyCuaHang
GO

-- Tạo bảng CUAHANG
CREATE TABLE CUAHANG (
    mach VARCHAR(5) NOT NULL PRIMARY KEY,   -- Mã cửa hàng (Khóa chính)
    tench NVARCHAR(20) NOT NULL,           -- Tên cửa hàng
    tongnv INT NOT NULL,                   -- Tổng số nhân viên
    diachi NVARCHAR (100) NOT NULL
);

-- Tạo bảng NHACUNGCAP
CREATE TABLE NHACUNGCAP (
    mancc VARCHAR(10) NOT NULL PRIMARY KEY, -- Mã nhà cung cấp (Khóa chính)
    tenncc NVARCHAR(20) NOT NULL,          -- Tên nhà cung cấp
    sdt CHAR(10) NOT NULL,                 -- Số điện thoại
    email VARCHAR(50)                      -- Email
);

-- Tạo bảng SANPHAM
CREATE TABLE SANPHAM (
    masp VARCHAR(10) NOT NULL PRIMARY KEY,
    tensp NVARCHAR(50) NOT NULL,
    maloai VARCHAR(10) NOT NULL,
    mancc VARCHAR(10) NOT NULL,
    giaban FLOAT NOT NULL,
    giagoc FLOAT NOT NULL,
    tonkho INT NOT NULL,
    size CHAR(3)
);

-- Tạo bảng LOAISANPHAM
CREATE TABLE LOAISANPHAM (
    maloai VARCHAR(10) NOT NULL PRIMARY KEY,
    tenloai NVARCHAR(11) NOT NULL,
    congdung NVARCHAR(30)
);

-- Tạo bảng CHATLIEU
CREATE TABLE CHATLIEU (
    machatlieu VARCHAR(10) NOT NULL PRIMARY KEY,
    tenchatlieu NVARCHAR(10) NOT NULL,
    masp VARCHAR(10) NOT NULL,
    dactinh NVARCHAR(50),
    nganhnghe NVARCHAR(20)
);

-- Tạo bảng NHANVIEN
CREATE TABLE NHANVIEN (
    manv VARCHAR(10) NOT NULL PRIMARY KEY,
    tennv NVARCHAR(30) NOT NULL,
    mach VARCHAR(5) NOT NULL,
    ngaysinh DATE NOT NULL,
    gioitinh BIT NOT NULL,
    email NVARCHAR(50),
    sdt CHAR(10),
    thanhpho NVARCHAR(20),
    quan NVARCHAR(20),
    duong NVARCHAR(20),
    sonha VARCHAR(20)
);

-- Tạo bảng KHACHHANG
CREATE TABLE KHACHHANG (
    makh VARCHAR(10) NOT NULL PRIMARY KEY,
    tenkh NVARCHAR(30) NOT NULL,
    masothe VARCHAR(10),
    gioitinh BIT NOT NULL,
    ngaysinh DATE NOT NULL,
    thanhpho NVARCHAR(20),
    quan NVARCHAR(20),
    email VARCHAR(50),
    sdt CHAR(10)
);

-- Tạo bảng HOADONBAN
CREATE TABLE HOADONBAN (
    mahdB VARCHAR(10) NOT NULL PRIMARY KEY,
    mach VARCHAR(5) NOT NULL,
    soluongban INT NOT NULL,
    ngayban DATE NOT NULL,
    tongtienthu FLOAT NOT NULL
);

-- Tạo bảng HOADONNHAP
CREATE TABLE HOADONNHAP (
    mahdN VARCHAR(10) NOT NULL PRIMARY KEY,
    mach VARCHAR(5) NOT NULL,
    soluongnhap INT NOT NULL,
    ngaynhap DATE NOT NULL,
    tongtientra FLOAT NOT NULL
);

-- Tạo bảng THETHANHVIEN
CREATE TABLE THETHANHVIEN (
    masothe CHAR(10) NOT NULL PRIMARY KEY,
    maloaithe VARCHAR(2) NOT NULL,
    diemtichluy INT NOT NULL
);

-- Tạo bảng LOAITHETHANHVIEN
CREATE TABLE LOAITHETHANHVIEN (
    maloaithe VARCHAR(2) NOT NULL PRIMARY KEY,
    tenloaithe NVARCHAR(10) NOT NULL,
    dieukien NVARCHAR(30)
);

-- Tạo bảng KHUYENMAI
CREATE TABLE KHUYENMAI (
    makm VARCHAR(10) NOT NULL PRIMARY KEY,
    thoigianbatdau DATE NOT NULL,
    thoigianketthuc DATE NOT NULL
);

-- Tạo bảng MUASANPHAM
CREATE TABLE MUASANPHAM (
    makh VARCHAR(10) NOT NULL,
    masp VARCHAR(10) NOT NULL,
    soluong INT NOT NULL,
    thanhtien FLOAT NOT NULL
);

-- Tạo bảng BANSANPHAM
CREATE TABLE BANSANPHAM (
    mach VARCHAR(5) NOT NULL,
    masp VARCHAR(10) NOT NULL,
    soluong INT NOT NULL,
    thanhtien FLOAT NOT NULL
);

-- Tạo bảng THAMGIAKM
CREATE TABLE THAMGIAKM (
    makh VARCHAR(10) NOT NULL,
    makm VARCHAR(10) NOT NULL,
    ngaythamgia DATE NOT NULL
);

-- Tạo bảng APDUNGKM
CREATE TABLE APDUNGKM (
    masp VARCHAR(10) NOT NULL,
    makm VARCHAR(10) NOT NULL,
    mach VARCHAR(5) NOT NULL,
    spkm NVARCHAR(30),
    soluongkm INT NOT NULL
);
