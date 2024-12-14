-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th12 06, 2024 lúc 06:18 PM
-- Phiên bản máy phục vụ: 8.3.0
-- Phiên bản PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dbquanlycuahang`
--

DROP DATABASE IF EXISTS `dbquanlycuahang`;
CREATE DATABASE `dbquanlycuahang` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dbquanlycuahang`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chatlieu`
--

DROP TABLE IF EXISTS `chatlieu`;
CREATE TABLE IF NOT EXISTS `chatlieu` (
  `macl` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tencl` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dactinh` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`macl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadonban`
--

DROP TABLE IF EXISTS `chitiethoadonban`;
CREATE TABLE IF NOT EXISTS `chitiethoadonban` (
  `mahd` int NOT NULL,
  `masp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `soluong` int NOT NULL,
  `masize` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`mahd`,`masp`),
  KEY `idx_chitiethoadonban` (`mahd`),
  KEY `idx_sanpham` (`masp`, `masize`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadonnhap`
--

DROP TABLE IF EXISTS `chitiethoadonnhap`;
CREATE TABLE IF NOT EXISTS `chitiethoadonnhap` (
  `mahd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `masp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `soluong` int NOT NULL,
  `masize` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`mahd`,`masp`),
  KEY `idx_chitiethoadonnhap` (`mahd`),
  KEY `idx_sanpham` (`masp`, `masize`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cuahang`
--

DROP TABLE IF EXISTS `cuahang`;
CREATE TABLE IF NOT EXISTS `cuahang` (
  `mach` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tench` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `diachi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hotline` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(250) NOT NULL,
  PRIMARY KEY (`mach`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinhanh`
--

DROP TABLE IF EXISTS `hinhanh`;
CREATE TABLE IF NOT EXISTS `hinhanh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(100) NOT NULL,
  `masp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadonban`
--

DROP TABLE IF EXISTS `hoadonban`;
CREATE TABLE IF NOT EXISTS `hoadonban` (
  `mahd` int NOT NULL AUTO_INCREMENT,
  `mach` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `makh` int NOT NULL,
  `httt` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ngaydat` date NOT NULL,
  `matt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`mahd`),
  KEY `idx_cuahang` (`mach`),
  KEY `idx_khachhang` (`makh`),
  KEY `idx_trangthai` (`matt`),
  KEY `idx_hoadonban` (`mahd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadonnhap`
--

DROP TABLE IF EXISTS `hoadonnhap`;
CREATE TABLE IF NOT EXISTS `hoadonnhap` (
  `mahd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `math` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ngaynhap` date NOT NULL,
  `tongtientra` int NOT NULL,
  `mach` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`mahd`),
  KEY `idx_thuonghieu` (`math`),
  KEY `idx_cuahang` (`mach`),
  KEY `idx_hoadonnhap` (`mahd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE IF NOT EXISTS `khachhang` (
  `makh` int NOT NULL AUTO_INCREMENT,
  `tenkh` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gioitinh` bit(1) NOT NULL,
  `ngaysinh` date NOT NULL,
  `diachi` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `sdt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`makh`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

DROP TABLE IF EXISTS `loaisanpham`;
CREATE TABLE IF NOT EXISTS `loaisanpham` (
  `maloai` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tenloai` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`maloai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `masp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tensp` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mota` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `maloai` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `math` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `macl` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gianhap` int NOT NULL,
  `giaban` int NOT NULL,
  PRIMARY KEY (`masp`),
  KEY `idx_loai` (`maloai`),
  KEY `idx_thuonghieu` (`math`),
  KEY `idx_chatlieu` (`macl`),
  KEY `idx_masp` (`masp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size`
--

DROP TABLE IF EXISTS `size`;
CREATE TABLE IF NOT EXISTS `size` (
  `masize` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tensize` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`masize`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
CREATE TABLE IF NOT EXISTS `taikhoan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `makh` int NOT NULL,
  `email` varchar(250) NOT NULL,
  `matkhau` char(30) NOT NULL,
  `quyen` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_khachhang` (`makh`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuonghieu`
--

DROP TABLE IF EXISTS `thuonghieu`;
CREATE TABLE IF NOT EXISTS `thuonghieu` (
  `math` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tenth` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`math`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tonkho`
--

DROP TABLE IF EXISTS `tonkho`;
CREATE TABLE IF NOT EXISTS `tonkho` (
  `mach` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `masp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `masize` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `soluong` int NOT NULL,
  PRIMARY KEY (`mach`,`masp`,`masize`),
  KEY `idx_sanpham` (`mach`, `masp`, `masize`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trangthai`
--

DROP TABLE IF EXISTS `trangthai`;
CREATE TABLE IF NOT EXISTS `trangthai` (
  `matt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tentt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`matt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
--   Các ràng buộc
--

/*Bảng `SANPHAM`*/

ALTER TABLE `SANPHAM`
	ADD CONSTRAINT `FK_LOAISANPHAM` FOREIGN KEY (`maloai`) REFERENCES `LOAISANPHAM`(`maloai`) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT `FK_THUONGHIEU` FOREIGN KEY (`math`) REFERENCES `THUONGHIEU`(`math`) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT `FK_CHATLIEU` FOREIGN KEY (`macl`) REFERENCES `CHATLIEU`(`macl`) ON DELETE CASCADE ON UPDATE CASCADE;

/*Bảng `HINHANH`*/

ALTER TABLE `HINHANH`
	ADD CONSTRAINT `FK_HINHANH_SANPHAM` FOREIGN KEY (`masp`) REFERENCES `SANPHAM`(`masp`) ON DELETE CASCADE ON UPDATE CASCADE;

/*Bảng `TONKHO`*/
ALTER TABLE `TONKHO`
	ADD CONSTRAINT `FK_TONKHO_CUAHANG` FOREIGN KEY (`mach`) REFERENCES `CUAHANG`(`mach`) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT `FK_TONKHO_SANPHAM` FOREIGN KEY (`masp`) REFERENCES `SANPHAM`(`masp`) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT `FK_TONKHO_SIZE` FOREIGN KEY (`masize`) REFERENCES `SIZE`(`masize`) ON DELETE CASCADE ON UPDATE CASCADE;

/*Bảng `TAIKHOAN`*/
ALTER TABLE `TAIKHOAN`
	ADD CONSTRAINT `FK_TAIKHOAN_KHACHHANG` FOREIGN KEY (`makh`) REFERENCES `KHACHHANG`(`makh`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Bảng `HOADONBAN`
--

ALTER TABLE `HOADONBAN`
	ADD CONSTRAINT `FK_HOADONBAN_CUAHANG` FOREIGN KEY (`mach`) REFERENCES `CUAHANG`(`mach`) ON UPDATE CASCADE,
	ADD CONSTRAINT `FK_HOADONBAN_KHACHHANG` FOREIGN KEY (`makh`) REFERENCES `KHACHHANG`(`makh`) ON UPDATE CASCADE,
	ADD CONSTRAINT `FK_HOADONBAN_TRANGTHAI` FOREIGN KEY (`matt`) REFERENCES `TRANGTHAI`(`matt`) ON UPDATE CASCADE;

--
-- Bảng `CHITIETHOADONBAN`
--

ALTER TABLE `CHITIETHOADONBAN`
	ADD CONSTRAINT `FK_CHITIETHOADONBAN_HOADON` FOREIGN KEY (`mahd`) REFERENCES `HOADONBAN`(`mahd`) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT `FK_CHITIETHOADONBAN_SANPHAM` FOREIGN KEY (`masp`) REFERENCES `SANPHAM`(`masp`);

--
-- Bảng `HOADONNHAP`
--

ALTER TABLE `HOADONNHAP`
	ADD CONSTRAINT `FK_HOADONNHAP_THUONGHIEU` FOREIGN KEY (`math`) REFERENCES `THUONGHIEU`(`math`) ON UPDATE CASCADE,
	ADD CONSTRAINT `FK_HOADONNHAP_CUAHANG` FOREIGN KEY (`mach`) REFERENCES `CUAHANG`(`mach`) ON UPDATE CASCADE;

--
-- Bảng `CHITIETHOADONNHAP`
--

ALTER TABLE `CHITIETHOADONNHAP`
	ADD CONSTRAINT `FK_CHITIETHOADONNHAP_HOADON` FOREIGN KEY (`mahd`) REFERENCES `HOADONNHAP`(`mahd`) ON UPDATE CASCADE,
	ADD CONSTRAINT `FK_CHITIETHOADONNHAP_SANPHAM` FOREIGN KEY (`masp`) REFERENCES `SANPHAM`(`masp`);



COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
