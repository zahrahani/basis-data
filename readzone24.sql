-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2025 at 07:02 AM
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
-- Database: `readzone24`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_transaksi` (IN `p_id_pelanggan` INT, IN `p_id_buku` INT, IN `p_jumlah` INT)   BEGIN
	DECLARE v_harga DECIMAL(10,2);
    DECLARE v_stok INT;
    DECLARE v_total DECIMAL(10,2);
    -- Ambil harga dan stok buku dari tabel buku
    SELECT harga, stok INTO v_harga, v_stok
    FROM buku
    WHERE id_buku = p_id_buku;
    
    -- Cek ketersediaan stok buku
    IF v_stok < p_jumlah THEN
    	SELECT CONCAT('GAGAL: Stok tidak mencukupi. Sisa stok: ', v_stok) AS pesan; -- Pesan ERROR
    ELSE 
    	-- Hitung total_harga
        SET v_total = v_harga * p_jumlah;
        
        -- Kurangi stok buku sesuai jumlah buku yang dibeli
        UPDATE buku
        SET stok = stok - p_jumlah
        WHERE id_buku = p_id_buku;
        
        -- Tambah data ke tabel transaksi dengan tanggal hari ini
        INSERT INTO transaksi (id_pelanggan, id_buku, jumlah, total_harga, tanggal_transaksi)
        VALUES (p_id_pelanggan, p_id_buku, p_jumlah, v_total, CURDATE());
        
        -- Tambah nilai total_harga ke total_belanja di tabel pelanggan
        UPDATE pelanggan
        SET total_belanja = total_belanja + v_total
        WHERE id_pelanggan = p_id_pelanggan;
        
        -- Pesan berhasil
        SELECT 'TRANSAKSI BERHASIL' AS pesan;
    END IF;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `hitung_diskon` (`total_belanja` DECIMAL(10,2)) RETURNS DECIMAL(5,2) DETERMINISTIC BEGIN
	DECLARE diskon DECIMAL(5,2);
    -- Diskon berdasarkan total_belanja
    IF total_belanja < 1000000 THEN
    	SET diskon = 0.00;
    ELSEIF total_belanja < 5000000 THEN
    	SET diskon = 0.05;
    ELSE 
    	SET diskon = 0.10;
    END IF;
    RETURN diskon;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `penulis` varchar(100) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penulis`, `harga`, `stok`) VALUES
(1, 'Clean Code', 'Robert C. Martin', 500000.00, 10),
(2, 'Sobotta', 'Paul', 2500000.00, 0),
(3, 'Beton Bertulang', 'T. Wangsadinata', 300000.00, 15),
(4, 'Linux', 'Christopher Negus', 700000.00, 13),
(5, 'SQL', 'Ben Forta', 550000.00, 8);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `total_belanja` decimal(10,2) DEFAULT 0.00,
  `status_member` enum('REGULER','GOLD','PLATINUM') DEFAULT 'REGULER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `total_belanja`, `status_member`) VALUES
(1, 'Stephanie', 6000000.00, 'PLATINUM'),
(2, 'Starla', 5000000.00, 'PLATINUM'),
(3, 'Maria', 13600000.00, 'PLATINUM'),
(4, 'Joseph', 1000000.00, 'GOLD'),
(5, 'Jack', 700000.00, 'REGULER');

--
-- Triggers `pelanggan`
--
DELIMITER $$
CREATE TRIGGER `updateStatusMember` BEFORE UPDATE ON `pelanggan` FOR EACH ROW IF NEW.total_belanja >= 5000000 THEN
	SET NEW.status_member = 'PLATINUM';
ELSEIF NEW. total_belanja >= 1000000 THEN
	SET NEW.status_member = 'GOLD';
ELSE
	SET NEW.status_member = 'REGULER';
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `id_buku`, `jumlah`, `total_harga`, `tanggal_transaksi`) VALUES
(1, 1, 4, 5, 3500000.00, '2025-06-01'),
(2, 2, 2, 2, 5000000.00, '2025-06-02'),
(3, 3, 5, 2, 1100000.00, '2025-06-03'),
(4, 1, 2, 1, 2500000.00, '2025-06-04'),
(5, 4, 1, 2, 1000000.00, '2025-06-04'),
(6, 5, 4, 1, 700000.00, '2025-06-05'),
(7, 3, 2, 5, 12500000.00, '2025-06-06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_buku` (`id_buku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
