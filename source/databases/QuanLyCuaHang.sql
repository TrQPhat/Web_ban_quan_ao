﻿CREATE DATABASE QuanLyCuaHang;
USE QuanLyCuaHang;

-- Tạo bảng CUAHANG
CREATE TABLE CUAHANG (
    mach CHAR(10) PRIMARY KEY,   -- Mã cửa hàng (Khóa chính)
    tench NVARCHAR(20) NOT NULL, -- Tên cửa hàng
    diachi NVARCHAR(100) NOT NULL, 
    hotline VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL
);

-- Tạo bảng THUONGHIEU
CREATE TABLE THUONGHIEU (
    math CHAR(10) PRIMARY KEY, -- Mã nhà cung cấp (Khóa chính)
    tenth NVARCHAR(20) NOT NULL -- Tên nhà cung cấp
);

-- Tạo bảng LOAISANPHAM
CREATE TABLE LOAISANPHAM (
    maloai CHAR(10) PRIMARY KEY,
    tenloai NVARCHAR(11) NOT NULL
);

-- Tạo bảng CHATLIEU
CREATE TABLE CHATLIEU (
    macl CHAR(10) PRIMARY KEY,
    tencl NVARCHAR(10) NOT NULL,
    dactinh NVARCHAR(50)
);

-- Tạo bảng SANPHAM
CREATE TABLE SANPHAM (
    masp CHAR(10) PRIMARY KEY, 
    tensp NVARCHAR(50) NOT NULL,
    maloai CHAR(10) NOT NULL, -- FK LOAISANPHAM
    math CHAR(10) NOT NULL,	 -- FK THUONGHIEU
    macl CHAR(10) NOT NULL,	 -- FK CHATLIEU
    gianhap FLOAT NOT NULL,
    giaban FLOAT NOT NULL,
    FOREIGN KEY (maloai) REFERENCES LOAISANPHAM(maloai),
    FOREIGN KEY (math) REFERENCES THUONGHIEU(math),
    FOREIGN KEY (macl) REFERENCES CHATLIEU(macl)
);

-- Tạo bảng SIZE
CREATE TABLE SIZE (
    masize CHAR(10) PRIMARY KEY,
    tensize NVARCHAR(10) NOT NULL
);

-- Tạo bảng TONKHO
CREATE TABLE TONKHO (
    mach CHAR(10) NOT NULL,   -- FK TONKHO_CUAHANG
    masp CHAR(10) NOT NULL,   -- FK SANPHAM
    masize CHAR(10) NOT NULL, -- FK SIZE
    soluong INT NOT NULL,
    PRIMARY KEY (mach, masp, masize),
    FOREIGN KEY (mach) REFERENCES CUAHANG(mach),
    FOREIGN KEY (masp) REFERENCES SANPHAM(masp),
    FOREIGN KEY (masize) REFERENCES SIZE(masize)
);

-- Tạo bảng KHACHHANG
CREATE TABLE KHACHHANG (
    makh INT AUTO_INCREMENT PRIMARY KEY,	
    tenkh NVARCHAR(30) NOT NULL,
    gioitinh BIT NOT NULL,
    ngaysinh DATE NOT NULL,
    diachi NVARCHAR(200),
    email VARCHAR(50) NOT NULL,
    sdt CHAR(10) NOT NULL
);

-- Tạo bảng TAIKHOAN
CREATE TABLE TAIKHOAN (
    id INT AUTO_INCREMENT PRIMARY KEY,
    makh INT NOT NULL,           -- FK KHACHHANG
    email VARCHAR(50) NOT NULL,
    matkhau CHAR(30) NOT NULL,
    quyen VARCHAR(10) CHECK (quyen IN ('admin', 'nhanvien', 'khachhang')),
    FOREIGN KEY (makh) REFERENCES KHACHHANG(makh)
);

-- Tạo bảng TRANGTHAI
CREATE TABLE TRANGTHAI (
    matt CHAR(10) PRIMARY KEY,
    tentt NVARCHAR(100) NOT NULL,
    CHECK (matt IN ('DVC', 'DDG', 'DGH'))
);

-- Tạo bảng HOADONBAN
CREATE TABLE HOADONBAN (
    mahd INT AUTO_INCREMENT PRIMARY KEY,
    mach CHAR(10) NOT NULL,    -- FK CUAHANG
    makh INT NOT NULL,         -- FK KHACHHANG
    httt NVARCHAR(50) NOT NULL, -- Hình thức thanh toán
    ngaydat DATE NOT NULL,
    matt CHAR(10) NOT NULL,    -- FK TRANGTHAI
    FOREIGN KEY (mach) REFERENCES CUAHANG(mach),
    FOREIGN KEY (makh) REFERENCES KHACHHANG(makh),
    FOREIGN KEY (matt) REFERENCES TRANGTHAI(matt)
);

-- Tạo bảng CHITIETHOADONBAN
CREATE TABLE CHITIETHOADONBAN (
    mahd INT NOT NULL,         -- FK HOADONBAN
    masp CHAR(10) NOT NULL,    -- FK SANPHAM
    soluong INT NOT NULL,
    masize NVARCHAR(10) NOT NULL,
    PRIMARY KEY (mahd, masp),
    FOREIGN KEY (mahd) REFERENCES HOADONBAN(mahd),
    FOREIGN KEY (masp) REFERENCES SANPHAM(masp)
);

-- Tạo bảng HOADONNHAP
CREATE TABLE HOADONNHAP (
    mahd CHAR(10) PRIMARY KEY,  
    math CHAR(10) NOT NULL,   -- FK THUONGHIEU
    ngaynhap DATE NOT NULL,
    tongtientra FLOAT NOT NULL,
    mach CHAR(10) NOT NULL,
    FOREIGN KEY (math) REFERENCES THUONGHIEU(math),
    FOREIGN KEY (mach) REFERENCES CUAHANG(mach)
);

-- Tạo bảng CHITIETHOADONNHAP
CREATE TABLE CHITIETHOADONNHAP (
    mahd CHAR(10) NOT NULL,  -- FK HOADONNHAP
    masp CHAR(10) NOT NULL,   -- FK SANPHAM
    soluong INT NOT NULL,
    masize NVARCHAR(10) NOT NULL,
    PRIMARY KEY (mahd, masp),
    FOREIGN KEY (mahd) REFERENCES HOADONNHAP(mahd),
    FOREIGN KEY (masp) REFERENCES SANPHAM(masp)
);
