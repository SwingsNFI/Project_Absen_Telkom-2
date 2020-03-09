-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2020 at 09:20 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_absensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_absen`
--

CREATE TABLE `tbl_absen` (
  `id_absen` int(10) UNSIGNED NOT NULL,
  `id_acara` varchar(10) NOT NULL,
  `id_siswa` varchar(10) NOT NULL,
  `waktu_absensi` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_absensi_ami`
--

CREATE TABLE `tbl_absensi_ami` (
  `id_absensi_ami` int(10) UNSIGNED NOT NULL,
  `id_acara` varchar(10) NOT NULL,
  `id_siswa` varchar(10) NOT NULL,
  `kehadiran` tinyint(1) NOT NULL,
  `kerapihan` tinyint(1) NOT NULL,
  `kebersihan` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_acara`
--

CREATE TABLE `tbl_acara` (
  `id_acara` varchar(10) NOT NULL,
  `id_nama_acara` varchar(10) NOT NULL,
  `waktu_acara` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_akses`
--

CREATE TABLE `tbl_akses` (
  `id_akses` int(5) NOT NULL,
  `hak_akses` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_guru`
--

CREATE TABLE `tbl_guru` (
  `id_guru` varchar(10) NOT NULL,
  `id_akses` int(5) NOT NULL,
  `nama_guru` varchar(50) NOT NULL,
  `email_guru` varchar(40) NOT NULL,
  `password_guru` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id_kategori` varchar(10) NOT NULL,
  `nama_kategori` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id_kategori`, `nama_kategori`) VALUES
('1', 'religius'),
('2', 'disiplin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `id_kelas` varchar(10) NOT NULL,
  `nama_kelas` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`id_kelas`, `nama_kelas`) VALUES
('X1', 'X Tel 1'),
('X10', 'X Tel 10'),
('X11', 'X Tel 11'),
('X12', 'X Tel 12'),
('X13', 'X Tel 13'),
('X2', 'X Tel 2'),
('X3', 'X Tel 3'),
('X4', 'X Tel 4'),
('X5', 'X Tel 5'),
('X6', 'X Tel 6'),
('X7', 'X Tel 7'),
('X8', 'X Tel 8'),
('X9', 'X Tel 9');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nama_acara`
--

CREATE TABLE `tbl_nama_acara` (
  `id_nama_acara` varchar(10) NOT NULL,
  `id_kategori` varchar(10) NOT NULL,
  `nama_acara` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `id_siswa` varchar(10) NOT NULL,
  `id_kelas` varchar(10) NOT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `email_siswa` varchar(40) NOT NULL,
  `password_siswa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`id_siswa`, `id_kelas`, `nama_siswa`, `email_siswa`, `password_siswa`) VALUES
('20181', 'X1', 'Emma', 'Emma@gmail.com', 'oiuqirmhjc'),
('201810', 'X1', 'Evelyn', 'Evelyn@gmail.com', 'hjlniuaeca'),
('2018100', 'X2', 'Skylar', 'Skylar@gmail.com', 'tvohabtrse'),
('2018101', 'X3', 'Emma', 'Emma@gmail.com', 'xljkotejlt'),
('2018102', 'X3', 'Olivia', 'Olivia@gmail.com', 'bydsffxrga'),
('2018103', 'X3', 'Ava', 'Ava@gmail.com', 'usnflhkvnk'),
('2018104', 'X3', 'Isabella', 'Isabella@gmail.com', 'tvhqiofuhj'),
('2018105', 'X3', 'Sophia', 'Sophia@gmail.com', 'ossfsbcexk'),
('2018106', 'X3', 'Charlotte', 'Charlotte@gmail.com', 'dpfpazcsnj'),
('2018107', 'X3', 'Mia', 'Mia@gmail.com', 'fjgzpjzboa'),
('2018108', 'X3', 'Amelia', 'Amelia@gmail.com', 'hufgwuynie'),
('2018109', 'X3', 'Harper', 'Harper@gmail.com', 'qxuflxjoby'),
('201811', 'X1', 'Abigail', 'Abigail@gmail.com', 'hygcztyxyc'),
('2018110', 'X3', 'Evelyn', 'Evelyn@gmail.com', 'aidvhjuqaa'),
('2018111', 'X3', 'Abigail', 'Abigail@gmail.com', 'qowwdnlaip'),
('2018112', 'X3', 'Emily', 'Emily@gmail.com', 'niynxkhxyl'),
('2018113', 'X3', 'Elizabeth', 'Elizabeth@gmail.com', 'ebwrkrijgw'),
('2018114', 'X3', 'Mila', 'Mila@gmail.com', 'cgtblzrbsj'),
('2018115', 'X3', 'Ella', 'Ella@gmail.com', 'gvwitylypm'),
('2018116', 'X3', 'Avery', 'Avery@gmail.com', 'shwehsvqqs'),
('2018117', 'X3', 'Sofia', 'Sofia@gmail.com', 'kexokkcfqn'),
('2018118', 'X3', 'Camila', 'Camila@gmail.com', 'lzfciutjeq'),
('2018119', 'X3', 'Aria', 'Aria@gmail.com', 'jyheyoduqx'),
('201812', 'X1', 'Emily', 'Emily@gmail.com', 'krkvrhadzo'),
('2018120', 'X3', 'Scarlett', 'Scarlett@gmail.com', 'xexyehzxve'),
('2018121', 'X3', 'Victoria', 'Victoria@gmail.com', 'fwcybrkrkt'),
('2018122', 'X3', 'Madison', 'Madison@gmail.com', 'yhjilsscas'),
('2018123', 'X3', 'Luna', 'Luna@gmail.com', 'suqqgkybax'),
('2018124', 'X3', 'Grace', 'Grace@gmail.com', 'uxdwyifugi'),
('2018125', 'X3', 'Chloe', 'Chloe@gmail.com', 'pbjfudqhbl'),
('2018126', 'X3', 'Penelope', 'Penelope@gmail.com', 'kckoukmzsv'),
('2018127', 'X3', 'Layla', 'Layla@gmail.com', 'uuvzprxeou'),
('2018128', 'X3', 'Riley', 'Riley@gmail.com', 'mjczayaznv'),
('2018129', 'X3', 'Zoey', 'Zoey@gmail.com', 'fyzctvakbc'),
('201813', 'X1', 'Elizabeth', 'Elizabeth@gmail.com', 'ssrempnpou'),
('2018130', 'X3', 'Nora', 'Nora@gmail.com', 'dmwwbhhign'),
('2018131', 'X3', 'Lily', 'Lily@gmail.com', 'ueqgbenqle'),
('2018132', 'X3', 'Eleanor', 'Eleanor@gmail.com', 'gugdysmwdv'),
('2018133', 'X3', 'Hannah', 'Hannah@gmail.com', 'utoujxaqvp'),
('2018134', 'X3', 'Lillian', 'Lillian@gmail.com', 'axlnlusxgk'),
('2018135', 'X3', 'Addison', 'Addison@gmail.com', 'rybqetaplm'),
('2018136', 'X3', 'Aubrey', 'Aubrey@gmail.com', 'lmwvtxrdha'),
('2018137', 'X3', 'Ellie', 'Ellie@gmail.com', 'kxktdgcnjj'),
('2018138', 'X3', 'Stella', 'Stella@gmail.com', 'afdsgcdfyj'),
('2018139', 'X3', 'Natalie', 'Natalie@gmail.com', 'ipfufsvgih'),
('201814', 'X1', 'Mila', 'Mila@gmail.com', 'dbbverppiz'),
('2018140', 'X3', 'Zoe', 'Zoe@gmail.com', 'tqazwcynvz'),
('2018141', 'X3', 'Leah', 'Leah@gmail.com', 'nryaqwbkrl'),
('2018142', 'X3', 'Hazel', 'Hazel@gmail.com', 'hrsmdekpcz'),
('2018143', 'X3', 'Violet', 'Violet@gmail.com', 'vqekajvrzu'),
('2018144', 'X3', 'Aurora', 'Aurora@gmail.com', 'qgiwvarxkj'),
('2018145', 'X3', 'Savannah', 'Savannah@gmail.com', 'ghuldumpjd'),
('2018146', 'X3', 'Audrey', 'Audrey@gmail.com', 'bcpxetnzjm'),
('2018147', 'X3', 'Brooklyn', 'Brooklyn@gmail.com', 'dtmrkumcje'),
('2018148', 'X3', 'Bella', 'Bella@gmail.com', 'kkytofanvn'),
('2018149', 'X3', 'Claire', 'Claire@gmail.com', 'hdqgqpckxx'),
('201815', 'X1', 'Ella', 'Ella@gmail.com', 'ifybvpnhtk'),
('2018150', 'X3', 'Skylar', 'Skylar@gmail.com', 'dvwhrdelek'),
('2018151', 'X4', 'Emma', 'Emma@gmail.com', 'kufrclesaq'),
('2018152', 'X4', 'Olivia', 'Olivia@gmail.com', 'gsozzadhol'),
('2018153', 'X4', 'Ava', 'Ava@gmail.com', 'fryzehaydi'),
('2018154', 'X4', 'Isabella', 'Isabella@gmail.com', 'ggrjvplviu'),
('2018155', 'X4', 'Sophia', 'Sophia@gmail.com', 'rhsikqfacm'),
('2018156', 'X4', 'Charlotte', 'Charlotte@gmail.com', 'zgaruxrqxg'),
('2018157', 'X4', 'Mia', 'Mia@gmail.com', 'dlwlcrskod'),
('2018158', 'X4', 'Amelia', 'Amelia@gmail.com', 'lqrsspoqpn'),
('2018159', 'X4', 'Harper', 'Harper@gmail.com', 'nxmbohcocb'),
('201816', 'X1', 'Avery', 'Avery@gmail.com', 'qxhohrsigy'),
('2018160', 'X4', 'Evelyn', 'Evelyn@gmail.com', 'fhoqwdngtc'),
('2018161', 'X4', 'Abigail', 'Abigail@gmail.com', 'poupvfvxxt'),
('2018162', 'X4', 'Emily', 'Emily@gmail.com', 'scrjijuscy'),
('2018163', 'X4', 'Elizabeth', 'Elizabeth@gmail.com', 'absvtmcsnp'),
('2018164', 'X4', 'Mila', 'Mila@gmail.com', 'apsmohkgih'),
('2018165', 'X4', 'Ella', 'Ella@gmail.com', 'edkoleyhhn'),
('2018166', 'X4', 'Avery', 'Avery@gmail.com', 'vdccgvgqam'),
('2018167', 'X4', 'Sofia', 'Sofia@gmail.com', 'ywkvzxtrrc'),
('2018168', 'X4', 'Camila', 'Camila@gmail.com', 'bgyrvvwkoi'),
('2018169', 'X4', 'Aria', 'Aria@gmail.com', 'dipjnotqek'),
('201817', 'X1', 'Sofia', 'Sofia@gmail.com', 'osfsnvlkzo'),
('2018170', 'X4', 'Scarlett', 'Scarlett@gmail.com', 'xtdvzlzodl'),
('2018171', 'X4', 'Victoria', 'Victoria@gmail.com', 'eebmympfxb'),
('2018172', 'X4', 'Madison', 'Madison@gmail.com', 'hxkntnlkgr'),
('2018173', 'X4', 'Luna', 'Luna@gmail.com', 'zcdqidlbwc'),
('2018174', 'X4', 'Grace', 'Grace@gmail.com', 'bewydyesvt'),
('2018175', 'X4', 'Chloe', 'Chloe@gmail.com', 'krrhivtxfj'),
('2018176', 'X4', 'Penelope', 'Penelope@gmail.com', 'zmoibtklgm'),
('2018177', 'X4', 'Layla', 'Layla@gmail.com', 'dwcogcqzsw'),
('2018178', 'X4', 'Riley', 'Riley@gmail.com', 'stvapncbbk'),
('2018179', 'X4', 'Zoey', 'Zoey@gmail.com', 'gwwbfnjufb'),
('201818', 'X1', 'Camila', 'Camila@gmail.com', 'sqdtxpjhuv'),
('2018180', 'X4', 'Nora', 'Nora@gmail.com', 'ptwlbdllsl'),
('2018181', 'X4', 'Lily', 'Lily@gmail.com', 'ldllbazbip'),
('2018182', 'X4', 'Eleanor', 'Eleanor@gmail.com', 'kbhzfaaqsq'),
('2018183', 'X4', 'Hannah', 'Hannah@gmail.com', 'fncakcwred'),
('2018184', 'X4', 'Lillian', 'Lillian@gmail.com', 'mrvaayjouk'),
('2018185', 'X4', 'Addison', 'Addison@gmail.com', 'odinjdcqbw'),
('2018186', 'X4', 'Aubrey', 'Aubrey@gmail.com', 'wvaxvjweqe'),
('2018187', 'X4', 'Ellie', 'Ellie@gmail.com', 'yrllpihnza'),
('2018188', 'X4', 'Stella', 'Stella@gmail.com', 'gqswmdfvau'),
('2018189', 'X4', 'Natalie', 'Natalie@gmail.com', 'ovftcotcvb'),
('201819', 'X1', 'Aria', 'Aria@gmail.com', 'zulnuicbrk'),
('2018190', 'X4', 'Zoe', 'Zoe@gmail.com', 'ruyujjrqil'),
('2018191', 'X4', 'Leah', 'Leah@gmail.com', 'erlfzogywm'),
('2018192', 'X4', 'Hazel', 'Hazel@gmail.com', 'tquibnbolo'),
('2018193', 'X4', 'Violet', 'Violet@gmail.com', 'vgrhlvrswb'),
('2018194', 'X4', 'Aurora', 'Aurora@gmail.com', 'spuwlttvkb'),
('2018195', 'X4', 'Savannah', 'Savannah@gmail.com', 'xbrcyayleg'),
('2018196', 'X4', 'Audrey', 'Audrey@gmail.com', 'hurirkgrnx'),
('2018197', 'X4', 'Brooklyn', 'Brooklyn@gmail.com', 'rtiphuwxud'),
('2018198', 'X4', 'Bella', 'Bella@gmail.com', 'jhdzzcepzy'),
('2018199', 'X4', 'Claire', 'Claire@gmail.com', 'zwnfmosols'),
('20182', 'X1', 'Olivia', 'Olivia@gmail.com', 'pqbzibbiqr'),
('201820', 'X1', 'Scarlett', 'Scarlett@gmail.com', 'rgtwldakye'),
('2018200', 'X4', 'Skylar', 'Skylar@gmail.com', 'muaqmooein'),
('2018201', 'X5', 'Emma', 'Emma@gmail.com', 'rbhflakcry'),
('2018202', 'X5', 'Olivia', 'Olivia@gmail.com', 'unnlxggbzo'),
('2018203', 'X5', 'Ava', 'Ava@gmail.com', 'pkgmvtyumo'),
('2018204', 'X5', 'Isabella', 'Isabella@gmail.com', 'bqitmicskx'),
('2018205', 'X5', 'Sophia', 'Sophia@gmail.com', 'ladlbzgotp'),
('2018206', 'X5', 'Charlotte', 'Charlotte@gmail.com', 'xzzxrjzvnc'),
('2018207', 'X5', 'Mia', 'Mia@gmail.com', 'xttvxdddgk'),
('2018208', 'X5', 'Amelia', 'Amelia@gmail.com', 'cjjeofcpjw'),
('2018209', 'X5', 'Harper', 'Harper@gmail.com', 'mxopqrsxsn'),
('201821', 'X1', 'Victoria', 'Victoria@gmail.com', 'wzawhgyebd'),
('2018210', 'X5', 'Evelyn', 'Evelyn@gmail.com', 'ktapzofskh'),
('2018211', 'X5', 'Abigail', 'Abigail@gmail.com', 'ilieciuwnx'),
('2018212', 'X5', 'Emily', 'Emily@gmail.com', 'ozdxsgxspt'),
('2018213', 'X5', 'Elizabeth', 'Elizabeth@gmail.com', 'noxplhtkin'),
('2018214', 'X5', 'Mila', 'Mila@gmail.com', 'ezrrjrkvyw'),
('2018215', 'X5', 'Ella', 'Ella@gmail.com', 'jiumatuvqi'),
('2018216', 'X5', 'Avery', 'Avery@gmail.com', 'aowrnfaekz'),
('2018217', 'X5', 'Sofia', 'Sofia@gmail.com', 'bredliadcv'),
('2018218', 'X5', 'Camila', 'Camila@gmail.com', 'yhnjlkehad'),
('2018219', 'X5', 'Aria', 'Aria@gmail.com', 'jswiuxpqua'),
('201822', 'X1', 'Madison', 'Madison@gmail.com', 'dgknjahsze'),
('2018220', 'X5', 'Scarlett', 'Scarlett@gmail.com', 'wmqxebeffe'),
('2018221', 'X5', 'Victoria', 'Victoria@gmail.com', 'jmcvmrkwqe'),
('2018222', 'X5', 'Madison', 'Madison@gmail.com', 'zpkrpibxrd'),
('2018223', 'X5', 'Luna', 'Luna@gmail.com', 'thkhxuaapt'),
('2018224', 'X5', 'Grace', 'Grace@gmail.com', 'vjjaevxhow'),
('2018225', 'X5', 'Chloe', 'Chloe@gmail.com', 'njvxbqruju'),
('2018226', 'X5', 'Penelope', 'Penelope@gmail.com', 'nxanjtnuhy'),
('2018227', 'X5', 'Layla', 'Layla@gmail.com', 'lekynzjrya'),
('2018228', 'X5', 'Riley', 'Riley@gmail.com', 'cwegimamrx'),
('2018229', 'X5', 'Zoey', 'Zoey@gmail.com', 'xwnrcegipd'),
('201823', 'X1', 'Luna', 'Luna@gmail.com', 'qqedpcsjyf'),
('2018230', 'X5', 'Nora', 'Nora@gmail.com', 'ozjzawiexg'),
('2018231', 'X5', 'Lily', 'Lily@gmail.com', 'yavdftbpog'),
('2018232', 'X5', 'Eleanor', 'Eleanor@gmail.com', 'kiqlsjxhzb'),
('2018233', 'X5', 'Hannah', 'Hannah@gmail.com', 'mjohdcynlq'),
('2018234', 'X5', 'Lillian', 'Lillian@gmail.com', 'extawsnxwf'),
('2018235', 'X5', 'Addison', 'Addison@gmail.com', 'qlfacdzora'),
('2018236', 'X5', 'Aubrey', 'Aubrey@gmail.com', 'eyvwkzhwjh'),
('2018237', 'X5', 'Ellie', 'Ellie@gmail.com', 'chwlwnafrs'),
('2018238', 'X5', 'Stella', 'Stella@gmail.com', 'uothqzfjaw'),
('2018239', 'X5', 'Natalie', 'Natalie@gmail.com', 'hlhuuogdmv'),
('201824', 'X1', 'Grace', 'Grace@gmail.com', 'kbbrfitbsa'),
('2018240', 'X5', 'Zoe', 'Zoe@gmail.com', 'dsyvhqgmaw'),
('2018241', 'X5', 'Leah', 'Leah@gmail.com', 'wgfyikictm'),
('2018242', 'X5', 'Hazel', 'Hazel@gmail.com', 'gqpqxnrzpd'),
('2018243', 'X5', 'Violet', 'Violet@gmail.com', 'bjgiymlruo'),
('2018244', 'X5', 'Aurora', 'Aurora@gmail.com', 'qqtmvbnrmu'),
('2018245', 'X5', 'Savannah', 'Savannah@gmail.com', 'ktechflxuu'),
('2018246', 'X5', 'Audrey', 'Audrey@gmail.com', 'bivdlrqsrt'),
('2018247', 'X5', 'Brooklyn', 'Brooklyn@gmail.com', 'tjemefwkxt'),
('2018248', 'X5', 'Bella', 'Bella@gmail.com', 'zfhilcaomg'),
('2018249', 'X5', 'Claire', 'Claire@gmail.com', 'pqzpjztdky'),
('201825', 'X1', 'Chloe', 'Chloe@gmail.com', 'zaykpbasiv'),
('2018250', 'X5', 'Skylar', 'Skylar@gmail.com', 'vvrijapatn'),
('2018251', 'X6', 'Emma', 'Emma@gmail.com', 'vgmibhkicj'),
('2018252', 'X6', 'Olivia', 'Olivia@gmail.com', 'yohfpaqyka'),
('2018253', 'X6', 'Ava', 'Ava@gmail.com', 'mfqxvmuyto'),
('2018254', 'X6', 'Isabella', 'Isabella@gmail.com', 'zzsnxehexq'),
('2018255', 'X6', 'Sophia', 'Sophia@gmail.com', 'bemhsinzmh'),
('2018256', 'X6', 'Charlotte', 'Charlotte@gmail.com', 'erxuhymhyt'),
('2018257', 'X6', 'Mia', 'Mia@gmail.com', 'kshiszxzup'),
('2018258', 'X6', 'Amelia', 'Amelia@gmail.com', 'qqhjocjpts'),
('2018259', 'X6', 'Harper', 'Harper@gmail.com', 'tsolhqqlbe'),
('201826', 'X1', 'Penelope', 'Penelope@gmail.com', 'hrxjirdecb'),
('2018260', 'X6', 'Evelyn', 'Evelyn@gmail.com', 'wjsxrgawhu'),
('2018261', 'X6', 'Abigail', 'Abigail@gmail.com', 'qqxgdbtiyr'),
('2018262', 'X6', 'Emily', 'Emily@gmail.com', 'ftnklkztpz'),
('2018263', 'X6', 'Elizabeth', 'Elizabeth@gmail.com', 'adjatcdkom'),
('2018264', 'X6', 'Mila', 'Mila@gmail.com', 'ifftvkfgvu'),
('2018265', 'X6', 'Ella', 'Ella@gmail.com', 'qxnuifoout'),
('2018266', 'X6', 'Avery', 'Avery@gmail.com', 'pvinxlqbgn'),
('2018267', 'X6', 'Sofia', 'Sofia@gmail.com', 'ljimylbwdt'),
('2018268', 'X6', 'Camila', 'Camila@gmail.com', 'xirrpyvchs'),
('2018269', 'X6', 'Aria', 'Aria@gmail.com', 'jykswupkzg'),
('201827', 'X1', 'Layla', 'Layla@gmail.com', 'stunvydago'),
('2018270', 'X6', 'Scarlett', 'Scarlett@gmail.com', 'qoaqzmojla'),
('2018271', 'X6', 'Victoria', 'Victoria@gmail.com', 'pjieftgplu'),
('2018272', 'X6', 'Madison', 'Madison@gmail.com', 'yrkwdbnyzk'),
('2018273', 'X6', 'Luna', 'Luna@gmail.com', 'eiyleafuoi'),
('2018274', 'X6', 'Grace', 'Grace@gmail.com', 'bjhdgwxgpr'),
('2018275', 'X6', 'Chloe', 'Chloe@gmail.com', 'qzleuwmkup'),
('2018276', 'X6', 'Penelope', 'Penelope@gmail.com', 'gntkykibfp'),
('2018277', 'X6', 'Layla', 'Layla@gmail.com', 'rchlpwjole'),
('2018278', 'X6', 'Riley', 'Riley@gmail.com', 'nrdvrsloaz'),
('2018279', 'X6', 'Zoey', 'Zoey@gmail.com', 'vkqelvmiaq'),
('201828', 'X1', 'Riley', 'Riley@gmail.com', 'bgicfwwafm'),
('2018280', 'X6', 'Nora', 'Nora@gmail.com', 'evuvskveie'),
('2018281', 'X6', 'Lily', 'Lily@gmail.com', 'edagghhvih'),
('2018282', 'X6', 'Eleanor', 'Eleanor@gmail.com', 'ctgvzcfqfa'),
('2018283', 'X6', 'Hannah', 'Hannah@gmail.com', 'aqqvisnieu'),
('2018284', 'X6', 'Lillian', 'Lillian@gmail.com', 'znsfpltgxo'),
('2018285', 'X6', 'Addison', 'Addison@gmail.com', 'ppyxsspert'),
('2018286', 'X6', 'Aubrey', 'Aubrey@gmail.com', 'xgmhvtlbkj'),
('2018287', 'X6', 'Ellie', 'Ellie@gmail.com', 'tccxsiazkt'),
('2018288', 'X6', 'Stella', 'Stella@gmail.com', 'sdactjvant'),
('2018289', 'X6', 'Natalie', 'Natalie@gmail.com', 'xrhgqyxatd'),
('201829', 'X1', 'Zoey', 'Zoey@gmail.com', 'rzbqvjzqhn'),
('2018290', 'X6', 'Zoe', 'Zoe@gmail.com', 'jbkfnuhoij'),
('2018291', 'X6', 'Leah', 'Leah@gmail.com', 'ywzloawmvc'),
('2018292', 'X6', 'Hazel', 'Hazel@gmail.com', 'kmzrofxhcv'),
('2018293', 'X6', 'Violet', 'Violet@gmail.com', 'bkqkvgnmeu'),
('2018294', 'X6', 'Aurora', 'Aurora@gmail.com', 'fokzzvfdtr'),
('2018295', 'X6', 'Savannah', 'Savannah@gmail.com', 'vmbyapxemb'),
('2018296', 'X6', 'Audrey', 'Audrey@gmail.com', 'oayooezspb'),
('2018297', 'X6', 'Brooklyn', 'Brooklyn@gmail.com', 'mnghwhxiux'),
('2018298', 'X6', 'Bella', 'Bella@gmail.com', 'flollreypr'),
('2018299', 'X6', 'Claire', 'Claire@gmail.com', 'oizskgfrnf'),
('20183', 'X1', 'Ava', 'Ava@gmail.com', 'rzkydlasyo'),
('201830', 'X1', 'Nora', 'Nora@gmail.com', 'bohdqallqy'),
('2018300', 'X6', 'Skylar', 'Skylar@gmail.com', 'koaomafdmn'),
('2018301', 'X7', 'Emma', 'Emma@gmail.com', 'nldfocatda'),
('2018302', 'X7', 'Olivia', 'Olivia@gmail.com', 'cmasgwgjjc'),
('2018303', 'X7', 'Ava', 'Ava@gmail.com', 'vxgjubeexe'),
('2018304', 'X7', 'Isabella', 'Isabella@gmail.com', 'ibnrcgopcv'),
('2018305', 'X7', 'Sophia', 'Sophia@gmail.com', 'ijpsffwtfp'),
('2018306', 'X7', 'Charlotte', 'Charlotte@gmail.com', 'npprudsjtq'),
('2018307', 'X7', 'Mia', 'Mia@gmail.com', 'awgeosmrgw'),
('2018308', 'X7', 'Amelia', 'Amelia@gmail.com', 'etdrzsanwu'),
('2018309', 'X7', 'Harper', 'Harper@gmail.com', 'viptxrbayu'),
('201831', 'X1', 'Lily', 'Lily@gmail.com', 'zgzjoxmngw'),
('2018310', 'X7', 'Evelyn', 'Evelyn@gmail.com', 'zbzryjapdh'),
('2018311', 'X7', 'Abigail', 'Abigail@gmail.com', 'jooyutmmhj'),
('2018312', 'X7', 'Emily', 'Emily@gmail.com', 'uqkgmlffud'),
('2018313', 'X7', 'Elizabeth', 'Elizabeth@gmail.com', 'meehbajghd'),
('2018314', 'X7', 'Mila', 'Mila@gmail.com', 'rtnftflsfm'),
('2018315', 'X7', 'Ella', 'Ella@gmail.com', 'hywqsgvegq'),
('2018316', 'X7', 'Avery', 'Avery@gmail.com', 'zljwpyaphq'),
('2018317', 'X7', 'Sofia', 'Sofia@gmail.com', 'drjfywkscf'),
('2018318', 'X7', 'Camila', 'Camila@gmail.com', 'dagmxvlnyy'),
('2018319', 'X7', 'Aria', 'Aria@gmail.com', 'qnfvoboavf'),
('201832', 'X1', 'Eleanor', 'Eleanor@gmail.com', 'uqctikuwey'),
('2018320', 'X7', 'Scarlett', 'Scarlett@gmail.com', 'shcfteztxf'),
('2018321', 'X7', 'Victoria', 'Victoria@gmail.com', 'ugvtumyvnd'),
('2018322', 'X7', 'Madison', 'Madison@gmail.com', 'qrtaxroygp'),
('2018323', 'X7', 'Luna', 'Luna@gmail.com', 'pcyfesooqn'),
('2018324', 'X7', 'Grace', 'Grace@gmail.com', 'mbnfwfpxop'),
('2018325', 'X7', 'Chloe', 'Chloe@gmail.com', 'ixvsawtgkt'),
('2018326', 'X7', 'Penelope', 'Penelope@gmail.com', 'vrcoihlqzi'),
('2018327', 'X7', 'Layla', 'Layla@gmail.com', 'fvstgfmfgo'),
('2018328', 'X7', 'Riley', 'Riley@gmail.com', 'nljuauopws'),
('2018329', 'X7', 'Zoey', 'Zoey@gmail.com', 'nlxpmukkja'),
('201833', 'X1', 'Hannah', 'Hannah@gmail.com', 'xughrrvhrn'),
('2018330', 'X7', 'Nora', 'Nora@gmail.com', 'dbboplocxo'),
('2018331', 'X7', 'Lily', 'Lily@gmail.com', 'wjiztjnrei'),
('2018332', 'X7', 'Eleanor', 'Eleanor@gmail.com', 'jllwedmyxr'),
('2018333', 'X7', 'Hannah', 'Hannah@gmail.com', 'sopzhqwpnf'),
('2018334', 'X7', 'Lillian', 'Lillian@gmail.com', 'kgtpjkiuxp'),
('2018335', 'X7', 'Addison', 'Addison@gmail.com', 'nspybvbpvi'),
('2018336', 'X7', 'Aubrey', 'Aubrey@gmail.com', 'pvsegcxpyh'),
('2018337', 'X7', 'Ellie', 'Ellie@gmail.com', 'ozyvclpnqn'),
('2018338', 'X7', 'Stella', 'Stella@gmail.com', 'vusydgqlcu'),
('2018339', 'X7', 'Natalie', 'Natalie@gmail.com', 'omhkvcxbti'),
('201834', 'X1', 'Lillian', 'Lillian@gmail.com', 'tirfqzexue'),
('2018340', 'X7', 'Zoe', 'Zoe@gmail.com', 'mikjueensh'),
('2018341', 'X7', 'Leah', 'Leah@gmail.com', 'lvrpxsopjj'),
('2018342', 'X7', 'Hazel', 'Hazel@gmail.com', 'riquurtyit'),
('2018343', 'X7', 'Violet', 'Violet@gmail.com', 'bgstchosul'),
('2018344', 'X7', 'Aurora', 'Aurora@gmail.com', 'kmyxamlgij'),
('2018345', 'X7', 'Savannah', 'Savannah@gmail.com', 'anaieqathr'),
('2018346', 'X7', 'Audrey', 'Audrey@gmail.com', 'uapsgthpia'),
('2018347', 'X7', 'Brooklyn', 'Brooklyn@gmail.com', 'zkpgcebncc'),
('2018348', 'X7', 'Bella', 'Bella@gmail.com', 'mapzauyxhh'),
('2018349', 'X7', 'Claire', 'Claire@gmail.com', 'zdjbvwdhbj'),
('201835', 'X1', 'Addison', 'Addison@gmail.com', 'ngeudeulom'),
('2018350', 'X7', 'Skylar', 'Skylar@gmail.com', 'emlitupzyp'),
('2018351', 'X8', 'Emma', 'Emma@gmail.com', 'akarnbakdq'),
('2018352', 'X8', 'Olivia', 'Olivia@gmail.com', 'udzquvbixj'),
('2018353', 'X8', 'Ava', 'Ava@gmail.com', 'laahbjygzk'),
('2018354', 'X8', 'Isabella', 'Isabella@gmail.com', 'tkyxwwkdbw'),
('2018355', 'X8', 'Sophia', 'Sophia@gmail.com', 'mqzuphffvh'),
('2018356', 'X8', 'Charlotte', 'Charlotte@gmail.com', 'tgkndswrft'),
('2018357', 'X8', 'Mia', 'Mia@gmail.com', 'dsxyioaahw'),
('2018358', 'X8', 'Amelia', 'Amelia@gmail.com', 'rqeeejwscu'),
('2018359', 'X8', 'Harper', 'Harper@gmail.com', 'pkgysucila'),
('201836', 'X1', 'Aubrey', 'Aubrey@gmail.com', 'mgvjltecbg'),
('2018360', 'X8', 'Evelyn', 'Evelyn@gmail.com', 'ylvzgiplds'),
('2018361', 'X8', 'Abigail', 'Abigail@gmail.com', 'whmkyloezp'),
('2018362', 'X8', 'Emily', 'Emily@gmail.com', 'efpfabbvbt'),
('2018363', 'X8', 'Elizabeth', 'Elizabeth@gmail.com', 'zvgfwaxuud'),
('2018364', 'X8', 'Mila', 'Mila@gmail.com', 'mfdupscnyx'),
('2018365', 'X8', 'Ella', 'Ella@gmail.com', 'gqxwbcqbml'),
('2018366', 'X8', 'Avery', 'Avery@gmail.com', 'jagnsmxztr'),
('2018367', 'X8', 'Sofia', 'Sofia@gmail.com', 'gujssmnsmn'),
('2018368', 'X8', 'Camila', 'Camila@gmail.com', 'leqxjzrgqi'),
('2018369', 'X8', 'Aria', 'Aria@gmail.com', 'zfwiuoxeyg'),
('201837', 'X1', 'Ellie', 'Ellie@gmail.com', 'zvsmvokbir'),
('2018370', 'X8', 'Scarlett', 'Scarlett@gmail.com', 'ueygxmxhre'),
('2018371', 'X8', 'Victoria', 'Victoria@gmail.com', 'npzptfrsnn'),
('2018372', 'X8', 'Madison', 'Madison@gmail.com', 'ccrjfldygz'),
('2018373', 'X8', 'Luna', 'Luna@gmail.com', 'runsmwqfod'),
('2018374', 'X8', 'Grace', 'Grace@gmail.com', 'zcempppocb'),
('2018375', 'X8', 'Chloe', 'Chloe@gmail.com', 'pghpvtqqko'),
('2018376', 'X8', 'Penelope', 'Penelope@gmail.com', 'dtdeltyomh'),
('2018377', 'X8', 'Layla', 'Layla@gmail.com', 'htlbvopkmb'),
('2018378', 'X8', 'Riley', 'Riley@gmail.com', 'esutmqdcyz'),
('2018379', 'X8', 'Zoey', 'Zoey@gmail.com', 'fqqcfmedcm'),
('201838', 'X1', 'Stella', 'Stella@gmail.com', 'ehmoprfqia'),
('2018380', 'X8', 'Nora', 'Nora@gmail.com', 'iglbdlirxa'),
('2018381', 'X8', 'Lily', 'Lily@gmail.com', 'afkpilrjdy'),
('2018382', 'X8', 'Eleanor', 'Eleanor@gmail.com', 'apxhlybedo'),
('2018383', 'X8', 'Hannah', 'Hannah@gmail.com', 'dsbzhycuac'),
('2018384', 'X8', 'Lillian', 'Lillian@gmail.com', 'czobsfmvfq'),
('2018385', 'X8', 'Addison', 'Addison@gmail.com', 'ojcrhrthgs'),
('2018386', 'X8', 'Aubrey', 'Aubrey@gmail.com', 'saqnbvzmkf'),
('2018387', 'X8', 'Ellie', 'Ellie@gmail.com', 'mxmtcneveg'),
('2018388', 'X8', 'Stella', 'Stella@gmail.com', 'lflhaetdnp'),
('2018389', 'X8', 'Natalie', 'Natalie@gmail.com', 'bzlfhywbzd'),
('201839', 'X1', 'Natalie', 'Natalie@gmail.com', 'tvgszamphv'),
('2018390', 'X8', 'Zoe', 'Zoe@gmail.com', 'xlpymxejzy'),
('2018391', 'X8', 'Leah', 'Leah@gmail.com', 'gupbsdpndd'),
('2018392', 'X8', 'Hazel', 'Hazel@gmail.com', 'okpehxysvf'),
('2018393', 'X8', 'Violet', 'Violet@gmail.com', 'pksozqswrv'),
('2018394', 'X8', 'Aurora', 'Aurora@gmail.com', 'kxmvutyexp'),
('2018395', 'X8', 'Savannah', 'Savannah@gmail.com', 'jpizklzgny'),
('2018396', 'X8', 'Audrey', 'Audrey@gmail.com', 'usdmdeclho'),
('2018397', 'X8', 'Brooklyn', 'Brooklyn@gmail.com', 'kaarbjsbhh'),
('2018398', 'X8', 'Bella', 'Bella@gmail.com', 'nhmpnxjfvf'),
('2018399', 'X8', 'Claire', 'Claire@gmail.com', 'xmgoiftscf'),
('20184', 'X1', 'Isabella', 'Isabella@gmail.com', 'iskhmawmay'),
('201840', 'X1', 'Zoe', 'Zoe@gmail.com', 'suuahrdnmf'),
('2018400', 'X8', 'Skylar', 'Skylar@gmail.com', 'bwemvfyazp'),
('2018401', 'X9', 'Emma', 'Emma@gmail.com', 'fznzgzwlzu'),
('2018402', 'X9', 'Olivia', 'Olivia@gmail.com', 'mjeercklhr'),
('2018403', 'X9', 'Ava', 'Ava@gmail.com', 'rmihwtyplv'),
('2018404', 'X9', 'Isabella', 'Isabella@gmail.com', 'zyhoucimfb'),
('2018405', 'X9', 'Sophia', 'Sophia@gmail.com', 'mggnnuwiji'),
('2018406', 'X9', 'Charlotte', 'Charlotte@gmail.com', 'omnxqigwnl'),
('2018407', 'X9', 'Mia', 'Mia@gmail.com', 'qyfbzgvnyz'),
('2018408', 'X9', 'Amelia', 'Amelia@gmail.com', 'yyllkxfkgz'),
('2018409', 'X9', 'Harper', 'Harper@gmail.com', 'rbcyoxrpom'),
('201841', 'X1', 'Leah', 'Leah@gmail.com', 'sibevjpduq'),
('2018410', 'X9', 'Evelyn', 'Evelyn@gmail.com', 'kdqoiddrzm'),
('2018411', 'X9', 'Abigail', 'Abigail@gmail.com', 'eudjeaqzmw'),
('2018412', 'X9', 'Emily', 'Emily@gmail.com', 'jdjhyhicvn'),
('2018413', 'X9', 'Elizabeth', 'Elizabeth@gmail.com', 'tijgmwuibu'),
('2018414', 'X9', 'Mila', 'Mila@gmail.com', 'xgveirashs'),
('2018415', 'X9', 'Ella', 'Ella@gmail.com', 'shfldhodjw'),
('2018416', 'X9', 'Avery', 'Avery@gmail.com', 'kezvzcjbyo'),
('2018417', 'X9', 'Sofia', 'Sofia@gmail.com', 'ehoqwfekat'),
('2018418', 'X9', 'Camila', 'Camila@gmail.com', 'xvswftibws'),
('2018419', 'X9', 'Aria', 'Aria@gmail.com', 'szivjnqjes'),
('201842', 'X1', 'Hazel', 'Hazel@gmail.com', 'bnihebudfv'),
('2018420', 'X9', 'Scarlett', 'Scarlett@gmail.com', 'fseeeiureu'),
('2018421', 'X9', 'Victoria', 'Victoria@gmail.com', 'udjnaerlfy'),
('2018422', 'X9', 'Madison', 'Madison@gmail.com', 'rayobdxoet'),
('2018423', 'X9', 'Luna', 'Luna@gmail.com', 'crwntuukso'),
('2018424', 'X9', 'Grace', 'Grace@gmail.com', 'mpijhwukfh'),
('2018425', 'X9', 'Chloe', 'Chloe@gmail.com', 'maxneitjzz'),
('2018426', 'X9', 'Penelope', 'Penelope@gmail.com', 'iljljlpewa'),
('2018427', 'X9', 'Layla', 'Layla@gmail.com', 'ngecwponbt'),
('2018428', 'X9', 'Riley', 'Riley@gmail.com', 'bfmxznkyfc'),
('2018429', 'X9', 'Zoey', 'Zoey@gmail.com', 'efcoqroncw'),
('201843', 'X1', 'Violet', 'Violet@gmail.com', 'ryobkmsmhk'),
('2018430', 'X9', 'Nora', 'Nora@gmail.com', 'jtaaqdtsyu'),
('2018431', 'X9', 'Lily', 'Lily@gmail.com', 'owdokqupfg'),
('2018432', 'X9', 'Eleanor', 'Eleanor@gmail.com', 'gscghhowep'),
('2018433', 'X9', 'Hannah', 'Hannah@gmail.com', 'melpexodsh'),
('2018434', 'X9', 'Lillian', 'Lillian@gmail.com', 'gxjnlerqnn'),
('2018435', 'X9', 'Addison', 'Addison@gmail.com', 'mzvpookypb'),
('2018436', 'X9', 'Aubrey', 'Aubrey@gmail.com', 'kzyzmbpgmn'),
('2018437', 'X9', 'Ellie', 'Ellie@gmail.com', 'lxnhviuvtp'),
('2018438', 'X9', 'Stella', 'Stella@gmail.com', 'clwjxsqicq'),
('2018439', 'X9', 'Natalie', 'Natalie@gmail.com', 'kcnyguedmx'),
('201844', 'X1', 'Aurora', 'Aurora@gmail.com', 'pzlfvaawdx'),
('2018440', 'X9', 'Zoe', 'Zoe@gmail.com', 'obogozxhdt'),
('2018441', 'X9', 'Leah', 'Leah@gmail.com', 'lqwrqtrede'),
('2018442', 'X9', 'Hazel', 'Hazel@gmail.com', 'dlzmzzofel'),
('2018443', 'X9', 'Violet', 'Violet@gmail.com', 'jdvzwpuqak'),
('2018444', 'X9', 'Aurora', 'Aurora@gmail.com', 'fpvzdkpbwg'),
('2018445', 'X9', 'Savannah', 'Savannah@gmail.com', 'bssuezklmi'),
('2018446', 'X9', 'Audrey', 'Audrey@gmail.com', 'dstqfuzmzq'),
('2018447', 'X9', 'Brooklyn', 'Brooklyn@gmail.com', 'mvznfunois'),
('2018448', 'X9', 'Bella', 'Bella@gmail.com', 'uuqzykdyws'),
('2018449', 'X9', 'Claire', 'Claire@gmail.com', 'yzrciykrzg'),
('201845', 'X1', 'Savannah', 'Savannah@gmail.com', 'bnwiidotvx'),
('2018450', 'X9', 'Skylar', 'Skylar@gmail.com', 'gbyjbdgnkv'),
('2018451', 'X10', 'Emma', 'Emma@gmail.com', 'gtrttwgext'),
('2018452', 'X10', 'Olivia', 'Olivia@gmail.com', 'gcmutlsjvv'),
('2018453', 'X10', 'Ava', 'Ava@gmail.com', 'sugadggpys'),
('2018454', 'X10', 'Isabella', 'Isabella@gmail.com', 'lonnykbwlk'),
('2018455', 'X10', 'Sophia', 'Sophia@gmail.com', 'nurqlxyqwq'),
('2018456', 'X10', 'Charlotte', 'Charlotte@gmail.com', 'peqvwyaayg'),
('2018457', 'X10', 'Mia', 'Mia@gmail.com', 'xscmnownbr'),
('2018458', 'X10', 'Amelia', 'Amelia@gmail.com', 'fhtnrlcxpq'),
('2018459', 'X10', 'Harper', 'Harper@gmail.com', 'nbxrtwdczz'),
('201846', 'X1', 'Audrey', 'Audrey@gmail.com', 'fhoqxfilow'),
('2018460', 'X10', 'Evelyn', 'Evelyn@gmail.com', 'zhfbcfzgmw'),
('2018461', 'X10', 'Abigail', 'Abigail@gmail.com', 'sisvyzfjek'),
('2018462', 'X10', 'Emily', 'Emily@gmail.com', 'geogjosnlo'),
('2018463', 'X10', 'Elizabeth', 'Elizabeth@gmail.com', 'dvlusbvlvk'),
('2018464', 'X10', 'Mila', 'Mila@gmail.com', 'lamxkwpzok'),
('2018465', 'X10', 'Ella', 'Ella@gmail.com', 'tzeukvdcse'),
('2018466', 'X10', 'Avery', 'Avery@gmail.com', 'kbvywrwqvu'),
('2018467', 'X10', 'Sofia', 'Sofia@gmail.com', 'uaarsgghzj'),
('2018468', 'X10', 'Camila', 'Camila@gmail.com', 'gqlapazpoi'),
('2018469', 'X10', 'Aria', 'Aria@gmail.com', 'ntlrkbnmvs'),
('201847', 'X1', 'Brooklyn', 'Brooklyn@gmail.com', 'eljopoters'),
('2018470', 'X10', 'Scarlett', 'Scarlett@gmail.com', 'drwasttfzc'),
('2018471', 'X10', 'Victoria', 'Victoria@gmail.com', 'wfddshpnun'),
('2018472', 'X10', 'Madison', 'Madison@gmail.com', 'ytmdosjbuq'),
('2018473', 'X10', 'Luna', 'Luna@gmail.com', 'potfytbiaf'),
('2018474', 'X10', 'Grace', 'Grace@gmail.com', 'eiewzmqfor'),
('2018475', 'X10', 'Chloe', 'Chloe@gmail.com', 'ehpqsvzxse'),
('2018476', 'X10', 'Penelope', 'Penelope@gmail.com', 'fhqbkixtlq'),
('2018477', 'X10', 'Layla', 'Layla@gmail.com', 'pzblylwugr'),
('2018478', 'X10', 'Riley', 'Riley@gmail.com', 'kkiewwvpad'),
('2018479', 'X10', 'Zoey', 'Zoey@gmail.com', 'apqenszwjy'),
('201848', 'X1', 'Bella', 'Bella@gmail.com', 'iohyqgqrhr'),
('2018480', 'X10', 'Nora', 'Nora@gmail.com', 'djgsfsspbu'),
('2018481', 'X10', 'Lily', 'Lily@gmail.com', 'ephlebjxgu'),
('2018482', 'X10', 'Eleanor', 'Eleanor@gmail.com', 'szkgcqirey'),
('2018483', 'X10', 'Hannah', 'Hannah@gmail.com', 'lubimkwdso'),
('2018484', 'X10', 'Lillian', 'Lillian@gmail.com', 'pbstmikgtu'),
('2018485', 'X10', 'Addison', 'Addison@gmail.com', 'spqiigpxdb'),
('2018486', 'X10', 'Aubrey', 'Aubrey@gmail.com', 'bkpzdrszbg'),
('2018487', 'X10', 'Ellie', 'Ellie@gmail.com', 'mfxrtkasua'),
('2018488', 'X10', 'Stella', 'Stella@gmail.com', 'lquzpzebtm'),
('2018489', 'X10', 'Natalie', 'Natalie@gmail.com', 'kctatfgjkm'),
('201849', 'X1', 'Claire', 'Claire@gmail.com', 'dwgbpvnxcx'),
('2018490', 'X10', 'Zoe', 'Zoe@gmail.com', 'iuertvpoib'),
('2018491', 'X10', 'Leah', 'Leah@gmail.com', 'eimwdahejj'),
('2018492', 'X10', 'Hazel', 'Hazel@gmail.com', 'hvatilhdxn'),
('2018493', 'X10', 'Violet', 'Violet@gmail.com', 'lizmgvoqvl'),
('2018494', 'X10', 'Aurora', 'Aurora@gmail.com', 'nrblneaylk'),
('2018495', 'X10', 'Savannah', 'Savannah@gmail.com', 'garhgkevgn'),
('2018496', 'X10', 'Audrey', 'Audrey@gmail.com', 'yyaoepxarc'),
('2018497', 'X10', 'Brooklyn', 'Brooklyn@gmail.com', 'qnouxnfbji'),
('2018498', 'X10', 'Bella', 'Bella@gmail.com', 'jjdqvizcqv'),
('2018499', 'X10', 'Claire', 'Claire@gmail.com', 'djdgvedcge'),
('20185', 'X1', 'Sophia', 'Sophia@gmail.com', 'wtihdodiqy'),
('201850', 'X1', 'Skylar', 'Skylar@gmail.com', 'uyusydyeof'),
('2018500', 'X10', 'Skylar', 'Skylar@gmail.com', 'dmnsudfhjn'),
('2018501', 'X11', 'Emma', 'Emma@gmail.com', 'wefhivzmmt'),
('2018502', 'X11', 'Olivia', 'Olivia@gmail.com', 'rrtznklbqp'),
('2018503', 'X11', 'Ava', 'Ava@gmail.com', 'nxqiuknxeb'),
('2018504', 'X11', 'Isabella', 'Isabella@gmail.com', 'ovoefosboe'),
('2018505', 'X11', 'Sophia', 'Sophia@gmail.com', 'rojvaoigmv'),
('2018506', 'X11', 'Charlotte', 'Charlotte@gmail.com', 'vffgfedxdm'),
('2018507', 'X11', 'Mia', 'Mia@gmail.com', 'yhkkamjgzw'),
('2018508', 'X11', 'Amelia', 'Amelia@gmail.com', 'ijkjhegezo'),
('2018509', 'X11', 'Harper', 'Harper@gmail.com', 'qantyaxelh'),
('201851', 'X2', 'Emma', 'Emma@gmail.com', 'vpjeggokiq'),
('2018510', 'X11', 'Evelyn', 'Evelyn@gmail.com', 'humyboyeml'),
('2018511', 'X11', 'Abigail', 'Abigail@gmail.com', 'mfmerxtwye'),
('2018512', 'X11', 'Emily', 'Emily@gmail.com', 'lgdvtbaadw'),
('2018513', 'X11', 'Elizabeth', 'Elizabeth@gmail.com', 'fongvfvieu'),
('2018514', 'X11', 'Mila', 'Mila@gmail.com', 'rfzyeqcbhv'),
('2018515', 'X11', 'Ella', 'Ella@gmail.com', 'qohquegtmb'),
('2018516', 'X11', 'Avery', 'Avery@gmail.com', 'wdilqmvhqu'),
('2018517', 'X11', 'Sofia', 'Sofia@gmail.com', 'kofgyepqpk'),
('2018518', 'X11', 'Camila', 'Camila@gmail.com', 'dgjsqohexo'),
('2018519', 'X11', 'Aria', 'Aria@gmail.com', 'dnyzlwnwly'),
('201852', 'X2', 'Olivia', 'Olivia@gmail.com', 'rlsqmtuylm'),
('2018520', 'X11', 'Scarlett', 'Scarlett@gmail.com', 'gqbzfysqyg'),
('2018521', 'X11', 'Victoria', 'Victoria@gmail.com', 'ywiqnctayj'),
('2018522', 'X11', 'Madison', 'Madison@gmail.com', 'nfoxsnltri'),
('2018523', 'X11', 'Luna', 'Luna@gmail.com', 'rnoqrgdjqn'),
('2018524', 'X11', 'Grace', 'Grace@gmail.com', 'cyguufuewx'),
('2018525', 'X11', 'Chloe', 'Chloe@gmail.com', 'thrlaztzct'),
('2018526', 'X11', 'Penelope', 'Penelope@gmail.com', 'cjczgudpxt'),
('2018527', 'X11', 'Layla', 'Layla@gmail.com', 'qpbhbvfiyr'),
('2018528', 'X11', 'Riley', 'Riley@gmail.com', 'gmiwjdgqko'),
('2018529', 'X11', 'Zoey', 'Zoey@gmail.com', 'vmcqfnvuoc'),
('201853', 'X2', 'Ava', 'Ava@gmail.com', 'eobtiihodp'),
('2018530', 'X11', 'Nora', 'Nora@gmail.com', 'aowzirqbyx'),
('2018531', 'X11', 'Lily', 'Lily@gmail.com', 'kekacvelyr'),
('2018532', 'X11', 'Eleanor', 'Eleanor@gmail.com', 'nellsdvdyj'),
('2018533', 'X11', 'Hannah', 'Hannah@gmail.com', 'asvnspswba'),
('2018534', 'X11', 'Lillian', 'Lillian@gmail.com', 'rlgawerzmr'),
('2018535', 'X11', 'Addison', 'Addison@gmail.com', 'hcgpxnlnrv'),
('2018536', 'X11', 'Aubrey', 'Aubrey@gmail.com', 'lkfwsitonu'),
('2018537', 'X11', 'Ellie', 'Ellie@gmail.com', 'jrusjnejvb'),
('2018538', 'X11', 'Stella', 'Stella@gmail.com', 'hiaatcogee'),
('2018539', 'X11', 'Natalie', 'Natalie@gmail.com', 'zaxffrwcmb'),
('201854', 'X2', 'Isabella', 'Isabella@gmail.com', 'ysaafpulqg'),
('2018540', 'X11', 'Zoe', 'Zoe@gmail.com', 'xmblkkcnyx'),
('2018541', 'X11', 'Leah', 'Leah@gmail.com', 'dtsamdiyui'),
('2018542', 'X11', 'Hazel', 'Hazel@gmail.com', 'hfiyuldsot'),
('2018543', 'X11', 'Violet', 'Violet@gmail.com', 'tiiwisddxt'),
('2018544', 'X11', 'Aurora', 'Aurora@gmail.com', 'ptzsfaoivj'),
('2018545', 'X11', 'Savannah', 'Savannah@gmail.com', 'xvuwocdoga'),
('2018546', 'X11', 'Audrey', 'Audrey@gmail.com', 'qrqzdygkfd'),
('2018547', 'X11', 'Brooklyn', 'Brooklyn@gmail.com', 'dqydlfdafw'),
('2018548', 'X11', 'Bella', 'Bella@gmail.com', 'nqnbhakgyd'),
('2018549', 'X11', 'Claire', 'Claire@gmail.com', 'tjmczpbpaj'),
('201855', 'X2', 'Sophia', 'Sophia@gmail.com', 'vlsydcjaox'),
('2018550', 'X11', 'Skylar', 'Skylar@gmail.com', 'twotoyghqa'),
('2018551', 'X12', 'Emma', 'Emma@gmail.com', 'eijeemjbhf'),
('2018552', 'X12', 'Olivia', 'Olivia@gmail.com', 'bupgylnmps'),
('2018553', 'X12', 'Ava', 'Ava@gmail.com', 'lvamyvguxw'),
('2018554', 'X12', 'Isabella', 'Isabella@gmail.com', 'vmkjadxywt'),
('2018555', 'X12', 'Sophia', 'Sophia@gmail.com', 'botuyjrtfi'),
('2018556', 'X12', 'Charlotte', 'Charlotte@gmail.com', 'pyplgdselu'),
('2018557', 'X12', 'Mia', 'Mia@gmail.com', 'jvvbdauozq'),
('2018558', 'X12', 'Amelia', 'Amelia@gmail.com', 'jxnwuwimdl'),
('2018559', 'X12', 'Harper', 'Harper@gmail.com', 'mdmiyludsu'),
('201856', 'X2', 'Charlotte', 'Charlotte@gmail.com', 'soojeutnxa'),
('2018560', 'X12', 'Evelyn', 'Evelyn@gmail.com', 'rncibudcgn'),
('2018561', 'X12', 'Abigail', 'Abigail@gmail.com', 'gpawaijyfi'),
('2018562', 'X12', 'Emily', 'Emily@gmail.com', 'kzoossscjj'),
('2018563', 'X12', 'Elizabeth', 'Elizabeth@gmail.com', 'jfnvrdsmsf'),
('2018564', 'X12', 'Mila', 'Mila@gmail.com', 'ktxlgvqmqh'),
('2018565', 'X12', 'Ella', 'Ella@gmail.com', 'zgvkubiqwx'),
('2018566', 'X12', 'Avery', 'Avery@gmail.com', 'bedajqxppl'),
('2018567', 'X12', 'Sofia', 'Sofia@gmail.com', 'pvtdgxrtdj'),
('2018568', 'X12', 'Camila', 'Camila@gmail.com', 'jhepavuzpa'),
('2018569', 'X12', 'Aria', 'Aria@gmail.com', 'thdrrufnsc'),
('201857', 'X2', 'Mia', 'Mia@gmail.com', 'vdvdtxdwov'),
('2018570', 'X12', 'Scarlett', 'Scarlett@gmail.com', 'haqtxmwydq'),
('2018571', 'X12', 'Victoria', 'Victoria@gmail.com', 'pkkaqveuzi'),
('2018572', 'X12', 'Madison', 'Madison@gmail.com', 'jfkkhahaef'),
('2018573', 'X12', 'Luna', 'Luna@gmail.com', 'kzlzoyamgq'),
('2018574', 'X12', 'Grace', 'Grace@gmail.com', 'ttcwhvosvr'),
('2018575', 'X12', 'Chloe', 'Chloe@gmail.com', 'pubzeodrxa'),
('2018576', 'X12', 'Penelope', 'Penelope@gmail.com', 'dwiygavnwh'),
('2018577', 'X12', 'Layla', 'Layla@gmail.com', 'avnxicmise'),
('2018578', 'X12', 'Riley', 'Riley@gmail.com', 'uycxdxfiec'),
('2018579', 'X12', 'Zoey', 'Zoey@gmail.com', 'bvsmszjssj'),
('201858', 'X2', 'Amelia', 'Amelia@gmail.com', 'ljlimguser'),
('2018580', 'X12', 'Nora', 'Nora@gmail.com', 'okkcvomaso'),
('2018581', 'X12', 'Lily', 'Lily@gmail.com', 'utjkuuxpbc'),
('2018582', 'X12', 'Eleanor', 'Eleanor@gmail.com', 'rvbejfssjx'),
('2018583', 'X12', 'Hannah', 'Hannah@gmail.com', 'wgnevabymq'),
('2018584', 'X12', 'Lillian', 'Lillian@gmail.com', 'fpafxhfylz'),
('2018585', 'X12', 'Addison', 'Addison@gmail.com', 'dbeoaxscrm'),
('2018586', 'X12', 'Aubrey', 'Aubrey@gmail.com', 'ihcygdvvjl'),
('2018587', 'X12', 'Ellie', 'Ellie@gmail.com', 'ddjnuqpzyd'),
('2018588', 'X12', 'Stella', 'Stella@gmail.com', 'skipgigrjr'),
('2018589', 'X12', 'Natalie', 'Natalie@gmail.com', 'jpwmcrzetk'),
('201859', 'X2', 'Harper', 'Harper@gmail.com', 'plobbkufti'),
('2018590', 'X12', 'Zoe', 'Zoe@gmail.com', 'mggleeahjx'),
('2018591', 'X12', 'Leah', 'Leah@gmail.com', 'odsonhplip'),
('2018592', 'X12', 'Hazel', 'Hazel@gmail.com', 'mslzlinvhd'),
('2018593', 'X12', 'Violet', 'Violet@gmail.com', 'ofpiojgudc'),
('2018594', 'X12', 'Aurora', 'Aurora@gmail.com', 'ncrculgoir'),
('2018595', 'X12', 'Savannah', 'Savannah@gmail.com', 'cmztcnbviy'),
('2018596', 'X12', 'Audrey', 'Audrey@gmail.com', 'iklchhrqfk'),
('2018597', 'X12', 'Brooklyn', 'Brooklyn@gmail.com', 'bqbrgcolcr'),
('2018598', 'X12', 'Bella', 'Bella@gmail.com', 'vodftrmygp'),
('2018599', 'X12', 'Claire', 'Claire@gmail.com', 'wjbycaifqo'),
('20186', 'X1', 'Charlotte', 'Charlotte@gmail.com', 'sockcavhib'),
('201860', 'X2', 'Evelyn', 'Evelyn@gmail.com', 'gjaxjklpav'),
('2018600', 'X12', 'Skylar', 'Skylar@gmail.com', 'llsngkqimp'),
('2018601', 'X13', 'Emma', 'Emma@gmail.com', 'eittxluplc'),
('2018602', 'X13', 'Olivia', 'Olivia@gmail.com', 'jwkkidhkce'),
('2018603', 'X13', 'Ava', 'Ava@gmail.com', 'kfqwipptko'),
('2018604', 'X13', 'Isabella', 'Isabella@gmail.com', 'swffxuisxt'),
('2018605', 'X13', 'Sophia', 'Sophia@gmail.com', 'cmhmvnaehd'),
('2018606', 'X13', 'Charlotte', 'Charlotte@gmail.com', 'aizpyugaep'),
('2018607', 'X13', 'Mia', 'Mia@gmail.com', 'dseswbfson'),
('2018608', 'X13', 'Amelia', 'Amelia@gmail.com', 'wopkqojzjt'),
('2018609', 'X13', 'Harper', 'Harper@gmail.com', 'arjvyzuneo'),
('201861', 'X2', 'Abigail', 'Abigail@gmail.com', 'lenmsxbqxc'),
('2018610', 'X13', 'Evelyn', 'Evelyn@gmail.com', 'prryqjgxtf'),
('2018611', 'X13', 'Abigail', 'Abigail@gmail.com', 'myxdknskun'),
('2018612', 'X13', 'Emily', 'Emily@gmail.com', 'waiotbhtvm'),
('2018613', 'X13', 'Elizabeth', 'Elizabeth@gmail.com', 'ezkxgxsiai'),
('2018614', 'X13', 'Mila', 'Mila@gmail.com', 'berznkprut'),
('2018615', 'X13', 'Ella', 'Ella@gmail.com', 'yccihlzaol'),
('2018616', 'X13', 'Avery', 'Avery@gmail.com', 'wwzhumgkon'),
('2018617', 'X13', 'Sofia', 'Sofia@gmail.com', 'czqcdoqrbq'),
('2018618', 'X13', 'Camila', 'Camila@gmail.com', 'oqqvenypot'),
('2018619', 'X13', 'Aria', 'Aria@gmail.com', 'htothmdneo'),
('201862', 'X2', 'Emily', 'Emily@gmail.com', 'ijkxweuzez'),
('2018620', 'X13', 'Scarlett', 'Scarlett@gmail.com', 'siapbhrhkz'),
('2018621', 'X13', 'Victoria', 'Victoria@gmail.com', 'rcyhscxdys'),
('2018622', 'X13', 'Madison', 'Madison@gmail.com', 'xklfisuwtl'),
('2018623', 'X13', 'Luna', 'Luna@gmail.com', 'pizkbjtnzn'),
('2018624', 'X13', 'Grace', 'Grace@gmail.com', 'hsmmhdeaiv'),
('2018625', 'X13', 'Chloe', 'Chloe@gmail.com', 'mzigfipdpy'),
('2018626', 'X13', 'Penelope', 'Penelope@gmail.com', 'fvaakzfhai'),
('2018627', 'X13', 'Layla', 'Layla@gmail.com', 'oryilhuoiw'),
('2018628', 'X13', 'Riley', 'Riley@gmail.com', 'mupkbfmcmm'),
('2018629', 'X13', 'Zoey', 'Zoey@gmail.com', 'azlehvgpgy'),
('201863', 'X2', 'Elizabeth', 'Elizabeth@gmail.com', 'vgigvkodoj'),
('2018630', 'X13', 'Nora', 'Nora@gmail.com', 'uwfrkuyhqo'),
('2018631', 'X13', 'Lily', 'Lily@gmail.com', 'kcxzeofcrz'),
('2018632', 'X13', 'Eleanor', 'Eleanor@gmail.com', 'vgfsmtuasu'),
('2018633', 'X13', 'Hannah', 'Hannah@gmail.com', 'nvorauktuj'),
('2018634', 'X13', 'Lillian', 'Lillian@gmail.com', 'slvqgarzik'),
('2018635', 'X13', 'Addison', 'Addison@gmail.com', 'oxxboiijrr'),
('2018636', 'X13', 'Aubrey', 'Aubrey@gmail.com', 'lleikgsmov'),
('2018637', 'X13', 'Ellie', 'Ellie@gmail.com', 'nrqiqfcgit'),
('2018638', 'X13', 'Stella', 'Stella@gmail.com', 'jddyiowhzx'),
('2018639', 'X13', 'Natalie', 'Natalie@gmail.com', 'qtbqpdhulr'),
('201864', 'X2', 'Mila', 'Mila@gmail.com', 'oeskgittzu'),
('2018640', 'X13', 'Zoe', 'Zoe@gmail.com', 'piaoxgrtmh'),
('2018641', 'X13', 'Leah', 'Leah@gmail.com', 'allpbodsmt'),
('2018642', 'X13', 'Hazel', 'Hazel@gmail.com', 'iypwypolyz'),
('2018643', 'X13', 'Violet', 'Violet@gmail.com', 'xbxdiqevnv'),
('2018644', 'X13', 'Aurora', 'Aurora@gmail.com', 'squgkypkbn'),
('2018645', 'X13', 'Savannah', 'Savannah@gmail.com', 'fnsncarvqf'),
('2018646', 'X13', 'Audrey', 'Audrey@gmail.com', 'lsqrgarzlr'),
('2018647', 'X13', 'Brooklyn', 'Brooklyn@gmail.com', 'ltnvpxkgzv'),
('2018648', 'X13', 'Bella', 'Bella@gmail.com', 'zsupowrrvc'),
('2018649', 'X13', 'Claire', 'Claire@gmail.com', 'tumuxzcpfh'),
('201865', 'X2', 'Ella', 'Ella@gmail.com', 'sxkboucaud'),
('2018650', 'X13', 'Skylar', 'Skylar@gmail.com', 'ifpbkpewyw'),
('201866', 'X2', 'Avery', 'Avery@gmail.com', 'uartztrlmo'),
('201867', 'X2', 'Sofia', 'Sofia@gmail.com', 'hnizimbixe'),
('201868', 'X2', 'Camila', 'Camila@gmail.com', 'tdoecyvjjk'),
('201869', 'X2', 'Aria', 'Aria@gmail.com', 'dieqwqwswy'),
('20187', 'X1', 'Mia', 'Mia@gmail.com', 'wysbaflazj'),
('201870', 'X2', 'Scarlett', 'Scarlett@gmail.com', 'sqenezsrfd'),
('201871', 'X2', 'Victoria', 'Victoria@gmail.com', 'ozpfoaevix'),
('201872', 'X2', 'Madison', 'Madison@gmail.com', 'cplktuyeji'),
('201873', 'X2', 'Luna', 'Luna@gmail.com', 'gizijajzym'),
('201874', 'X2', 'Grace', 'Grace@gmail.com', 'hbqjhkimve'),
('201875', 'X2', 'Chloe', 'Chloe@gmail.com', 'xsbesfgksx'),
('201876', 'X2', 'Penelope', 'Penelope@gmail.com', 'fmaraqvwlo'),
('201877', 'X2', 'Layla', 'Layla@gmail.com', 'ewirgqhtgu'),
('201878', 'X2', 'Riley', 'Riley@gmail.com', 'sixjvxwkgz'),
('201879', 'X2', 'Zoey', 'Zoey@gmail.com', 'ktrfawwlge'),
('20188', 'X1', 'Amelia', 'Amelia@gmail.com', 'wdimqxottq'),
('201880', 'X2', 'Nora', 'Nora@gmail.com', 'xadluymmoy'),
('201881', 'X2', 'Lily', 'Lily@gmail.com', 'dxuushkuop'),
('201882', 'X2', 'Eleanor', 'Eleanor@gmail.com', 'gofrfsvxnc'),
('201883', 'X2', 'Hannah', 'Hannah@gmail.com', 'jjckdvpijh'),
('201884', 'X2', 'Lillian', 'Lillian@gmail.com', 'ytyuiymmxn'),
('201885', 'X2', 'Addison', 'Addison@gmail.com', 'ijtxrhxhdi'),
('201886', 'X2', 'Aubrey', 'Aubrey@gmail.com', 'mqrzxpfkih'),
('201887', 'X2', 'Ellie', 'Ellie@gmail.com', 'sezrwkxbps'),
('201888', 'X2', 'Stella', 'Stella@gmail.com', 'ngugviusge'),
('201889', 'X2', 'Natalie', 'Natalie@gmail.com', 'aubyaxlavy'),
('20189', 'X1', 'Harper', 'Harper@gmail.com', 'bbszmvgnfq'),
('201890', 'X2', 'Zoe', 'Zoe@gmail.com', 'srabpffvkm'),
('201891', 'X2', 'Leah', 'Leah@gmail.com', 'rfxsdjjhiq'),
('201892', 'X2', 'Hazel', 'Hazel@gmail.com', 'dgrbrnsghk'),
('201893', 'X2', 'Violet', 'Violet@gmail.com', 'nqkaqfoedv'),
('201894', 'X2', 'Aurora', 'Aurora@gmail.com', 'yyeijmbfso'),
('201895', 'X2', 'Savannah', 'Savannah@gmail.com', 'fneyfqqrub'),
('201896', 'X2', 'Audrey', 'Audrey@gmail.com', 'pkmulxazaj'),
('201897', 'X2', 'Brooklyn', 'Brooklyn@gmail.com', 'dqrduqsfwt'),
('201898', 'X2', 'Bella', 'Bella@gmail.com', 'bvkcjlgtwj'),
('201899', 'X2', 'Claire', 'Claire@gmail.com', 'ajhixqknyh');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_validasi`
--

CREATE TABLE `tbl_validasi` (
  `id_validasi` int(10) UNSIGNED NOT NULL,
  `id_absen` int(10) UNSIGNED NOT NULL,
  `id_guru` varchar(10) NOT NULL,
  `waktu_validasi` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_absen`
--
ALTER TABLE `tbl_absen`
  ADD PRIMARY KEY (`id_absen`),
  ADD KEY `id_acara` (`id_acara`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `tbl_absensi_ami`
--
ALTER TABLE `tbl_absensi_ami`
  ADD PRIMARY KEY (`id_absensi_ami`),
  ADD KEY `id_acara` (`id_acara`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `tbl_acara`
--
ALTER TABLE `tbl_acara`
  ADD PRIMARY KEY (`id_acara`),
  ADD KEY `id_kategori` (`id_nama_acara`);

--
-- Indexes for table `tbl_akses`
--
ALTER TABLE `tbl_akses`
  ADD PRIMARY KEY (`id_akses`);

--
-- Indexes for table `tbl_guru`
--
ALTER TABLE `tbl_guru`
  ADD PRIMARY KEY (`id_guru`),
  ADD KEY `id_akses` (`id_akses`);

--
-- Indexes for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `tbl_nama_acara`
--
ALTER TABLE `tbl_nama_acara`
  ADD PRIMARY KEY (`id_nama_acara`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `tbl_validasi`
--
ALTER TABLE `tbl_validasi`
  ADD PRIMARY KEY (`id_validasi`),
  ADD KEY `id_absen` (`id_absen`),
  ADD KEY `id_guru` (`id_guru`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_absen`
--
ALTER TABLE `tbl_absen`
  MODIFY `id_absen` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=551;

--
-- AUTO_INCREMENT for table `tbl_absensi_ami`
--
ALTER TABLE `tbl_absensi_ami`
  MODIFY `id_absensi_ami` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_validasi`
--
ALTER TABLE `tbl_validasi`
  MODIFY `id_validasi` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=452;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_absen`
--
ALTER TABLE `tbl_absen`
  ADD CONSTRAINT `tbl_absen_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `tbl_siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_absen_ibfk_2` FOREIGN KEY (`id_acara`) REFERENCES `tbl_acara` (`id_acara`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_absensi_ami`
--
ALTER TABLE `tbl_absensi_ami`
  ADD CONSTRAINT `tbl_absensi_ami_ibfk_1` FOREIGN KEY (`id_acara`) REFERENCES `tbl_acara` (`id_acara`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_absensi_ami_ibfk_2` FOREIGN KEY (`id_siswa`) REFERENCES `tbl_siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_acara`
--
ALTER TABLE `tbl_acara`
  ADD CONSTRAINT `tbl_acara_ibfk_1` FOREIGN KEY (`id_nama_acara`) REFERENCES `tbl_nama_acara` (`id_nama_acara`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_guru`
--
ALTER TABLE `tbl_guru`
  ADD CONSTRAINT `tbl_guru_ibfk_1` FOREIGN KEY (`id_akses`) REFERENCES `tbl_akses` (`id_akses`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_nama_acara`
--
ALTER TABLE `tbl_nama_acara`
  ADD CONSTRAINT `tbl_nama_acara_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tbl_kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD CONSTRAINT `tbl_siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `tbl_kelas` (`id_kelas`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_validasi`
--
ALTER TABLE `tbl_validasi`
  ADD CONSTRAINT `tbl_validasi_ibfk_1` FOREIGN KEY (`id_guru`) REFERENCES `tbl_guru` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_validasi_ibfk_2` FOREIGN KEY (`id_absen`) REFERENCES `tbl_absen` (`id_absen`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
