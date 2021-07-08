-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2021 at 12:00 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coba`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `headline` varchar(255) NOT NULL,
  `pengirim` varchar(45) NOT NULL,
  `penerima` varchar(45) NOT NULL,
  `tanggal` datetime NOT NULL,
  `isi` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id_berita`, `headline`, `pengirim`, `penerima`, `tanggal`, `isi`, `status`) VALUES
(2, 'Kehilangan Tas', 'admin@gmail.com', 'manajer@gmail.com', '2019-11-12 09:00:00', 'Telah ditemukan tas jsakdska', 1),
(5, 'nfitrihasna@gmail.com', 'akuuuuuuu', 'nfitrihasna@gmail.com', '2020-01-12 00:09:00', 'Assalamualaikum', 1),
(14, 'Test', 'baakpcr@gmail.com', 'nfitrihasna@gmail.com', '2020-09-27 05:54:17', 'Assalamualaikum', 1),
(15, 'Tayu', 'baakpcr@gmail.com', 'piiwpiee@gmail.com', '2020-09-27 05:55:33', 'sadhaksda\r\n', 1),
(22, 'as', 'baakpcr@gmail.com', 'nfitrihasna@gmail.com', '2020-09-27 07:12:45', 'asa', 1),
(23, 'Hai', 'baakpcr@gmail.com', 'nfitrihasna@gmail.com', '2020-09-27 10:00:25', 'Tayoo', 1),
(24, 'hai', 'baakpcr@gmail.com', 'nfitrihasna@gmail.com', '2020-09-27 10:02:03', 'haiiiii', 1);

-- --------------------------------------------------------

--
-- Table structure for table `berita1`
--

CREATE TABLE `berita1` (
  `id_berita` int(11) NOT NULL,
  `headline` varchar(50) NOT NULL,
  `pengirim` varchar(50) NOT NULL,
  `penerima` varchar(50) NOT NULL,
  `isi` text NOT NULL,
  `tgl` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `pengguna_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `berita1`
--

INSERT INTO `berita1` (`id_berita`, `headline`, `pengirim`, `penerima`, `isi`, `tgl`, `status`, `pengguna_id`) VALUES
(1, 'Pembekalan KP Prodi TI', 'admin@gmail.com', 'manajer@gmail.com', 'Dear adik-adik mahasiswa\r\n\r\nKami (prodi) mengundang adik-adik untuk WAJIB hadir dalam kegiatan pembekalan KP Prodi TI, yang insyaallah akan dilaksanakan pada:\r\n      Hari/Tanggal : Jumat/ 15 November 2019\r\n      Waktu           : 10.00 s.d. 12.00\r\n      Tempat         : Auditorium\r\n      Agenda         :\r\n1. Pemaparan mekanisme KP oleh Koor KP\r\n2. Pemaparan kebutuhan mhs magang di Balmon oleh Pak Tony\r\n                            \r\nDemikian undangan ini ibu sampaikan ? \r\n\r\nNote: mohon bantuan bapak/ibu dosen wali untuk dapat memastikan mhs perwaliannya hadir pada kegiatan ini.', '2019-12-17 09:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `id_prodi` int(11) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `inisial` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `id_prodi`, `nama_dosen`, `email`, `status`, `inisial`) VALUES
(1, 1, 'Diah Kusumawardhani', 'diah@pcr.acr.ac.id', 'ada', 'DYH'),
(2, 1, 'Erwin Setyo Nugroho S.T.,M.Eng', 'erwinsn@pcr.ac.id', '1', 'ESN'),
(3, 2, 'Istianah Muslim, S.T.,M.T', 'istianah@pcr.ac.id', '1', 'ISM'),
(4, 1, 'Mardhiah Fadhli, S.T., M.T.', 'mardhiah@pcr.ac.id', '', 'MDF');

-- --------------------------------------------------------

--
-- Table structure for table `ganti`
--

CREATE TABLE `ganti` (
  `id_ganti` int(11) NOT NULL,
  `id_prodi` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_matakuliah` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `tanggal` varchar(11) NOT NULL,
  `jam` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ganti`
--

INSERT INTO `ganti` (`id_ganti`, `id_prodi`, `id_jadwal`, `id_kelas`, `id_matakuliah`, `id_ruangan`, `tanggal`, `jam`) VALUES
(1, 2, 1, 1, 2, 1, '2019-11-12', '09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `hari`
--

CREATE TABLE `hari` (
  `id_hari` int(11) NOT NULL,
  `hari` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hari`
--

INSERT INTO `hari` (`id_hari`, `hari`) VALUES
(1, '<center><b>Senin</center></b><br>'),
(2, 'Selasa<br>'),
(3, 'rabu<br>'),
(4, 'kamis<br>'),
(5, 'jum\'at<br>');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(10) NOT NULL,
  `id_prodi` int(10) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_matakuliah` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `id_jam` int(11) NOT NULL,
  `id_hari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `id_prodi`, `id_kelas`, `id_matakuliah`, `id_dosen`, `id_ruangan`, `id_jam`, `id_hari`) VALUES
(1, 2, 5, 2, 1, 2, 1, 1),
(2, 1, 1, 1, 1, 1, 2, 2),
(3, 1, 2, 2, 2, 2, 2, 2),
(4, 2, 6, 1, 1, 2, 1, 3),
(5, 3, 4, 2, 1, 2, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal1`
--

CREATE TABLE `jadwal1` (
  `id_jadwal` int(11) NOT NULL,
  `hari` varchar(50) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_matakuliah` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `id_jam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal1`
--

INSERT INTO `jadwal1` (`id_jadwal`, `hari`, `id_kelas`, `id_matakuliah`, `id_dosen`, `id_ruangan`, `id_jam`) VALUES
(1, 'Senin', 2, 1, 3, 4, 1),
(2, 'Senin', 1, 2, 3, 3, 4),
(3, 'Selasa', 2, 2, 1, 2, 3),
(4, 'Selasa', 3, 1, 3, 3, 2),
(5, 'Selasa', 3, 1, 2, 1, 3),
(6, 'Rabu', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jam`
--

CREATE TABLE `jam` (
  `id_jam` int(11) NOT NULL,
  `mulai` time NOT NULL,
  `jam` varchar(50) NOT NULL,
  `keterangan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jam`
--

INSERT INTO `jam` (`id_jam`, `mulai`, `jam`, `keterangan`) VALUES
(1, '07:00:00', '07.00 - 08.00', 7),
(2, '08:00:00', '08.00 - 09.00', 8),
(3, '09:00:00', '09.00 - 10.00', 9),
(4, '10:00:00', '10.00 - 11.00', 10),
(5, '11:00:00', '11.00 - 12.00', 11),
(6, '12:00:00', '12.00 - 13.00', 12),
(7, '13:00:00', '13.00 - 14.00', 13),
(8, '14:00:00', '14.00 - 15.00', 14),
(9, '15:00:00', '15.00 - 16.00', 15),
(10, '16:00:00', '16.00 - 17.00', 16),
(11, '17:00:00', '17.00 - 18.00', 17);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `id_prodi` int(11) NOT NULL,
  `nama_kelas` varchar(11) NOT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `id_prodi`, `nama_kelas`, `semester`) VALUES
(1, 1, '4 TI A', 7),
(2, 1, '4 TI B', 7),
(3, 1, '4 TI C', 7),
(4, 3, '4 TL A', 7),
(5, 2, '4 SI A', 7),
(6, 2, '4 SI B', 7);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL,
  `jenis_aksi` varchar(50) NOT NULL,
  `keterangan` varchar(500) NOT NULL,
  `tgl` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `ip_addr` varchar(17) NOT NULL,
  `pengguna_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`log_id`, `jenis_aksi`, `keterangan`, `tgl`, `status`, `ip_addr`, `pengguna_id`) VALUES
(1, 'Login', 'Fikri Muhaffizh Imani Login', '2019-02-09 17:00:00', 1, '1', 1),
(2, 'Memperbaharui Pengguna', 'Memperbaharui data pengguna ', '2019-02-13 22:24:19', 1, '::1', 1),
(3, 'Memperbaharui Pengguna', 'Memperbaharui data pengguna kfjalsdkfj', '2019-02-13 22:27:46', 1, '::1', 1),
(4, 'Memperbaharui Pengguna', 'Memperbaharui data pengguna asdaaaasdf', '2019-02-13 22:32:14', 1, '::1', 1),
(5, 'Memperbaharui Pengguna', 'Memperbaharui data pengguna ', '2019-02-13 22:32:21', 1, '::1', 1),
(6, 'Memperbaharui Pengguna', 'Memperbaharui data pengguna r234', '2019-02-13 22:33:12', 1, '::1', 1),
(7, 'Memperbaharui Pengguna', 'Memperbaharui data pengguna kfjalsdkfj', '2019-02-13 22:33:48', 1, '::1', 1),
(8, 'Memperbaharui Pengguna', 'Memperbaharui data pengguna asdfasdfa', '2019-02-13 22:34:23', 1, '::1', 1),
(9, 'Memperbaharui Pengguna', 'Reset password pengguna asdfasdfa', '2019-02-13 22:36:11', 1, '::1', 1),
(10, 'Memperbaharui Pengguna', 'Memperbaharui data pengguna asdfasdfa', '2019-02-13 22:37:03', 1, '::1', 1),
(11, 'Memperbaharui Pengguna', 'Memperbaharui data pengguna Hendra', '2019-02-13 22:37:50', 1, '::1', 1),
(12, 'Memperbaharui Pengguna', 'Memperbaharui data pengguna r234', '2019-02-13 22:39:24', 1, '::1', 1),
(13, 'Memperbaharui Pengguna', 'Memperbaharui data pengguna kfjalsdkfj', '2019-02-13 22:39:41', 1, '::1', 1),
(14, 'Memperbaharui Pengguna', 'Memperbaharui data pengguna r234', '2019-02-13 22:40:12', 1, '::1', 1),
(15, 'Menambah Pengguna', 'Menambah pengguna asdf sebagai ', '2019-02-13 22:41:58', 1, '::1', 1),
(16, 'Menghapus Pengguna', 'Menghapus pengguna asdf', '2019-02-13 22:42:34', 1, '::1', 1),
(17, 'Menambah Pengguna', 'Menambah pengguna Reis sebagai Akuntan', '2019-02-13 22:45:07', 1, '::1', 1),
(18, 'Menambah Kelompok Akun', 'Menambah Kelompok 13 - Rekening Koran Pemegang Saham', '2019-02-13 23:13:52', 1, '::1', 1),
(19, 'Menambah Kelompok Akun', 'Menambah Kelompok 11 - Piutang Dagang', '2019-02-13 23:15:57', 1, '::1', 1),
(20, 'Menambah Kelompok Akun', 'Menambah Kelompok 12 - Piutang Pajak', '2019-02-13 23:16:18', 1, '::1', 1),
(21, 'Menambah Kelompok Akun', 'Menambah Kelompok 34 - sadfasdf', '2019-02-13 23:20:14', 1, '::1', 1),
(22, 'Menghapus Pengguna', 'Menghapus pengguna Hendra', '2019-02-13 23:20:19', 1, '::1', 1),
(23, 'Menghapus Kelompok Akkun', 'Menghapus Kelompok 34', '2019-02-13 23:21:25', 1, '::1', 1),
(24, 'Menambah Kelompok Akun', 'Menambah Kelompok 53 - asdfasdf', '2019-02-13 23:26:32', 1, '::1', 1),
(25, 'Memperbaharui Kelompok Akun', 'Memperbaharui data kelompok \"54-asdfasdf\"', '2019-02-13 23:27:23', 1, '::1', 1),
(26, 'Memperbaharui Kelompok Akun', 'Memperbaharui data kelompok akun \"54-asdfasdf\"', '2019-02-13 23:28:53', 1, '::1', 1),
(27, 'Memperbaharui Kelompok Akun', 'Memperbaharui data kelompok akun \"22-Piutang Pajak\"', '2019-02-13 23:29:39', 1, '::1', 1),
(28, 'Memperbaharui Kelompok Akun', 'Memperbaharui data kelompok akun \"54-asdfasdfasdf\"', '2019-02-13 23:35:25', 1, '::1', 1),
(29, 'Menambah Akun', 'Menambah Akun 1123 - 2342rsdf', '2019-02-13 23:58:20', 1, '::1', 1),
(30, 'Menghapus Kelompok Akkun', 'Menghapus Kelompok Akun \"1123\"', '2019-02-14 00:28:17', 1, '::1', 1),
(31, 'Menambah Akun', 'Menambah Akun 1133 - Hutang Piutang', '2019-02-14 00:29:03', 1, '::1', 1),
(32, 'Menghapus Kelompok Akkun', 'Menghapus Kelompok Akun \"11\"', '2019-02-14 07:34:35', 1, '::1', 1),
(33, 'Menambah Kelompok Akun', 'Menambah Kelompok 11 - Piutang Usaha Dalam Negri', '2019-02-14 07:34:39', 1, '::1', 1),
(34, 'Menghapus Kelompok Akkun', 'Menghapus Kelompok Akun \"1133\"', '2019-02-14 07:34:53', 1, '::1', 1),
(35, 'Memperbaharui Kelompok Akun', 'Memperbaharui data kelompok akun \"11-Piutang Dagang\"', '2019-02-14 07:35:35', 1, '::1', 1),
(36, 'Menambah Akun', 'Menambah Akun 2223 - asdkjashdk', '2019-02-14 22:05:42', 1, '::1', 1),
(37, 'Menambah Akun', 'Menambah Akun 2221 - dsfgsdfg', '2019-02-14 22:06:23', 1, '::1', 1),
(38, 'Menghapus Kelompok Akkun', 'Menghapus Kelompok Akun \"2221\"', '2019-02-14 22:14:15', 1, '::1', 1),
(39, 'Menghapus Kelompok Akkun', 'Menghapus Kelompok Akun \"2223\"', '2019-02-14 22:14:51', 1, '::1', 1),
(40, 'Menambah Akun', 'Menambah Akun 1323 - fsafad', '2019-02-14 22:17:57', 1, '::1', 1),
(41, 'Menghapus Akkun', 'Menghapus Kelompok Akun \"1323\"', '2019-02-14 22:18:30', 1, '::1', 1),
(42, 'Menambah Akun', 'Menambah Akun 1101 - PIUTANG USAHA DALAM NEGERI', '2019-02-14 22:19:56', 1, '::1', 1),
(43, 'Memperbaharui Kelompok Akun', 'Memperbaharui data kelompok akun \"61-BIAYA AMORTISASI & DEPRESIASI\"', '2019-02-14 22:22:54', 1, '::1', 1),
(44, 'Memperbaharui Kelompok Akun', 'Memperbaharui data kelompok akun \"11-PIUTANG DAGANG\"', '2019-02-14 22:23:10', 1, '::1', 1),
(45, 'Menambah Akun', 'Menambah Akun 6132 - BIAYA DEPRESIASI BANGUNAN', '2019-02-14 22:23:53', 1, '::1', 1),
(46, 'Menambah Kelompok Akun', 'Menambah Kelompok 40 - PENDAPATAN USAHA', '2019-02-14 22:27:34', 1, '::1', 1),
(47, 'Menambah Kelompok Akun', 'Menambah Kelompok 51 - HARGA POKOK PENJUALAN', '2019-02-14 22:28:40', 1, '::1', 1),
(48, 'Menambah Kelompok Akun', 'Menambah Kelompok 60 - BIAYA-BIAYA OPERASIONAL', '2019-02-14 22:29:07', 1, '::1', 1),
(49, 'Menambah Kelompok Akun', 'Menambah Kelompok 14 - PERSEDIAAN', '2019-02-14 22:29:36', 1, '::1', 1),
(50, 'Menambah Kelompok Akun', 'Menambah Kelompok 16 - AKTIVA TETAP', '2019-02-14 22:30:06', 1, '::1', 1),
(51, 'Menambah Kelompok Akun', 'Menambah Kelompok 20 - HUTANG USAHA', '2019-02-14 22:31:02', 1, '::1', 1),
(52, 'Menambah Kelompok Akun', 'Menambah Kelompok 21 - BIAYA YANG MASIH HARUS DIBAYAR', '2019-02-14 22:31:22', 1, '::1', 1),
(53, 'Memperbaharui Kelompok Akun', 'Memperbaharui data kelompok akun \"22-HUTANG PAJAK\"', '2019-02-14 22:32:36', 1, '::1', 1),
(54, 'Memperbaharui Kelompok Akun', 'Memperbaharui data kelompok akun \"13-REKENING KORAN PEMEGANG SAHAM\"', '2019-02-14 22:33:02', 1, '::1', 1),
(55, 'Menambah Akun', 'Menambah Akun 2001 - HUTANG USAHA DALAM NEGERI', '2019-02-14 22:42:44', 1, '::1', 1),
(56, 'Memperbaharui Akun', 'Memperbaharui Data Akun \"141\"', '2019-02-14 23:36:26', 1, '::1', 1),
(57, 'Memperbaharui Akun', 'Memperbaharui Data Akun \"1401\"', '2019-02-14 23:37:58', 1, '::1', 1),
(58, 'Memperbaharui Akun', 'Memperbaharui Data Akun \"1601\"', '2019-02-14 23:40:44', 1, '::1', 1),
(59, 'Memperbaharui Akun', 'Memperbaharui Data Akun \"1601\"', '2019-02-14 23:40:49', 1, '::1', 1),
(60, 'Menghapus Bank', 'Menghapus Bank \"asdaf cabang asdf\"', '2019-02-14 23:53:56', 1, '::1', 1),
(61, 'Menghapus Bank', 'Menghapus Bank \"asdf cabang asdfasdf\"', '2019-02-14 23:54:31', 1, '::1', 1),
(62, 'Menambah Bank', 'Menambah Bank asdf cabang asdf', '2019-02-14 23:57:54', 1, '::1', 1),
(63, 'Menambah Bank', 'Menambah Bank asdf cabang asd', '2019-02-14 23:58:23', 1, '::1', 1),
(64, 'Menghapus Bank', 'Menghapus Bank \"asdf cabang asdf\"', '2019-02-14 23:58:28', 1, '::1', 1),
(65, 'Memperbaharui Kelompok Akun', 'Memperbaharui data Bank \"ddd cabang ddd\"', '2019-02-15 00:07:36', 1, '::1', 1),
(66, 'Memperbaharui Kelompok Akun', 'Memperbaharui data Bank \"asdfd cabang asd\"', '2019-02-15 00:09:10', 1, '::1', 1),
(67, 'Memperbaharui Kelompok Akun', 'Memperbaharui data Bank \"asdfasdf cabang asdasdfasdfa\"', '2019-02-15 00:09:23', 1, '::1', 1),
(68, 'Memperbaharui Kelompok Akun', 'Memperbaharui data Bank \"asdfasdf cabang asd\"', '2019-02-15 00:10:16', 1, '::1', 1),
(69, 'Menambah Bank', 'Menambah Bank 111 cabang 111', '2019-02-15 00:10:46', 1, '::1', 1),
(70, 'Memperbaharui Kelompok Akun', 'Memperbaharui data Bank \"asdf cabang asd\"', '2019-02-15 00:11:19', 1, '::1', 1),
(71, 'Memperbaharui Bank', 'Memperbaharui data Bank \"asdf cabang asd\"', '2019-02-15 00:12:00', 1, '::1', 1),
(72, 'Memperbaharui Bank', 'Memperbaharui data Bank \"asdf cabang asd\"', '2019-02-15 00:12:19', 1, '::1', 1),
(73, 'Memperbaharui Bank', 'Memperbaharui data Bank \"Mandiri cabang Pekanbaru\"', '2019-02-17 18:04:08', 1, '::1', 1),
(74, 'Menambah Bank', 'Menambah Bank Bank Bukopin cabang Medan', '2019-02-17 18:05:30', 1, '::1', 1),
(75, 'Menambah Partner', 'Menambah Partner asdf cabang ', '2019-02-18 07:54:38', 1, '::1', 1),
(76, 'Menghapus Partner', 'Menghapus Partner \"asdf cabang \"', '2019-02-18 08:03:52', 1, '::1', 1),
(77, 'Menambah Partner', 'Menambah Partner a cabang ', '2019-02-18 08:10:13', 1, '::1', 1),
(78, 'Memperbaharui Partner', 'Memperbaharui data Partner \"a', '2019-02-18 08:11:26', 1, '::1', 1),
(79, 'Menambah Partner', 'Menambah Partner b', '2019-02-18 08:11:37', 1, '::1', 1),
(80, 'Menghapus Partner', 'Menghapus Partner \"b', '2019-02-18 08:12:23', 1, '::1', 1),
(81, 'Menambah Partner', 'Menambah Partner PT. Indo Utama Group', '2019-02-18 08:16:25', 1, '::1', 1),
(82, 'Memperbaharui Partner', 'Memperbaharui data Partner \"Politeknik Caltex Riau', '2019-02-18 08:25:48', 1, '::1', 1),
(83, 'Memperbaharui Partner', 'Memperbaharui data Partner \"Politeknik Caltex Riau', '2019-02-18 08:55:29', 1, '::1', 1),
(84, 'Menambah Jenis Asset', 'Menambah Jenis Asset \"Kendaraan\"', '2019-02-18 13:51:10', 1, '::1', 1),
(85, 'Menambah Jenis Asset', 'Menambah Jenis Asset \"\"', '2019-02-18 14:06:34', 1, '::1', 1),
(86, 'Menghapus Jenis Asset', 'Menghapus Jenis Asset \"\"', '2019-02-18 14:48:54', 1, '::1', 1),
(87, 'Menghapus Jenis Asset', 'Menghapus Jenis Asset \"Kendaraan\"', '2019-02-18 14:49:14', 1, '::1', 1),
(88, 'Menambah Jenis Asset', 'Menambah Jenis Asset \"Kendaraan\"', '2019-02-18 14:49:23', 1, '::1', 1),
(89, 'Menambah Jenis Asset', 'Menambah Jenis Asset \"\"', '2019-02-18 14:49:52', 1, '::1', 1),
(90, 'Menghapus Jenis Asset', 'Menghapus Jenis Asset \"\"', '2019-02-18 14:49:58', 1, '::1', 1),
(91, 'Menambah Jenis Asset', 'Menambah Jenis Asset \"\"', '2019-02-18 14:50:30', 1, '::1', 1),
(92, 'Menghapus Jenis Asset', 'Menghapus Jenis Asset \"\"', '2019-02-18 14:50:51', 1, '::1', 1),
(93, 'Menambah Jenis Asset', 'Menambah Jenis Asset \"asdf\"', '2019-02-18 14:50:56', 1, '::1', 1),
(94, 'Menghapus Jenis Asset', 'Menghapus Jenis Asset \"asdf\"', '2019-02-18 14:52:16', 1, '::1', 1),
(95, 'Menambah Jenis Asset', 'Menambah Jenis Asset \"asdf\"', '2019-02-18 14:56:08', 1, '::1', 1),
(96, 'Menambah Jenis Asset', 'Menambah Jenis Asset \"Gedung\"', '2019-02-18 14:58:10', 1, '::1', 1),
(97, 'Memperbaharui Jenis Asset', 'Memperbaharui data Jenis Asset \"Alat Berat\"', '2019-02-18 15:04:08', 1, '::1', 1),
(98, 'Memperbaharui Jenis Asset', 'Memperbaharui data Jenis Asset \"Kendaraan\"', '2019-02-18 15:04:20', 1, '::1', 1),
(99, 'Menambah Pengguna', 'Menambah pengguna \"asdf\" sebagai ', '2019-02-18 15:05:31', 1, '::1', 1),
(100, 'Menghapus Pengguna', 'Menghapus pengguna asdf', '2019-02-18 15:05:39', 1, '::1', 1),
(101, 'Menambah Akun', 'Menambah Akun 112 - 2342', '2019-02-18 15:11:47', 1, '::1', 1),
(102, 'Menghapus Akkun', 'Menghapus Kelompok Akun \"112\"', '2019-02-18 15:11:52', 1, '::1', 1),
(103, 'Menambah Pengguna', 'Menambah pengguna \"asdf\" sebagai Akuntan', '2019-02-18 15:12:20', 1, '::1', 1),
(104, 'Menghapus Pengguna', 'Menghapus pengguna asdf', '2019-02-18 15:12:26', 1, '::1', 1),
(105, 'Menambah Jenis Asset', 'Menambah Jenis Asset \"sdf\"', '2019-02-19 04:58:59', 1, '::1', 1),
(106, 'Menghapus Jenis Asset', 'Menghapus Jenis Asset \"sdf\"', '2019-02-19 04:59:05', 1, '::1', 1),
(107, 'Memperbaharui Jenis Asset', 'Memperbaharui data Jenis Asset \"Gedung\"', '2019-02-19 05:04:00', 1, '::1', 1),
(108, 'Memperbaharui Jenis Asset', 'Memperbaharui data Jenis Asset \"Gedung\"', '2019-02-19 05:09:08', 1, '::1', 1),
(109, 'Memperbaharui Jenis Asset', 'Memperbaharui data Jenis Asset \"Gedung\"', '2019-02-19 05:09:15', 1, '::1', 1),
(110, 'Menambah Akun', 'Menambah Akun 6133 - BIAYA DEPRESIASI KENDARAAN', '2019-02-19 05:12:15', 1, '::1', 1),
(111, 'Memperbaharui Akun', 'Memperbaharui Data Akun \"6133\"', '2019-02-19 05:12:33', 1, '::1', 1),
(112, 'Menghapus Akkun', 'Menghapus Kelompok Akun \"6133\"', '2019-02-19 05:12:39', 1, '::1', 1),
(113, 'Menambah Akun', 'Menambah Akun 6133 - BIAYA DEPRESIASI KENDARAAN', '2019-02-19 05:12:48', 1, '::1', 1),
(114, 'Memperbaharui Jenis Asset', 'Memperbaharui data Jenis Asset \"Kendaraan\"', '2019-02-19 05:14:02', 1, '::1', 1),
(115, 'Menghapus Jenis Asset', 'Menghapus Jenis Asset \"Alat Berat\"', '2019-02-19 05:57:50', 1, '::1', 1),
(116, 'Logout', 'Administrator Logout dari System', '2019-02-21 08:28:02', 1, '::1', 1),
(117, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-02-21 08:31:25', 1, '::1', 1),
(118, 'Menambah Pengguna', 'Menambah pengguna \"Evausa\" sebagai Akuntan', '2019-02-21 08:34:46', 1, '::1', 1),
(119, 'Logout', 'Fikri Muhaffizh Imani Logout dari System', '2019-02-21 08:35:09', 1, '::1', 1),
(120, 'Login', 'Evausa Login ke System', '2019-02-21 08:35:15', 1, '::1', 15),
(121, 'Login', 'Evausa Login ke System', '2019-02-21 08:35:27', 1, '::1', 15),
(122, 'Login', 'Evausa Login ke System', '2019-02-21 08:36:19', 1, '::1', 15),
(123, 'Login', 'Evausa Login ke System', '2019-02-21 08:36:39', 1, '::1', 15),
(124, 'Memperbaharui Jenis Asset', 'Memperbaharui data Jenis Asset \"Kendaraan\"', '2019-02-21 11:24:07', 1, '::1', 1),
(125, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-02-22 09:49:37', 1, '::1', 1),
(126, 'Logout', 'Fikri Muhaffizh Imani Logout dari System', '2019-02-22 09:50:25', 1, '::1', 1),
(127, 'Login', 'Evausa Login ke System', '2019-02-22 09:50:35', 1, '::1', 15),
(128, 'Logout', 'Evausa Logout dari System', '2019-02-22 09:50:40', 1, '::1', 1),
(129, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-02-22 10:12:06', 1, '::1', 1),
(130, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-02-25 18:26:44', 1, '::1', 1),
(131, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-02-25 22:22:17', 1, '::1', 1),
(132, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-02-26 09:16:08', 1, '::1', 1),
(133, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-02-27 19:23:25', 1, '::1', 1),
(134, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-02-27 23:21:10', 1, '::1', 1),
(135, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-02-28 05:53:25', 1, '::1', 1),
(136, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-03 12:26:26', 1, '::1', 1),
(137, 'Menambah Asset', 'Menambah Asset \"sadfasdf', '2019-03-03 13:01:00', 1, '::1', 1),
(138, 'Memperbaharui Asset', 'Memberbaharui Data Asset \"Asset tes', '2019-03-03 13:10:28', 1, '::1', 1),
(139, 'Memperbaharui Asset', 'Memberbaharui Data Asset \"asset 1', '2019-03-03 13:10:46', 1, '::1', 1),
(140, 'Memperbaharui Asset', 'Memberbaharui Data Asset \"352938tweof', '2019-03-03 13:11:15', 1, '::1', 1),
(141, 'Memperbaharui Asset', 'Memberbaharui Data Asset \"352938tweof', '2019-03-03 13:12:01', 1, '::1', 1),
(142, 'Menghapus Partner', 'Menghapus Partner \"Politeknik Caltex Riau', '2019-03-03 13:12:16', 1, '::1', 1),
(143, 'Memperbaharui Asset', 'Memberbaharui Data Asset \"FIkti Muhaffizh', '2019-03-03 13:35:42', 1, '::1', 1),
(144, 'Menambah Komponen Biaya', 'Menambah Komponen Biaya \"Pemberian Satu\"', '2019-03-03 15:15:41', 1, '::1', 1),
(145, 'Memperbaharui Komponen Biaya', 'Memperbaharui data Komponen Biaya \"Pemberian Satuasdfsdfas\"', '2019-03-03 15:16:47', 1, '::1', 1),
(146, 'Menambah Komponen Biaya', 'Menambah Komponen Biaya \"afsfasdfa\"', '2019-03-03 15:16:56', 1, '::1', 1),
(147, 'Menambah Komponen Biaya', 'Menambah Komponen Biaya \"cvcxbxcvb\"', '2019-03-03 15:17:05', 1, '::1', 1),
(148, 'Menghapus Komponen Biaya', 'Menghapus Komponen Biaya \"\"', '2019-03-03 15:17:14', 1, '::1', 1),
(149, 'Menghapus Komponen Biaya', 'Menghapus Komponen Biaya \"afsfasdfa\"', '2019-03-03 15:17:37', 1, '::1', 1),
(150, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-03 21:27:28', 1, '::1', 1),
(151, 'Memperbaharui Partner', 'Memperbaharui data Partner \"PT. Indo Utama Group', '2019-03-03 22:41:54', 1, '::1', 1),
(152, 'Menambah Komponen Biaya', 'Menambah Komponen Biaya \"fasdfasdf\"', '2019-03-03 22:53:44', 1, '::1', 1),
(153, 'Menambah Komponen Biaya', 'Menambah Komponen Biaya \"erwer\"', '2019-03-03 22:53:50', 1, '::1', 1),
(154, 'Menambah Komponen Biaya', 'Menambah Komponen Biaya \"sdfsdfsdf\"', '2019-03-03 22:53:59', 1, '::1', 1),
(155, 'Memperbaharui Asset', 'Memberbaharui Data Asset \"Bangunan Kantor & Workshop KBI', '2019-03-03 23:46:21', 1, '::1', 1),
(156, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-04 07:50:13', 1, '::1', 1),
(157, 'Memperbaharui Komponen Biaya', 'Memperbaharui data Komponen Biaya \"Gaji\"', '2019-03-04 08:14:03', 1, '::1', 1),
(158, 'Memperbaharui Komponen Biaya', 'Memperbaharui data Komponen Biaya \"Listrik, Air, dan Telepon\"', '2019-03-04 08:14:23', 1, '::1', 1),
(159, 'Memperbaharui Komponen Biaya', 'Memperbaharui data Komponen Biaya \"Biaya Perjalanan Dinas\"', '2019-03-04 08:14:41', 1, '::1', 1),
(160, 'Memperbaharui Komponen Biaya', 'Memperbaharui data Komponen Biaya \"Biaya Sewa\"', '2019-03-04 08:14:55', 1, '::1', 1),
(161, 'Menambah Komponen Biaya', 'Menambah Komponen Biaya \"Biaya Utilitas\"', '2019-03-04 08:15:16', 1, '::1', 1),
(162, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-04 19:31:35', 1, '::1', 1),
(163, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-06 17:22:27', 1, '::1', 1),
(164, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-08 14:13:13', 1, '::1', 1),
(165, 'Menghapus Proyek', 'Menghapus Proyek \"Pembangunan Rumah Tinggal', '2019-03-08 14:16:44', 1, '::1', 1),
(166, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-08 21:07:47', 1, '::1', 1),
(167, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-09 07:35:20', 1, '::1', 1),
(168, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-09 14:41:42', 1, '::1', 1),
(169, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-10 08:28:25', 1, '::1', 1),
(170, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-10 16:46:17', 1, '::1', 1),
(171, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-11 03:11:22', 1, '::1', 1),
(172, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-11 13:41:08', 1, '::1', 1),
(173, 'Menghapus Transaksi', 'Menghapus Transaksi \"CJ03190001\"', '2019-03-11 14:48:23', 1, '::1', 1),
(174, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-11 21:48:44', 1, '::1', 1),
(175, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-12 06:00:20', 1, '::1', 1),
(176, 'Logout', 'Fikri Muhaffizh Imani Logout dari System', '2019-03-12 08:00:36', 1, '::1', 1),
(177, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-12 08:01:23', 1, '::1', 1),
(178, 'Set Saldo Awal', 'Set Saldo Awal akun  menjadi ', '2019-03-12 10:34:59', 1, '::1', 1),
(179, 'Set Saldo Awal', 'Set Saldo Awal akun  menjadi ', '2019-03-12 10:36:29', 1, '::1', 1),
(180, 'Set Saldo Awal', 'Set Saldo Awal akun  menjadi ', '2019-03-12 10:37:20', 1, '::1', 1),
(181, 'Set Saldo Awal', 'Set Saldo Awal akun 1101 menjadi 700', '2019-03-12 10:38:20', 1, '::1', 1),
(182, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-12 15:04:02', 1, '::1', 1),
(183, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-13 04:14:03', 1, '::1', 1),
(184, 'Menghapus Transaksi', 'Menghapus Transaksi \"CB03190001\"', '2019-03-13 05:11:24', 1, '::1', 1),
(185, 'Menghapus Transaksi', 'Menghapus Transaksi \"CB03190002\"', '2019-03-13 05:12:05', 1, '::1', 1),
(186, 'Menambah Transaksi', 'Menambah Transaksi Pembelian \"PS03190001', '2019-03-13 05:13:23', 1, '::1', 1),
(187, 'Menghapus Transaksi', 'Menghapus Transaksi \"PS03190001\"', '2019-03-13 05:47:04', 1, '::1', 1),
(188, 'Menambah Transaksi', 'Menambah Transaksi Pembelian \"PS03190002', '2019-03-13 05:47:44', 1, '::1', 1),
(189, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembangunan Rumah Tinggal', '2019-03-13 07:48:57', 1, '::1', 1),
(190, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembangunan Rumah Tinggal', '2019-03-13 07:50:48', 1, '::1', 1),
(191, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembangunan Rumah Tinggal', '2019-03-13 08:22:00', 1, '::1', 1),
(192, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembangunan Rumah Tinggal', '2019-03-13 08:23:06', 1, '::1', 1),
(193, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembangunan Rumah Tinggal', '2019-03-13 08:24:01', 1, '::1', 1),
(194, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembangunan Rumah Tinggal', '2019-03-13 08:30:04', 1, '::1', 1),
(195, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembangunan Rumah Tinggal', '2019-03-13 08:35:56', 1, '::1', 1),
(196, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembangunan Rumah Tinggal', '2019-03-13 08:41:55', 1, '::1', 1),
(197, 'Logout', 'Fikri Muhaffizh Imani Logout dari System', '2019-03-13 09:12:49', 1, '::1', 1),
(198, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-13 09:13:28', 1, '::1', 1),
(199, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembangunan Rumah Tinggal', '2019-03-13 09:20:12', 1, '::1', 1),
(200, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-19 17:29:09', 1, '::1', 1),
(201, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-20 07:24:37', 1, '::1', 1),
(202, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembelian Mesin Baja', '2019-03-20 07:33:05', 1, '::1', 1),
(203, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembelian Mesin Baja', '2019-03-20 07:37:34', 1, '::1', 1),
(204, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembelian Beton', '2019-03-20 07:38:48', 1, '::1', 1),
(205, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembelian Beton', '2019-03-20 07:39:01', 1, '::1', 1),
(206, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembelian Mesin Baja', '2019-03-20 07:43:06', 1, '::1', 1),
(207, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembelian Mesin Baja', '2019-03-20 07:43:13', 1, '::1', 1),
(208, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembelian Mesin Baja', '2019-03-20 07:43:19', 1, '::1', 1),
(209, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-20 19:14:49', 1, '::1', 1),
(210, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"Proyek Pembangunan Bandara 2', '2019-03-20 19:30:27', 1, '::1', 1),
(211, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"Proyek Pembangunan Bandara', '2019-03-20 19:32:25', 1, '::1', 1),
(212, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"Proyek Pembangunan Bandara', '2019-03-20 19:34:55', 1, '::1', 1),
(213, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"Proyek Pembangunan Bandara', '2019-03-20 19:35:05', 1, '::1', 1),
(214, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"Proyek Pembangunan Bandara', '2019-03-20 19:36:43', 1, '::1', 1),
(215, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"Proyek Pembangunan Bandara', '2019-03-20 19:37:30', 1, '::1', 1),
(216, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"Proyek Pembangunan Bandara', '2019-03-20 19:40:27', 1, '::1', 1),
(217, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"Proyek Pembangunan Bandara', '2019-03-20 19:42:04', 1, '::1', 1),
(218, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"Proyek Pembangunan Bandara', '2019-03-20 19:42:45', 1, '::1', 1),
(219, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-20 21:54:38', 1, '127.0.0.1', 1),
(220, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"Proyek Pembangunan Bandara', '2019-03-20 22:20:21', 1, '::1', 1),
(221, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"Proyek Pembangunan Bandara', '2019-03-20 22:24:52', 1, '::1', 1),
(222, 'Menghapus Transaksi', 'Menghapus Transaksi \"PS03190002\"', '2019-03-20 22:27:39', 1, '::1', 1),
(223, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190003\"', '2019-03-20 22:27:46', 1, '::1', 1),
(224, 'Menghapus Transaksi', 'Menghapus Transaksi \"CJ03190001\"', '2019-03-20 22:28:49', 1, '::1', 1),
(225, 'Menghapus Transaksi', 'Menghapus Transaksi \"AJ03190001\"', '2019-03-20 22:28:56', 1, '::1', 1),
(226, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190002\"', '2019-03-20 22:29:00', 1, '::1', 1),
(227, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190001\"', '2019-03-20 22:29:05', 1, '::1', 1),
(228, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-20 22:53:26', 1, '::1', 1),
(229, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190002', '2019-03-20 22:53:48', 1, '::1', 1),
(230, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190003', '2019-03-20 22:55:01', 1, '::1', 1),
(231, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190004', '2019-03-20 22:55:33', 1, '::1', 1),
(232, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190004\"', '2019-03-20 22:56:57', 1, '::1', 1),
(233, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190003\"', '2019-03-20 22:57:03', 1, '::1', 1),
(234, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190002\"', '2019-03-20 22:57:09', 1, '::1', 1),
(235, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190001\"', '2019-03-20 22:57:13', 1, '::1', 1),
(236, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-20 22:57:17', 1, '::1', 1),
(237, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-20 23:01:00', 1, '::1', 1),
(238, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-21 05:45:19', 1, '::1', 1),
(239, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190001\"', '2019-03-21 05:47:43', 1, '::1', 1),
(240, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-21 05:49:28', 1, '::1', 1),
(241, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190002', '2019-03-21 05:50:00', 1, '::1', 1),
(242, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190001\"', '2019-03-21 06:00:46', 1, '::1', 1),
(243, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190002\"', '2019-03-21 06:00:51', 1, '::1', 1),
(244, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-21 06:00:55', 1, '::1', 1),
(245, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190002', '2019-03-21 06:01:57', 1, '::1', 1),
(246, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-21 06:14:41', 1, '::1', 1),
(247, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-21 06:15:50', 1, '::1', 1),
(248, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190002', '2019-03-21 06:16:52', 1, '::1', 1),
(249, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-21 06:17:26', 1, '::1', 1),
(250, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-21 06:18:22', 1, '::1', 1),
(251, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190002', '2019-03-21 06:19:16', 1, '::1', 1),
(252, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190003', '2019-03-21 06:19:48', 1, '::1', 1),
(253, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190004', '2019-03-21 06:20:24', 1, '::1', 1),
(254, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190005', '2019-03-21 06:21:31', 1, '::1', 1),
(255, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190006', '2019-03-21 06:22:13', 1, '::1', 1),
(256, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190007', '2019-03-21 06:22:57', 1, '::1', 1),
(257, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190008', '2019-03-21 06:23:30', 1, '::1', 1),
(258, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190009', '2019-03-21 06:25:25', 1, '::1', 1),
(259, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190010', '2019-03-21 06:25:40', 1, '::1', 1),
(260, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190011', '2019-03-21 06:26:25', 1, '::1', 1),
(261, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-21 06:27:22', 1, '::1', 1),
(262, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-21 06:27:34', 1, '::1', 1),
(263, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-21 07:12:36', 1, '::1', 1),
(264, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190002', '2019-03-21 07:12:59', 1, '::1', 1),
(265, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190003', '2019-03-21 07:13:12', 1, '::1', 1),
(266, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-21 07:13:31', 1, '::1', 1),
(267, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190002', '2019-03-21 07:14:46', 1, '::1', 1),
(268, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190003', '2019-03-21 07:18:54', 1, '::1', 1),
(269, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190004', '2019-03-21 07:20:05', 1, '::1', 1),
(270, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Koreksi \"CJ03190001', '2019-03-21 07:21:56', 1, '::1', 1),
(271, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Penyesuaian \"AJ03190001', '2019-03-21 07:25:48', 1, '::1', 1),
(272, 'Set Saldo Awal', 'Set Saldo Awal akun 1010 menjadi 1.000', '2019-03-21 07:42:11', 1, '::1', 1),
(273, 'Set Saldo Awal', 'Set Saldo Awal akun  menjadi 25.000', '2019-03-21 07:54:30', 1, '::1', 1),
(274, 'Logout', 'Fikri Muhaffizh Imani Logout dari System', '2019-03-21 07:54:57', 1, '::1', 1),
(275, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-21 07:55:03', 1, '::1', 1),
(276, 'Set Saldo Awal', 'Set Saldo Awal akun  menjadi 25.000', '2019-03-21 07:58:13', 1, '::1', 1),
(277, 'Set Saldo Awal', 'Set Saldo Awal akun 1012 menjadi 25.000', '2019-03-21 08:02:50', 1, '::1', 1),
(278, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190005', '2019-03-21 08:04:05', 1, '::1', 1),
(279, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190006', '2019-03-21 08:04:14', 1, '::1', 1),
(280, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190006\"', '2019-03-21 08:04:45', 1, '::1', 1),
(281, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190005\"', '2019-03-21 08:04:51', 1, '::1', 1),
(282, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190005', '2019-03-21 08:05:34', 1, '::1', 1),
(283, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190005', '2019-03-21 08:08:09', 1, '::1', 1),
(284, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-21 11:25:53', 1, '::1', 1),
(285, 'Set Saldo Awal', 'Set Saldo Awal akun 1010 menjadi 10.000', '2019-03-21 12:01:20', 1, '::1', 1),
(286, 'Set Saldo Awal', 'Set Saldo Awal akun 1010 menjadi 10.000', '2019-03-21 12:02:17', 1, '::1', 1),
(287, 'Set Saldo Awal', 'Set Saldo Awal akun 1010 menjadi 10.000', '2019-03-21 12:05:34', 1, '::1', 1),
(288, 'Set Saldo Awal', 'Set Saldo Awal akun 1010 menjadi 10.000', '2019-03-21 12:09:18', 1, '::1', 1),
(289, 'Set Saldo Awal', 'Set Saldo Awal akun 1010 menjadi 20.000', '2019-03-21 12:10:36', 1, '::1', 1),
(290, 'Set Saldo Awal', 'Set Saldo Awal akun 1104 menjadi 50.000', '2019-03-21 12:11:25', 1, '::1', 1),
(291, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-21 14:23:39', 1, '::1', 1),
(292, 'Set Saldo Awal', 'Set Saldo Awal akun 1010 menjadi 20.000', '2019-03-21 15:07:36', 1, '::1', 1),
(293, 'Set Saldo Awal', 'Set Saldo Awal akun 1010 menjadi 20.000', '2019-03-21 15:16:15', 1, '::1', 1),
(294, 'Set Saldo Awal', 'Set Saldo Awal akun 1010 menjadi 20.000', '2019-03-21 15:20:25', 1, '::1', 1),
(295, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-21 20:25:29', 1, '::1', 1),
(296, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-22 05:54:37', 1, '::1', 1),
(297, 'Menambah Transaksi', 'Menambah Transaksi Kas \"CB03190001', '2019-03-22 05:56:54', 1, '::1', 1),
(298, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-22 10:45:12', 1, '::1', 1),
(299, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-22 15:27:30', 1, '::1', 1),
(300, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190002', '2019-03-22 16:02:22', 1, '::1', 1),
(301, 'Logout', 'Fikri Muhaffizh Imani Logout dari System', '2019-03-22 16:49:21', 1, '10.8.0.4', 1),
(302, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-22 16:49:25', 1, '10.8.0.4', 1),
(303, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-22 21:50:00', 1, '10.8.0.4', 1),
(304, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-23 08:00:02', 1, '10.8.0.4', 1),
(305, 'Login', 'Evausa Login ke System', '2019-03-23 16:22:59', 1, '10.8.0.4', 15),
(306, 'Set Saldo Awal', 'Set Saldo Awal akun 1001 menjadi 10.000.000', '2019-03-23 16:23:59', 1, '10.8.0.4', 15),
(307, 'Set Saldo Awal', 'Set Saldo Awal akun 1010 menjadi 861.015.235', '2019-03-23 16:26:14', 1, '10.8.0.4', 15),
(308, 'Set Saldo Awal', 'Set Saldo Awal akun 1010 menjadi 1.255', '2019-03-23 16:27:02', 1, '10.8.0.4', 15),
(309, 'Set Saldo Awal', 'Set Saldo Awal akun 1010 menjadi 861.015.235', '2019-03-23 16:27:44', 1, '10.8.0.4', 15),
(310, 'Set Saldo Awal', 'Set Saldo Awal akun 1012 menjadi 4.310.813.305', '2019-03-23 16:28:55', 1, '10.8.0.4', 15),
(311, 'Set Saldo Awal', 'Set Saldo Awal akun 1012 menjadi 4.310.813.305', '2019-03-23 16:30:00', 1, '10.8.0.4', 15),
(312, 'Set Saldo Awal', 'Set Saldo Awal akun 1015 menjadi 564.815.546', '2019-03-23 16:31:21', 1, '10.8.0.4', 15),
(313, 'Set Saldo Awal', 'Set Saldo Awal akun 1012 menjadi 431', '2019-03-23 16:31:41', 1, '10.8.0.4', 15),
(314, 'Set Saldo Awal', 'Set Saldo Awal akun 1012 menjadi 4.310.813.305', '2019-03-23 16:32:22', 1, '10.8.0.4', 15),
(315, 'Set Saldo Awal', 'Set Saldo Awal akun 1101 menjadi 367.224.000', '2019-03-23 16:33:13', 1, '10.8.0.4', 15),
(316, 'Set Saldo Awal', 'Set Saldo Awal akun 1012 menjadi 4.310.813.305', '2019-03-23 16:33:54', 1, '10.8.0.4', 15),
(317, 'Set Saldo Awal', 'Set Saldo Awal akun 1111 menjadi 315.842.783', '2019-03-23 16:35:23', 1, '10.8.0.4', 15),
(318, 'Set Saldo Awal', 'Set Saldo Awal akun 1121 menjadi 148.000.000', '2019-03-23 16:36:06', 1, '10.8.0.4', 15),
(319, 'Set Saldo Awal', 'Set Saldo Awal akun 1108 menjadi 3.583.720.000', '2019-03-23 16:37:01', 1, '10.8.0.4', 15),
(320, 'Set Saldo Awal', 'Set Saldo Awal akun 1202 menjadi 480.000', '2019-03-23 16:48:46', 1, '10.8.0.4', 15),
(321, 'Set Saldo Awal', 'Set Saldo Awal akun 1204 menjadi 306.968.530', '2019-03-23 16:49:45', 1, '10.8.0.4', 15),
(322, 'Set Saldo Awal', 'Set Saldo Awal akun 1513 menjadi 6.712.911.574', '2019-03-23 16:51:28', 1, '10.8.0.4', 15),
(323, 'Set Saldo Awal', 'Set Saldo Awal akun 1504 menjadi 14.240.399.823', '2019-03-23 16:52:22', 1, '10.8.0.4', 15),
(324, 'Set Saldo Awal', 'Set Saldo Awal akun 1514 menjadi 14.113.827.245', '2019-03-23 16:53:35', 1, '10.8.0.4', 15),
(325, 'Set Saldo Awal', 'Set Saldo Awal akun 1601 menjadi 120.000.000', '2019-03-23 16:54:01', 1, '10.8.0.4', 15),
(326, 'Set Saldo Awal', 'Set Saldo Awal akun 1602 menjadi 1.904.503.500', '2019-03-23 16:55:01', 1, '10.8.0.4', 15),
(327, 'Set Saldo Awal', 'Set Saldo Awal akun 1603 menjadi 296.450.000', '2019-03-23 16:55:34', 1, '10.8.0.4', 15),
(328, 'Set Saldo Awal', 'Set Saldo Awal akun 1603 menjadi 296.450.000', '2019-03-23 16:55:53', 1, '10.8.0.4', 15),
(329, 'Set Saldo Awal', 'Set Saldo Awal akun 1604 menjadi 149.606.919', '2019-03-23 16:56:49', 1, '10.8.0.4', 15),
(330, 'Set Saldo Awal', 'Set Saldo Awal akun 1605 menjadi 79.957.800', '2019-03-23 16:57:22', 1, '10.8.0.4', 15),
(331, 'Set Saldo Awal', 'Set Saldo Awal akun 1610 menjadi 79.957.800', '2019-03-23 16:58:04', 1, '10.8.0.4', 15),
(332, 'Set Saldo Awal', 'Set Saldo Awal akun 1610 menjadi 1.649.000', '2019-03-23 16:58:32', 1, '10.8.0.4', 15),
(333, 'Set Saldo Awal', 'Set Saldo Awal akun 1612 menjadi 286.961.125', '2019-03-23 16:59:18', 1, '10.8.0.4', 15),
(334, 'Set Saldo Awal', 'Set Saldo Awal akun 1613 menjadi 74.556.250', '2019-03-23 16:59:58', 1, '10.8.0.4', 15),
(335, 'Set Saldo Awal', 'Set Saldo Awal akun 1614 menjadi 80.142.460', '2019-03-23 17:00:46', 1, '10.8.0.4', 15),
(336, 'Set Saldo Awal', 'Set Saldo Awal akun 1615 menjadi 47.776.625', '2019-03-23 17:01:18', 1, '10.8.0.4', 15),
(337, 'Set Saldo Awal', 'Set Saldo Awal akun 1620 menjadi 412.250', '2019-03-23 17:02:00', 1, '10.8.0.4', 15),
(338, 'Set Saldo Awal', 'Set Saldo Awal akun 1902 menjadi 4.087.120', '2019-03-23 17:02:57', 1, '10.8.0.4', 15),
(339, 'Set Saldo Awal', 'Set Saldo Awal akun 2304 menjadi 834.000', '2019-03-23 17:03:45', 1, '10.8.0.4', 15),
(340, 'Set Saldo Awal', 'Set Saldo Awal akun 2411 menjadi 15.484.383.445', '2019-03-23 17:04:30', 1, '10.8.0.4', 15),
(341, 'Set Saldo Awal', 'Set Saldo Awal akun 2303 menjadi 1.668.418.982', '2019-03-23 17:05:32', 1, '10.8.0.4', 15),
(342, 'Set Saldo Awal', 'Set Saldo Awal akun 2310 menjadi 9.600.000', '2019-03-23 17:06:03', 1, '10.8.0.4', 15),
(343, 'Set Saldo Awal', 'Set Saldo Awal akun 2210 menjadi 14.368.645', '2019-03-23 17:06:50', 1, '10.8.0.4', 15),
(344, 'Set Saldo Awal', 'Set Saldo Awal akun 2403 menjadi 7.144.923.227', '2019-03-23 17:07:39', 1, '10.8.0.4', 15),
(345, 'Set Saldo Awal', 'Set Saldo Awal akun 3001 menjadi 1.000.000.000', '2019-03-23 17:09:12', 1, '10.8.0.4', 15),
(346, 'Set Saldo Awal', 'Set Saldo Awal akun 3002 menjadi 4.000.000.000', '2019-03-23 17:09:41', 1, '10.8.0.4', 15),
(347, 'Set Saldo Awal', 'Set Saldo Awal akun 3002 menjadi 4.000.000.000', '2019-03-23 17:09:52', 1, '10.8.0.4', 15),
(348, 'Set Saldo Awal', 'Set Saldo Awal akun 3101 menjadi 251.926.155', '2019-03-23 17:12:31', 1, '10.8.0.4', 15),
(349, 'Set Saldo Awal', 'Set Saldo Awal akun 3102 menjadi 143.429.218', '2019-03-23 17:13:30', 1, '10.8.0.4', 15),
(350, 'Set Saldo Awal', 'Set Saldo Awal akun 1012 menjadi 4.310.813.305', '2019-03-23 17:14:23', 1, '10.8.0.4', 15),
(351, 'Memperbaharui Bank', 'Memperbaharui data Bank \"Bank Bukopin cabang Pekanbaru\"', '2019-03-23 17:26:30', 1, '10.8.0.4', 15),
(352, 'Memperbaharui Bank', 'Memperbaharui data Bank \"Bank Mandiri Rumbai cabang Rumbai\"', '2019-03-23 17:29:53', 1, '10.8.0.4', 15),
(353, 'Memperbaharui Bank', 'Memperbaharui data Bank \"Bank Mandiri Cilacap cabang Cilacap\"', '2019-03-23 17:31:19', 1, '10.8.0.4', 15),
(354, 'Menambah Bank', 'Menambah Bank Bank Mandiri Rekening Bersama cabang Rumbai', '2019-03-23 17:32:54', 1, '10.8.0.4', 15),
(355, 'Menambah Asset', 'Menambah Asset \"Bagunan ', '2019-03-23 17:42:09', 1, '10.8.0.4', 15),
(356, 'Menambah Asset', 'Menambah Asset \"Perabot Kantor ', '2019-03-23 17:46:05', 1, '10.8.0.4', 15),
(357, 'Menambah Asset', 'Menambah Asset \"Peralatan Kantor', '2019-03-23 17:47:38', 1, '10.8.0.4', 15),
(358, 'Menambah Asset', 'Menambah Asset \"Mobil Innova 2007', '2019-03-23 17:49:00', 1, '10.8.0.4', 15),
(359, 'Menambah Asset', 'Menambah Asset \"Mobil Avanza 2017', '2019-03-23 17:49:48', 1, '10.8.0.4', 15),
(360, 'Menambah Asset', 'Menambah Asset \"Mobil Pajero Sport', '2019-03-23 17:50:40', 1, '10.8.0.4', 15),
(361, 'Menambah Asset', 'Menambah Asset \"Peralatan lain lain', '2019-03-23 17:51:44', 1, '10.8.0.4', 15),
(362, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190001', '2019-03-23 18:02:29', 1, '10.8.0.4', 15),
(363, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190002', '2019-03-23 18:08:47', 1, '10.8.0.4', 15),
(364, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-23 21:02:23', 1, '10.8.0.4', 1),
(365, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190001\"', '2019-03-23 21:29:33', 1, '10.8.0.4', 1),
(366, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190002\"', '2019-03-23 21:29:38', 1, '10.8.0.4', 1),
(367, 'Menghapus Partner', 'Menghapus Partner \"b', '2019-03-23 21:30:01', 1, '10.8.0.4', 1),
(368, 'Menghapus Proyek', 'Menghapus Proyek \"Proyek Tunggal', '2019-03-23 21:30:43', 1, '10.8.0.4', 1),
(369, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-24 05:42:27', 1, '10.8.0.4', 1),
(370, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-24 09:42:26', 1, '10.8.0.4', 1),
(371, 'Login', 'Evausa Login ke System', '2019-03-24 11:06:58', 1, '10.8.0.4', 15),
(372, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190003', '2019-03-24 11:12:05', 1, '10.8.0.4', 15),
(373, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190004', '2019-03-24 11:15:54', 1, '10.8.0.4', 15),
(374, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190005', '2019-03-24 11:19:11', 1, '10.8.0.4', 15),
(375, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190006', '2019-03-24 11:21:58', 1, '10.8.0.4', 15),
(376, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190007', '2019-03-24 11:25:15', 1, '10.8.0.4', 15),
(377, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190008', '2019-03-24 11:28:55', 1, '10.8.0.4', 15),
(378, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190009', '2019-03-24 11:31:34', 1, '10.8.0.4', 15),
(379, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190010', '2019-03-24 11:59:36', 1, '10.8.0.4', 15),
(380, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190011', '2019-03-24 12:04:41', 1, '10.8.0.4', 15),
(381, 'Login', 'Evausa Login ke System', '2019-03-24 14:48:06', 1, '10.8.0.4', 15),
(382, 'Menambah Partner', 'Menambah Partner PT. Jasmine Residence Indonesia', '2019-03-24 14:49:56', 1, '10.8.0.4', 15),
(383, 'Menambah Partner', 'Menambah Partner PT. Argantara', '2019-03-24 14:50:47', 1, '10.8.0.4', 15),
(384, 'Menambah Partner', 'Menambah Partner PT. Teknik Utama Negeri Engineering (PT.TUNE)', '2019-03-24 14:51:18', 1, '10.8.0.4', 15),
(385, 'Menambah Partner', 'Menambah Partner PT. Multi Inti Guna (PT.MIG)', '2019-03-24 14:51:48', 1, '10.8.0.4', 15),
(386, 'Menambah Partner', 'Menambah Partner PT. Ridho Perkasa Alam (PT.RPA)', '2019-03-24 14:52:14', 1, '10.8.0.4', 15),
(387, 'Menambah Partner', 'Menambah Partner Ciputat Molek Residence', '2019-03-24 14:52:34', 1, '10.8.0.4', 15),
(388, 'Menambah Partner', 'Menambah Partner Nadia Asri Residence', '2019-03-24 14:53:01', 1, '10.8.0.4', 15),
(389, 'Menambah Partner', 'Menambah Partner CV. Berkah Tanjak Laksmana (CV.BTL)', '2019-03-24 14:53:46', 1, '10.8.0.4', 15),
(390, 'Menambah Partner', 'Menambah Partner Ciliong Mea Properties (CMP)ksmana (CV.BTL)', '2019-03-24 14:54:06', 1, '10.8.0.4', 15),
(391, 'Menambah Partner', 'Menambah Partner PT. Safari Putra Riau (PT.SPR)smana (CV.BTL)', '2019-03-24 14:54:20', 1, '10.8.0.4', 15),
(392, 'Menambah Partner', 'Menambah Partner PT. Janabayu Indo Citra Engineering Servicesmana (CV.BTL)', '2019-03-24 14:54:37', 1, '10.8.0.4', 15),
(393, 'Menambah Partner', 'Menambah Partner Konsorsium PT. Syifa Jaya Energi, CV. Berkah Tanjak Laksmana dan PT. Karya Bangsa Indonesiamana (CV.BTL)', '2019-03-24 14:54:58', 1, '10.8.0.4', 15),
(394, 'Menambah Partner', 'Menambah Partner Kolaborasi PT. KBI, PT. Pajajaran Bangun Mandiri (PBM) & CV.Prima Jasa (PJ) ana (CV.BTL)', '2019-03-24 14:55:14', 1, '10.8.0.4', 15),
(395, 'Menambah Partner', 'Menambah Partner KBI - TIP', '2019-03-24 14:55:36', 1, '10.8.0.4', 15),
(396, 'Menambah Partner', 'Menambah Partner KBI - CV. BERKAH TANJAK LAKSMANA', '2019-03-24 14:55:52', 1, '10.8.0.4', 15),
(397, 'Menambah Partner', 'Menambah Partner PT. SUMBER MITRA JAYA (KBI - TIP))', '2019-03-24 14:56:19', 1, '10.8.0.4', 15),
(398, 'Menambah Partner', 'Menambah Partner PT. WAHANA ALAM INDONESIA (KBI - TIP)', '2019-03-24 14:56:41', 1, '10.8.0.4', 15),
(399, 'Menambah Partner', 'Menambah Partner PT ANUGERAH BUMI PARAHYANGAN - BANDUNG (KBI - TIP) ', '2019-03-24 14:56:59', 1, '10.8.0.4', 15),
(400, 'Menambah Partner', 'Menambah Partner CV. SUMBER ALAM BERSAMA (KBI - TIP)', '2019-03-24 14:57:17', 1, '10.8.0.4', 15),
(401, 'Memperbaharui Partner', 'Memperbaharui data Partner \"PT. Safari Putra Riau (PT.SPR)', '2019-03-24 14:58:36', 1, '10.8.0.4', 15),
(402, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190012', '2019-03-24 15:00:57', 1, '10.8.0.4', 15),
(403, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190013', '2019-03-24 15:03:59', 1, '10.8.0.4', 15),
(404, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190014', '2019-03-24 15:08:21', 1, '10.8.0.4', 15),
(405, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190015', '2019-03-24 15:10:35', 1, '10.8.0.4', 15),
(406, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190016', '2019-03-24 15:14:05', 1, '10.8.0.4', 15),
(407, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190017', '2019-03-24 15:16:07', 1, '10.8.0.4', 15),
(408, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190018', '2019-03-24 15:19:43', 1, '10.8.0.4', 15),
(409, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190019', '2019-03-24 15:22:40', 1, '10.8.0.4', 15),
(410, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190020', '2019-03-24 15:23:36', 1, '10.8.0.4', 15),
(411, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190021', '2019-03-24 15:26:33', 1, '10.8.0.4', 15),
(412, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-25 05:41:36', 1, '10.8.0.4', 1),
(413, 'Menghapus Asset', 'Menghapus Asset \"FIkti Muhaffizh\"', '2019-03-25 05:47:50', 1, '10.8.0.4', 1),
(414, 'Login', 'Evausa Login ke System', '2019-03-25 08:02:32', 1, '10.8.0.4', 15),
(415, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190022', '2019-03-25 08:06:25', 1, '10.8.0.4', 15),
(416, 'Set Saldo Awal', 'Set Saldo Awal akun 1012 menjadi 4.310.813.305', '2019-03-25 08:07:58', 1, '10.8.0.4', 15),
(417, 'Set Saldo Awal', 'Set Saldo Awal akun 1104 menjadi ', '2019-03-25 08:08:49', 1, '10.8.0.4', 15),
(418, 'Set Saldo Awal', 'Set Saldo Awal akun 1108 menjadi 3.583.720.000', '2019-03-25 08:09:35', 1, '10.8.0.4', 15),
(419, 'Set Saldo Awal', 'Set Saldo Awal akun 1513 menjadi 6.712.911.574', '2019-03-25 08:10:59', 1, '10.8.0.4', 15),
(420, 'Set Saldo Awal', 'Set Saldo Awal akun 1514 menjadi 14.113.827.245', '2019-03-25 08:12:23', 1, '10.8.0.4', 15),
(421, 'Set Saldo Awal', 'Set Saldo Awal akun 2403 menjadi 7.144.923.227', '2019-03-25 08:14:06', 1, '10.8.0.4', 15),
(422, 'Set Saldo Awal', 'Set Saldo Awal akun 2411 menjadi 18.075.000.000', '2019-03-25 08:15:04', 1, '10.8.0.4', 15),
(423, 'Set Saldo Awal', 'Set Saldo Awal akun 3002 menjadi 4.000.000.000', '2019-03-25 08:15:34', 1, '10.8.0.4', 15),
(424, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190023', '2019-03-25 08:22:50', 1, '10.8.0.4', 15),
(425, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190024', '2019-03-25 08:27:18', 1, '10.8.0.4', 15),
(426, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-25 09:09:49', 1, '10.8.0.4', 1),
(427, 'Set Saldo Awal', 'Set Saldo Awal akun 1301 menjadi 5.555.833.972', '2019-03-25 09:27:03', 1, '10.8.0.4', 15),
(428, 'Menambah Asset', 'Menambah Asset \"gedung', '2019-03-25 09:42:01', 1, '10.8.0.4', 15),
(429, 'Memperbaharui Asset', 'Memberbaharui Data Asset \"gedung', '2019-03-25 09:46:09', 1, '10.8.0.4', 15),
(430, 'Memperbaharui Asset', 'Memberbaharui Data Asset \"gedung', '2019-03-25 09:47:20', 1, '10.8.0.4', 15),
(431, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembangunan Rumah Tinggal', '2019-03-25 09:48:13', 1, '10.8.0.4', 15),
(432, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembelian Pesawat Terbang', '2019-03-25 09:49:44', 1, '10.8.0.4', 15),
(433, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-25 11:30:35', 1, '::1', 1),
(434, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-26 06:00:01', 1, '::1', 1),
(435, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-26 07:11:40', 1, '::1', 1),
(436, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembelian Mesin Baja', '2019-03-26 08:18:05', 1, '::1', 1),
(437, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Proyek Kapsulasi Jaringan', '2019-03-26 08:38:06', 1, '::1', 1),
(438, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Proyek Kapsulasi Jaringan', '2019-03-26 08:38:20', 1, '::1', 1),
(439, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Proyek Kapsulasi Jaringan', '2019-03-26 08:50:32', 1, '::1', 1),
(440, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-26 09:48:27', 1, '::1', 1),
(441, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-26 13:22:37', 1, '::1', 1),
(442, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-27 05:08:00', 1, '::1', 1),
(443, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-27 11:33:35', 1, '::1', 1),
(444, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-27 13:22:36', 1, '::1', 1),
(445, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-27 16:35:56', 1, '::1', 1),
(446, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Penutup \"CE03190001', '2019-03-27 17:05:43', 1, '::1', 1),
(447, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Penutup \"CE03190002', '2019-03-27 17:06:13', 1, '::1', 1),
(448, 'Menghapus Transaksi', 'Menghapus Transaksi \"CE03190001\"', '2019-03-27 17:07:08', 1, '::1', 1),
(449, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-27 17:25:44', 1, '::1', 1),
(450, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-28 05:42:39', 1, '::1', 1),
(451, 'Menambah Pengguna', 'Menambah pengguna \"Manajer\" sebagai Eksekutif', '2019-03-28 05:43:11', 1, '::1', 1),
(452, 'Logout', 'Fikri Muhaffizh Imani Logout dari System', '2019-03-28 05:43:47', 1, '::1', 1),
(453, 'Login', 'Manajer Login ke System', '2019-03-28 05:43:54', 1, '::1', 16),
(454, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-28 07:39:38', 1, '::1', 1),
(455, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Penutup \"CE03190003', '2019-03-28 11:17:13', 1, '::1', 1),
(456, 'Menghapus Transaksi', 'Menghapus Transaksi \"CE03190003\"', '2019-03-28 11:18:23', 1, '::1', 1),
(457, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Penutup \"CE03190003', '2019-03-28 11:18:30', 1, '::1', 1),
(458, 'Menghapus Transaksi', 'Menghapus Transaksi \"CE03190003\"', '2019-03-28 11:18:58', 1, '::1', 1),
(459, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Penutup \"CE03190003', '2019-03-28 11:24:35', 1, '::1', 1),
(460, 'Menghapus Transaksi', 'Menghapus Transaksi \"CE03190003\"', '2019-03-28 11:24:42', 1, '::1', 1),
(461, 'Close Transaksi', 'Menguci transaksi bulan $data[\"bulan\"] tahun $data[\"tahun\"]', '2019-03-28 11:59:47', 1, '::1', 1),
(462, 'Close Transaksi', 'Menguci transaksi bulan $data[\"bulan\"] tahun $data[\"tahun\"]', '2019-03-28 12:03:00', 1, '::1', 1),
(463, 'Close Transaksi', 'Menguci transaksi bulan $data[\"bulan\"] tahun $data[\"tahun\"]', '2019-03-28 12:08:15', 1, '::1', 1),
(464, 'Close Transaksi', 'Menguci transaksi bulan $data[\"bulan\"] tahun $data[\"tahun\"]', '2019-03-28 12:08:43', 1, '::1', 1),
(465, 'Close Transaksi', 'Menguci transaksi bulan $data[\"bulan\"] tahun $data[\"tahun\"]', '2019-03-28 12:10:45', 1, '::1', 1),
(466, 'Close Transaksi', 'Menguci transaksi bulan $data[\"bulan\"] tahun $data[\"tahun\"]', '2019-03-28 12:11:28', 1, '::1', 1);
INSERT INTO `log` (`log_id`, `jenis_aksi`, `keterangan`, `tgl`, `status`, `ip_addr`, `pengguna_id`) VALUES
(467, 'Close Transaksi', 'Menguci transaksi bulan $data[\"bulan\"] tahun $data[\"tahun\"]', '2019-03-28 12:24:09', 1, '::1', 1),
(468, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-28 21:35:46', 1, '127.0.0.1', 1),
(469, 'Close Transaksi', 'Menguci transaksi bulan $data[\"bulan\"] tahun $data[\"tahun\"]', '2019-03-28 22:17:09', 1, '::1', 1),
(470, 'Menambah Transaksi', 'Menambah Transaksi Bank \"CB03190025', '2019-03-28 22:50:33', 1, '::1', 1),
(471, 'Menambah Transaksi', 'Menambah Transaksi Pembelian \"PS03190001', '2019-03-28 23:32:06', 1, '::1', 1),
(472, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Koreksi \"CJ03190001', '2019-03-28 23:55:46', 1, '::1', 1),
(473, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-29 11:05:48', 1, '::1', 1),
(474, 'Menghapus Transaksi', 'Menghapus Transaksi \"CJ03190001\"', '2019-03-29 11:25:29', 1, '::1', 1),
(475, 'Menghapus Transaksi', 'Menghapus Transaksi \"PS03190001\"', '2019-03-29 11:25:33', 1, '::1', 1),
(476, 'Menghapus Transaksi', 'Menghapus Transaksi \"CB03190025\"', '2019-03-29 11:25:37', 1, '::1', 1),
(477, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190001\"', '2019-03-29 11:25:41', 1, '::1', 1),
(478, 'Menghapus Transaksi', 'Menghapus Transaksi \"CE03190002\"', '2019-03-29 11:25:45', 1, '::1', 1),
(479, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190001', '2019-03-29 11:32:16', 1, '::1', 1),
(480, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-29 15:51:59', 1, '::1', 1),
(481, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Penutup \"CE03190001', '2019-03-29 15:53:51', 1, '::1', 1),
(482, 'Menghapus Transaksi', 'Menghapus Transaksi \"CE03190001\"', '2019-03-29 15:55:35', 1, '::1', 1),
(483, 'Menambah Akun', 'Menambah Akun 3104 - Ikhtisar Laba Rugi', '2019-03-29 16:08:40', 1, '::1', 1),
(484, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190002', '2019-03-29 16:19:07', 1, '::1', 1),
(485, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190003', '2019-03-29 16:31:31', 1, '::1', 1),
(486, 'Close Transaksi', 'Menguci transaksi bulan $data[\"bulan\"] tahun $data[\"tahun\"]', '2019-03-29 16:45:59', 1, '::1', 1),
(487, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190004', '2019-03-29 16:47:32', 1, '::1', 1),
(488, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190004\"', '2019-03-29 16:47:46', 1, '::1', 1),
(489, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-30 07:25:12', 1, '::1', 1),
(490, 'Logout', 'Fikri Muhaffizh Imani Logout dari System', '2019-03-30 07:26:07', 1, '::1', 1),
(491, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-30 07:26:15', 1, '::1', 1),
(492, 'Memperbaharui Partner', 'Memperbaharui data Partner \"Rahmat Sunidar', '2019-03-30 07:51:50', 1, '::1', 1),
(493, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-31 07:01:21', 1, '::1', 1),
(494, 'Menambah Transaksi', 'Menambah Transaksi Kas \"CB03190026', '2019-03-31 07:24:49', 1, '::1', 1),
(495, 'Menambah Transaksi', 'Menambah Transaksi Pembelian \"PS03190002', '2019-03-31 07:29:48', 1, '::1', 1),
(496, 'Menambah Transaksi', 'Menambah Transaksi Penjualan \"PS03190003', '2019-03-31 09:53:17', 1, '::1', 1),
(497, 'Menambah Bank', 'Menambah Bank asd cabang asdf', '2019-03-31 11:29:41', 1, '::1', 1),
(498, 'Menghapus Bank', 'Menghapus Bank \"asd cabang asdf\"', '2019-03-31 11:30:19', 1, '::1', 1),
(499, 'Menambah Kelompok Akun', 'Menambah Kelompok 32 - sdfsdf', '2019-03-31 11:31:43', 1, '::1', 1),
(500, 'Menghapus Kelompok Akun', 'Menghapus Kelompok Akun \"32\"', '2019-03-31 11:32:21', 1, '::1', 1),
(501, 'Menambah Komponen Biaya', 'Menambah Komponen Biaya \"asdf\"', '2019-03-31 11:34:05', 1, '::1', 1),
(502, 'Menghapus Komponen Biaya', 'Menghapus Komponen Biaya \"asdf\"', '2019-03-31 11:34:09', 1, '::1', 1),
(503, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"Proyek Pembangunan Bandara', '2019-03-31 12:07:47', 1, '::1', 1),
(504, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-03-31 21:02:24', 1, '::1', 1),
(505, 'Menambah Transaksi', 'Menambah Transaksi Jurnal Umum \"JE03190004', '2019-03-31 22:38:28', 1, '::1', 1),
(506, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190004\"', '2019-03-31 22:49:29', 1, '::1', 1),
(507, 'Menghapus Transaksi', 'Menghapus Transaksi \"PS03190003\"', '2019-03-31 22:49:36', 1, '::1', 1),
(508, 'Menghapus Transaksi', 'Menghapus Transaksi \"PS03190002\"', '2019-03-31 22:49:53', 1, '::1', 1),
(509, 'Menghapus Transaksi', 'Menghapus Transaksi \"CB03190026\"', '2019-03-31 22:49:58', 1, '::1', 1),
(510, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190003\"', '2019-03-31 22:50:04', 1, '::1', 1),
(511, 'Menghapus Transaksi', 'Menghapus Transaksi \"JE03190001\"', '2019-03-31 22:56:07', 1, '::1', 1),
(512, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-01 05:50:16', 1, '::1', 1),
(513, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-01 07:54:09', 1, '::1', 1),
(514, 'Logout', 'Fikri Muhaffizh Imani Logout dari System', '2019-04-01 09:00:26', 1, '::1', 1),
(515, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-01 09:03:02', 1, '::1', 1),
(516, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-01 09:03:12', 1, '::1', 1),
(517, 'Logout', 'Fikri Muhaffizh Imani Logout dari System', '2019-04-01 12:03:54', 1, '::1', 1),
(518, 'Login', 'Evausa Login ke System', '2019-04-01 12:04:00', 1, '::1', 15),
(519, 'Logout', 'Evausa Logout dari System', '2019-04-01 12:16:13', 1, '::1', 15),
(520, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-01 12:16:19', 1, '::1', 1),
(521, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-02 05:42:17', 1, '::1', 1),
(522, 'Menambah Asset', 'Menambah Asset \"Laptop', '2019-04-02 05:42:56', 1, '::1', 1),
(523, 'Menambah Asset', 'Menambah Asset \"Laptop', '2019-04-02 05:43:04', 1, '::1', 1),
(524, 'Menghapus Asset', 'Menghapus Asset \"Laptop\"', '2019-04-02 05:43:12', 1, '::1', 1),
(525, 'Menghapus Depresiasi Asset', 'Menghapus Depresiasi Asset \"Laptop\" tahun 2019', '2019-04-02 05:46:22', 1, '::1', 1),
(526, 'Menghapus Depresiasi Asset', 'Menghapus Depresiasi Asset \"Laptop\" tahun 2019', '2019-04-02 06:08:17', 1, '::1', 1),
(527, 'Memperbaharui Asset', 'Memberbaharui Data Asset \"Laptop', '2019-04-02 06:09:16', 1, '::1', 1),
(528, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"asdfasdf', '2019-04-02 06:21:40', 1, '::1', 1),
(529, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"asdfasdf', '2019-04-02 06:22:13', 1, '::1', 1),
(530, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"asdfasdf', '2019-04-02 06:23:17', 1, '::1', 1),
(531, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-02 12:08:57', 1, '::1', 1),
(532, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"asdfasdf', '2019-04-02 12:09:15', 1, '::1', 1),
(533, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"asdfasdf', '2019-04-02 12:12:20', 1, '::1', 1),
(534, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"asdfasdf44', '2019-04-02 12:13:15', 1, '::1', 1),
(535, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"asdfasdf', '2019-04-02 12:19:57', 1, '::1', 1),
(536, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"asdfasdf', '2019-04-02 12:23:53', 1, '::1', 1),
(537, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"asdfasdf', '2019-04-02 12:25:06', 1, '::1', 1),
(538, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"asdfasdf0099', '2019-04-02 12:26:01', 1, '::1', 1),
(539, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"asdfasdf0099', '2019-04-02 14:14:34', 1, '::1', 1),
(540, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"asdfasdf0099', '2019-04-02 14:16:36', 1, '::1', 1),
(541, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"asdfasdf0099', '2019-04-02 14:16:45', 1, '::1', 1),
(542, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"asdfasdf0099', '2019-04-02 14:17:59', 1, '::1', 1),
(543, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"asdfasdf0099', '2019-04-02 14:18:22', 1, '::1', 1),
(544, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"asdfasdf0099', '2019-04-02 14:24:23', 1, '::1', 1),
(545, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembelian Mesin Baja', '2019-04-02 14:52:23', 1, '::1', 1),
(546, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembelian Mesin Baja', '2019-04-02 14:53:40', 1, '::1', 1),
(547, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembelian Beton', '2019-04-02 16:01:08', 1, '::1', 1),
(548, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-02 18:03:53', 1, '::1', 1),
(549, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"asdfasdf0099', '2019-04-02 18:10:29', 1, '::1', 1),
(550, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"asdfasdf0099', '2019-04-02 18:10:33', 1, '::1', 1),
(551, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"asdfasdf0099', '2019-04-02 18:10:38', 1, '::1', 1),
(552, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"asdfasdf0099', '2019-04-02 18:10:42', 1, '::1', 1),
(553, 'Menambah Transaksi', 'Menambah Transaksi Penjualan \"PS04190003', '2019-04-02 18:12:33', 1, '::1', 1),
(554, 'Menambah Transaksi', 'Menambah Transaksi Pembelian \"PS04190004', '2019-04-02 18:15:41', 1, '::1', 1),
(555, 'Logout', 'Fikri Muhaffizh Imani Logout dari System', '2019-04-02 22:10:44', 1, '::1', 1),
(556, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-02 22:10:50', 1, '::1', 1),
(557, 'Menghapus Depresiasi Asset', 'Menghapus Depresiasi Asset \"Laptop\" tahun 2027', '2019-04-02 22:30:57', 1, '::1', 1),
(558, 'Menghapus Proyek', 'Menghapus Proyek \"asdfas\"', '2019-04-03 00:15:39', 1, '::1', 1),
(559, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembelian Batu Bara', '2019-04-03 00:28:55', 1, '::1', 1),
(560, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembelian Batu Bara', '2019-04-03 00:32:30', 1, '::1', 1),
(561, 'Menambah Progress Proyek', 'Menambah Progress Proyek \"Pembelian Pasir', '2019-04-03 00:32:36', 1, '::1', 1),
(562, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-03 09:38:09', 1, '::1', 1),
(563, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"Pembangunan Mesjid', '2019-04-03 09:41:35', 1, '::1', 1),
(564, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-04 05:34:48', 1, '::1', 1),
(565, 'Menambah Transaksi', 'Menambah Transaksi Pembelian \"PS04190005', '2019-04-04 06:04:39', 1, '::1', 1),
(566, 'Menghapus Transaksi', 'Menghapus Transaksi \"PS04190005\"', '2019-04-04 06:06:07', 1, '::1', 1),
(567, 'Menambah Transaksi', 'Menambah Transaksi Pembelian \"PS04190006', '2019-04-04 06:09:56', 1, '::1', 1),
(568, 'Menambah Transaksi', 'Menambah Transaksi Pembelian \"PS04190007', '2019-04-04 06:12:19', 1, '::1', 1),
(569, 'Menghapus Transaksi', 'Menghapus Transaksi \"PS04190006\"', '2019-04-04 06:12:32', 1, '::1', 1),
(570, 'Menghapus Transaksi', 'Menghapus Transaksi \"PS04190007\"', '2019-04-04 06:14:12', 1, '::1', 1),
(571, 'Menambah Transaksi', 'Menambah Transaksi Pembelian \"PS04190008', '2019-04-04 06:14:17', 1, '::1', 1),
(572, 'Menghapus Transaksi', 'Menghapus Transaksi \"PS04190008\"', '2019-04-04 06:15:14', 1, '::1', 1),
(573, 'Menambah Transaksi', 'Menambah Transaksi Pembelian \"PS04190009', '2019-04-04 06:16:18', 1, '::1', 1),
(574, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-04 07:50:42', 1, '::1', 1),
(575, 'Menambah Transaksi', 'Menambah Transaksi Pembelian \"PS04190010', '2019-04-04 08:06:34', 1, '::1', 1),
(576, 'Memperbaharui Proyek', 'Memperbaharui Data Proyek \"Pembangunan Mesjid', '2019-04-04 11:29:12', 1, '::1', 1),
(577, 'Logout', 'Fikri Muhaffizh Imani Logout dari System', '2019-04-04 13:38:03', 1, '::1', 1),
(578, 'Login', 'Manajer Login ke System', '2019-04-04 13:38:15', 1, '::1', 16),
(579, 'Logout', 'Manajer Logout dari System', '2019-04-04 14:34:32', 1, '::1', 16),
(580, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-04 14:34:38', 1, '::1', 1),
(581, 'Menambah Satuan', 'Menambah Satuan \"kubik\"', '2019-04-04 14:36:46', 1, '::1', 1),
(582, 'Memperbaharui Satuan', 'Memperbaharui data Satuan \"kubik per segi\"', '2019-04-04 14:38:24', 1, '::1', 1),
(583, 'Memperbaharui Satuan', 'Memperbaharui data Satuan \"kubik persegi\"', '2019-04-04 14:38:51', 1, '::1', 1),
(584, 'Memperbaharui Satuan', 'Memperbaharui data Satuan \"kubik persegi\"', '2019-04-04 14:39:48', 1, '::1', 1),
(585, 'Memperbaharui Satuan', 'Memperbaharui data Satuan \"kubik persegi\"', '2019-04-04 14:40:20', 1, '::1', 1),
(586, 'Menghapus Satuan', 'Menghapus Satuan \"kubik persegi\"', '2019-04-04 14:42:06', 1, '::1', 1),
(587, 'Menambah Satuan', 'Menambah Satuan \"Km\"', '2019-04-04 14:42:33', 1, '::1', 1),
(588, 'Menambah Satuan', 'Menambah Satuan \"kilo\"', '2019-04-04 14:42:48', 1, '::1', 1),
(589, 'Menambah Satuan', 'Menambah Satuan \"gram\"', '2019-04-04 14:42:57', 1, '::1', 1),
(590, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-05 11:55:54', 1, '::1', 1),
(591, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-08 08:17:11', 1, '::1', 1),
(592, 'Login', 'Fikri Muhaffizh Imani Login ke System', '2019-04-08 08:20:26', 1, '::1', 1),
(593, 'Memperbaharui Pengguna', 'Memperbaharui data pengguna Mahasiswa', '2019-04-08 08:30:23', 1, '::1', 1),
(594, 'Memperbaharui Pengguna', 'Memperbaharui data pengguna Administrator', '2019-04-08 08:30:45', 1, '::1', 1),
(595, 'Memperbaharui Pengguna', 'Memperbaharui data pengguna Mahasiswa', '2019-04-08 08:32:03', 1, '::1', 1),
(596, 'Logout', 'Fikri Muhaffizh Imani Logout dari System', '2019-04-08 08:32:11', 1, '::1', 1),
(597, 'Login', 'Administrator Login ke System', '2019-04-08 08:34:06', 1, '::1', 1),
(598, 'Memperbaharui Pengguna', 'Reset password pengguna Administrator', '2019-04-08 08:34:24', 1, '::1', 1),
(599, 'Memperbaharui Pengguna', 'Reset password pengguna Administrator', '2019-04-08 08:34:42', 1, '::1', 1),
(600, 'Logout', 'Administrator Logout dari System', '2019-04-08 08:34:48', 1, '::1', 1),
(601, 'Login', 'Administrator Login ke System', '2019-04-08 08:34:54', 1, '::1', 1),
(602, 'Logout', 'Administrator Logout dari System', '2019-04-08 03:59:36', 1, '::1', 1),
(603, 'Login', 'Administrator Login ke System', '2019-04-08 03:59:46', 1, '::1', 1),
(604, 'Login', 'Administrator Login ke System', '2019-04-08 06:51:01', 1, '::1', 1),
(605, 'Login', 'Administrator Login ke System', '2019-11-14 04:39:40', 1, '::1', 1),
(606, 'Login', 'Administrator Login ke System', '2019-11-16 07:33:49', 1, '::1', 1),
(607, 'Login', 'Administrator Login ke System', '2019-11-16 07:34:01', 1, '::1', 1),
(608, 'Login', 'Administrator Login ke System', '2019-11-30 09:28:27', 1, '::1', 1),
(609, 'Login', 'Administrator Login ke System', '2019-12-07 02:08:13', 1, '::1', 1),
(610, 'Login', 'Administrator Login ke System', '2019-12-11 01:52:35', 1, '::1', 1),
(611, 'Login', 'Administrator Login ke System', '2019-12-11 04:20:43', 1, '::1', 1),
(612, 'Login', 'Administrator Login ke System', '2019-12-11 04:20:44', 1, '::1', 1),
(613, 'Menambah Pengguna', 'Menambah pengguna \"Mpiit\" sebagai Akuntan', '2019-12-11 06:06:08', 1, '::1', 1),
(614, 'Login', 'Administrator Login ke System', '2019-12-17 10:33:42', 1, '::1', 1),
(615, 'Login', 'Administrator Login ke System', '2019-12-25 10:07:50', 1, '::1', 1),
(616, 'Login', 'Administrator Login ke System', '2020-01-05 02:43:31', 1, '::1', 1),
(617, 'Login', 'Administrator Login ke System', '2020-01-14 11:43:47', 1, '::1', 1),
(618, 'Login', 'Administrator Login ke System', '2020-01-14 12:35:19', 1, '::1', 1),
(619, 'Logout', 'Administrator Logout dari System', '2020-01-14 12:35:24', 1, '::1', 1),
(620, 'Login', 'Administrator Login ke System', '2020-01-14 12:35:34', 1, '::1', 1),
(621, 'Login', 'Administrator Login ke System', '2020-01-23 05:02:00', 1, '::1', 1),
(622, 'Logout', 'Administrator Logout dari System', '2020-01-23 05:14:06', 1, '::1', 1),
(623, 'Login', 'Administrator Login ke System', '2020-01-23 05:14:11', 1, '::1', 1),
(624, 'Logout', 'Administrator Logout dari System', '2020-01-23 06:00:00', 1, '::1', 1),
(625, 'Login', 'Manajer Login ke System', '2020-01-23 06:01:01', 1, '::1', 16),
(626, 'Logout', 'Manajer Logout dari System', '2020-01-23 06:01:20', 1, '::1', 16),
(627, 'Login', 'Administrator Login ke System', '2020-01-23 06:01:25', 1, '::1', 1),
(628, 'Login', 'Administrator Login ke System', '2020-01-24 03:29:57', 1, '::1', 1),
(629, 'Login', 'Administrator Login ke System', '2020-01-25 04:44:54', 1, '::1', 1),
(630, 'Login', 'Administrator Login ke System', '2020-01-25 07:07:28', 1, '::1', 1),
(631, 'Login', 'Administrator Login ke System', '2020-01-30 02:01:32', 1, '::1', 1),
(632, 'Login', 'Administrator Login ke System', '2020-01-30 10:37:42', 1, '::1', 1),
(633, 'Login', 'Administrator Login ke System', '2020-01-30 15:45:52', 1, '::1', 1),
(634, 'Login', 'Administrator Login ke System', '2020-01-31 05:38:57', 1, '::1', 1),
(635, 'Login', 'Administrator Login ke System', '2020-02-06 02:57:28', 1, '::1', 1),
(636, 'Logout', 'Administrator Logout dari System', '2020-02-06 02:57:47', 1, '::1', 1),
(637, 'Login', 'Administrator Login ke System', '2020-02-06 03:13:43', 1, '::1', 1),
(638, 'Logout', 'Administrator Logout dari System', '2020-02-06 06:04:52', 1, '::1', 1),
(639, 'Login', 'Administrator Login ke System', '2020-02-06 06:13:30', 1, '::1', 1),
(640, 'Login', 'Administrator Login ke System', '2020-02-10 05:36:33', 1, '::1', 1),
(641, 'Logout', 'Administrator Logout dari System', '2020-02-10 07:48:04', 1, '::1', 1),
(642, 'Login', 'Administrator Login ke System', '2020-02-10 07:54:31', 1, '::1', 1),
(643, 'Logout', 'Administrator Logout dari System', '2020-02-10 07:54:38', 1, '::1', 1),
(644, 'Login', 'Administrator Login ke System', '2020-02-10 07:55:03', 1, '::1', 1),
(645, 'Logout', 'Administrator Logout dari System', '2020-02-10 07:56:48', 1, '::1', 1),
(646, 'Login', 'Administrator Login ke System', '2020-02-10 10:49:29', 1, '::1', 1),
(647, 'Login', 'Administrator Login ke System', '2020-02-10 11:12:27', 1, '::1', 1),
(648, 'Logout', 'Administrator Logout dari System', '2020-02-10 11:12:40', 1, '::1', 1),
(649, 'Login', 'Administrator Login ke System', '2020-02-10 11:13:17', 1, '::1', 1),
(650, 'Login', 'Administrator Login ke System', '2020-02-10 15:29:48', 1, '::1', 1),
(651, 'Logout', 'Administrator Logout dari System', '2020-02-10 15:29:55', 1, '::1', 1),
(652, 'Login', 'Administrator Login ke System', '2020-02-10 15:30:02', 1, '::1', 1),
(653, 'Login', 'Administrator Login ke System', '2020-02-12 04:26:45', 1, '::1', 1),
(654, 'Logout', 'Administrator Logout dari System', '2020-02-12 05:04:24', 1, '::1', 1),
(655, 'Login', 'Manajer Login ke System', '2020-02-12 05:05:46', 1, '::1', 16),
(656, 'Logout', 'Manajer Logout dari System', '2020-02-12 05:05:58', 1, '::1', 16),
(657, 'Login', 'Administrator Login ke System', '2020-02-12 05:06:04', 1, '::1', 1),
(658, 'Login', 'Administrator Login ke System', '2020-02-13 08:47:44', 1, '::1', 1),
(659, 'Login', 'Administrator Login ke System', '2020-02-17 04:58:10', 1, '::1', 1),
(660, 'Logout', 'Administrator Logout dari System', '2020-02-17 07:16:30', 1, '::1', 1),
(661, 'Login', 'Administrator Login ke System', '2020-02-17 07:16:37', 1, '::1', 1),
(662, 'Login', 'Administrator Login ke System', '2020-02-19 02:18:23', 1, '::1', 1),
(663, 'Login', 'Administrator Login ke System', '2020-02-19 02:28:06', 1, '::1', 1),
(664, 'Login', 'Administrator Login ke System', '2020-02-19 05:55:36', 1, '::1', 1),
(665, 'Logout', 'Administrator Logout dari System', '2020-02-19 08:02:34', 1, '::1', 1),
(666, 'Login', 'Administrator Login ke System', '2020-02-19 08:03:34', 1, '::1', 1),
(667, 'Logout', 'Administrator Logout dari System', '2020-02-19 08:11:17', 1, '::1', 1),
(668, 'Login', 'Administrator Login ke System', '2020-02-19 08:13:05', 1, '::1', 1),
(669, 'Logout', 'Administrator Logout dari System', '2020-02-19 08:42:21', 1, '::1', 1),
(670, 'Login', 'Administrator Login ke System', '2020-02-19 08:42:32', 1, '::1', 1),
(671, 'Login', 'Administrator Login ke System', '2020-02-27 09:09:06', 1, '::1', 1),
(672, 'Login', 'Administrator Login ke System', '2020-03-02 10:54:38', 1, '::1', 1),
(673, 'Login', 'Administrator Login ke System', '2020-03-02 10:54:38', 1, '::1', 1),
(674, 'Login', 'Administrator Login ke System', '2020-03-02 10:54:39', 1, '::1', 1),
(675, 'Login', 'Administrator Login ke System', '2020-03-05 06:41:25', 1, '::1', 1),
(676, 'Login', 'Administrator Login ke System', '2020-03-06 09:31:49', 1, '::1', 1),
(677, 'Login', 'Administrator Login ke System', '2020-03-06 11:47:21', 1, '::1', 1),
(678, 'Login', 'Administrator Login ke System', '2020-03-13 09:06:45', 1, '::1', 1),
(679, 'Logout', 'Administrator Logout dari System', '2020-03-13 09:10:18', 1, '::1', 1),
(680, 'Login', 'Administrator Login ke System', '2020-03-30 06:57:05', 1, '::1', 1),
(681, 'Login', 'Administrator Login ke System', '2020-04-16 06:20:29', 1, '::1', 1),
(682, 'Login', 'Administrator Login ke System', '2020-05-12 11:10:56', 1, '::1', 1),
(683, 'Logout', 'Administrator Logout dari System', '2020-05-12 11:11:14', 1, '::1', 1),
(684, 'Logout', 'Administrator Logout dari System', '2020-06-19 11:48:45', 1, '::1', 1),
(685, 'Login', 'Administrator Login ke System', '2020-06-21 17:00:52', 1, '::1', 1),
(686, 'Login', 'Administrator Login ke System', '2020-07-18 06:25:00', 1, '::1', 1),
(687, 'Login', 'Administrator Login ke System', '2020-07-28 12:56:24', 1, '::1', 1),
(688, 'Login', 'Administrator Login ke System', '2020-07-29 13:31:56', 1, '::1', 1),
(689, 'Logout', 'Administrator Logout dari System', '2020-07-29 13:34:00', 1, '::1', 1),
(690, 'Login', 'Administrator Login ke System', '2020-08-01 08:30:46', 1, '::1', 1),
(691, 'Login', 'Administrator Login ke System', '2020-08-24 05:20:00', 1, '::1', 1),
(692, 'Login', 'Administrator Login ke System', '2020-08-24 05:20:01', 1, '::1', 1),
(693, 'Login', 'Administrator Login ke System', '2020-09-01 04:50:37', 1, '::1', 1),
(694, 'Login', 'Administrator Login ke System', '2020-09-03 07:48:20', 1, '::1', 1),
(695, 'Login', 'Administrator Login ke System', '2020-09-03 09:51:25', 1, '::1', 1),
(696, 'Login', 'Administrator Login ke System', '2020-09-15 06:24:40', 1, '::1', 1),
(697, 'Login', 'Administrator Login ke System', '2020-09-15 06:24:41', 1, '::1', 1),
(698, 'Login', 'Administrator Login ke System', '2020-09-16 08:09:35', 1, '::1', 1),
(699, 'Login', 'Administrator Login ke System', '2020-09-26 04:28:01', 1, '::1', 1),
(700, 'Login', 'Administrator Login ke System', '2020-09-27 05:50:40', 1, '::1', 1),
(701, 'Login', 'Administrator Login ke System', '2020-09-27 09:33:36', 1, '::1', 1),
(702, 'Login', 'Administrator Login ke System', '2020-09-28 06:14:00', 1, '::1', 1),
(703, 'Logout', 'Administrator Logout dari System', '2020-09-28 06:18:03', 1, '::1', 1),
(704, 'Login', 'Administrator Login ke System', '2020-09-28 06:53:04', 1, '::1', 1),
(705, 'Login', 'Administrator Login ke System', '2020-10-26 04:27:13', 1, '::1', 1),
(706, 'Login', 'Administrator Login ke System', '2020-10-26 09:24:15', 1, '::1', 1),
(707, 'Login', 'Administrator Login ke System', '2020-12-16 15:36:44', 1, '::1', 1),
(708, 'Login', 'Administrator Login ke System', '2020-12-22 06:07:17', 1, '::1', 1),
(709, 'Login', 'Administrator Login ke System', '2021-01-19 01:54:11', 1, '::1', 1),
(710, 'Login', 'Administrator Login ke System', '2021-01-19 03:08:23', 1, '::1', 1),
(711, 'Login', 'Administrator Login ke System', '2021-01-20 08:00:28', 1, '::1', 1),
(712, 'Logout', 'Administrator Logout dari System', '2021-01-20 11:59:14', 1, '::1', 1),
(713, 'Login', 'Administrator Login ke System', '2021-01-20 11:59:22', 1, '::1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_dosen` int(11) NOT NULL,
  `id_prodi` varchar(50) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `dosen inisial` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `id_matakuliah` int(11) NOT NULL,
  `matakuliah` varchar(50) NOT NULL,
  `sks` int(11) NOT NULL,
  `jam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`id_matakuliah`, `matakuliah`, `sks`, `jam`) VALUES
(1, 'IT Strategic Planning', 2, 2),
(2, 'Jaringan Multimedia', 2, 3),
(3, 'Sistem Informasi Geografis', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `pengguna_id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`pengguna_id`, `nama`, `email`, `username`, `password`, `level`, `status`) VALUES
(1, 'Administrator', 'admin@gmail.com', 'admin', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', 'Administrator', 1),
(15, 'Mahasiswa', 'mahs@pcr.ac.id', 'akuntan', 'f84cd25d5a6fcce1047173b3acbce7f7f6d74e53dc3a1dc1b67f59a30aabd3ef4e2183fbf53825ab06cbdfd86081072d81fde55d846fa72329fcd25d43999020', 'Akuntan', 1),
(16, 'Manajer', 'manajer@gmail.com', 'manajer', '933c4ce877d76193724436df5238905ac5f7e66ff500175ba4adba38118d1925bcfd4bfe693b3c1747c227710ddda8d2279b116bae0574e5f613d71d4979362b', 'Eksekutif', 1),
(17, 'Mpiit', 'Mpiit@gmail.com', 'Mpiiit', '338deada7d9c5027bb1948c32eff9464d27c9fdc2f698dad4a3537ea3555773f4b06f61a114bb126022bd2af83aa54ea3fb290052da131cf06d9dbb3ec21b7f5', 'Akuntan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` int(11) NOT NULL,
  `nama_prodi` varchar(50) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `id_kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `nama_prodi`, `jurusan`, `id_kelas`) VALUES
(1, 'Teknik Informatika', 'Teknologi Informasi', 0),
(2, 'Sistem Informasi', 'Teknologi Informasi', 0),
(3, 'Teknik Listrik', '-', 0),
(4, 'Teknik Mekatronika', 'Teknologi Industri', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `id_ruangan` int(11) NOT NULL,
  `nama_ruangan` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`id_ruangan`, `nama_ruangan`, `keterangan`) VALUES
(1, 'R.118', 'Kosong'),
(2, 'R.119', 'Kosong'),
(3, 'R.126', 'kosong'),
(4, 'R.211', 'Kosong');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `berita1`
--
ALTER TABLE `berita1`
  ADD PRIMARY KEY (`id_berita`),
  ADD KEY `pengguna_id` (`pengguna_id`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`);

--
-- Indexes for table `ganti`
--
ALTER TABLE `ganti`
  ADD PRIMARY KEY (`id_ganti`);

--
-- Indexes for table `hari`
--
ALTER TABLE `hari`
  ADD PRIMARY KEY (`id_hari`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indexes for table `jadwal1`
--
ALTER TABLE `jadwal1`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indexes for table `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`id_jam`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `fk_log_pengguna1_idx` (`pengguna_id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_dosen`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`id_matakuliah`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`pengguna_id`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `berita1`
--
ALTER TABLE `berita1`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ganti`
--
ALTER TABLE `ganti`
  MODIFY `id_ganti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hari`
--
ALTER TABLE `hari`
  MODIFY `id_hari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=714;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `pengguna_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id_ruangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `fk_log_pengguna1` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`pengguna_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
