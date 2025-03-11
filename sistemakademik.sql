-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2025 at 05:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistemakademik`
--

-- --------------------------------------------------------

--
-- Table structure for table `hasilstudi`
--

CREATE TABLE `hasilstudi` (
  `NPM` char(5) NOT NULL,
  `kode` char(5) NOT NULL,
  `nilai` decimal(5,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hasilstudi`
--

INSERT INTO `hasilstudi` (`NPM`, `kode`, `nilai`) VALUES
('24001', 'TI101', 4.00),
('24001', 'TI102', 3.97),
('24002', 'TI101', 3.95),
('24002', 'TI102', 3.95),
('24003', 'TI101', 3.50),
('24003', 'TI102', 3.50),
('24004', 'TI101', 3.95),
('24004', 'TI102', 3.90),
('24005', 'TI102', 3.70),
('24005', 'TI103', 3.60),
('24006', 'TI102', 3.75),
('24006', 'TI103', 3.50),
('24007', 'TI102', 3.75),
('24007', 'TI103', 3.80),
('24008', 'TI102', 4.00),
('24009', 'TI102', 3.75),
('24010', 'TI102', 3.80);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NPM` char(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `fakultas` varchar(50) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NPM`, `nama`, `jenis_kelamin`, `jurusan`, `fakultas`, `status`) VALUES
('24001', 'Jay Jo', 'L', 'Teknologi Informasi', 'Teknik', 'Aktif'),
('24002', 'Shelly Scott', 'P', 'Teknologi Informasi', 'Teknik', 'Aktif'),
('24003', 'Noah Austin', 'P', 'Teknologi Informasi', 'Teknik', 'Aktif'),
('24004', 'Owen Knight', 'L', 'Teknologi Informasi', 'Teknik', 'Aktif'),
('24005', 'Dom Kang', 'L', 'Teknik Informatika', 'Teknik', 'Aktif'),
('24006', 'Vinny Hong', 'L', 'Teknik Informatika', 'Teknik', 'Aktif'),
('24007', 'Lee Yumi', 'P', 'Teknik Informatika', 'Teknik', 'Aktif'),
('24008', 'Kim Gimyung', 'L', 'Sistem Informasi', 'Teknik', 'Aktif'),
('24009', 'Takeda Kaneshiro', 'P', 'Sistem Informasi', 'Teknik', 'Aktif'),
('24010', 'Jong Geon', 'L', 'Sistem Informasi', 'Teknik', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kode` char(5) NOT NULL,
  `matakuliah` varchar(50) NOT NULL,
  `sks` tinyint(4) NOT NULL CHECK (`sks` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`kode`, `matakuliah`, `sks`) VALUES
('24005', 'TI003', 4),
('24006', 'TI003', 4),
('24007', 'TI003', 4),
('TI101', 'Basis Data', 2),
('TI102', 'Struktur Data', 3),
('TI103', 'Jaringan Komputer', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hasilstudi`
--
ALTER TABLE `hasilstudi`
  ADD PRIMARY KEY (`NPM`,`kode`),
  ADD KEY `kode` (`kode`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NPM`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hasilstudi`
--
ALTER TABLE `hasilstudi`
  ADD CONSTRAINT `hasilstudi_ibfk_1` FOREIGN KEY (`NPM`) REFERENCES `mahasiswa` (`NPM`),
  ADD CONSTRAINT `hasilstudi_ibfk_2` FOREIGN KEY (`kode`) REFERENCES `matakuliah` (`kode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
