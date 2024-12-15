-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th12 14, 2024 lúc 04:45 PM
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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chatlieu`
--

DROP TABLE IF EXISTS `chatlieu`;
CREATE TABLE IF NOT EXISTS `chatlieu` (
  `macl` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tencl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`macl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `chatlieu`
--

INSERT INTO `chatlieu` (`macl`, `tencl`) VALUES
('BAM', 'Sợi tre'),
('CAN', 'Vải bạt'),
('CHI', 'Vải voan'),
('COT', 'Cotton'),
('DEN', 'Vải Jean'),
('LEA', 'Da'),
('LIN', 'Vải lanh'),
('POL', 'Vải tổng hợp'),
('SIL', 'Lụa'),
('VEL', 'Vải Nhung'),
('WOO', 'Sợi tự nhiên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadonban`
--

DROP TABLE IF EXISTS `chitiethoadonban`;
CREATE TABLE IF NOT EXISTS `chitiethoadonban` (
  `mahd` int NOT NULL,
  `masp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `masize` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `soluong` int NOT NULL,
  PRIMARY KEY (`mahd`,`masp`,`masize`) USING BTREE,
  KEY `idx_chitiethoadonban` (`mahd`),
  KEY `idx_sanpham` (`masp`,`masize`),
  KEY `FK_CHITIETHOADONBAN_SIZE` (`masize`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadonnhap`
--

DROP TABLE IF EXISTS `chitiethoadonnhap`;
CREATE TABLE IF NOT EXISTS `chitiethoadonnhap` (
  `mahd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `masp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `masize` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `soluong` int NOT NULL,
  PRIMARY KEY (`mahd`,`masp`,`masize`) USING BTREE,
  KEY `idx_chitiethoadonnhap` (`mahd`),
  KEY `idx_sanpham` (`masp`,`masize`),
  KEY `FK_CHITIETHOADONNHAP_SIZE` (`masize`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `chitiethoadonnhap`
--

INSERT INTO `chitiethoadonnhap` (`mahd`, `masp`, `masize`, `soluong`) VALUES
('HDN001', 'ELSAO0001', 'L', 50),
('HDN001', 'ELSAO0001', 'M', 50),
('HDN001', 'ELSAO0001', 'S', 50),
('HDN001', 'ELSAO0001', 'XL', 50),
('HDN001', 'ELSAO0002', 'L', 50),
('HDN001', 'ELSAO0002', 'M', 50),
('HDN001', 'ELSAO0002', 'S', 50),
('HDN001', 'ELSAO0002', 'XL', 50),
('HDN001', 'ELSAO0003', 'L', 50),
('HDN001', 'ELSAO0003', 'M', 50),
('HDN001', 'ELSAO0003', 'S', 50),
('HDN001', 'ELSAO0003', 'XL', 50),
('HDN001', 'ELSAO0004', 'L', 50),
('HDN001', 'ELSAO0004', 'M', 50),
('HDN001', 'ELSAO0004', 'S', 50),
('HDN001', 'ELSAO0004', 'XL', 50),
('HDN001', 'ELSAO0005', 'L', 50),
('HDN001', 'ELSAO0005', 'M', 50),
('HDN001', 'ELSAO0005', 'S', 50),
('HDN001', 'ELSAO0005', 'XL', 50),
('HDN001', 'ELSAO0006', 'L', 50),
('HDN001', 'ELSAO0006', 'M', 50),
('HDN001', 'ELSAO0006', 'S', 50),
('HDN001', 'ELSAO0006', 'XL', 50),
('HDN001', 'ELSAO0007', 'L', 50),
('HDN001', 'ELSAO0007', 'M', 50),
('HDN001', 'ELSAO0007', 'S', 50),
('HDN001', 'ELSAO0007', 'XL', 50),
('HDN001', 'ELSAO0008', 'L', 50),
('HDN001', 'ELSAO0008', 'M', 50),
('HDN001', 'ELSAO0008', 'S', 50),
('HDN001', 'ELSAO0008', 'XL', 50),
('HDN001', 'ELSAO0009', 'L', 50),
('HDN001', 'ELSAO0009', 'M', 50),
('HDN001', 'ELSAO0009', 'S', 50),
('HDN001', 'ELSAO0009', 'XL', 50),
('HDN001', 'ELSAO0010', 'L', 50),
('HDN001', 'ELSAO0010', 'M', 50),
('HDN001', 'ELSAO0010', 'S', 50),
('HDN001', 'ELSAO0010', 'XL', 50),
('HDN001', 'ELSAO0011', 'L', 50),
('HDN001', 'ELSAO0011', 'M', 50),
('HDN001', 'ELSAO0011', 'S', 50),
('HDN001', 'ELSAO0011', 'XL', 50),
('HDN001', 'ELSAO0012', 'L', 50),
('HDN001', 'ELSAO0012', 'M', 50),
('HDN001', 'ELSAO0012', 'S', 50),
('HDN001', 'ELSAO0012', 'XL', 50),
('HDN001', 'ELSCV0001', 'L', 50),
('HDN001', 'ELSCV0001', 'M', 50),
('HDN001', 'ELSCV0001', 'S', 50),
('HDN001', 'ELSCV0001', 'XL', 50),
('HDN001', 'ELSCV0002', 'L', 50),
('HDN001', 'ELSCV0002', 'M', 50),
('HDN001', 'ELSCV0002', 'S', 50),
('HDN001', 'ELSCV0002', 'XL', 50),
('HDN001', 'ELSCV0003', 'L', 50),
('HDN001', 'ELSCV0003', 'M', 50),
('HDN001', 'ELSCV0003', 'S', 50),
('HDN001', 'ELSCV0003', 'XL', 50),
('HDN001', 'ELSCV0004', 'L', 50),
('HDN001', 'ELSCV0004', 'M', 50),
('HDN001', 'ELSCV0004', 'S', 50),
('HDN001', 'ELSCV0004', 'XL', 50),
('HDN001', 'ELSCV0005', 'L', 50),
('HDN001', 'ELSCV0005', 'M', 50),
('HDN001', 'ELSCV0005', 'S', 50),
('HDN001', 'ELSCV0005', 'XL', 50),
('HDN001', 'ELSCV0006', 'L', 50),
('HDN001', 'ELSCV0006', 'M', 50),
('HDN001', 'ELSCV0006', 'S', 50),
('HDN001', 'ELSCV0006', 'XL', 50),
('HDN001', 'ELSCV0007', 'L', 50),
('HDN001', 'ELSCV0007', 'M', 50),
('HDN001', 'ELSCV0007', 'S', 50),
('HDN001', 'ELSCV0007', 'XL', 50),
('HDN001', 'ELSCV0008', 'L', 50),
('HDN001', 'ELSCV0008', 'M', 50),
('HDN001', 'ELSCV0008', 'S', 50),
('HDN001', 'ELSCV0008', 'XL', 50),
('HDN001', 'ELSCV0009', 'L', 50),
('HDN001', 'ELSCV0009', 'M', 50),
('HDN001', 'ELSCV0009', 'S', 50),
('HDN001', 'ELSCV0009', 'XL', 50),
('HDN001', 'ELSCV0010', 'L', 50),
('HDN001', 'ELSCV0010', 'M', 50),
('HDN001', 'ELSCV0010', 'S', 50),
('HDN001', 'ELSCV0010', 'XL', 50),
('HDN001', 'ELSCV0011', 'L', 50),
('HDN001', 'ELSCV0011', 'M', 50),
('HDN001', 'ELSCV0011', 'S', 50),
('HDN001', 'ELSCV0011', 'XL', 50),
('HDN001', 'ELSDA0001', 'L', 50),
('HDN001', 'ELSDA0001', 'M', 50),
('HDN001', 'ELSDA0001', 'S', 50),
('HDN001', 'ELSDA0001', 'XL', 50),
('HDN001', 'ELSDA0002', 'L', 50),
('HDN001', 'ELSDA0002', 'M', 50),
('HDN001', 'ELSDA0002', 'S', 50),
('HDN001', 'ELSDA0002', 'XL', 50),
('HDN001', 'ELSDA0003', 'L', 50),
('HDN001', 'ELSDA0003', 'M', 50),
('HDN001', 'ELSDA0003', 'S', 50),
('HDN001', 'ELSDA0003', 'XL', 50),
('HDN001', 'ELSDA0004', 'L', 50),
('HDN001', 'ELSDA0004', 'M', 50),
('HDN001', 'ELSDA0004', 'S', 50),
('HDN001', 'ELSDA0004', 'XL', 50),
('HDN001', 'ELSDA0005', 'L', 50),
('HDN001', 'ELSDA0005', 'M', 50),
('HDN001', 'ELSDA0005', 'S', 50),
('HDN001', 'ELSDA0005', 'XL', 50),
('HDN001', 'ELSDA0006', 'L', 50),
('HDN001', 'ELSDA0006', 'M', 50),
('HDN001', 'ELSDA0006', 'S', 50),
('HDN001', 'ELSDA0006', 'XL', 50),
('HDN001', 'ELSDA0007', 'L', 50),
('HDN001', 'ELSDA0007', 'M', 50),
('HDN001', 'ELSDA0007', 'S', 50),
('HDN001', 'ELSDA0007', 'XL', 50),
('HDN001', 'ELSDA0008', 'L', 50),
('HDN001', 'ELSDA0008', 'M', 50),
('HDN001', 'ELSDA0008', 'S', 50),
('HDN001', 'ELSDA0008', 'XL', 50),
('HDN001', 'ELSDB0001', 'L', 50),
('HDN001', 'ELSDB0001', 'M', 50),
('HDN001', 'ELSDB0001', 'S', 50),
('HDN001', 'ELSDB0001', 'XL', 50),
('HDN001', 'ELSDB0002', 'L', 50),
('HDN001', 'ELSDB0002', 'M', 50),
('HDN001', 'ELSDB0002', 'S', 50),
('HDN001', 'ELSDB0002', 'XL', 50),
('HDN001', 'ELSDB0003', 'L', 50),
('HDN001', 'ELSDB0003', 'M', 50),
('HDN001', 'ELSDB0003', 'S', 50),
('HDN001', 'ELSDB0003', 'XL', 50),
('HDN001', 'ELSDB0004', 'L', 50),
('HDN001', 'ELSDB0004', 'M', 50),
('HDN001', 'ELSDB0004', 'S', 50),
('HDN001', 'ELSDB0004', 'XL', 50),
('HDN001', 'ELSDB0005', 'L', 50),
('HDN001', 'ELSDB0005', 'M', 50),
('HDN001', 'ELSDB0005', 'S', 50),
('HDN001', 'ELSDB0005', 'XL', 50),
('HDN001', 'ELSQU0001', 'L', 50),
('HDN001', 'ELSQU0001', 'M', 50),
('HDN001', 'ELSQU0001', 'S', 50),
('HDN001', 'ELSQU0001', 'XL', 50),
('HDN001', 'ELSQU0002', 'L', 50),
('HDN001', 'ELSQU0002', 'M', 50),
('HDN001', 'ELSQU0002', 'S', 50),
('HDN001', 'ELSQU0002', 'XL', 50),
('HDN001', 'ELSQU0003', 'L', 50),
('HDN001', 'ELSQU0003', 'M', 50),
('HDN001', 'ELSQU0003', 'S', 50),
('HDN001', 'ELSQU0003', 'XL', 50),
('HDN001', 'ELSQU0004', 'L', 50),
('HDN001', 'ELSQU0004', 'M', 50),
('HDN001', 'ELSQU0004', 'S', 50),
('HDN001', 'ELSQU0004', 'XL', 50),
('HDN001', 'ELSQU0005', 'L', 50),
('HDN001', 'ELSQU0005', 'M', 50),
('HDN001', 'ELSQU0005', 'S', 50),
('HDN001', 'ELSQU0005', 'XL', 50),
('HDN001', 'ELSQU0006', 'L', 50),
('HDN001', 'ELSQU0006', 'M', 50),
('HDN001', 'ELSQU0006', 'S', 50),
('HDN001', 'ELSQU0006', 'XL', 50),
('HDN001', 'ELSQU0007', 'L', 50),
('HDN001', 'ELSQU0007', 'M', 50),
('HDN001', 'ELSQU0007', 'S', 50),
('HDN001', 'ELSQU0007', 'XL', 50),
('HDN001', 'ELSQU0008', 'L', 50),
('HDN001', 'ELSQU0008', 'M', 50),
('HDN001', 'ELSQU0008', 'S', 50),
('HDN001', 'ELSQU0008', 'XL', 50),
('HDN001', 'ELSQU0009', 'L', 50),
('HDN001', 'ELSQU0009', 'M', 50),
('HDN001', 'ELSQU0009', 'S', 50),
('HDN001', 'ELSQU0009', 'XL', 50);

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

--
-- Đang đổ dữ liệu cho bảng `cuahang`
--

INSERT INTO `cuahang` (`mach`, `tench`, `diachi`, `hotline`, `email`) VALUES
('CH01', 'Fat Store Parc Mall', 'Tầng 3, số 547 - 549 Tạ Quang Bửu, Phường 4, Quận 8 Thành phố Hồ Chí Minh', '0909.333.8', 'fatstore-fashion@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinhanh`
--

DROP TABLE IF EXISTS `hinhanh`;
CREATE TABLE IF NOT EXISTS `hinhanh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(100) NOT NULL,
  `masp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_HINHANH_SANPHAM` (`masp`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `hinhanh`
--

INSERT INTO `hinhanh` (`id`, `ten`, `masp`) VALUES
(1, 'anh10a.jpg', 'ELSCV0003'),
(2, 'anh10b.jpg', 'ELSCV0003'),
(3, 'anh10c.jpg', 'ELSCV0003'),
(4, 'anh10d.jpg', 'ELSCV0003'),
(5, 'anh11a.jpg', 'ELSDA0003'),
(6, 'anh11b.jpg', 'ELSDA0003'),
(7, 'anh11c.jpg', 'ELSDA0003'),
(8, 'anh11d.jpg', 'ELSDA0003'),
(9, 'anh11e.jpg', 'ELSDA0003'),
(10, 'anh12a.jpg', 'ELSQU0003'),
(11, 'anh12b.jpg', 'ELSQU0003'),
(12, 'anh12c.jpg', 'ELSQU0003'),
(13, 'anh12d.jpg', 'ELSQU0003'),
(14, 'anh12e.jpg', 'ELSQU0003'),
(15, 'anh13a.jpg', 'ELSCV0004'),
(16, 'anh13b.jpg', 'ELSCV0004'),
(17, 'anh13c.jpg', 'ELSCV0004'),
(18, 'anh13d.jpg', 'ELSCV0004'),
(19, 'anh14a.jpg', 'ELSAO0004'),
(20, 'anh14b.jpg', 'ELSAO0004'),
(21, 'anh14c.jpg', 'ELSAO0004'),
(22, 'anh14d.jpg', 'ELSAO0004'),
(23, 'anh15a.jpg', 'ELSCV0005'),
(24, 'anh15b.jpg', 'ELSCV0005'),
(25, 'anh15c.jpg', 'ELSCV0005'),
(26, 'anh15d.jpg', 'ELSCV0005'),
(27, 'anh16a.jpg', 'ELSCV0006'),
(28, 'anh16b.jpg', 'ELSCV0006'),
(29, 'anh16c.jpg', 'ELSCV0006'),
(30, 'anh16d.jpg', 'ELSCV0006'),
(31, 'anh17a.jpg', 'ELSCV0007'),
(32, 'anh17b.jpg', 'ELSCV0007'),
(33, 'anh17c.jpg', 'ELSCV0007'),
(34, 'anh17d.jpg', 'ELSCV0007'),
(35, 'anh18a.jpg', 'ELSDA0004'),
(36, 'anh18b.jpg', 'ELSDA0004'),
(37, 'anh18c.jpg', 'ELSDA0004'),
(38, 'anh18d.jpg', 'ELSDA0004'),
(39, 'anh19a.jpg', 'ELSDA0005'),
(40, 'anh19b.jpg', 'ELSDA0005'),
(41, 'anh19c.jpg', 'ELSDA0005'),
(42, 'anh19d.jpg', 'ELSDA0005'),
(43, 'anh19e.jpg', 'ELSDA0005'),
(44, 'anh1a.jpg', 'ELSDA0001'),
(45, 'anh1b.jpg', 'ELSDA0001'),
(46, 'anh1c.jpg', 'ELSDA0001'),
(47, 'anh1d.jpg', 'ELSDA0001'),
(48, 'anh1e.jpg', 'ELSDA0001'),
(49, 'anh20a.jpg', 'ELSDA0006'),
(50, 'anh20b.jpg', 'ELSDA0006'),
(51, 'anh20c.jpg', 'ELSDA0006'),
(52, 'anh20d.jpg', 'ELSDA0006'),
(53, 'anh20e.jpg', 'ELSDA0006'),
(54, 'anh21a.jpg', 'ELSDA0007'),
(55, 'anh21b.jpg', 'ELSDA0007'),
(56, 'anh21c.jpg', 'ELSDA0007'),
(57, 'anh21d.jpg', 'ELSDA0007'),
(58, 'anh21e.jpg', 'ELSDA0007'),
(59, 'anh22a.jpg', 'ELSAO0005'),
(60, 'anh22b.jpg', 'ELSAO0005'),
(61, 'anh22c.jpg', 'ELSAO0005'),
(62, 'anh22d.jpg', 'ELSAO0005'),
(63, 'anh23a.jpg', 'ELSAO0006'),
(64, 'anh23b.jpg', 'ELSAO0006'),
(65, 'anh23c.jpg', 'ELSAO0006'),
(66, 'anh23d.jpg', 'ELSAO0006'),
(67, 'anh23e.jpg', 'ELSAO0006'),
(68, 'anh24a.jpg', 'ELSAO0007'),
(69, 'anh24b.jpg', 'ELSAO0007'),
(70, 'anh24c.jpg', 'ELSAO0007'),
(71, 'anh24d.jpg', 'ELSAO0007'),
(72, 'anh25a.jpg', 'ELSQU0004'),
(73, 'anh25b.jpg', 'ELSQU0004'),
(74, 'anh25c.jpg', 'ELSQU0004'),
(75, 'anh25d.jpg', 'ELSQU0004'),
(76, 'anh25e.jpg', 'ELSQU0004'),
(77, 'anh26a.jpg', 'ELSAO0008'),
(78, 'anh26b.jpg', 'ELSAO0008'),
(79, 'anh26c.jpg', 'ELSAO0008'),
(80, 'anh26d.jpg', 'ELSAO0008'),
(81, 'anh26e.jpg', 'ELSAO0008'),
(82, 'anh27a.jpg', 'ELSDB0001'),
(83, 'anh27b.jpg', 'ELSDB0001'),
(84, 'anh27c.jpg', 'ELSDB0001'),
(85, 'anh27d.jpg', 'ELSDB0001'),
(86, 'anh28a.jpg', 'ELSAO0009'),
(87, 'anh28b.jpg', 'ELSAO0009'),
(88, 'anh28c.jpg', 'ELSAO0009'),
(89, 'anh28d.jpg', 'ELSAO0009'),
(90, 'anh28e.jpg', 'ELSAO0009'),
(91, 'anh29a.jpg', 'ELSQU0005'),
(92, 'anh29b.jpg', 'ELSQU0005'),
(93, 'anh29c.jpg', 'ELSQU0005'),
(94, 'anh29d.jpg', 'ELSQU0005'),
(95, 'anh29e.jpg', 'ELSQU0005'),
(96, 'anh2a.jpg', 'ELSDA0002'),
(97, 'anh2b.jpg', 'ELSDA0002'),
(98, 'anh2c.jpg', 'ELSDA0002'),
(99, 'anh2d.jpg', 'ELSDA0002'),
(100, 'anh30a.jpg', 'ELSQU0006'),
(101, 'anh30b.jpg', 'ELSQU0006'),
(102, 'anh30c.jpg', 'ELSQU0006'),
(103, 'anh30d.jpg', 'ELSQU0006'),
(104, 'anh31a.jpg', 'ELSCV0008'),
(105, 'anh31b.jpg', 'ELSCV0008'),
(106, 'anh31c.jpg', 'ELSCV0008'),
(107, 'anh31d.jpg', 'ELSCV0008'),
(108, 'anh31e.jpg', 'ELSCV0008'),
(109, 'anh32a.jpg', 'ELSQU0007'),
(110, 'anh32b.jpg', 'ELSQU0007'),
(111, 'anh32c.jpg', 'ELSQU0007'),
(112, 'anh32d.jpg', 'ELSQU0007'),
(113, 'anh32e.jpg', 'ELSQU0007'),
(114, 'anh33a.jpg', 'ELSCV0009'),
(115, 'anh33b.jpg', 'ELSCV0009'),
(116, 'anh33c.jpg', 'ELSCV0009'),
(117, 'anh33d.jpg', 'ELSCV0009'),
(118, 'anh33e.jpg', 'ELSCV0009'),
(119, 'anh34a.jpg', 'ELSAO0010'),
(120, 'anh34b.jpg', 'ELSAO0010'),
(121, 'anh34c.jpg', 'ELSAO0010'),
(122, 'anh34d.jpg', 'ELSAO0010'),
(123, 'anh35a.jpg', 'ELSAO0011'),
(124, 'anh35b.jpg', 'ELSAO0011'),
(125, 'anh35c.jpg', 'ELSAO0011'),
(126, 'anh35d.jpg', 'ELSAO0011'),
(127, 'anh36a.jpg', 'ELSDA0008'),
(128, 'anh36b.jpg', 'ELSDA0008'),
(129, 'anh36c.jpg', 'ELSDA0008'),
(130, 'anh36d.jpg', 'ELSDA0008'),
(131, 'anh36e.jpg', 'ELSDA0008'),
(132, 'anh37a.jpg', 'ELSAO0012'),
(133, 'anh37b.jpg', 'ELSAO0012'),
(134, 'anh37c.jpg', 'ELSAO0012'),
(135, 'anh37d.jpg', 'ELSAO0012'),
(136, 'anh38a.jpg', 'ELSCV0010'),
(137, 'anh38b.jpg', 'ELSCV0010'),
(138, 'anh38c.jpg', 'ELSCV0010'),
(139, 'anh38d.jpg', 'ELSCV0010'),
(140, 'anh39a.jpg', 'ELSQU0008'),
(141, 'anh39b.jpg', 'ELSQU0008'),
(142, 'anh39c.jpg', 'ELSQU0008'),
(143, 'anh39d.jpg', 'ELSQU0008'),
(144, 'anh39e.jpg', 'ELSQU0008'),
(145, 'anh3a.jpg', 'ELSQU0001'),
(146, 'anh3b.jpg', 'ELSQU0001'),
(147, 'anh3c.jpg', 'ELSQU0001'),
(148, 'anh3d.jpg', 'ELSQU0001'),
(149, 'anh3e.jpg', 'ELSQU0001'),
(150, 'anh40a.jpg', 'ELSQU0009'),
(151, 'anh40b.jpg', 'ELSQU0009'),
(152, 'anh40c.jpg', 'ELSQU0009'),
(153, 'anh40d.jpg', 'ELSQU0009'),
(154, 'anh40e.jpg', 'ELSQU0009'),
(155, 'anh41a.jpg', 'ELSDB0002'),
(156, 'anh41b.jpg', 'ELSDB0002'),
(157, 'anh41c.jpg', 'ELSDB0002'),
(158, 'anh41d.jpg', 'ELSDB0002'),
(159, 'anh41e.jpg', 'ELSDB0002'),
(160, 'anh42a.jpg', 'ELSDB0003'),
(161, 'anh42b.jpg', 'ELSDB0003'),
(162, 'anh42c.jpg', 'ELSDB0003'),
(163, 'anh42d.jpg', 'ELSDB0003'),
(164, 'anh42e.jpg', 'ELSDB0003'),
(165, 'anh43a.jpg', 'ELSCV0011'),
(166, 'anh43b.jpg', 'ELSCV0011'),
(167, 'anh43c.jpg', 'ELSCV0011'),
(168, 'anh43d.jpg', 'ELSCV0011'),
(169, 'anh43e.jpg', 'ELSCV0011'),
(170, 'anh44a.jpg', 'ELSDB0004'),
(171, 'anh44b.jpg', 'ELSDB0004'),
(172, 'anh44c.jpg', 'ELSDB0004'),
(173, 'anh44d.jpg', 'ELSDB0004'),
(174, 'anh44e.jpg', 'ELSDB0004'),
(175, 'anh45a.jpg', 'ELSDB0005'),
(176, 'anh45b.jpg', 'ELSDB0005'),
(177, 'anh45c.jpg', 'ELSDB0005'),
(178, 'anh4a.jpg', 'ELSCV0001'),
(179, 'anh4b.jpg', 'ELSCV0001'),
(180, 'anh4c.jpg', 'ELSCV0001'),
(181, 'anh4d.jpg', 'ELSCV0001'),
(182, 'anh4e.jpg', 'ELSCV0001'),
(183, 'anh5a.jpg', 'ELSAO0001'),
(184, 'anh5b.jpg', 'ELSAO0001'),
(185, 'anh5c.jpg', 'ELSAO0001'),
(186, 'anh5d.jpg', 'ELSAO0001'),
(187, 'anh5e.jpg', 'ELSAO0001'),
(188, 'anh6a.jpg', 'ELSAO0002'),
(189, 'anh6b.jpg', 'ELSAO0002'),
(190, 'anh6c.jpg', 'ELSAO0002'),
(191, 'anh6d.jpg', 'ELSAO0002'),
(192, 'anh7a.jpg', 'ELSAO0003'),
(193, 'anh7b.jpg', 'ELSAO0003'),
(194, 'anh7c.jpg', 'ELSAO0003'),
(195, 'anh7d.jpg', 'ELSAO0003'),
(196, 'anh8a.jpg', 'ELSQU0002'),
(197, 'anh8b.jpg', 'ELSQU0002'),
(198, 'anh8c.jpg', 'ELSQU0002'),
(199, 'anh8d.jpg', 'ELSQU0002'),
(200, 'anh8e.jpg', 'ELSQU0002'),
(201, 'anh9a.jpg', 'ELSCV0002'),
(202, 'anh9b.jpg', 'ELSCV0002'),
(203, 'anh9c.jpg', 'ELSCV0002'),
(204, 'anh9d.jpg', 'ELSCV0002'),
(205, 'anh9e.jpg', 'ELSCV0002');

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
  `mach` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`mahd`),
  KEY `idx_thuonghieu` (`math`),
  KEY `idx_cuahang` (`mach`),
  KEY `idx_hoadonnhap` (`mahd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `hoadonnhap`
--

INSERT INTO `hoadonnhap` (`mahd`, `math`, `ngaynhap`, `mach`) VALUES
('HDN001', 'ELS', '2024-12-01', 'CH01');

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

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`maloai`, `tenloai`) VALUES
('AO', 'Áo'),
('CV', 'Chân váy'),
('DA', 'Đầm'),
('DB', 'Đồ bộ'),
('QU', 'Quần');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `masp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tensp` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mota` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`masp`, `tensp`, `mota`, `maloai`, `math`, `macl`, `gianhap`, `giaban`) VALUES
('ELSAO0001', ' SM TƠ XANH CỔ ĐỨC XẾP LY GẤU', NULL, 'AO', 'ELS', 'VEL', 375000, 589000),
('ELSAO0002', ' GILE BE SỮA ĐAI EO', NULL, 'AO', 'ELS', 'DEN', 375000, 589000),
('ELSAO0003', ' SƠ MI SẠN HỒNG CỔ ĐỨC', NULL, 'AO', 'ELS', 'POL', 375000, 589000),
('ELSAO0004', ' VEST XỐP KEM HOA NỔI ỐP NẮP TÚI', NULL, 'AO', 'ELS', 'LEA', 375000, 589000),
('ELSAO0005', ' ÁO KHOÁC TƠ ĐEN TÚI HỘP RÚT DÂY TAY', NULL, 'AO', 'ELS', 'SIL', 375000, 589000),
('ELSAO0006', ' SM LỤA HỒNG CỔ ĐỨC TÚI NGỰC', NULL, 'AO', 'ELS', 'WOO', 375000, 589000),
('ELSAO0007', ' SM TƠ KEM PHỦ CÚP NGỰC', NULL, 'AO', 'ELS', 'WOO', 375000, 589000),
('ELSAO0008', ' ÁO THUN RÊU XOẮN NGỰC', NULL, 'AO', 'ELS', 'BAM', 375000, 589000),
('ELSAO0009', ' VEST SỢI XANH BIỂN CỔ TRÒN CƠI TÚI NGỰC', NULL, 'AO', 'ELS', 'WOO', 375000, 589000),
('ELSAO0010', ' GILE TWEED ĐỎ PHỐI VIỀN ĐEN ỐP TÚI', NULL, 'AO', 'ELS', 'WOO', 375000, 589000),
('ELSAO0011', ' SM TƠ HỒNG ĐÍNH HOA NỔI', NULL, 'AO', 'ELS', 'LEA', 375000, 589000),
('ELSAO0012', ' GILE DÀI SỢI KẺ VÂN TRẮNG ỐP NẮP TÚI', NULL, 'AO', 'ELS', 'VEL', 375000, 589000),
('ELSCV0001', ' JUPE KEM LY 2 BÊN ĐÍNH CÚC BỌC', NULL, 'CV', 'ELS', 'DEN', 375000, 589000),
('ELSCV0002', ' JUPE DÀI XƯỚC HỒNG PHẤN XẾP LY', NULL, 'CV', 'ELS', 'BAM', 375000, 589000),
('ELSCV0003', ' CV LỤA ĐEN CẠP BO DÂY CẠP', NULL, 'CV', 'ELS', 'DEN', 375000, 589000),
('ELSCV0004', ' JUPE NGẮN TAFTA ĐỎ SẪM', NULL, 'CV', 'ELS', 'DEN', 375000, 589000),
('ELSCV0005', ' CHÂN VÁY LEN GHI XẾP NHÚN HÔNG', NULL, 'CV', 'ELS', 'WOO', 375000, 589000),
('ELSCV0006', ' JUPE BÚT CHÌ KẺ Ô NỀN ĐEN XẺ TRƯỚC', NULL, 'CV', 'ELS', 'POL', 375000, 589000),
('ELSCV0007', ' JUPE BÚT CHÌ NÂU GÂN GIỮA', NULL, 'CV', 'ELS', 'LIN', 375000, 589000),
('ELSCV0008', ' JUPE JEAN XANH ĐẬM THÊU HOA BÔ ĐÊ', NULL, 'CV', 'ELS', 'CAN', 375000, 589000),
('ELSCV0009', ' JUPE NGẮN TWEED XANH DA TRỜI TÚI CHÉO', NULL, 'CV', 'ELS', 'COT', 375000, 589000),
('ELSCV0010', ' CV LƯỚI GHI SÁNG XẾP BẤU LY CHÉO', NULL, 'CV', 'ELS', 'POL', 375000, 589000),
('ELSCV0011', ' CHÂN VÁY JEANS XANH RUA GẤU', NULL, 'CV', 'ELS', 'VEL', 375000, 589000),
('ELSDA0001', ' ĐẦM THÔ KẺ ĐỎ MẬN NƠ CỔ BÈO GẤU', NULL, 'DA', 'ELS', 'VEL', 375000, 589000),
('ELSDA0002', ' ĐẦM ÔM SỢI XANH LÁ', NULL, 'DA', 'ELS', 'COT', 375000, 589000),
('ELSDA0003', ' ĐẦM GẤM HOA ĐEN NỔI VIỀN REN CỔ', NULL, 'DA', 'ELS', 'CAN', 375000, 589000),
('ELSDA0004', ' ĐẦM TWEED VÀNG TÚI NGỰC ĐAI EO', NULL, 'DA', 'ELS', 'LEA', 375000, 589000),
('ELSDA0005', ' ĐẦM SUÔNG SỢI TÍM NGỰC ĐÍNH HOA', NULL, 'DA', 'ELS', 'SIL', 375000, 589000),
('ELSDA0006', ' ĐẦM REN HOA XANH DT CỔ V VIỀN BÈO', NULL, 'DA', 'ELS', 'LIN', 375000, 589000),
('ELSDA0007', ' ĐẦM REN HOA XANH CỐM NHẠT VAI ĐỘN', NULL, 'DA', 'ELS', 'CHI', 375000, 589000),
('ELSDA0008', ' ĐẦM LƯỚI GHI SÁNG DẬP LY ĐÈ REN', NULL, 'DA', 'ELS', 'CHI', 375000, 589000),
('ELSDB0001', ' JUMPSUIT DÀI ĐEN KIM TUYẾN DÂY VAI TRỄ', NULL, 'DB', 'ELS', 'LEA', 375000, 589000),
('ELSDB0002', ' SET LEN ĐEN VIỀN TRẮNG ĐÍNH LOGO', NULL, 'DB', 'ELS', 'CHI', 375000, 589000),
('ELSDB0003', ' SET LEN ĐEN VIỀN BE', NULL, 'DB', 'ELS', 'SIL', 375000, 589000),
('ELSDB0004', ' SET GHI NÂU VIỀN ĐEN', NULL, 'DB', 'ELS', 'POL', 375000, 589000),
('ELSDB0005', ' SET ÁO CHOÀNG DÀI + 2 DÂY ĐEN', NULL, 'DB', 'ELS', 'VEL', 375000, 589000),
('ELSQU0001', ' QUẦN JEANS TRẮNG BAGGY', NULL, 'QU', 'ELS', 'CAN', 375000, 589000),
('ELSQU0002', ' QUẦN BAGGY SỢI KEM CẠP V', NULL, 'QU', 'ELS', 'DEN', 375000, 589000),
('ELSQU0003', ' QUẦN BAGGY SỢI CAM ĐỒNG TÚI DỌC', NULL, 'QU', 'ELS', 'CHI', 375000, 589000),
('ELSQU0004', ' QUẦN JEANS HỒNG DIỄU CHỈ', NULL, 'QU', 'ELS', 'BAM', 375000, 589000),
('ELSQU0005', ' QUẦN SUÔNG ĐEN LY GIỮA CẠP LẬT', NULL, 'QU', 'ELS', 'CAN', 375000, 589000),
('ELSQU0006', ' QUẦN JEAN XANH CẠP DIỄU CHỈ', NULL, 'QU', 'ELS', 'CHI', 375000, 589000),
('ELSQU0007', ' QUẦN SUÔNG TWEED HỒNG ĐẤT XẾP LY', NULL, 'QU', 'ELS', 'SIL', 375000, 589000),
('ELSQU0008', ' QUẦN SUÔNG DẠ TWEED TRẮNG KT', NULL, 'QU', 'ELS', 'WOO', 375000, 589000),
('ELSQU0009', ' QUẦN SOOC NHUNG BUDLANH ĐEN TÚI CHÉO', NULL, 'QU', 'ELS', 'LEA', 375000, 589000);

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

--
-- Đang đổ dữ liệu cho bảng `size`
--

INSERT INTO `size` (`masize`, `tensize`) VALUES
('L', 'L'),
('M', 'M'),
('S', 'S'),
('XL', 'XL');

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

--
-- Đang đổ dữ liệu cho bảng `thuonghieu`
--

INSERT INTO `thuonghieu` (`math`, `tenth`) VALUES
('ELS', 'Elise');

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
  KEY `idx_sanpham` (`mach`,`masp`,`masize`),
  KEY `FK_TONKHO_SANPHAM` (`masp`),
  KEY `FK_TONKHO_SIZE` (`masize`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tonkho`
--

INSERT INTO `tonkho` (`mach`, `masp`, `masize`, `soluong`) VALUES
('CH01', 'ELSAO0001', 'L', 50),
('CH01', 'ELSAO0001', 'M', 50),
('CH01', 'ELSAO0001', 'S', 50),
('CH01', 'ELSAO0001', 'XL', 50),
('CH01', 'ELSAO0002', 'L', 50),
('CH01', 'ELSAO0002', 'M', 50),
('CH01', 'ELSAO0002', 'S', 50),
('CH01', 'ELSAO0002', 'XL', 50),
('CH01', 'ELSAO0003', 'L', 50),
('CH01', 'ELSAO0003', 'M', 50),
('CH01', 'ELSAO0003', 'S', 50),
('CH01', 'ELSAO0003', 'XL', 50),
('CH01', 'ELSAO0004', 'L', 50),
('CH01', 'ELSAO0004', 'M', 50),
('CH01', 'ELSAO0004', 'S', 50),
('CH01', 'ELSAO0004', 'XL', 50),
('CH01', 'ELSAO0005', 'L', 50),
('CH01', 'ELSAO0005', 'M', 50),
('CH01', 'ELSAO0005', 'S', 50),
('CH01', 'ELSAO0005', 'XL', 50),
('CH01', 'ELSAO0006', 'L', 50),
('CH01', 'ELSAO0006', 'M', 50),
('CH01', 'ELSAO0006', 'S', 50),
('CH01', 'ELSAO0006', 'XL', 50),
('CH01', 'ELSAO0007', 'L', 50),
('CH01', 'ELSAO0007', 'M', 50),
('CH01', 'ELSAO0007', 'S', 50),
('CH01', 'ELSAO0007', 'XL', 50),
('CH01', 'ELSAO0008', 'L', 50),
('CH01', 'ELSAO0008', 'M', 50),
('CH01', 'ELSAO0008', 'S', 50),
('CH01', 'ELSAO0008', 'XL', 50),
('CH01', 'ELSAO0009', 'L', 50),
('CH01', 'ELSAO0009', 'M', 50),
('CH01', 'ELSAO0009', 'S', 50),
('CH01', 'ELSAO0009', 'XL', 50),
('CH01', 'ELSAO0010', 'L', 50),
('CH01', 'ELSAO0010', 'M', 50),
('CH01', 'ELSAO0010', 'S', 50),
('CH01', 'ELSAO0010', 'XL', 50),
('CH01', 'ELSAO0011', 'L', 50),
('CH01', 'ELSAO0011', 'M', 50),
('CH01', 'ELSAO0011', 'S', 50),
('CH01', 'ELSAO0011', 'XL', 50),
('CH01', 'ELSAO0012', 'L', 50),
('CH01', 'ELSAO0012', 'M', 50),
('CH01', 'ELSAO0012', 'S', 50),
('CH01', 'ELSAO0012', 'XL', 50),
('CH01', 'ELSCV0001', 'L', 50),
('CH01', 'ELSCV0001', 'M', 50),
('CH01', 'ELSCV0001', 'S', 50),
('CH01', 'ELSCV0001', 'XL', 50),
('CH01', 'ELSCV0002', 'L', 50),
('CH01', 'ELSCV0002', 'M', 50),
('CH01', 'ELSCV0002', 'S', 50),
('CH01', 'ELSCV0002', 'XL', 50),
('CH01', 'ELSCV0003', 'L', 50),
('CH01', 'ELSCV0003', 'M', 50),
('CH01', 'ELSCV0003', 'S', 50),
('CH01', 'ELSCV0003', 'XL', 50),
('CH01', 'ELSCV0004', 'L', 50),
('CH01', 'ELSCV0004', 'M', 50),
('CH01', 'ELSCV0004', 'S', 50),
('CH01', 'ELSCV0004', 'XL', 50),
('CH01', 'ELSCV0005', 'L', 50),
('CH01', 'ELSCV0005', 'M', 50),
('CH01', 'ELSCV0005', 'S', 50),
('CH01', 'ELSCV0005', 'XL', 50),
('CH01', 'ELSCV0006', 'L', 50),
('CH01', 'ELSCV0006', 'M', 50),
('CH01', 'ELSCV0006', 'S', 50),
('CH01', 'ELSCV0006', 'XL', 50),
('CH01', 'ELSCV0007', 'L', 50),
('CH01', 'ELSCV0007', 'M', 50),
('CH01', 'ELSCV0007', 'S', 50),
('CH01', 'ELSCV0007', 'XL', 50),
('CH01', 'ELSCV0008', 'L', 50),
('CH01', 'ELSCV0008', 'M', 50),
('CH01', 'ELSCV0008', 'S', 50),
('CH01', 'ELSCV0008', 'XL', 50),
('CH01', 'ELSCV0009', 'L', 50),
('CH01', 'ELSCV0009', 'M', 50),
('CH01', 'ELSCV0009', 'S', 50),
('CH01', 'ELSCV0009', 'XL', 50),
('CH01', 'ELSCV0010', 'L', 50),
('CH01', 'ELSCV0010', 'M', 50),
('CH01', 'ELSCV0010', 'S', 50),
('CH01', 'ELSCV0010', 'XL', 50),
('CH01', 'ELSCV0011', 'L', 50),
('CH01', 'ELSCV0011', 'M', 50),
('CH01', 'ELSCV0011', 'S', 50),
('CH01', 'ELSCV0011', 'XL', 50),
('CH01', 'ELSDA0001', 'L', 50),
('CH01', 'ELSDA0001', 'M', 50),
('CH01', 'ELSDA0001', 'S', 50),
('CH01', 'ELSDA0001', 'XL', 50),
('CH01', 'ELSDA0002', 'L', 50),
('CH01', 'ELSDA0002', 'M', 50),
('CH01', 'ELSDA0002', 'S', 50),
('CH01', 'ELSDA0002', 'XL', 50),
('CH01', 'ELSDA0003', 'L', 50),
('CH01', 'ELSDA0003', 'M', 50),
('CH01', 'ELSDA0003', 'S', 50),
('CH01', 'ELSDA0003', 'XL', 50),
('CH01', 'ELSDA0004', 'L', 50),
('CH01', 'ELSDA0004', 'M', 50),
('CH01', 'ELSDA0004', 'S', 50),
('CH01', 'ELSDA0004', 'XL', 50),
('CH01', 'ELSDA0005', 'L', 50),
('CH01', 'ELSDA0005', 'M', 50),
('CH01', 'ELSDA0005', 'S', 50),
('CH01', 'ELSDA0005', 'XL', 50),
('CH01', 'ELSDA0006', 'L', 50),
('CH01', 'ELSDA0006', 'M', 50),
('CH01', 'ELSDA0006', 'S', 50),
('CH01', 'ELSDA0006', 'XL', 50),
('CH01', 'ELSDA0007', 'L', 50),
('CH01', 'ELSDA0007', 'M', 50),
('CH01', 'ELSDA0007', 'S', 50),
('CH01', 'ELSDA0007', 'XL', 50),
('CH01', 'ELSDA0008', 'L', 50),
('CH01', 'ELSDA0008', 'M', 50),
('CH01', 'ELSDA0008', 'S', 50),
('CH01', 'ELSDA0008', 'XL', 50),
('CH01', 'ELSDB0001', 'L', 50),
('CH01', 'ELSDB0001', 'M', 50),
('CH01', 'ELSDB0001', 'S', 50),
('CH01', 'ELSDB0001', 'XL', 50),
('CH01', 'ELSDB0002', 'L', 50),
('CH01', 'ELSDB0002', 'M', 50),
('CH01', 'ELSDB0002', 'S', 50),
('CH01', 'ELSDB0002', 'XL', 50),
('CH01', 'ELSDB0003', 'L', 50),
('CH01', 'ELSDB0003', 'M', 50),
('CH01', 'ELSDB0003', 'S', 50),
('CH01', 'ELSDB0003', 'XL', 50),
('CH01', 'ELSDB0004', 'L', 50),
('CH01', 'ELSDB0004', 'M', 50),
('CH01', 'ELSDB0004', 'S', 50),
('CH01', 'ELSDB0004', 'XL', 50),
('CH01', 'ELSDB0005', 'L', 50),
('CH01', 'ELSDB0005', 'M', 50),
('CH01', 'ELSDB0005', 'S', 50),
('CH01', 'ELSDB0005', 'XL', 50),
('CH01', 'ELSQU0001', 'L', 50),
('CH01', 'ELSQU0001', 'M', 50),
('CH01', 'ELSQU0001', 'S', 50),
('CH01', 'ELSQU0001', 'XL', 50),
('CH01', 'ELSQU0002', 'L', 50),
('CH01', 'ELSQU0002', 'M', 50),
('CH01', 'ELSQU0002', 'S', 50),
('CH01', 'ELSQU0002', 'XL', 50),
('CH01', 'ELSQU0003', 'L', 50),
('CH01', 'ELSQU0003', 'M', 50),
('CH01', 'ELSQU0003', 'S', 50),
('CH01', 'ELSQU0003', 'XL', 50),
('CH01', 'ELSQU0004', 'L', 50),
('CH01', 'ELSQU0004', 'M', 50),
('CH01', 'ELSQU0004', 'S', 50),
('CH01', 'ELSQU0004', 'XL', 50),
('CH01', 'ELSQU0005', 'L', 50),
('CH01', 'ELSQU0005', 'M', 50),
('CH01', 'ELSQU0005', 'S', 50),
('CH01', 'ELSQU0005', 'XL', 50),
('CH01', 'ELSQU0006', 'L', 50),
('CH01', 'ELSQU0006', 'M', 50),
('CH01', 'ELSQU0006', 'S', 50),
('CH01', 'ELSQU0006', 'XL', 50),
('CH01', 'ELSQU0007', 'L', 50),
('CH01', 'ELSQU0007', 'M', 50),
('CH01', 'ELSQU0007', 'S', 50),
('CH01', 'ELSQU0007', 'XL', 50),
('CH01', 'ELSQU0008', 'L', 50),
('CH01', 'ELSQU0008', 'M', 50),
('CH01', 'ELSQU0008', 'S', 50),
('CH01', 'ELSQU0008', 'XL', 50),
('CH01', 'ELSQU0009', 'L', 50),
('CH01', 'ELSQU0009', 'M', 50),
('CH01', 'ELSQU0009', 'S', 50),
('CH01', 'ELSQU0009', 'XL', 50);

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
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethoadonban`
--
ALTER TABLE `chitiethoadonban`
  ADD CONSTRAINT `FK_CHITIETHOADONBAN_HOADON` FOREIGN KEY (`mahd`) REFERENCES `hoadonban` (`mahd`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CHITIETHOADONBAN_SANPHAM` FOREIGN KEY (`masp`) REFERENCES `sanpham` (`masp`),
  ADD CONSTRAINT `FK_CHITIETHOADONBAN_SIZE` FOREIGN KEY (`masize`) REFERENCES `size` (`masize`);

--
-- Các ràng buộc cho bảng `chitiethoadonnhap`
--
ALTER TABLE `chitiethoadonnhap`
  ADD CONSTRAINT `FK_CHITIETHOADONNHAP_HOADON` FOREIGN KEY (`mahd`) REFERENCES `hoadonnhap` (`mahd`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CHITIETHOADONNHAP_SANPHAM` FOREIGN KEY (`masp`) REFERENCES `sanpham` (`masp`),
  ADD CONSTRAINT `FK_CHITIETHOADONNHAP_SIZE` FOREIGN KEY (`masize`) REFERENCES `size` (`masize`);

--
-- Các ràng buộc cho bảng `hinhanh`
--
ALTER TABLE `hinhanh`
  ADD CONSTRAINT `FK_HINHANH_SANPHAM` FOREIGN KEY (`masp`) REFERENCES `sanpham` (`masp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `hoadonban`
--
ALTER TABLE `hoadonban`
  ADD CONSTRAINT `FK_HOADONBAN_CUAHANG` FOREIGN KEY (`mach`) REFERENCES `cuahang` (`mach`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_HOADONBAN_KHACHHANG` FOREIGN KEY (`makh`) REFERENCES `khachhang` (`makh`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_HOADONBAN_TRANGTHAI` FOREIGN KEY (`matt`) REFERENCES `trangthai` (`matt`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `hoadonnhap`
--
ALTER TABLE `hoadonnhap`
  ADD CONSTRAINT `FK_HOADONNHAP_CUAHANG` FOREIGN KEY (`mach`) REFERENCES `cuahang` (`mach`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_HOADONNHAP_THUONGHIEU` FOREIGN KEY (`math`) REFERENCES `thuonghieu` (`math`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_CHATLIEU` FOREIGN KEY (`macl`) REFERENCES `chatlieu` (`macl`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_LOAISANPHAM` FOREIGN KEY (`maloai`) REFERENCES `loaisanpham` (`maloai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_THUONGHIEU` FOREIGN KEY (`math`) REFERENCES `thuonghieu` (`math`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `FK_TAIKHOAN_KHACHHANG` FOREIGN KEY (`makh`) REFERENCES `khachhang` (`makh`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tonkho`
--
ALTER TABLE `tonkho`
  ADD CONSTRAINT `FK_TONKHO_CUAHANG` FOREIGN KEY (`mach`) REFERENCES `cuahang` (`mach`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TONKHO_SANPHAM` FOREIGN KEY (`masp`) REFERENCES `sanpham` (`masp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TONKHO_SIZE` FOREIGN KEY (`masize`) REFERENCES `size` (`masize`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
