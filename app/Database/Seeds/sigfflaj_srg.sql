-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 25, 2020 at 02:23 PM
-- Server version: 5.6.47
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbsigfllaj_srg`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_laporan`
--

CREATE TABLE `app_laporan` (
  `id` int(11) NOT NULL,
  `id_entitas_proses` tinyint(4) DEFAULT '0',
  `icon` varchar(50) DEFAULT NULL,
  `uraian` varchar(50) DEFAULT NULL,
  `form_file` varchar(100) DEFAULT NULL COMMENT 'file form lap',
  `page_file` varchar(50) DEFAULT NULL COMMENT 'file preview lap',
  `description` varchar(100) DEFAULT '',
  `ordering` int(11) DEFAULT '0',
  `status_aktif` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_laporan`
--

INSERT INTO `app_laporan` (`id`, `id_entitas_proses`, `icon`, `uraian`, `form_file`, `page_file`, `description`, `ordering`, `status_aktif`) VALUES
(1, 0, NULL, 'Data Sarana', 'frm_sarana', 'rekap_sarana', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `crb_users`
--

CREATE TABLE `crb_users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(25) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `status_aktif` tinyint(1) NOT NULL DEFAULT '1',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_skpd` int(11) DEFAULT NULL,
  `id_bidang` int(11) DEFAULT NULL COMMENT 'khusus usertype bidang (bappeda)'
);

--
-- Dumping data for table `crb_users`
--

INSERT INTO `crb_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `status_aktif`, `registerDate`, `lastvisitDate`, `id_skpd`, `id_bidang`) VALUES
(1, 'Iid Anwar Hidayat', 'asani75', 'iid@cirebonkota.go.id', '78ec3d3f660112200a9cdb9bf2f4d2a7', 'master', 1, '2014-03-06 00:00:00', '0000-00-00 00:00:00', NULL, NULL),
(4, 'Administrator', 'admin', '', '21232f297a57a5a743894a0e4a801fc3', 'master', 1, '2014-05-10 04:12:35', '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gis_menu`
--

CREATE TABLE `gis_menu` (
  `id` int(11) NOT NULL,
  `id_parent` int(11) DEFAULT '0',
  `icon` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `target` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT NULL,
  `ordering` int(11) DEFAULT '0',
  `status_aktif` tinyint(1) DEFAULT '1'
);

--
-- Dumping data for table `gis_menu`
--

INSERT INTO `gis_menu` (`id`, `id_parent`, `icon`, `title`, `url`, `target`, `description`, `type`, `ordering`, `status_aktif`) VALUES
(1, 0, 'fa-home', 'Beranda', 'main.html', NULL, '', NULL, 1, 1),
(2, 0, 'fa-map-signs', 'Data Sarana', 'datasarana.html', NULL, '', NULL, 2, 1),
(3, 0, 'fa-list', 'Data Referensi', '#', NULL, '', NULL, 3, 1),
(4, 3, 'fa-cubes', 'Jenis Sarana', 'data/jensarana.html', NULL, '', NULL, 1, 1),
(5, 3, 'fa-road', 'Data Jalan', 'data/datajalan.html', NULL, '', NULL, 2, 1),
(6, 3, 'fa-adjust', 'Jenis Traffic Light', 'data/jenistraffic.html', NULL, '', NULL, 3, 1),
(7, 3, 'fa-map-signs', 'Jenis Marka', 'data/jenismarka.html', NULL, '', NULL, 4, 1),
(8, 3, 'fa-magic', 'Bahan Marka', 'data/bahanmarka.html', NULL, '', NULL, 5, 1),
(9, 0, 'fa-print', 'Laporan', 'laporan.html', NULL, '', NULL, 4, 1),
(10, 0, 'fa-cog', 'Pengaturan', NULL, NULL, '', NULL, 5, 1),
(11, 10, 'fa-pencil', 'Tandatangan', 'data/tandatangan.html', NULL, '', NULL, 2, 1),
(12, 10, 'fa-users', 'Pengguna', 'pengguna.html', NULL, '', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gis_sessions`
--

CREATE TABLE `gis_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
);

--
-- Table structure for table `gis_users_menu`
--

CREATE TABLE `gis_users_menu` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `list_menu` text,
  `date_entry` datetime DEFAULT '0000-00-00 00:00:00',
  `date_update` datetime DEFAULT '0000-00-00 00:00:00',
  `user_entry` varchar(50) DEFAULT '',
  `user_update` varchar(50) DEFAULT ''
);

-- --------------------------------------------------------

--
-- Table structure for table `mst_sarana`
--

CREATE TABLE `mst_sarana` (
  `id` int(11) NOT NULL,
  `id_jenis_sarana` int(11) DEFAULT '0',
  `id_jalan` int(11) DEFAULT '0',
  `tahun_pengadaan` year(4) DEFAULT '0000',
  `sumber_dana` varchar(100) DEFAULT '',
  `nomor_inv` text,
  `f1` varchar(255) DEFAULT '',
  `f2` int(11) DEFAULT '0',
  `f3` int(11) DEFAULT '0',
  `f4` int(11) DEFAULT '0',
  `f5` int(11) DEFAULT '0',
  `f6` int(11) DEFAULT '0',
  `f7` int(11) DEFAULT '0',
  `f8` int(11) DEFAULT '0',
  `f9` int(11) DEFAULT '0',
  `f10` varchar(255) DEFAULT '',
  `f11` varchar(100) DEFAULT '',
  `f12` varchar(100) DEFAULT '',
  `f13` varchar(100) DEFAULT '',
  `f14` varchar(100) DEFAULT '',
  `keterangan` text,
  `lat` varchar(30) DEFAULT '',
  `lng` varchar(30) DEFAULT '',
  `latlng` text COMMENT 'if marktype=1 garis',
  `marktype` tinyint(1) DEFAULT '0' COMMENT '0:marker 1:polyline',
  `id_klas_jalan` int(11) DEFAULT NULL,
  `url_foto` text,
  `kondisi` tinyint(1) DEFAULT '0' COMMENT '1:baik 2:rusak 3:tdk ditemukan',
  `status_data` tinyint(1) DEFAULT '0' COMMENT '1:existing 2:rencana 3:dihapus',
  `status_aktif` tinyint(1) DEFAULT '0',
  `date_entry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime DEFAULT '0000-00-00 00:00:00',
  `user_entry` varchar(50) DEFAULT '',
  `user_update` varchar(50) DEFAULT ''
);

--
-- Dumping data for table `mst_sarana`
--

CREATE TABLE `mst_sarana_trash` (
  `id` int(11) NOT NULL DEFAULT '0',
  `id_jenis_sarana` int(11) DEFAULT '0',
  `id_jalan` int(11) DEFAULT '0',
  `tahun_pengadaan` year(4) DEFAULT '0000',
  `sumber_dana` varchar(100) DEFAULT '',
  `nomor_inv` text,
  `f1` varchar(255) DEFAULT '',
  `f2` int(11) DEFAULT '0',
  `f3` int(11) DEFAULT '0',
  `f4` int(11) DEFAULT '0',
  `f5` int(11) DEFAULT '0',
  `f6` int(11) DEFAULT '0',
  `f7` int(11) DEFAULT '0',
  `f8` int(11) DEFAULT '0',
  `f9` int(11) DEFAULT '0',
  `f10` varchar(255) DEFAULT '',
  `f11` varchar(100) DEFAULT '',
  `f12` varchar(100) DEFAULT '',
  `f13` varchar(100) DEFAULT '',
  `f14` varchar(100) DEFAULT '',
  `keterangan` text,
  `lat` varchar(30) DEFAULT '',
  `lng` varchar(30) DEFAULT '',
  `latlng` text COMMENT 'if marktype=1 garis',
  `marktype` tinyint(1) DEFAULT '0' COMMENT '0:marker 1:polyline',
  `url_foto` text,
  `kondisi` tinyint(1) DEFAULT '0' COMMENT '1:baik 2:rusak 3:tdk ditemukan',
  `status_data` tinyint(1) DEFAULT '0' COMMENT '1:existing 2:rencana 3:dihapus',
  `status_aktif` tinyint(1) DEFAULT '0',
  `date_entry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime DEFAULT '0000-00-00 00:00:00',
  `user_entry` varchar(50) DEFAULT '',
  `user_update` varchar(50) DEFAULT ''
);

-- --------------------------------------------------------

--
-- Table structure for table `ref_bahan_marka`
--

CREATE TABLE `ref_bahan_marka` (
  `id` int(11) NOT NULL,
  `uraian` varchar(100) DEFAULT NULL,
  `status_aktif` tinyint(1) DEFAULT '0',
  `user_entry` varchar(30) DEFAULT NULL,
  `date_entry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(30) DEFAULT NULL,
  `date_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);

--
-- Dumping data for table `ref_bahan_marka`
--

INSERT INTO `ref_bahan_marka` (`id`, `uraian`, `status_aktif`, `user_entry`, `date_entry`, `user_update`, `date_update`) VALUES
(1, 'Thermoplastic', 1, 'asani75', '2016-11-27 03:40:53', NULL, '0000-00-00 00:00:00'),
(2, 'Coldplastic', 1, 'asani75', '2016-11-27 03:41:25', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ref_jalan`
--

CREATE TABLE `ref_jalan` (
  `id` int(11) NOT NULL,
  `id_kecamatan` int(11) DEFAULT '0',
  `uraian` varchar(100) DEFAULT '',
  `status_aktif` tinyint(1) DEFAULT '0',
  `user_entry` varchar(30) DEFAULT NULL,
  `date_entry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(30) DEFAULT NULL,
  `date_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `ref_jalan` (`id`, `id_kecamatan`, `uraian`, `status_aktif`, `user_entry`, `date_entry`, `user_update`, `date_update`) VALUES
(1, 5, 'Diponegoro', 1, 'asani75', '2016-11-26 10:35:40', '197112241995031001', '2019-09-26 05:35:17');

CREATE TABLE `ref_jenis_marka` (
  `id` int(11) NOT NULL,
  `uraian` varchar(100) DEFAULT NULL,
  `status_aktif` tinyint(1) DEFAULT '0',
  `user_entry` varchar(30) DEFAULT NULL,
  `date_entry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(30) DEFAULT NULL,
  `date_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);

--
-- Dumping data for table `ref_jenis_marka`
--

INSERT INTO `ref_jenis_marka` (`id`, `uraian`, `status_aktif`, `user_entry`, `date_entry`, `user_update`, `date_update`) VALUES
(1, 'Zebra Cross', 1, 'asani75', '2016-11-27 03:24:45', 'asani75', '2016-11-26 21:25:09'),
(2, 'Jalur Sepeda', 1, 'asani75', '2016-11-27 03:25:23', NULL, '0000-00-00 00:00:00'),
(3, 'ZOSS', 1, 'asani75', '2016-11-27 03:25:31', NULL, '0000-00-00 00:00:00'),
(4, 'Membujur', 1, 'asani75', '2016-11-27 03:25:43', NULL, '0000-00-00 00:00:00'),
(5, 'Melintang', 1, 'asani75', '2016-11-27 03:25:49', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ref_jenis_sarana`
--

CREATE TABLE `ref_jenis_sarana` (
  `id` int(11) NOT NULL,
  `uraian` varchar(100) DEFAULT NULL,
  `singkat` varchar(20) DEFAULT NULL,
  `params` text,
  `status_aktif` tinyint(1) DEFAULT '0',
  `icon` varchar(20) DEFAULT 'marker.png',
  `user_entry` varchar(30) DEFAULT NULL,
  `date_entry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(30) DEFAULT NULL,
  `date_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);

--
-- Dumping data for table `ref_jenis_sarana`
--

INSERT INTO `ref_jenis_sarana` (`id`, `uraian`, `singkat`, `params`, `status_aktif`, `icon`, `user_entry`, `date_entry`, `user_update`, `date_update`) VALUES
(1, 'Rambu Lalu Lintas', 'rambu_lalin', 'f1:Nama Barang#,f10:Jenis#,f2:Ukuran#,Jumlah#', 1, 'rambu.png', 'asani75', '2016-09-04 04:20:10', '197112241995031001', '2019-09-24 16:29:50'),
(2, 'RPPJ', 'rppj', 'f2:Daun#m2,f4:Tinggi Tiang#m', 1, 'rppj.png', 'asani75', '2016-10-23 05:25:51', NULL, '0000-00-00 00:00:00'),
(3, 'Marka Jalan', 'marka_jalan', 'f2:Jenis Marka#,f3:Jenis Bahan#,f4:Volume#m2', 1, 'marka.png', 'asani75', '2016-10-23 05:25:58', NULL, '0000-00-00 00:00:00'),
(4, 'Pagar Pengaman', 'pagar_pengaman', 'f2:Panjang#m', 1, 'pagar.png', 'asani75', '2016-10-23 05:26:09', NULL, '0000-00-00 00:00:00'),
(5, 'Traffic Light', 'traffic_light', 'f2:Jenis#,f3:Tiang Overhead#buah,f4:Tiang Lurus#buah,f5:Controller#unit,f6:Lampu 3 aspek 30 cm#buah,f7:Lampu 2 aspek 20 cm#buah,f8:Lampu Pejalan Kaki#buah,f9:Count Down/VMS#buah', 1, 'traffic.png', 'asani75', '2016-10-23 05:26:21', NULL, '0000-00-00 00:00:00'),
(6, 'Warning Light', 'warning_light', 'f2:Jenis#,f3:Tiang Overhead#buah,f4:Tiang Lurus#buah,f5:Lampu 2 Aspek 20 cm#buah,f6:Lampu 2 Aspek 30 cm#buah,f7:Controller#unit', 1, 'warning.png', 'asani75', '2016-10-23 05:26:30', NULL, '0000-00-00 00:00:00'),
(7, 'Deliniator', 'deliniator', 'f1:Nama Barang#,f10:Jenis#,f2:Ukuran#,Jumlah#', 1, 'lainnya.png', 'asani75', '2016-10-23 05:26:35', '197112241995031001', '2019-09-30 18:49:40'),
(8, 'Lainnya', 'lainnya', 'f1:Nama Barang#,f10:Jenis#,f2:Ukuran#,Jumlah#', 0, '201612100340331.png', 'asani75', '2016-12-09 13:13:38', '197112241995031001', '2019-09-30 18:49:08'),
(9, 'Cermin Tikungan', 'cermin_tikungan', 'f1:Nama Barang#,f10:Jenis#,f2:Ukuran#,Jumlah#', 0, 'marker.png', 'asani75', '2016-12-09 15:34:02', '197112241995031001', '2019-09-24 21:14:46'),
(10, 'PJU', 'pju', 'f1:Nama Barang#,f10:Jenis#,f2:Ukuran#,Jumlah#', 1, 'marker.png', '197112241995031001', '2019-09-25 02:24:56', '197112241995031001', '2019-09-26 23:04:37'),
(11, 'Lainnya', 'lainnya', 'f1:Nama Barang#,f10:Jenis#,f2:Ukuran#,Jumlah#', 0, 'marker.png', '197112241995031001', '2019-09-25 04:18:56', '197112241995031001', '2019-09-30 18:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `ref_jenis_traffic_light`
--

CREATE TABLE `ref_jenis_traffic_light` (
  `id` int(11) NOT NULL,
  `uraian` varchar(100) DEFAULT NULL,
  `status_aktif` tinyint(1) DEFAULT '0',
  `user_entry` varchar(30) DEFAULT NULL,
  `date_entry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(30) DEFAULT NULL,
  `date_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);

--
-- Dumping data for table `ref_jenis_traffic_light`
--

INSERT INTO `ref_jenis_traffic_light` (`id`, `uraian`, `status_aktif`, `user_entry`, `date_entry`, `user_update`, `date_update`) VALUES
(1, 'PLN', 1, 'asani75', '2016-11-26 10:50:37', 'asani75', '2016-11-26 04:51:07'),
(2, 'Tenaga Surya', 1, 'asani75', '2016-11-28 14:42:22', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ref_kecamatan`
--

CREATE TABLE `ref_kecamatan` (
  `id` int(11) NOT NULL,
  `kode` varchar(15) DEFAULT '',
  `uraian` varchar(100) DEFAULT ''
);

--
-- Dumping data for table `ref_kecamatan`
--

INSERT INTO `ref_kecamatan` (`id`, `kode`, `uraian`) VALUES
(1, '3274010', 'Harjamukti'),
(2, '3274020', 'Lemahwungkuk'),
(3, '3274030', 'Pekalipan'),
(4, '3274040', 'Kesambi'),
(5, '3274050', 'Kejaksan');

-- --------------------------------------------------------

--
-- Table structure for table `ref_klas_jalan`
--

CREATE TABLE `ref_klas_jalan` (
  `id` int(11) NOT NULL,
  `uraian` varchar(100) DEFAULT NULL,
  `warna` varchar(50) DEFAULT NULL,
  `status_aktif` tinyint(1) DEFAULT '0',
  `user_entry` varchar(30) DEFAULT NULL,
  `date_entry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(30) DEFAULT NULL,
  `date_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);

--
-- Dumping data for table `ref_klas_jalan`
--

INSERT INTO `ref_klas_jalan` (`id`, `uraian`, `warna`, `status_aktif`, `user_entry`, `date_entry`, `user_update`, `date_update`) VALUES
(1, 'Jalan Nasional', '#F50057', 1, NULL, '2019-01-09 08:12:03', NULL, '0000-00-00 00:00:00'),
(2, 'Jalan Provinsi', '#AA00FF', 1, NULL, '2019-01-09 08:12:10', NULL, '0000-00-00 00:00:00'),
(3, 'Jalan Kota', '#EF6C00', 1, NULL, '2019-01-09 08:12:15', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ref_ttd`
--

CREATE TABLE `ref_ttd` (
  `id` int(11) NOT NULL,
  `eselon` tinyint(1) DEFAULT '0' COMMENT '2:kadis, 3:kabid, 4:kasi',
  `nama` varchar(100) DEFAULT '',
  `nip` varchar(30) DEFAULT '',
  `pangkat` varchar(50) DEFAULT '',
  `jabatan` varchar(255) DEFAULT '',
  `tanggal` varchar(50) DEFAULT '',
  `status_aktif` tinyint(1) DEFAULT '0',
  `date_entry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_entry` varchar(50) DEFAULT NULL,
  `user_update` varchar(50) DEFAULT NULL
);

--
-- Dumping data for table `ref_ttd`
--

INSERT INTO `ref_ttd` (`id`, `eselon`, `nama`, `nip`, `pangkat`, `jabatan`, `tanggal`, `status_aktif`, `date_entry`, `date_update`, `user_entry`, `user_update`) VALUES
(1, 2, 'KEPALA DINAS.', '19660722 199301 1 001', 'Pembina Utama Muda', 'KEPALA DINAS PERHUBUNGAN KOTA SERANG', '', 1, '2015-12-05 04:42:17', '2019-09-28 03:24:46', NULL, '197112241995031001'),
(2, 3, 'KEPALA BIDANG', '19680522 199203 1 002', 'Pembina', 'KEPALA BIDANG LALU LINTAS', '', 1, '2016-11-29 16:40:10', '2018-12-27 05:46:10', 'asani75', '197504022009011001'),
(3, 4, 'KEPALA SEKSI', '19780619 200012 1 002', 'Penata Tk.I', 'KEPALA SEKSI REKAYASA LALU LINTAS', '', 1, '2016-11-29 16:44:02', '2019-09-28 03:27:23', 'asani75', '197112241995031001');

-- --------------------------------------------------------

--
-- Table structure for table `sys_users`
--

CREATE TABLE `sys_users` (
  `id` int(11) NOT NULL,
  `username` varchar(18) NOT NULL DEFAULT '' COMMENT 'nip atau email',
  `level` varchar(25) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `status_pns` tinyint(1) DEFAULT '0' COMMENT '0 non pns, 1 pns',
  `status_aktif` tinyint(1) NOT NULL DEFAULT '1',
  `first_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
);

--
-- Dumping data for table `sys_users`
--

INSERT INTO `sys_users` (`id`, `username`, `level`, `password`, `status_pns`, `status_aktif`, `first_login`, `last_login`) VALUES
(1, '197504022009011001', '9', '', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'asani75@yahoo.com', '2', '78ec3d3f660112200a9cdb9bf2f4d2a7', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '196805221992031002', '9', '', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '197112241995031001', '9', '', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sys_user_level`
--

CREATE TABLE `sys_user_level` (
  `id` int(1) NOT NULL,
  `uraian` varchar(50) DEFAULT NULL
);

--
-- Dumping data for table `sys_user_level`
--

INSERT INTO `sys_user_level` (`id`, `uraian`) VALUES
(1, 'Operator SKPD'),
(2, 'Admin SKPD'),
(3, 'Pengolah Data'),
(4, 'Pengawas'),
(9, 'Administrator');


ALTER TABLE `app_laporan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordering` (`ordering`),
  ADD KEY `id_parent` (`id_entitas_proses`),
  ADD KEY `status_aktif` (`status_aktif`);

--
-- Indexes for table `crb_users`
--
ALTER TABLE `crb_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `NewIndex1` (`username`),
  ADD KEY `usertype` (`usertype`),
  ADD KEY `idx_name` (`name`),
  ADD KEY `id_skpd` (`id_skpd`);

--
-- Indexes for table `gis_menu`
--
ALTER TABLE `gis_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordering` (`ordering`),
  ADD KEY `id_parent` (`id_parent`),
  ADD KEY `status_aktif` (`status_aktif`);

--
-- Indexes for table `gis_sessions`
--
ALTER TABLE `gis_sessions`
  ADD PRIMARY KEY (`id`,`ip_address`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `gis_users_menu`
--
ALTER TABLE `gis_users_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- Indexes for table `mst_sarana`
--
ALTER TABLE `mst_sarana`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jalan` (`id_jenis_sarana`),
  ADD KEY `id_lokasi` (`lat`);

--
-- Indexes for table `ref_bahan_marka`
--
ALTER TABLE `ref_bahan_marka`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_jalan`
--
ALTER TABLE `ref_jalan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_jenis_marka`
--
ALTER TABLE `ref_jenis_marka`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_jenis_sarana`
--
ALTER TABLE `ref_jenis_sarana`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_jenis_traffic_light`
--
ALTER TABLE `ref_jenis_traffic_light`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_kecamatan`
--
ALTER TABLE `ref_kecamatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_klas_jalan`
--
ALTER TABLE `ref_klas_jalan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_ttd`
--
ALTER TABLE `ref_ttd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_users`
--
ALTER TABLE `sys_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `useridx` (`username`);

--
-- Indexes for table `sys_user_level`
--
ALTER TABLE `sys_user_level`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `app_laporan`
--
ALTER TABLE `app_laporan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `crb_users`
--
ALTER TABLE `crb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gis_menu`
--
ALTER TABLE `gis_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `gis_users_menu`
--
ALTER TABLE `gis_users_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mst_sarana`
--
ALTER TABLE `mst_sarana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `ref_bahan_marka`
--
ALTER TABLE `ref_bahan_marka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ref_jalan`
--
ALTER TABLE `ref_jalan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `ref_jenis_marka`
--
ALTER TABLE `ref_jenis_marka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ref_jenis_sarana`
--
ALTER TABLE `ref_jenis_sarana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ref_jenis_traffic_light`
--
ALTER TABLE `ref_jenis_traffic_light`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ref_kecamatan`
--
ALTER TABLE `ref_kecamatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ref_klas_jalan`
--
ALTER TABLE `ref_klas_jalan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ref_ttd`
--
ALTER TABLE `ref_ttd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sys_users`
--
ALTER TABLE `sys_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

