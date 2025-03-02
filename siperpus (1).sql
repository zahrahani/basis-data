-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2025 at 09:39 AM
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
-- Database: `siperpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NPM` char(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NPM`, `nama`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`) VALUES
('2420501024', 'Vinnyla Lana', 'Magelang', '2006-05-19', 'P'),
('2420501224', 'Duta Modjo', 'Yogyakarta', '2006-04-30', 'L'),
('2420501324', 'Jen Janshen', '', '0000-00-00', 'L'),
('2420501424', 'Marie Jane', '', '0000-00-00', 'P'),
('2420501524', 'Jenrico Mahesa', '', '0000-00-00', 'L'),
('2420502024', 'Mohan Azhar', 'Yogyakarta', '2005-07-23', 'L'),
('2420503024', 'Noel Galaleo', 'Magelang', '2004-09-26', 'L'),
('2420504024', 'Sissy Wissie', 'Semarang', '2006-04-10', 'P'),
('2420505024', 'Nia Carpenter', 'Malang', '2006-01-01', 'P'),
('2420506024', 'Zahra Nibras', 'Magelang', '2006-04-12', 'P'),
('2420507024', 'Julian Jacob', '', '0000-00-00', 'L'),
('2420508024', 'Valentina Rossie', 'Solo', '2006-02-14', 'P'),
('2420509024', 'Roberto Elrico', 'Solo', '2005-08-10', 'L');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NPM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
