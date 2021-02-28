-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2021 at 07:26 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warung`
--

-- --------------------------------------------------------

--
-- Table structure for table `bahan`
--

CREATE TABLE `bahan` (
  `ID_BAHAN` char(5) NOT NULL,
  `NAMA_BAHAN` varchar(15) NOT NULL,
  `STOK_BAHAN` int(11) NOT NULL,
  `SATUAN` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bahan`
--

INSERT INTO `bahan` (`ID_BAHAN`, `NAMA_BAHAN`, `STOK_BAHAN`, `SATUAN`) VALUES
('1', 'beras', 5, 'kg'),
('69', 'ayam', 10, 'kg');

-- --------------------------------------------------------

--
-- Table structure for table `menu_warung`
--

CREATE TABLE `menu_warung` (
  `ID_MENU` char(5) NOT NULL,
  `NAMA_MENU` varchar(15) NOT NULL,
  `JENIS` smallint(6) NOT NULL,
  `HARGA` bigint(20) NOT NULL,
  `STOCK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_warung`
--

INSERT INTO `menu_warung` (`ID_MENU`, `NAMA_MENU`, `JENIS`, `HARGA`, `STOCK`) VALUES
('1', 'jengkol goreng', 1, 5000, 10),
('2', 'Sate ', 1, 2000, 5),
('3', 'Sate Usus', 1, 2500, 10),
('4', 'nasi goreng', 1, 10000, 5),
('6', 'nasi teri', 1, 2500, 10);

-- --------------------------------------------------------

--
-- Table structure for table `pemasok`
--

CREATE TABLE `pemasok` (
  `ID_PEMASOK` char(5) NOT NULL,
  `NAMA_PEMASOK` varchar(15) NOT NULL,
  `ALAMAT_PEMASOK` varchar(156) NOT NULL,
  `TELEPON` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemasok`
--

INSERT INTO `pemasok` (`ID_PEMASOK`, `NAMA_PEMASOK`, `ALAMAT_PEMASOK`, `TELEPON`) VALUES
('1', 'Jajang Tarmidi', 'jalan kembar ', '08338726'),
('2', 'abdul', 'neraka', '00000');

-- --------------------------------------------------------

--
-- Table structure for table `produk_jadi`
--

CREATE TABLE `produk_jadi` (
  `ID_PRODUK` char(5) NOT NULL,
  `ID_PEMASOK` char(5) NOT NULL,
  `NAMA_PRODUK` varchar(20) NOT NULL,
  `STOK` int(11) NOT NULL,
  `HARGA_SATUAN` bigint(20) NOT NULL,
  `TANGGAL` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk_jadi`
--

INSERT INTO `produk_jadi` (`ID_PRODUK`, `ID_PEMASOK`, `NAMA_PRODUK`, `STOK`, `HARGA_SATUAN`, `TANGGAL`) VALUES
('2', '1', 'teh pucuk', 50, 2500, '2020-01-20');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID_TRANSAKSI` int(11) NOT NULL,
  `ID_MENU` bigint(20) NOT NULL,
  `NAMA_MENU` varchar(156) NOT NULL,
  `TOTAL_BAYAR` bigint(20) NOT NULL,
  `JUMLAH` int(11) NOT NULL,
  `TOTAL_HARGA` varchar(156) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`ID_TRANSAKSI`, `ID_MENU`, `NAMA_MENU`, `TOTAL_BAYAR`, `JUMLAH`, `TOTAL_HARGA`) VALUES
(21, 1, 'jengkol goreng', 25000, 5, '25000');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` char(10) NOT NULL,
  `PASSWORD` varchar(156) NOT NULL,
  `NAMA` varchar(15) NOT NULL,
  `TELEPON` varchar(13) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `PASSWORD`, `NAMA`, `TELEPON`, `status`) VALUES
('jajang', '123456', 'jajang jujung', '000000', 3),
('kasir', '123456', 'Kasir', '12345678', 2),
('kasir 2', '123456', 'wimaku', '9999', 2),
('petugas', '123456', 'Abdul', '12345678', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahan`
--
ALTER TABLE `bahan`
  ADD PRIMARY KEY (`ID_BAHAN`);

--
-- Indexes for table `menu_warung`
--
ALTER TABLE `menu_warung`
  ADD PRIMARY KEY (`ID_MENU`);

--
-- Indexes for table `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`ID_PEMASOK`);

--
-- Indexes for table `produk_jadi`
--
ALTER TABLE `produk_jadi`
  ADD PRIMARY KEY (`ID_PRODUK`),
  ADD KEY `FK_MEMASOK` (`ID_PEMASOK`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID_TRANSAKSI`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `ID_TRANSAKSI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produk_jadi`
--
ALTER TABLE `produk_jadi`
  ADD CONSTRAINT `FK_MEMASOK` FOREIGN KEY (`ID_PEMASOK`) REFERENCES `pemasok` (`ID_PEMASOK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
