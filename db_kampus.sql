-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2025 at 06:21 AM
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
-- Database: `db_kampus`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `NIP` char(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `bidang` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`NIP`, `nama`, `bidang`) VALUES
('2205202501', 'Shelly Scott', 'Ilmu Komputer'),
('2205202502', 'Noah Austin', 'Cyber Security'),
('2205202503', 'Lee Yumi', 'Computer Networks'),
('2205202504', 'Momoko Kawasaki', 'Data Science'),
('2205202505', 'Takeda Kaneshiro', 'Data Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` char(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `nama`, `jurusan`) VALUES
('1234567890', 'Andi', 'Informatika'),
('2400000001', 'Jay Jo', 'TIF'),
('2400000002', 'Yoon Minwoo', 'TIF'),
('2400000003', 'Owen Knight', 'TIF'),
('2400000004', 'Oliver', 'TIF'),
('2400000005', 'Hachijo Ryohei', 'TIF');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kode_mk` char(6) NOT NULL,
  `nama_mk` varchar(50) NOT NULL,
  `sks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`kode_mk`, `nama_mk`, `sks`) VALUES
('TIF101', 'Basis Data', 2),
('TIF102', 'Jaringan Komputer', 3),
('TIF103', 'Keamanan Jaringan', 2),
('TIF104', 'Big Data', 2),
('TIF105', 'Struktur Data', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `NIM` char(10) NOT NULL,
  `jenis_tagihan` varchar(50) NOT NULL,
  `jumlah_tagihan` int(11) NOT NULL,
  `status` enum('Belum Bayar','Dibayar 50%','Lunas') DEFAULT 'Belum Bayar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `NIM`, `jenis_tagihan`, `jumlah_tagihan`, `status`) VALUES
(1, '2400000001', 'UKT Semester 1', 5000000, 'Lunas'),
(2, '2400000002', 'UKT Semester 1', 8000000, 'Lunas'),
(3, '2400000003', 'SPI - Angsuran 1', 6500000, 'Lunas'),
(4, '2400000001', 'UKT Semester 2', 5000000, 'Lunas'),
(5, '2400000002', 'UKT Semester 2', 5000000, 'Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `temp_tabel`
--

CREATE TABLE `temp_tabel` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`NIP`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kode_mk`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
