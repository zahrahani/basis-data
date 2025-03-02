-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2025 at 08:36 AM
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
-- Database: `teknologi_informasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `biodatamahasiswa`
--

CREATE TABLE `biodatamahasiswa` (
  `NPM` char(5) NOT NULL,
  `Nama` varchar(25) NOT NULL,
  `Tempat_Lahir` varchar(30) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Jenis_Kelamin` enum('L','P') NOT NULL,
  `No_HP` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `biodatamahasiswa`
--

INSERT INTO `biodatamahasiswa` (`NPM`, `Nama`, `Tempat_Lahir`, `Tanggal_Lahir`, `Jenis_Kelamin`, `No_HP`) VALUES
('24001', 'Jo Jahyeon', 'Magelang', '2005-09-30', 'L', '080888999666'),
('24002', 'Yoon Minwoo', 'Magelang', '2006-05-25', 'L', '080999666888'),
('24003', 'Dom Kang Hannam', 'Solo', '2005-08-18', 'L', '080111777333'),
('24005', 'Yoon Yunha', 'Magelang', '2006-05-25', 'P', '0809090909099'),
('24006', 'Shelly Scott', 'Yogyakarta', '2006-04-12', 'P', '080808080808'),
('24007', 'Richardo Rossi', 'Solo', '2004-08-22', 'L', '0808846778843'),
('24008', 'Kim Miyoung', 'Bantul', '2006-01-22', 'P', '080878799766'),
('24009', 'Noah Austin', 'Yogyakarta', '2006-04-20', 'P', '080811800876'),
('24010', 'Takeda Kaneshiro', 'Surabaya', '2005-12-12', 'P', '080111333555'),
('24011', 'Yumi Lee', 'Surabaya', '2006-02-12', 'P', '080999777666'),
('24012', 'Jake Kim', 'Magelang', '2005-09-12', 'L', '080115550090'),
('24013', 'Im Lua', 'Solo', '2006-03-10', 'P', '080115669990'),
('24014', 'Chae Won Seok ', 'Palu', '2005-07-17', 'L', '089000669990'),
('24015', 'Park Jong Geon', 'Magelang', '2004-12-31', 'L', '080444488880');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biodatamahasiswa`
--
ALTER TABLE `biodatamahasiswa`
  ADD PRIMARY KEY (`NPM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
