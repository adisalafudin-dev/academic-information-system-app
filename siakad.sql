-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 25, 2025 at 07:39 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakad`
--

-- --------------------------------------------------------

--
-- Table structure for table `biaya`
--

CREATE TABLE `biaya` (
  `id_biaya` int NOT NULL,
  `id_gel` int NOT NULL,
  `id_jurusan` int NOT NULL,
  `spa` int NOT NULL,
  `oka` int DEFAULT NULL,
  `beasiswa` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calon_siswa`
--

CREATE TABLE `calon_siswa` (
  `no_daftar` int NOT NULL,
  `id_gel` int NOT NULL,
  `id_jurusan` int DEFAULT NULL,
  `nama_lengkap` varchar(500) NOT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `kelamin` int DEFAULT NULL COMMENT 'Jenis Kelamin\\n1 = Laki - Laki, 2 = Perempuan',
  `agama` int DEFAULT NULL,
  `telp` varchar(45) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `pilihan_jur` varchar(100) DEFAULT NULL,
  `info` varchar(100) DEFAULT NULL,
  `tgl_daftar` date DEFAULT NULL,
  `tgl_ujian` date DEFAULT NULL,
  `tgl_lulus` date DEFAULT NULL,
  `status_daftar` int NOT NULL DEFAULT '0' COMMENT '0 = reg, 1 = pindahan, 2 = csr',
  `kelengkapan` int NOT NULL DEFAULT '0' COMMENT '0 = blm lengkap, 1 = lengkap',
  `biaya_daftar` int NOT NULL DEFAULT '0',
  `beasiswa` int NOT NULL DEFAULT '0',
  `cs_daftar` varchar(100) DEFAULT NULL,
  `cs_edit` varchar(100) DEFAULT NULL,
  `cs_lulus` varchar(100) NOT NULL,
  `daftar_ol` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gelombang`
--

CREATE TABLE `gelombang` (
  `id_gelombang` int NOT NULL,
  `id_tha` int NOT NULL,
  `nama_gel` varchar(45) NOT NULL,
  `start_gel` date NOT NULL,
  `end_gel` date NOT NULL,
  `end_bayar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int NOT NULL,
  `nama_jurusan` varchar(100) NOT NULL,
  `jenjang` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tha`
--

CREATE TABLE `tha` (
  `id_tha` int NOT NULL,
  `tha` varchar(10) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `index_tha` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tha_jur`
--

CREATE TABLE `tha_jur` (
  `id_tha_jur` int NOT NULL,
  `id_tha` int NOT NULL,
  `id_jurusan` int NOT NULL,
  `spp_var` int DEFAULT NULL,
  `spp_tetap` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biaya`
--
ALTER TABLE `biaya`
  ADD PRIMARY KEY (`id_biaya`),
  ADD KEY `fk_gelombang_has_jurusan_gelombang1` (`id_gel`),
  ADD KEY `fk_gelombang_has_jurusan_jurusan1` (`id_jurusan`);

--
-- Indexes for table `calon_siswa`
--
ALTER TABLE `calon_siswa`
  ADD PRIMARY KEY (`no_daftar`),
  ADD KEY `fk_siswa_jurusan2` (`id_jurusan`),
  ADD KEY `fk_table1_gelombang2` (`id_gel`);

--
-- Indexes for table `gelombang`
--
ALTER TABLE `gelombang`
  ADD PRIMARY KEY (`id_gelombang`),
  ADD KEY `fk_gelombang_tha1` (`id_tha`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`),
  ADD UNIQUE KEY `nama_jurusan` (`nama_jurusan`,`jenjang`);

--
-- Indexes for table `tha`
--
ALTER TABLE `tha`
  ADD PRIMARY KEY (`id_tha`),
  ADD UNIQUE KEY `tha` (`index_tha`);

--
-- Indexes for table `tha_jur`
--
ALTER TABLE `tha_jur`
  ADD PRIMARY KEY (`id_tha_jur`),
  ADD KEY `fk_tha_has_jurusan_jurusan1` (`id_jurusan`),
  ADD KEY `fk_tha_has_jurusan_tha1` (`id_tha`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `biaya`
--
ALTER TABLE `biaya`
  MODIFY `id_biaya` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calon_siswa`
--
ALTER TABLE `calon_siswa`
  MODIFY `no_daftar` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gelombang`
--
ALTER TABLE `gelombang`
  MODIFY `id_gelombang` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tha`
--
ALTER TABLE `tha`
  MODIFY `id_tha` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tha_jur`
--
ALTER TABLE `tha_jur`
  MODIFY `id_tha_jur` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `biaya`
--
ALTER TABLE `biaya`
  ADD CONSTRAINT `fk_gelombang_has_jurusan_gelombang1` FOREIGN KEY (`id_gel`) REFERENCES `gelombang` (`id_gelombang`),
  ADD CONSTRAINT `fk_gelombang_has_jurusan_jurusan1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`);

--
-- Constraints for table `calon_siswa`
--
ALTER TABLE `calon_siswa`
  ADD CONSTRAINT `fk_siswa_jurusan2` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`),
  ADD CONSTRAINT `fk_table1_gelombang2` FOREIGN KEY (`id_gel`) REFERENCES `gelombang` (`id_gelombang`);

--
-- Constraints for table `gelombang`
--
ALTER TABLE `gelombang`
  ADD CONSTRAINT `fk_gelombang_tha1` FOREIGN KEY (`id_tha`) REFERENCES `tha` (`id_tha`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tha_jur`
--
ALTER TABLE `tha_jur`
  ADD CONSTRAINT `fk_tha_has_jurusan_jurusan1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`),
  ADD CONSTRAINT `fk_tha_has_jurusan_tha1` FOREIGN KEY (`id_tha`) REFERENCES `tha` (`id_tha`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
