-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2025 at 03:42 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spk3`
--

-- --------------------------------------------------------

--
-- Table structure for table `classification`
--

CREATE TABLE `classification` (
  `id_classification` int(11) NOT NULL,
  `classification_name` varchar(50) NOT NULL,
  `classification_point` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classification`
--

INSERT INTO `classification` (`id_classification`, `classification_name`, `classification_point`) VALUES
(1, 'BM', 5),
(2, 'PdM', 4),
(3, 'Rotating work', 4),
(4, 'Static work', 2),
(5, 'NDT', 3),
(6, 'Certification work', 3),
(7, 'VI', 1);

-- --------------------------------------------------------

--
-- Table structure for table `compute_history`
--

CREATE TABLE `compute_history` (
  `id_history` int(11) NOT NULL,
  `computed_by` varchar(100) DEFAULT NULL,
  `computed_at` datetime DEFAULT current_timestamp(),
  `filters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compute_results`
--

CREATE TABLE `compute_results` (
  `id_result` int(11) NOT NULL,
  `history_id` int(11) NOT NULL,
  `id_equipment` int(11) NOT NULL,
  `score` float NOT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `criteria_weight`
--

CREATE TABLE `criteria_weight` (
  `id_criteria` int(11) NOT NULL,
  `criteria_name` varchar(50) NOT NULL,
  `weight` float NOT NULL,
  `type` enum('benefit','cost') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criteria_weight`
--

INSERT INTO `criteria_weight` (`id_criteria`, `criteria_name`, `weight`, `type`) VALUES
(1, 'Classification', 0.3, 'benefit'),
(2, 'Grade', 0.3, 'benefit'),
(3, 'Inspection Period', 0.4, 'cost');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id_equipment` int(11) NOT NULL,
  `equipment_name` varchar(100) NOT NULL,
  `inspection_name` varchar(100) NOT NULL,
  `id_grade` int(11) NOT NULL,
  `id_classification` int(11) NOT NULL,
  `id_inspection_period` int(11) NOT NULL,
  `id_last_inspection` int(4) NOT NULL,
  `id_plant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id_equipment`, `equipment_name`, `inspection_name`, `id_grade`, `id_classification`, `id_inspection_period`, `id_last_inspection`, `id_plant`) VALUES
(1, 'F-1725 Agitator', 'Bottom Bearing Check & Change', 9, 3, 1, 1, 1),
(2, 'F-1725 Agitator', 'Mechanical seal replace and overhaul', 9, 3, 2, 2, 1),
(3, 'F-1725 Agitator', 'Middle bearing and chain coupling replace', 9, 3, 3, 3, 1),
(4, 'F-1725 Agitator', 'PT check at impeller and bottom bearing support', 9, 5, 1, 1, 1),
(5, 'F-1726 Agitator', 'Bottom Bearing Check & Change', 8, 3, 1, 1, 1),
(6, 'F-1726 Agitator', 'Gear Reducer overhaul', 8, 3, 3, 3, 1),
(7, 'F-1726 Agitator', 'Mechanical seal replace and overhaul', 8, 3, 2, 2, 1),
(8, 'F-1726 Agitator', 'PT check at gear', 8, 5, 2, 2, 1),
(9, 'F-1726 Agitator', 'PT check at impeller and bottom bearing support', 8, 5, 1, 1, 1),
(10, 'D-1731 Agitator', 'Bottom Bearing Check & Change', 7, 3, 1, 1, 1),
(11, 'D-1731 Agitator', 'Gear Reducer overhaul', 7, 3, 2, 2, 1),
(12, 'D-1731 Agitator', 'Inspection at phase jet impeller (tightening bolt inspection)', 7, 3, 1, 1, 1),
(13, 'D-1731 Agitator', 'Mechanical seal replace and overhaul', 7, 3, 2, 2, 1),
(14, 'D-1731 Agitator', 'PT check at gear', 7, 5, 3, 3, 1),
(15, 'D-1731 Agitator', 'PT check at impeller, slinger disk and bottom bearing support', 7, 5, 1, 1, 1),
(16, 'AG-1731 Oil pump No.1', 'Pump Overhaul (Replace with spare unit)', 7, 2, 2, 2, 1),
(17, 'AG-1731 Oil pump No.2', 'Pump Overhaul (Replace with spare unit)', 7, 2, 2, 2, 1),
(18, 'D-1732 Agitator', 'Bottom Bearing Check & Change', 7, 3, 1, 1, 1),
(19, 'D-1732 Agitator', 'Gear Reducer overhaul', 7, 3, 2, 2, 1),
(20, 'D-1732 Agitator', 'Mechanical seal replace and overhaul', 7, 3, 2, 2, 1),
(21, 'D-1732 Agitator', 'PT check at gear', 7, 5, 2, 2, 1),
(22, 'D-1732 Agitator', 'PT check at impeller, slinger disk and bottom bearing support', 7, 5, 1, 1, 1),
(23, 'AG-1732 Oil pump No.1', 'Pump Overhaul', 7, 2, 2, 2, 1),
(24, 'AG-1732 Oil pump No.2', 'Pump Overhaul', 7, 2, 2, 2, 1),
(25, 'D-1735 Agitator', 'Bottom Bearing Check & Change', 7, 3, 1, 1, 1),
(26, 'D-1735 Agitator', 'Gear Reducer overhaul', 7, 3, 2, 2, 1),
(27, 'D-1735 Agitator', 'Mechanical seal replace and overhaul', 7, 3, 2, 2, 1),
(28, 'D-1735 Agitator', 'PT check at gear', 7, 5, 3, 3, 1),
(29, 'D-1735 Agitator', 'PT check at impeller, slinger disk and bottom bearing support', 7, 5, 1, 1, 1),
(30, 'AG-1735 Oil pump No.1', 'Pump Overhaul', 7, 2, 2, 2, 1),
(31, 'AG-1735 Oil pump No.2', 'Pump Overhaul', 7, 2, 2, 2, 1),
(32, 'D-1736 Agitator', 'Bottom Bearing Check & Change', 8, 3, 1, 1, 1),
(33, 'D-1736 Agitator', 'Gear Reducer overhaul', 8, 3, 2, 2, 1),
(34, 'D-1736 Agitator', 'Mechanical seal replace and overhaul', 8, 3, 2, 2, 1),
(35, 'D-1736 Agitator', 'PT check at gear', 8, 5, 3, 3, 1),
(36, 'D-1736 Agitator', 'PT check at impeller and bottom bearing support', 8, 5, 1, 1, 1),
(37, 'F-1741 Agitator', 'Mechanical seal replace and overhaul', 8, 3, 2, 2, 1),
(38, 'F-1741 Agitator', 'Middle bearing and chain coupling replace', 8, 3, 3, 3, 1),
(39, 'F-1741 Agitator', 'PT check of impeller', 8, 5, 1, 1, 1),
(40, 'D-1751 Agitator', 'Mechanical seal overhaul (Include Middle bearing)', 8, 3, 2, 2, 1),
(41, 'F-1756 Agitator', 'Mechanical seal replace and overhaul', 8, 3, 2, 2, 1),
(42, 'F-1756 Agitator', 'Middle bearing and chain coupling replace', 8, 3, 3, 3, 1),
(43, 'F-1756 Agitator', 'PT check of impeller', 8, 5, 1, 1, 1),
(44, 'D-1771 Agitator', 'Bottom Bearing Check & Change', 9, 3, 1, 1, 1),
(45, 'D-1771 Agitator', 'Gland packing (Bottom side) replace', 9, 3, 1, 1, 1),
(46, 'D-1771 Agitator', 'Gland packing (Top side) replace', 9, 8, 1, 1, 1),
(47, 'D-1771 Agitator', 'Gear Reducer overhaul\n Middle bearing replace', 9, 3, 2, 2, 1),
(48, 'D-1771 Agitator', 'PT check at bottom bearing support', 9, 5, 2, 2, 1),
(49, 'D-1722 Agitator', 'Bottom Bearing Check & Change', 9, 3, 1, 1, 1),
(50, 'D-1722 Agitator', 'Mechanical seal replace and overhaul', 9, 3, 2, 2, 1),
(51, 'D-1722 Agitator', 'Middle bearing and chain coupling replace', 9, 3, 3, 3, 1),
(52, 'D-1722 Agitator', 'PT check at impeller and bottom bearing support', 9, 5, 1, 1, 1),
(53, 'Air Compressor', 'Bearing & Shaft seal check', 7, 3, 1, 1, 1),
(54, 'Air Compressor', 'Gear Check', 7, 3, 2, 2, 1),
(55, 'Air Compressor', 'Impeller Cleaning', 7, 3, 2, 2, 1),
(56, 'Air Compressor', 'PT check at bull gear, 1st/2nd/3rd/4th/5th gear', 7, 5, 2, 2, 1),
(57, 'Air Compressor', 'Open Diffuser Casing, VI', 7, 3, 2, 2, 1),
(58, 'Air Compressor', 'PT check all of bearing, inlet diffuser stiffeners 1st stage, impeller, guide vane blade', 7, 5, 2, 2, 1),
(59, 'Air Compressor', 'UT at HP and LP thrust collar', 7, 5, 2, 2, 1),
(60, 'Gas Expander', 'Bearing & Shaft seal check', 7, 3, 2, 2, 1),
(61, 'Gas Expander', 'Gear Check', 7, 3, 2, 2, 1),
(62, 'Gas Expander', 'Impeller Cleaning', 7, 3, 2, 2, 1),
(63, 'Gas Expander', 'PT check at bull gear, HP and LP pinion gear', 7, 5, 2, 2, 1),
(64, 'Gas Expander', 'Open Diffuser Casing, VI', 7, 3, 2, 2, 1),
(65, 'Gas Expander', 'PT check all of bearing, inlet diffuser stiffeners 1st stage, impeller, HP and LP guide vane blade', 7, 5, 2, 2, 1),
(66, 'Gas Expander', 'UT at HP and LP thrust collar', 7, 5, 2, 2, 1),
(67, 'Gas Expander', 'Inspection of expansion joint', 7, 4, 2, 2, 1),
(68, 'Steam Turbine', 'Bearing & Shaft seal check', 7, 3, 1, 1, 1),
(69, 'Steam Turbine', 'Measure length of casing bolt', 7, 3, 2, 2, 1),
(70, 'Steam Turbine', 'Open Rotor Casing, VI', 7, 3, 2, 2, 1),
(71, 'Steam Turbine', 'PT check at bearing and rotor of steam turbine', 7, 5, 2, 2, 1),
(72, 'Steam Turbine', 'Rotor & Stator Cleaning', 7, 3, 2, 2, 1),
(73, 'Steam Turbine', 'UT at HP and LP thrust collar', 7, 5, 2, 2, 1),
(74, 'Steam Turbine', 'Overhaul Vent Gas Blower', 7, 3, 2, 2, 1),
(75, '1st Oxidation Reactor', 'Open Manhole and cleaning', 7, 4, 1, 1, 1),
(76, '1st Oxidation Reactor', 'PT check at bottom pads (Pipe support and baffle support)', 7, 5, 1, 1, 1),
(77, '1st Oxidation Reactor', 'PT check at top and middle pads (Pipe support and baffle support)', 7, 5, 1, 1, 1),
(78, '1st Oxidation Reactor', 'Replace gland packing at flush bottom valve', 7, 4, 2, 2, 1),
(79, '1st Oxidation Reactor', 'Visual Inspection', 7, 7, 1, 1, 1),
(80, '2nd Oxidation Reactor', 'Open Manhole and cleaning', 7, 4, 1, 1, 1),
(81, '2nd Oxidation Reactor', 'PT check at Pipe support and baffle support pads', 7, 5, 2, 2, 1),
(82, '2nd Oxidation Reactor', 'Replace gland packing at flush bottom valve', 7, 4, 2, 2, 1),
(83, '2nd Oxidation Reactor', 'Visual Inspection', 7, 7, 2, 2, 1),
(84, '1st Crystallizer', 'Open Manhole and cleaning', 7, 4, 1, 1, 1),
(85, '1st Crystallizer', 'PT check at support pad and all nozzle', 7, 5, 2, 2, 1),
(86, '1st Crystallizer', 'Visual Inspection', 7, 7, 2, 2, 1),
(87, '2nd Crystallizer', 'Open Manhole and cleaning', 7, 4, 1, 1, 1),
(88, '2nd Crystallizer', 'PT check at support pad and all nozzle', 7, 5, 1, 1, 1),
(89, '2nd Crystallizer', 'Visual Inspection', 7, 7, 1, 1, 1),
(90, 'High Pressure Absorber', 'Open Manhole & Manway, Cleaning', 7, 4, 2, 2, 1),
(91, 'High Pressure Absorber', 'Visual Inspection', 7, 7, 2, 2, 1),
(92, 'Vent Gas Scrubber', 'Open Bottom Manhole (for inspection Pad nozzle leakage)', 9, 4, 2, 2, 1),
(93, 'Vent Gas Scrubber', 'Open Manhole and cleaning', 9, 4, 2, 2, 1),
(94, 'Vent Gas Scrubber', 'Inspection the telerate packing (Replace Packing and cleaning if need)', 9, 4, 2, 2, 1),
(95, 'Vent Gas Scrubber', 'Visual Inspection', 9, 7, 2, 2, 1),
(96, 'Dryer Gas Scruber', 'Open Manhole, Manway, Take out eliminator and cleaning', 9, 4, 1, 1, 1),
(97, 'Dryer Gas Scruber', 'Visual Inspection', 9, 7, 1, 1, 1),
(98, 'Dryer Gas Scruber', 'Open Manhole, Manway, Take out eliminator and cleaning', 9, 4, 1, 1, 1),
(99, 'Dryer Gas Scruber', 'Visual Inspection', 9, 7, 1, 1, 1),
(100, 'Atmospheric Absorber', 'Open Bottom Manhole (for inspection Pad nozzle leakage)', 8, 4, 2, 2, 1),
(101, 'Atmospheric Absorber', 'Open Manhole and cleaning', 8, 4, 2, 2, 1),
(102, 'Atmospheric Absorber', 'Inspection the telerate packing (Replace Packing and cleaning if need)', 8, 4, 2, 2, 1),
(103, 'Atmospheric Absorber', 'Visual Inspection', 8, 7, 2, 2, 1),
(104, 'Striper Still Pot', 'Open and Inspection Expansion Joint', 7, 4, 2, 2, 1),
(105, 'Striper Still Pot', 'Open Manhole and cleaning', 7, 4, 1, 1, 1),
(106, 'Striper Still Pot', 'PT at nozzle and weld line', 7, 5, 1, 1, 1),
(107, 'Striper Still Pot', 'Thickness check at shell (Fix point)', 7, 5, 2, 2, 1),
(108, 'Striper Still Pot', 'Visual Inspection', 7, 7, 1, 1, 1),
(109, 'Solvent Stripper', 'Open Manhole & Manway, Cleaning', 7, 4, 1, 1, 1),
(110, 'Solvent Stripper', 'PT Check at Support ring weld line #1~#5, Top head circumference weld line', 7, 5, 1, 1, 1),
(111, 'Solvent Stripper', 'Thickness check at shell (Fix point)', 7, 5, 1, 1, 1),
(112, 'Solvent Stripper', 'Visual Inspection', 7, 7, 1, 1, 1),
(113, 'Dehydration Tower', 'Inspection nozzle from middle to bottom (Flange surface check *galvanic corrosion)', 7, 4, 2, 2, 1),
(114, 'Dehydration Tower', 'Open Manhole & Manway , Cleaning', 7, 4, 1, 1, 1),
(115, 'Dehydration Tower', 'PT Check at N-5 nozzle sleeve weld line', 7, 5, 2, 2, 1),
(116, 'Dehydration Tower', 'Thickness check at shell (Fix point)', 7, 5, 1, 1, 1),
(117, 'Dehydration Tower', 'Visual Inspection', 7, 7, 1, 1, 1),
(118, 'Methyl Acetate Absorber', 'Open Manhole & Manway, Cleaning', 7, 4, 2, 2, 1),
(119, 'Methyl Acetate Absorber', 'Inspection the telerate packing (Replace Packing and cleaning if need)', 7, 4, 2, 2, 1),
(120, 'Methyl Acetate Absorber', 'Visual Inspection', 7, 7, 2, 2, 1),
(121, 'NBA Distillation Tower', 'Open Manhole & Manway, Cleaning', 7, 4, 4, 4, 1),
(122, 'NBA Distillation Tower', 'Visual Inspection', 7, 7, 4, 4, 1),
(123, 'Residue Evaporator', 'Open Manhole and cleaning', 9, 4, 1, 1, 1),
(124, 'Residue Evaporator', 'Visual Inspection', 9, 7, 1, 1, 1),
(125, 'Residue Crystallizer', 'Open Manhole and cleaning', 8, 4, 1, 1, 1),
(126, 'Residue Crystallizer', 'Visual Inspection', 8, 7, 1, 1, 1),
(127, 'I G Scrubber', 'Open Handhole and cleaning', 8, 4, 3, 3, 1),
(128, 'I G Scrubber', 'Inspection the telerate packing (Replace Packing and cleaning if need)', 8, 7, 3, 3, 1),
(129, 'I G Scrubber', 'Visual Inspection', 8, 7, 3, 3, 1),
(130, 'NEW IG Scrubber', 'Open Handhole and cleaning', 8, 4, 2, 2, 1),
(131, 'NEW IG Scrubber', 'Inspection the telerate packing (Replace Packing and cleaning if need)', 8, 7, 2, 2, 1),
(132, 'NEW IG Scrubber', 'Visual Inspection', 8, 7, 2, 2, 1),
(133, 'I G PSA Drum', 'Open Handhole and cleaning', 8, 4, 1, 1, 1),
(134, 'I G PSA Drum', 'Replace Carbon active and silica gel', 8, 4, 1, 1, 1),
(135, 'I G PSA Drum', 'Open Handhole and cleaning', 8, 4, 1, 1, 1),
(136, 'I G PSA Drum', 'Replace Carbon active and silica gel', 8, 4, 1, 1, 1),
(137, 'C-1711 Lube Oil Cooler', 'Open Channel cover, Take out tube bundle and cleaning', 7, 4, 1, 1, 1),
(138, 'C-1711 Lube Oil Cooler', 'Visual Inspection', 7, 7, 1, 1, 1),
(139, 'C-1711 No. 1 Cooler', 'Open Cover and Manhole, T/O Tube Bundle and Chemical Circulation Cleaning', 7, 4, 1, 1, 1),
(140, 'C-1711 No. 1 Cooler', 'Take out & cleaning demister', 7, 4, 2, 2, 1),
(141, 'C-1711 No. 1 Cooler', 'Change Demister', 7, 4, 2, 2, 1),
(142, 'C-1711 No. 1 Cooler', 'Tube Eddy current Examinationï¼Ÿ', 7, 7, 1, 1, 1),
(143, 'C-1711 No. 1 Cooler', 'Tube Eddy current Examination', 7, 5, 2, 2, 1),
(144, 'C-1711 No.2 Cooler', 'Open Cover and Manhole, T/O Tube Bundle and Chemical Circulation Cleaning', 7, 4, 1, 1, 1),
(145, 'C-1711 No.2 Cooler', 'Take out & cleaning demister', 7, 4, 2, 2, 1),
(146, 'C-1711 No.2 Cooler', 'Change Demister', 7, 4, 2, 2, 1),
(147, 'C-1711 No.2 Cooler', 'Tube Eddy current Examinationï¼Ÿ', 7, 7, 1, 1, 1),
(148, 'C-1711 No.2 Cooler', 'Tube Eddy current Examination', 7, 5, 2, 2, 1),
(149, 'C-1711 No.3 Cooler', 'Open Cover and Manhole, T/O Tube Bundle and Chemical Circulation Cleaning', 7, 4, 1, 1, 1),
(150, 'C-1711 No.3 Cooler', 'Take out & cleaning demister', 7, 4, 2, 2, 1),
(151, 'C-1711 No.3 Cooler', 'Change Demister', 7, 4, 2, 2, 1),
(152, 'C-1711 No.3 Cooler', 'Tube Eddy current Examinationï¼Ÿ', 7, 7, 1, 1, 1),
(153, 'C-1711 No.3 Cooler', 'Tube Eddy current Examination', 7, 5, 2, 2, 1),
(154, 'Off Gas Heater', 'Take out Channel cover, Tube Bundle and cleaning (Tube Cleaning by mini jetter)', 7, 4, 1, 1, 1),
(155, 'Off Gas Heater', 'Visual Inspection', 7, 7, 1, 1, 1),
(156, 'Off Gas Heater', 'Take out Channel cover and cleaning (Tube Cleaning by mini jetter)', 7, 4, 1, 1, 1),
(157, 'Off Gas Heater', 'Tube Eddy current Examination', 7, 5, 1, 1, 1),
(158, 'Off Gas Heater', 'Visual Inspection', 7, 7, 1, 1, 1),
(159, 'Off Gas Reheater', 'Take out Channel cover and cleaning (Tube Cleaning by mini jetter)', 7, 4, 2, 2, 1),
(160, 'Off Gas Reheater', 'Tube Eddy current Examination', 7, 5, 2, 2, 1),
(161, 'Off Gas Reheater', 'Visual Inspection', 7, 7, 2, 2, 1),
(162, 'C-1713 Condenser', 'Open Channel Cover and Cleaning (Tube cleaning by Jetter)', 7, 4, 2, 2, 1),
(163, 'C-1713 Condenser', 'Visual Inspection', 7, 7, 2, 2, 1),
(164, 'Ejector Condenser', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 7, 4, 5, 5, 1),
(165, 'Ejector Condenser', 'Tube Eddy current Examination', 7, 5, 5, 5, 1),
(166, 'Ejector Condenser', 'Visual Inspection', 7, 7, 5, 5, 1),
(167, 'D-1731 1st Condenser', 'Open Cover and cleaning (Tube Cleaning by Jetter)', 7, 4, 4, 4, 1),
(168, 'D-1731 1st Condenser', 'UT at CW0,1,2,3,4, LW1,2', 7, 5, 1, 1, 1),
(169, 'D-1731 1st Condenser', 'UT at N-1,2,3,4 nozzle', 7, 5, 1, 1, 1),
(170, 'D-1731 1st Condenser', 'Visual Inspection', 7, 7, 4, 4, 1),
(171, 'D-1731 1st Condenser', 'Tube Eddy current Examination', 7, 5, 2, 2, 1),
(172, 'D-1731 2nd Condenser', 'Open Cover and cleaning (Tube Cleaning by Jetter)', 7, 4, 4, 4, 1),
(173, 'D-1731 2nd Condenser', 'UT at CW0,1,2,3,4, LW1,2', 7, 5, 1, 1, 1),
(174, 'D-1731 2nd Condenser', 'UT at N-1,2,3,4 nozzle', 7, 5, 1, 1, 1),
(175, 'D-1731 2nd Condenser', 'Tube Eddy current Examinationï¼Ÿ', 7, 7, 4, 4, 1),
(176, 'D-1731 2nd Condenser', 'Tube Eddy current Examination', 7, 5, 2, 2, 1),
(177, 'D-1731 3rd Condenser', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 7, 4, 6, 1, 1),
(178, 'D-1731 3rd Condenser', 'Tube Eddy current Examinationï¼Ÿ', 7, 7, 6, 1, 1),
(179, 'D-1731 Condenser', 'Open Cover and cleaning (Tube Cleaning by jetter)', 7, 4, 6, 1, 1),
(180, 'D-1731 Condenser', 'Tube Eddy current Examination', 7, 5, 6, 1, 1),
(181, 'D-1731 Condenser', 'Visual Inspection', 7, 7, 6, 1, 1),
(182, 'D-1731 4th Condenser', 'Open Cover and demister, cleaning tube and demister (by Jetter)', 7, 4, 4, 4, 1),
(183, 'D-1731 4th Condenser', 'PT check at Tube seal weld', 7, 5, 4, 4, 1),
(184, 'D-1731 4th Condenser', 'Tube Eddy current Examination', 7, 5, 2, 2, 1),
(185, 'D-1731 4th Condenser', 'Visual Inspection', 7, 7, 4, 4, 1),
(186, 'D-1731 5th Condenser', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 8, 4, 4, 4, 1),
(187, 'D-1731 5th Condenser', 'PT check at Tube seal weld', 8, 5, 4, 4, 1),
(188, 'D-1731 5th Condenser', 'Tube Eddy current Examination', 8, 5, 4, 4, 1),
(189, 'D-1731 5th Condenser', 'Visual Inspection', 8, 7, 4, 4, 1),
(190, 'D-1732 Condenser', 'Open Cover and cleaning (Tube Cleaning by jetter)', 8, 4, 3, 3, 1),
(191, 'D-1732 Condenser', 'Tube Eddy current Examinationï¼Ÿ', 8, 7, 3, 3, 1),
(192, 'D-1732 Condenser', 'Tube Eddy current Examination', 8, 5, 2, 2, 1),
(193, 'D-1732 Vent Condenser', 'Open Cover and cleaning (Tube Cleaning by jetter)', 8, 4, 3, 3, 1),
(194, 'D-1732 Vent Condenser', 'Tube Eddy current Examinationï¼Ÿ', 8, 7, 3, 3, 1),
(195, 'D-1732 Vent Condenser', 'Tube Eddy current Examination', 8, 5, 2, 2, 1),
(196, 'LSQ Cooler', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 9, 4, 2, 2, 1),
(197, 'LSQ Cooler', 'PT check at Tube seal weld', 9, 5, 2, 2, 1),
(198, 'LSQ Cooler', 'Tube Eddy current Examination', 9, 5, 2, 2, 1),
(199, 'LSQ Cooler', 'Visual Inspection', 9, 7, 2, 2, 1),
(200, 'D-1736 1 st Condenser', 'Open Cover and cleaning (Tube Cleaning by Jetter)', 8, 4, 1, 1, 1),
(201, 'D-1736 1 st Condenser', 'PT Check at seal weld and channel cover', 8, 5, 1, 1, 1),
(202, 'D-1736 1 st Condenser', 'Tube Eddy current Examination', 8, 5, 1, 1, 1),
(203, 'D-1736 1 st Condenser', 'Visual Inspection', 8, 7, 1, 1, 1),
(204, 'D-1736 2 nd Condenser', 'Open Cover and cleaning (Tube Cleaning by Jetter)', 9, 4, 2, 2, 1),
(205, 'D-1736 2 nd Condenser', 'PT check at Tube seal weld', 9, 5, 2, 2, 1),
(206, 'D-1736 2 nd Condenser', 'Tube Eddy current Examination', 9, 5, 2, 2, 1),
(207, 'D-1736 2 nd Condenser', 'Visual Inspection', 9, 7, 2, 2, 1),
(208, 'D-1736 3 rd Coooler', 'Open Cover and cleaning (Tube Cleaning by Jetter)', 9, 4, 2, 2, 1),
(209, 'D-1736 3 rd Coooler', 'PT check at Tube seal weld', 9, 5, 2, 2, 1),
(210, 'D-1736 3 rd Coooler', 'Tube Eddy current Examination', 9, 5, 2, 2, 1),
(211, 'D-1736 3 rd Coooler', 'Visual Inspection', 9, 7, 2, 2, 1),
(212, 'D-1738 1 st Cooler', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 8, 4, 2, 2, 1),
(213, 'D-1738 1 st Cooler', 'PT Check at seal weld and channel cover', 8, 5, 2, 2, 1),
(214, 'D-1738 1 st Cooler', 'Tube Eddy current Examination', 8, 5, 2, 2, 1),
(215, 'D-1738 1 st Cooler', 'Visual Inspection', 8, 7, 2, 2, 1),
(216, 'D-1738 2 nd Cooler', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 8, 4, 2, 2, 1),
(217, 'D-1738 2 nd Cooler', 'PT Check at seal weld and channel cover', 8, 5, 2, 2, 1),
(218, 'D-1738 2 nd Cooler', 'Tube Eddy current Examination', 8, 5, 2, 2, 1),
(219, 'D-1738 2 nd Cooler', 'Visual Inspection', 8, 7, 2, 2, 1),
(220, 'D-1738 3 rd Cooler', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 8, 4, 2, 2, 1),
(221, 'D-1738 3 rd Cooler', 'PT Check at seal weld and channel cover', 8, 5, 2, 2, 1),
(222, 'D-1738 3 rd Cooler', 'Tube Eddy current Examination', 8, 5, 4, 4, 1),
(223, 'D-1738 3 rd Cooler', 'Visual Inspection', 8, 7, 4, 4, 1),
(224, 'M-1741 Gas Condenser', 'Open Cover and cleaning (Tube Cleaning by jetter)', 8, 4, 2, 2, 1),
(225, 'M-1741 Gas Condenser', 'Tube Eddy current Examination', 8, 5, 2, 2, 1),
(226, 'M-1741 Gas Condenser', 'Visual Inspection', 8, 7, 2, 2, 1),
(227, 'C-1741 HAC Cooler', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 9, 4, 2, 2, 1),
(228, 'C-1741 HAC Cooler', 'Tube Eddy current Examination', 9, 5, 4, 4, 1),
(229, 'C-1741 HAC Cooler', 'Visual Inspection', 9, 7, 2, 2, 1),
(230, 'M-1741 Gas Heater', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 9, 4, 2, 2, 1),
(231, 'M-1741 Gas Heater', 'Tube Eddy current Examination', 9, 5, 4, 4, 1),
(232, 'M-1741 Gas Heater', 'Visual Inspection', 9, 7, 2, 2, 1),
(233, 'D-1751-B Feed Cooler', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 8, 4, 2, 2, 1),
(234, 'D-1751-B Feed Cooler', 'PT Check at Tube seal weld', 8, 5, 1, 1, 1),
(235, 'D-1751-B Feed Cooler', 'Tube Eddy current Examination', 8, 5, 2, 2, 1),
(236, 'D-1751-B Feed Cooler', 'Visual Inspection', 8, 7, 2, 2, 1),
(237, 'D-1752 Feed Cooler', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 9, 4, 2, 2, 1),
(238, 'D-1752 Feed Cooler', 'PT Check at Tube seal weld', 9, 5, 2, 2, 1),
(239, 'D-1752 Feed Cooler', 'Tube Eddy current Examination', 9, 5, 2, 2, 1),
(240, 'D-1752 Feed Cooler', 'Visual Inspection', 9, 7, 2, 2, 1),
(241, 'Dryer Gas Heater', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 9, 4, 1, 1, 1),
(242, 'Dryer Gas Heater', 'PT check at Tube seal weld', 9, 5, 2, 2, 1),
(243, 'Dryer Gas Heater', 'Tube Eddy current Examination', 9, 5, 2, 2, 1),
(244, 'Dryer Gas Heater', 'Visual Inspection', 9, 7, 2, 2, 1),
(245, 'Gas Heater of Dryer Gas', 'Open Cover, T/O Tube Bundle and Cleaning (Tube Cleaning by mini jetter)', 9, 4, 1, 1, 1),
(246, 'Gas Heater of Dryer Gas', 'Visual Inspection', 9, 7, 1, 1, 1),
(247, 'Gas Heater of Dryer Gas', 'Tube Eddy current Examination', 9, 5, 2, 2, 1),
(248, 'D-1761 Reboiler', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 9, 4, 1, 1, 1),
(249, 'D-1761 Reboiler', 'Tube Eddy current Examinationï¼Ÿ', 9, 7, 2, 2, 1),
(250, 'D-1761 Reboiler', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 9, 4, 2, 2, 1),
(251, 'D-1761 Reboiler', 'Tube Eddy current Examinationï¼Ÿ', 9, 7, 2, 2, 1),
(252, 'PX Heater', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 7, 4, 2, 2, 1),
(253, 'PX Heater', 'Visual Inspection', 7, 7, 4, 4, 1),
(254, 'PX Heater', 'Tube Eddy current Examination', 7, 5, 2, 2, 1),
(255, 'D-1764 HAC Cooler', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 9, 4, 1, 1, 1),
(256, 'D-1764 HAC Cooler', 'PT check at Tube seal weld', 9, 5, 1, 1, 1),
(257, 'D-1764 HAC Cooler', 'Tube Eddy current Examination', 9, 5, 1, 1, 1),
(258, 'D-1764 HAC Cooler', 'Visual Inspection', 9, 7, 1, 1, 1),
(259, 'D-1764 Reboiler', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 7, 4, 1, 1, 1),
(260, 'D-1764 Reboiler', 'Tube Eddy current Examinationï¼Ÿ', 7, 7, 1, 1, 1),
(261, 'D-1764 Condenser', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 7, 4, 4, 4, 1),
(262, 'D-1764 Condenser', 'Tube Eddy current Examination', 7, 5, 4, 4, 1),
(263, 'D-1764 Condenser', 'Visual Inspection', 7, 7, 4, 4, 1),
(264, 'D-1764 Condenser', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 7, 4, 4, 4, 1),
(265, 'D-1764 Condenser', 'Tube Eddy current Examination', 7, 5, 4, 4, 1),
(266, 'D-1764 Condenser', 'Visual Inspection', 7, 7, 4, 4, 1),
(267, 'F-1766 Condenser', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 9, 4, 1, 1, 1),
(268, 'F-1766 Condenser', 'PT check at Tube seal weld', 9, 5, 1, 1, 1),
(269, 'F-1766 Condenser', 'Tube Eddy current Examination', 9, 5, 6, 1, 1),
(270, 'F-1766 Condenser', 'Visual Inspection', 9, 7, 1, 1, 1),
(271, 'F-1766 Vent Condenser', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 9, 4, 5, 5, 1),
(272, 'F-1766 Vent Condenser', 'PT check at Tube seal weld', 9, 5, 5, 5, 1),
(273, 'F-1766 Vent Condenser', 'Visual Inspection', 9, 7, 5, 5, 1),
(274, 'F-1766B Condensate Cooler', 'Open Cover and cleaning', 9, 4, 1, 1, 1),
(275, 'F-1766B Condensate Cooler', 'Visual Inspection', 9, 7, 1, 1, 1),
(276, 'E-1765 B Condenser', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 9, 4, 1, 1, 1),
(277, 'E-1765 B Condenser', 'PT check at Tube seal weld', 9, 5, 1, 1, 1),
(278, 'E-1765 B Condenser', 'Visual Inspection', 9, 7, 1, 1, 1),
(279, 'PX Side Cut Condenser', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 9, 4, 1, 1, 1),
(280, 'PX Side Cut Condenser', 'PT check at Tube seal weld', 9, 5, 1, 1, 1),
(281, 'PX Side Cut Condenser', 'Tube Eddy current Examination', 9, 5, 6, 1, 1),
(282, 'PX Side Cut Condenser', 'Visual Inspection', 9, 7, 1, 1, 1),
(283, 'D-1769-A/B Cooler\n (compa block)', 'Open Cover and cleaning', 9, 4, 1, 1, 1),
(284, 'D-1769-A/B Cooler\n (compa block)', 'Visual Inspection', 9, 7, 1, 1, 1),
(285, 'D-1769 Reboiler\n (compa block)', 'Open Cover and cleaning', 9, 4, 1, 1, 1),
(286, 'D-1769 Reboiler\n (compa block)', 'Visual Inspection', 9, 7, 1, 1, 1),
(287, 'D-1769 Condenser', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 8, 4, 1, 1, 1),
(288, 'D-1769 Condenser', 'PT check at Tube seal weld', 8, 5, 1, 1, 1),
(289, 'D-1769 Condenser', 'Tube Eddy current Examination', 9, 5, 6, 1, 1),
(290, 'D-1769 Condenser', 'Visual Inspection', 8, 7, 1, 1, 1),
(291, 'D-1771 Condenser', 'Open Cover and cleaning (Tube Cleaning by jetter)', 9, 4, 4, 4, 1),
(292, 'D-1771 Condenser', 'Tube Eddy current Examination', 9, 5, 4, 4, 1),
(293, 'D-1771 Condenser', 'Visual Inspection', 9, 7, 4, 4, 1),
(294, 'D-1771 Vent Condenser', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 9, 4, 4, 4, 1),
(295, 'D-1771 Vent Condenser', 'Tube Eddy current Examination', 9, 5, 2, 2, 1),
(296, 'D-1771 Vent Condenser', 'Visual Inspection', 9, 7, 4, 4, 1),
(297, '2M-1741 BW Heater', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 9, 4, 4, 4, 1),
(298, '2M-1741 BW Heater', 'Visual Inspection', 9, 7, 4, 4, 1),
(299, '2M-1741 BW Heater', 'Tube Eddy current Examination', 9, 5, 2, 2, 1),
(300, 'NaOH Heater', 'Open Cover and cleaning (Tube Cleaning by mini jetter)', 9, 4, 4, 4, 1),
(301, 'NaOH Heater', 'Visual Inspection', 9, 7, 4, 4, 1),
(302, 'NaOH Heater', 'Tube Eddy current Examination', 9, 5, 2, 2, 1),
(303, 'C-1711 Lube Oil Tank', 'Cleaning & Oil Replace', 9, 4, 2, 2, 1),
(304, 'C-1711 Lube Oil Tank', 'Open Manhole Inside Tank', 9, 4, 2, 2, 1),
(305, 'Over Head Tank', 'Open Mnahole and Cleaning', 9, 4, 2, 2, 1),
(306, 'Over Head Tank', 'Visual Inspection', 9, 7, 2, 2, 1),
(307, 'HBR Tank', 'Open / Close manhole', 8, 4, 2, 2, 1),
(308, 'HBR Tank', 'Replace unit tank', 8, 4, 2, 2, 1),
(309, 'HAC Settler', 'Open Manhole and cleaning', 9, 4, 1, 1, 1),
(310, 'HAC Settler', 'PT check at Shell weld line', 9, 5, 2, 2, 1),
(311, 'HAC Settler', 'Visual Inspection', 9, 7, 1, 1, 1),
(312, 'Feed Mixing Tank', 'Open Manhole and cleaning', 8, 4, 1, 1, 1),
(313, 'Feed Mixing Tank', 'Visual Inspection', 8, 7, 1, 1, 1),
(314, 'M-1741 Feed Drum', 'Open Manhole and cleaning', 8, 4, 1, 1, 1),
(315, 'M-1741 Feed Drum', 'PT check at CW line, LW line and all nozzle', 8, 5, 1, 1, 1),
(316, 'M-1741 Feed Drum', 'Visual Inspection', 8, 7, 1, 1, 1),
(317, 'D-1750 NaOH Tank', 'Open M/H, Visual Inspection', 9, 4, 2, 2, 1),
(318, 'Mother Liquid Tank', 'Open Manhole and cleaning', 9, 4, 1, 1, 1),
(319, 'Mother Liquid Tank', 'Visual Inspection', 9, 7, 1, 1, 1),
(320, 'D-1764 Mist Separator', 'Open Manhole and cleaning', 7, 4, 4, 4, 1),
(321, 'D-1764 Mist Separator', 'Visual Inspection', 7, 7, 4, 4, 1),
(322, 'D-1764 Condensate Tank', 'Open Manhole and cleaning', 8, 4, 3, 3, 1),
(323, 'D-1764 Condensate Tank', 'Visual Inspection', 8, 7, 3, 3, 1),
(324, 'Flush Drum (NBA)', 'Open Manhole and cleaning', 8, 4, 3, 3, 1),
(325, 'Flush Drum (NBA)', 'Visual Inspection', 8, 7, 3, 3, 1),
(326, 'Dehydrated Solvent Tank', 'Open Manhole and cleaning', 9, 4, 2, 2, 1),
(327, 'Dehydrated Solvent Tank', 'Visual Inspection', 9, 7, 2, 2, 1),
(328, 'NBA separation Tank', 'Open Manhole and cleaning', 9, 4, 3, 3, 1),
(329, 'NBA separation Tank', 'Visual Inspection', 9, 7, 3, 3, 1),
(330, 'D-1769 B Condensate Tank', 'Open Manhole and cleaning', 9, 4, 2, 2, 1),
(331, 'D-1769 B Condensate Tank', 'Visual Inspection', 9, 7, 2, 2, 1),
(332, 'PX Separator', 'Open Manhole and cleaning', 9, 4, 2, 2, 1),
(333, 'PX Separator', 'Visual Inspection', 9, 7, 2, 2, 1),
(334, '6 S Steam Drum', 'MPI at all weld joint', 9, 5, 4, 4, 1),
(335, '6 S Steam Drum', 'Open Manhole and cleaning (weld line cleaning by wire brush)', 9, 4, 4, 4, 1),
(336, '6 S Steam Drum', 'Visual Inspection', 9, 7, 2, 2, 1),
(337, 'MS Condensate Drum', 'MPI at all weld joint', 9, 5, 4, 4, 1),
(338, 'MS Condensate Drum', 'Open Manhole and cleaning (weld line cleaning by wire brush)', 9, 4, 2, 2, 1),
(339, 'MS Condensate Drum', 'Visual Inspection', 9, 7, 2, 2, 1),
(340, '3.5 S Steam Drum', 'MPI at all weld joint', 9, 5, 4, 4, 1),
(341, '3.5 S Steam Drum', 'Open Manhole and cleaning (weld line cleaning by wire brush)', 9, 4, 2, 2, 1),
(342, '3.5 S Steam Drum', 'Visual Inspection', 9, 7, 2, 2, 1),
(343, 'BW Storage Drum', 'Open Manhole and cleaning', 8, 4, 2, 2, 1),
(344, 'BW Storage Drum', 'Visual Inspection', 8, 7, 2, 2, 1),
(345, 'BW Storage Drum', 'MPI at all weld joint', 8, 5, 2, 2, 1),
(346, 'E-1771 Steam Drum', 'MPI at all weld joint', 9, 5, 4, 4, 1),
(347, 'E-1771 Steam Drum', 'Open Manhole and cleaning (weld line cleaning by wire brush)', 9, 4, 2, 2, 1),
(348, 'E-1771 Steam Drum', 'Visual Inspection', 9, 7, 2, 2, 1),
(349, '0.5 S Steam Drum', 'MPI at all weld joint', 9, 5, 4, 4, 1),
(350, '0.5 S Steam Drum', 'Open Manhole and cleaning (weld line cleaning by wire brush)', 9, 4, 2, 2, 1),
(351, '0.5 S Steam Drum', 'Visual Inspection', 9, 7, 2, 2, 1),
(352, 'C-1711 Lube Oil Pump', 'Pump Overhaul', 7, 2, 1, 1, 1),
(353, 'C-1711 Lube Oil Pump', 'Pump Overhaul', 7, 2, 1, 1, 1),
(354, 'E-1718 Condensate Pump', 'Pump Overhaul', 7, 3, 1, 1, 1),
(355, 'E-1718 Condensate Pump', 'Pump Overhaul', 7, 3, 1, 1, 1),
(356, 'No. 1 Condensate Separator', 'Visual Inspection by boroscoupe', 8, 7, 2, 2, 1),
(357, 'No. 1 Condensate Separator', 'Thickness check at shell (Fix point)', 8, 5, 2, 2, 1),
(358, 'No. 2 Condensate Separator', 'Visual Inspection by boroscoupe', 8, 7, 2, 2, 1),
(359, 'No. 2 Condensate Separator', 'Thickness check at shell (Fix point)', 8, 5, 2, 2, 1),
(360, 'No. 3 Condensate Separator', 'Thickness check at shell (Fix point)', 8, 5, 2, 2, 1),
(361, 'MC Head Tank', 'Open Cover, Visual Inspection', 8, 4, 5, 5, 1),
(362, 'HBR Head Tank', 'Open Cover, Visual Inspection', 8, 4, 5, 5, 1),
(363, 'E-1731 Condensate Tank', 'Open Flange and cover (Lift down to lower plateform)', 7, 4, 5, 5, 1),
(364, 'E-1731 Condensate Tank', 'Visual Inspection', 7, 7, 5, 5, 1),
(365, 'Catalyst Charge Tank', 'Open Handhole', 7, 4, 6, 1, 1),
(366, 'Catalyst Charge Tank', 'Visual Inspection', 7, 7, 6, 1, 1),
(367, 'M-1741 Separator', 'Open Manhole, take out demister and cleaning', 7, 4, 3, 3, 1),
(368, 'M-1741 Separator', 'Visual Inspection', 7, 7, 3, 3, 1),
(369, 'C-1741 Mist Separator', 'Open Manhole, take out demister and cleaning', 9, 4, 3, 3, 1),
(370, 'C-1741 Mist Separator', 'Replace Demiter', 9, 4, 2, 2, 1),
(371, 'C-1741 Mist Separator', 'Visual Inspection', 9, 7, 3, 3, 1),
(372, 'M-1745 RAM ROD', 'Open Top Cover, Visual inspection', 9, 4, 2, 2, 1),
(373, 'N0. 2 Steam Separator', 'Take out / Install Steam separator', 7, 4, 3, 3, 1),
(374, 'N0. 2 Steam Separator', 'Visual Inspection', 7, 7, 3, 3, 1),
(375, 'No. 1 Steam Separator', 'Take out / Install Steam separator', 7, 4, 3, 3, 1),
(376, 'No. 1 Steam Separator', 'Visual Inspection', 7, 7, 3, 3, 1),
(377, 'Purge Heater', 'Pneumatic test', 7, 4, 5, 3, 1),
(378, 'Purge Heater', 'PT check of coupling&support', 7, 5, 5, 3, 1),
(379, 'Purge Heater', 'Take out / Install purge heater', 7, 4, 5, 3, 1),
(380, 'Purge Heater', 'Pneumatic test', 8, 4, 5, 3, 1),
(381, 'Purge Heater', 'PT check of coupling&support', 8, 5, 5, 3, 1),
(382, 'Purge Heater', 'Take out / Install purge heater', 8, 4, 5, 3, 1),
(383, 'Purge Heater', 'Pneumatic test', 8, 4, 5, 3, 1),
(384, 'Purge Heater', 'PT check of coupling&support', 8, 5, 5, 3, 1),
(385, 'Purge Heater', 'Take out / Install purge heater', 8, 4, 5, 3, 1),
(386, 'Purge Heater', 'Pneumatic test', 8, 4, 5, 3, 1),
(387, 'Purge Heater', 'PT check of coupling&support', 8, 5, 5, 3, 1),
(388, 'Purge Heater', 'Take out / Install purge heater', 8, 4, 5, 3, 1),
(389, 'Purge Heater', 'Pneumatic test', 8, 4, 5, 3, 1),
(390, 'Purge Heater', 'PT check of coupling&support', 8, 5, 5, 3, 1),
(391, 'Purge Heater', 'Take out / Install purge heater', 8, 4, 5, 3, 1),
(392, '1 st Vacum Ejector', 'Penetrant test of ejector', 8, 5, 3, 3, 1),
(393, '1 st Vacum Ejector', 'Take out / Install Ejector - Assembly and disassembly', 8, 4, 3, 3, 1),
(394, '2 nd Vacum Ejector', 'Penetrant test of ejector', 8, 5, 3, 3, 1),
(395, '2 nd Vacum Ejector', 'Take out / Install Ejector - Assembly and disassembly', 8, 4, 3, 3, 1),
(396, 'Hogging Ejector', 'Penetrant test of ejector', 8, 5, 3, 3, 1),
(397, 'Hogging Ejector', 'Take out / Install Ejector - Assembly and disassembly', 8, 4, 3, 3, 1),
(398, 'D-1736 Ejector', 'Penetrant test of ejector', 8, 5, 3, 3, 1),
(399, 'D-1736 Ejector', 'Take out / Install Ejector - Assembly and disassembly', 8, 4, 3, 3, 1),
(400, 'D-1750 Ejector', 'Penetrant test of ejector', 8, 5, 3, 3, 1),
(401, 'D-1750 Ejector', 'Take out / Install Ejector - Assembly and disassembly', 8, 4, 3, 3, 1),
(402, 'D-1722 1st Ejector', 'Penetrant test of ejector', 8, 5, 2, 2, 1),
(403, 'D-1722 1st Ejector', 'Take out / Install Ejector - Assembly and disassembly', 8, 4, 2, 2, 1),
(404, 'D-1722 2nd Ejector', 'Penetrant test of ejector', 8, 5, 2, 2, 1),
(405, 'D-1722 2nd Ejector', 'Take out / Install Ejector - Assembly and disassembly', 8, 4, 2, 2, 1),
(406, 'D-1722 3rd Ejector', 'Penetrant test of ejector', 8, 5, 2, 2, 1),
(407, 'D-1722 3rd Ejector', 'Take out / Install Ejector - Assembly and disassembly', 8, 4, 2, 2, 1),
(408, 'CTA Vacum Filter', 'Bearing inspection (Replace if needed)', 8, 3, 1, 1, 1),
(409, 'CTA Vacum Filter', 'Change filter clothes', 8, 3, 1, 1, 1),
(410, 'CTA Vacum Filter', 'Change Gland packing', 8, 3, 1, 1, 1),
(411, 'CTA Vacum Filter', 'Check Corrosion & Blow Back Valve Gap', 8, 3, 1, 1, 1),
(412, 'CTA Vacum Filter', 'Check damper and spray nozzle', 8, 3, 1, 1, 1),
(413, 'CTA Vacum Filter', 'Replace Drive chain & sprocket inspection', 8, 3, 1, 1, 1),
(414, 'CTA Vacum Filter', 'PT check at casing and Internal nozzle neck of center drum', 8, 5, 1, 1, 1),
(415, 'CTA Vacum Filter', 'Take out/ install casing, VI', 8, 3, 1, 1, 1),
(416, 'CTA Vacum Filter', 'Change filter clothes', 8, 3, 1, 1, 1),
(417, 'CTA Vacum Filter', 'Change Gland packing', 8, 3, 1, 1, 1),
(418, 'CTA Vacum Filter', 'Check Corrosion & Blow Back Valve Gap', 8, 3, 1, 1, 1),
(419, 'CTA Vacum Filter', 'Check damper and spray nozzle', 8, 3, 1, 1, 1),
(420, 'CTA Vacum Filter', 'Replace Drive chain & sprocket inspection', 8, 3, 1, 1, 1),
(421, 'CTA Vacum Filter', 'Bearing inspection (Replace if needed)', 8, 3, 1, 1, 1),
(422, 'CTA Vacum Filter', 'PT check at casing and Internal nozzle neck of center drum', 8, 5, 1, 1, 1),
(423, 'CTA Vacum Filter', 'Take out/ install casing, VI', 8, 7, 1, 1, 1),
(424, 'CTA Dryer', 'Change Fluid Coupling', 7, 3, 2, 2, 1),
(425, 'CTA Dryer', 'Gear Reducer Overhaul', 7, 3, 2, 2, 1),
(426, 'CTA Dryer', 'Open Manhole and cleaning', 7, 3, 1, 1, 1),
(427, 'CTA Dryer', 'Measurement gap or clearrance of tube support', 7, 3, 2, 2, 1),
(428, 'CTA Dryer', 'Inspection and measurement off ball knocker', 7, 3, 2, 2, 1),
(429, 'CTA Dryer', 'Overhaoul Oil pinion P/N (c)', 7, 3, 2, 2, 1),
(430, 'CTA Dryer', 'Replace Fuse plug of Fluid coupling', 7, 3, 2, 2, 1),
(431, 'CTA Dryer', 'Inspecction tube 2\" at base material by PAUT (45pcs)', 7, 5, 2, 2, 1),
(432, 'CTA Dryer', 'PT Check Steam header & Air vent tube', 7, 5, 2, 2, 1),
(433, 'CTA Dryer', 'PT Check at gir gear P/N-a', 7, 5, 2, 2, 1),
(434, 'CTA Dryer', 'PT check at Tube support, key plate and shim plate', 7, 5, 1, 1, 1),
(435, 'CTA Dryer', 'Radial Roller Bearing Replace (Inlet side)', 7, 3, 2, 2, 1),
(436, 'CTA Dryer', 'Radial Roller Bearing Replace (Outlet side)', 7, 3, 2, 2, 1),
(437, 'CTA Dryer', 'Thrust Roller Bearing Replace', 7, 3, 2, 2, 1),
(438, 'CTA Dryer', 'Visual Inspection', 7, 7, 1, 1, 1),
(439, '1 st Outlet Conveyor', 'Bearing replace', 8, 3, 2, 2, 1),
(440, '1 st Outlet Conveyor', 'Check reamer bolt', 8, 3, 2, 2, 1),
(441, '1 st Outlet Conveyor', 'Replace Drive chain & sprocket inspection', 8, 3, 2, 2, 1),
(442, '1 st Outlet Conveyor', 'Gland Check & Change', 8, 3, 1, 1, 1),
(443, '1 st Outlet Conveyor', 'PT check at Screw and reamer bolt', 8, 5, 2, 2, 1),
(444, '1 st Outlet Conveyor', 'Take out screw & Open Cover, Visual Inspection', 8, 3, 2, 2, 1),
(445, '1 st Outlet Conveyor', 'Bearing replace', 8, 3, 2, 2, 1),
(446, '1 st Outlet Conveyor', 'Check reamer bolt', 8, 3, 2, 2, 1),
(447, '1 st Outlet Conveyor', 'Replace Drive chain & sprocket inspection', 8, 3, 2, 2, 1),
(448, '1 st Outlet Conveyor', 'Gland Check & Change', 8, 3, 1, 1, 1),
(449, '1 st Outlet Conveyor', 'PT check at Screw and reamer bolt', 8, 5, 2, 2, 1),
(450, '1 st Outlet Conveyor', 'Take out screw & Open Cover, Visual Inspection', 8, 3, 2, 2, 1),
(451, '2 nd Outlet Conveyor', 'Bearing replace', 8, 3, 2, 2, 1),
(452, '2 nd Outlet Conveyor', 'Check reamer bolt', 8, 3, 2, 2, 1),
(453, '2 nd Outlet Conveyor', 'Replace Drive chain & sprocket inspection', 8, 3, 2, 2, 1),
(454, '2 nd Outlet Conveyor', 'Gland Check & Change', 8, 3, 1, 1, 1),
(455, '2 nd Outlet Conveyor', 'PT check at Screw and reamer bolt', 8, 5, 2, 2, 1),
(456, '2 nd Outlet Conveyor', 'Take out screw & Open Cover, Visual Inspection', 8, 3, 2, 2, 1),
(457, 'M-1745 Inlet Conveyor', 'Bearing replace', 8, 3, 2, 2, 1),
(458, 'M-1745 Inlet Conveyor', 'Replace Drive chain & sprocket inspection', 8, 3, 2, 2, 1),
(459, 'M-1745 Inlet Conveyor', 'Change gland packing (Detail A)', 8, 3, 1, 1, 1),
(460, 'M-1745 Inlet Conveyor', 'Change gland packing and V-seal (Detail B and C)', 8, 3, 1, 1, 1),
(461, 'M-1745 Inlet Conveyor', 'Change gland packing Steam tubes (Detail D and E)', 8, 3, 3, 3, 1),
(462, 'M-1745 Inlet Conveyor', 'PT check at Spokes and shaft', 8, 5, 2, 2, 1),
(463, 'M-1745 Inlet Conveyor', 'Visual Inspection', 8, 7, 2, 2, 1),
(464, 'M-1745 Outlet Conveyor', 'Change gland packing (Detail A)', 8, 3, 1, 1, 1),
(465, 'M-1745 Outlet Conveyor', 'Change gland packing (Detail B)', 8, 3, 1, 1, 1),
(466, 'M-1745 Outlet Conveyor', 'Change gland packing (Detail C)', 8, 3, 1, 1, 1),
(467, 'M-1745 Outlet Conveyor', 'Change Internal Bearing (Detail D)', 8, 3, 1, 1, 1),
(468, 'M-1745 Outlet Conveyor', 'Change bush (Detail E)', 8, 3, 1, 1, 1),
(469, 'M-1745 Outlet Conveyor', 'Change bush (Detail F)', 8, 3, 1, 1, 1),
(470, 'M-1745 Outlet Conveyor', 'Replace Drive chain & sprocket inspection', 8, 3, 2, 2, 1),
(471, 'M-1745 Outlet Conveyor', 'Visual Inspection of Coil spring (spring support)', 8, 5, 2, 2, 1),
(472, 'M-1745 Outlet Conveyor', 'Bearing replace', 8, 3, 2, 2, 1),
(473, 'M-1745 Outlet Conveyor', 'PT check Screw conveyar', 8, 5, 2, 2, 1),
(474, 'M-1745 Outlet Conveyor', 'Take out screw & Open H H, Visual Inspection', 8, 3, 2, 2, 1),
(475, 'M-1745 Rotary Valve', 'Replace Drive chain & sprocket inspection', 8, 3, 2, 2, 1),
(476, 'M-1745 Rotary Valve', 'Rotary Valve Overhaul', 8, 3, 2, 2, 1),
(477, 'M-1745 Rotary Valve', 'Change ABC Ring', 8, 4, 2, 2, 1),
(478, 'CTA Conveyor', 'Bearing Replace', 9, 2, 2, 2, 1),
(479, 'CTA Conveyor', 'Change Gland packing', 9, 2, 1, 1, 1),
(480, 'CTA Conveyor', 'Conveyor chain inspection ( T/O sampling, measure deflection of conveyor chain)', 9, 2, 2, 2, 1),
(481, 'CTA Conveyor', 'Replace Drive chain & sprocket inspection', 9, 2, 2, 2, 1),
(482, 'CTA Conveyor', 'Open Cover, Visual Inspection', 9, 2, 2, 2, 1),
(483, 'CTA Conveyor', 'PT check at flight(take sampling flight 20%)', 9, 5, 2, 2, 1),
(484, 'CTA Conveyor', 'Bearing replace', 8, 3, 2, 2, 1),
(485, 'CTA Conveyor', 'Change Gland packing', 8, 3, 1, 1, 1),
(486, 'CTA Conveyor', 'Conveyor chain inspection ( T/O sampling, measure deflection of conveyor chain)', 8, 3, 2, 2, 1),
(487, 'CTA Conveyor', 'Replace Drive chain & sprocket inspection', 8, 3, 2, 2, 1),
(488, 'CTA Conveyor', 'Open Cover, Visual Inspection', 8, 3, 2, 2, 1),
(489, 'CTA Conveyor', 'PT check at flight (take sampling flight 20%)', 8, 5, 2, 2, 1),
(490, 'CTA Conveyor', 'Bearing replace', 8, 3, 2, 2, 1),
(491, 'CTA Conveyor', 'Change Gland packing', 8, 3, 1, 1, 1),
(492, 'CTA Conveyor', 'Conveyor chain inspection ( T/O sampling, measure deflection of conveyor chain)', 8, 3, 2, 2, 1),
(493, 'CTA Conveyor', 'Replace Drive chain & sprocket inspection', 8, 3, 2, 2, 1),
(494, 'CTA Conveyor', 'Open Cover, Visual Inspection', 8, 3, 2, 2, 1),
(495, 'CTA Conveyor', 'PT check at bucket (take sampling Bucket 10%)', 8, 5, 2, 2, 1),
(496, 'CTA Conveyor', 'Bearing replace', 8, 3, 2, 2, 1),
(497, 'CTA Conveyor', 'Change Gland packing', 8, 3, 1, 1, 1),
(498, 'CTA Conveyor', 'Conveyor chain inspection ( T/O sampling, measure deflection of conveyor chain)', 8, 3, 2, 2, 1),
(499, 'CTA Conveyor', 'Replace Drive chain & sprocket inspection', 8, 3, 2, 2, 1),
(500, 'CTA Conveyor', 'Open Cover, Visual Inspection', 8, 3, 2, 2, 1),
(501, 'CTA Conveyor', 'PT check at flight (take sampling flight 20%)', 8, 5, 2, 2, 1),
(502, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(503, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(504, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(505, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(506, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(507, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(508, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(509, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(510, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(511, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(512, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(513, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(514, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(515, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(516, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(517, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(518, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(519, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(520, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(521, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(522, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(523, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(524, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(525, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(526, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(527, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(528, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(529, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(530, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(531, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(532, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(533, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(534, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(535, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(536, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(537, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(538, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(539, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(540, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(541, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(542, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(543, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(544, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(545, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(546, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(547, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(548, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(549, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(550, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(551, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(552, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 1),
(553, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 1),
(554, 'Off Gas Separator', 'Open Manhole and Cleaning', 8, 4, 5, 5, 1),
(555, 'Off Gas Separator', 'Visual Inspection', 8, 7, 5, 5, 1),
(556, 'Off Gas Separator', 'Inspection Demister vane inlet', 8, 7, 2, 2, 1),
(557, 'D-1772 Ejector', 'Take out / install top cover (include rubber tray)', 9, 4, 3, 3, 1),
(558, 'D-1772 Ejector', 'Visual Inspection', 9, 7, 3, 3, 1),
(559, 'D-1772 Ejector', 'Take out / install top cover (include rubber tray)', 9, 4, 3, 3, 1),
(560, 'D-1772 Ejector', 'Visual Inspection', 9, 7, 3, 3, 1),
(561, 'D-1772 Ejector After', 'Take out / install top cover (include rubber tray)', 9, 4, 3, 3, 1),
(562, 'D-1772 Ejector After', 'Visual Inspection', 9, 7, 3, 3, 1),
(563, 'Sea Water Header Nozzle and Header Side', 'Open / Close Blind Flange', 9, 4, 1, 1, 1),
(564, 'Sea Water Header Nozzle and Header Side', 'Visual Inspection', 9, 7, 1, 1, 1),
(565, '2F-1725 Agitator', 'Bottom Bearing Check & Change', 7, 3, 1, 1, 2),
(566, '2F-1725 Agitator', 'Mechanical Seal Replace (include intermediate bearing)', 9, 3, 2, 2, 2),
(567, '2F-1725 Agitator', 'Adapter Overhaul', 9, 3, 3, 3, 2),
(568, '2F-1725 Agitator', 'PT check at impeller and bottom bearing support', 9, 5, 1, 1, 2),
(569, '2F-1725 Agitator', 'Gear Reducer Overhaul', 9, 3, 3, 3, 2),
(570, '2F-1725 Agitator', 'Bottom Bearing Check & Change', 8, 3, 1, 1, 2),
(571, '2F-1725 Agitator', 'Adapter Overhaul', 8, 3, 3, 3, 2),
(572, '2F-1725 Agitator', 'Rubber Coupling Replace', 8, 3, 3, 3, 2),
(573, '2F-1725 Agitator', 'PT check at impeller and bottom bearing support', 8, 5, 1, 1, 2),
(574, '2F-1725 Agitator', 'Mechanical seal replace and overhaul', 8, 3, 2, 2, 2),
(575, '2F-1725 Agitator', 'Gear Reducer Overhaul', 7, 3, 3, 3, 2),
(576, '2F-1725 Agitator', 'PT check at impeller, slinger disk and bottom bearing support', 7, 5, 1, 1, 2),
(577, '2F-1725 Agitator', 'MPI(MT) test at gears', 7, 5, 3, 3, 2),
(578, '2F-1725 Agitator', 'Bottom Bearing Check & Change', 7, 3, 1, 1, 2),
(579, '2F-1725 Agitator', 'Mechanical seal replace and overhaul', 7, 3, 2, 2, 2),
(580, '2F-1725 Agitator', 'Gear Reducer Overhaul', 7, 3, 3, 3, 2),
(581, '2F-1725 Agitator', 'Pump Overhaul', 7, 2, 2, 2, 2),
(582, '2F-1725 Agitator', 'Pump Overhaul', 7, 2, 2, 2, 2),
(583, '2F-1725 Agitator', 'PT check at impeller, slinger disk and bottom bearing support', 7, 5, 1, 1, 2),
(584, '2F-1725 Agitator', 'Mechanical seal replace and overhaul', 7, 3, 2, 2, 2),
(585, '2F-1725 Agitator', 'Gear Reducer Overhaul', 7, 3, 3, 3, 2),
(586, '2F-1725 Agitator', 'Bottom Bearing Check & Change', 7, 3, 1, 1, 2),
(587, '2F-1725 Agitator', 'Pressure Unit Pump Overhaul', 7, 2, 2, 2, 2),
(588, '2F-1725 Agitator', 'Pressure Unit Pump Overhaul', 7, 2, 2, 2, 2),
(589, '2F-1725 Agitator', 'PT check at impeller, slinger disk and bottom bearing support', 7, 5, 1, 1, 2),
(590, '2F-1725 Agitator', 'Mechanical seal replace and overhaul', 7, 3, 2, 2, 2),
(591, '2F-1725 Agitator', 'Gear Reducer Overhaul', 7, 3, 3, 3, 2),
(592, '2F-1725 Agitator', 'Bottom Bearing Check & Change', 7, 3, 1, 1, 2),
(593, '2F-1725 Agitator', 'Pressure Unit Pump Overhaul', 7, 2, 2, 2, 2),
(594, '2F-1725 Agitator', 'Pressure Unit Pump Overhaul', 7, 2, 2, 2, 2),
(595, '2F-1725 Agitator', 'Bottom Bearing Check & Change', 7, 3, 1, 1, 2),
(596, '2F-1725 Agitator', 'Adapter Overhaul', 7, 3, 3, 3, 2),
(597, '2F-1725 Agitator', 'Rubber Coupling Replace', 8, 3, 3, 3, 2),
(598, '2F-1725 Agitator', 'PT check at impeller', 8, 5, 1, 1, 2),
(599, '2F-1725 Agitator', 'Mechanical seal replace and overhaul', 8, 3, 2, 2, 2),
(600, '2F-1725 Agitator', 'Gear Reducer Overhaul', 8, 3, 3, 3, 2),
(601, '2F-1725 Agitator', 'Gear Reducer Overhaul', 8, 3, 3, 3, 2),
(602, '2F-1725 Agitator', 'Adapter Overhaul', 8, 3, 3, 3, 2),
(603, '2F-1725 Agitator', 'PT check at impeller', 8, 5, 1, 1, 2),
(604, '2F-1725 Agitator', 'Mechanical Seal Replace (include intermediate bearing)', 8, 3, 2, 2, 2),
(605, '2F-1725 Agitator', 'Adapter Overhaul', 8, 3, 3, 3, 2),
(606, '2F-1725 Agitator', 'Mechanical seal replace and overhaul', 8, 3, 1, 1, 2),
(607, '2F-1725 Agitator', 'Gear Reducer Overhaul', 8, 3, 3, 3, 2),
(608, '2F-1725 Agitator', 'Adapter overhaul', 8, 3, 3, 3, 2),
(609, '2F-1725 Agitator', 'PT check at impeller', 9, 5, 1, 1, 2),
(610, '2F-1725 Agitator', 'Mechanical seal replace and overhaul', 9, 3, 2, 2, 2),
(611, '2F-1725 Agitator', 'Gear Reducer overhaul', 9, 3, 3, 3, 2),
(612, '2F-1725 Agitator', 'Gland packing (Top side) replace', 9, 8, 1, 1, 2),
(613, '2F-1725 Agitator', 'Bottom Bearing Check & Change', 9, 3, 1, 1, 2),
(614, '2F-1725 Agitator', 'Gear Reducer Overhaul', 9, 3, 3, 3, 2),
(615, '2F-1725 Agitator', 'Gland packing (Bottom side) replace', 9, 3, 1, 1, 2),
(616, '2F-1725 Agitator', 'Adapter Overhaul', 9, 3, 3, 3, 2),
(617, '2F-1725 Agitator', 'Rubber coupling replacement', 9, 3, 3, 3, 2),
(618, '2F-1725 Agitator', 'PT check at impeller, slinger disk and bottom bearing support', 7, 5, 1, 1, 2),
(619, '2F-1725 Agitator', 'Mechanical seal replace and overhaul', 7, 3, 2, 2, 2),
(620, '2F-1725 Agitator', 'Gear Reducer Overhaul', 7, 3, 3, 3, 2),
(621, '2F-1725 Agitator', 'Bottom Bearing Check & Change', 7, 3, 1, 1, 2),
(622, '2F-1725 Agitator', 'Open Cover Filter, Visual Insp.', 7, 2, 3, 3, 2),
(623, '2F-1725 Agitator', 'Impeller Inspection', 7, 3, 1, 1, 2),
(624, '2F-1725 Agitator', 'Bearing & Shaft Seal check', 7, 3, 1, 1, 2),
(625, '2F-1725 Agitator', 'Gear Check', 7, 3, 1, 1, 2),
(626, '2F-1725 Agitator', 'PT check at all bearing, inlet diffuser stiffeners 1st stage, Impeller, Guide vane blade, bull gear,', 7, 5, 1, 1, 2),
(627, '2F-1725 Agitator', 'MPI(MT) at gears', 7, 5, 1, 1, 2),
(628, '2F-1725 Agitator', 'UT at HP and LP thrust collar', 7, 5, 1, 1, 2),
(629, '2F-1725 Agitator', 'Open Diffuser Casing, VI', 7, 3, 1, 1, 2),
(630, '2F-1725 Agitator', 'Impeller Cleaning', 7, 3, 1, 1, 2),
(631, '2F-1725 Agitator', 'Bearing & Shaft Seal check', 7, 3, 1, 1, 2),
(632, '2F-1725 Agitator', 'Gear Check', 7, 3, 1, 1, 2),
(633, '2F-1725 Agitator', 'PT check at all bearing, inlet diffuser stiffeners 1st stage, Impeller, Guide vane blade, bull gear,', 7, 5, 1, 1, 2),
(634, '2F-1725 Agitator', 'MPI(MT) at gears', 7, 5, 1, 1, 2),
(635, '2F-1725 Agitator', 'UT at HP and LP thrust collar', 7, 5, 1, 1, 2),
(636, '2F-1725 Agitator', 'Open Diffuser Casing, VI', 7, 3, 1, 1, 2),
(637, '2F-1725 Agitator', 'Rotor & Stator Cleaning', 7, 3, 1, 1, 2),
(638, '2F-1725 Agitator', 'Bearing & Shaft Seal Check', 7, 3, 1, 1, 2),
(639, '2F-1725 Agitator', 'Rotor, stator cleaning, and mesuring clearance rotor to steam blade carrier', 7, 5, 1, 1, 2),
(640, '2F-1725 Agitator', 'Measure length of casing bolt', 7, 3, 2, 2, 2),
(641, '2F-1725 Agitator', 'Repair by Re bladding at Dresser Rand', 7, 3, 1, 1, 2),
(642, '2F-1725 Agitator', 'Open Rotor Casing, VI', 7, 3, 1, 1, 2),
(643, '2F-1725 Agitator', 'Overhaul Blower', 7, 3, 2, 2, 2),
(644, '2F-1725 Agitator', 'NDT Inspection', 7, 5, 2, 2, 2),
(645, '2F-1725 Agitator', 'Open Cover, Visual Inspection', 7, 4, 1, 1, 2),
(646, '2F-1725 Agitator', 'Replace gland packing at flush bottom valve', 7, 3, 1, 1, 2),
(647, '2F-1725 Agitator', 'Visual inspection', 7, 7, 1, 1, 2),
(648, '2F-1725 Agitator', 'PT check at bottom pads (Pipe support and baffle support)', 7, 5, 1, 1, 2),
(649, '2F-1725 Agitator', 'PT check at top and middle pads (Pipe support and baffle support)', 7, 5, 1, 1, 2),
(650, '2F-1725 Agitator', 'Open Manhole and cleaning', 7, 4, 1, 1, 2),
(651, '2F-1725 Agitator', 'Open Manhole', 7, 4, 1, 1, 2),
(652, '2F-1725 Agitator', 'Replace gland packing at flush bottom valve', 7, 3, 1, 1, 2);
INSERT INTO `equipment` (`id_equipment`, `equipment_name`, `inspection_name`, `id_grade`, `id_classification`, `id_inspection_period`, `id_last_inspection`, `id_plant`) VALUES
(653, '2F-1725 Agitator', 'Visual inspection', 7, 7, 1, 1, 2),
(654, '2F-1725 Agitator', 'PT check at Pipe support and baffle support pads', 7, 5, 1, 1, 2),
(655, '2F-1725 Agitator', 'Open Manhole', 7, 4, 1, 1, 2),
(656, '2F-1725 Agitator', 'Visual inspection', 7, 7, 1, 1, 2),
(657, '2F-1725 Agitator', 'PT check air pipe support, support pad and all nozzle', 9, 5, 1, 1, 2),
(658, '2F-1725 Agitator', 'Open Manhole', 9, 4, 1, 1, 2),
(659, '2F-1725 Agitator', 'Visual inspection', 9, 7, 1, 1, 2),
(660, '2F-1725 Agitator', 'PT check at support pad, Top and Bottom Nozzle', 9, 5, 1, 1, 2),
(661, '2F-1725 Agitator', 'Open Manhole & Manway', 9, 4, 2, 2, 2),
(662, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 2, 2, 2),
(663, '2F-1725 Agitator', 'Open Manhole and cleaning', 9, 4, 2, 2, 2),
(664, '2F-1725 Agitator', 'Inspection the telerate packing (Replace Packing and cleaning if need)', 9, 4, 2, 2, 2),
(665, '2F-1725 Agitator', 'Visual Inspection', 8, 7, 2, 2, 2),
(666, '2F-1725 Agitator', 'Visual inspection', 8, 7, 1, 1, 2),
(667, '2F-1725 Agitator', 'Open Manhole, Manway, Take out eliminator and cleaning', 8, 4, 1, 1, 2),
(668, '2F-1725 Agitator', 'Inspection the telerate packing (Replace Packing and cleaning if need)', 8, 4, 2, 2, 2),
(669, '2F-1725 Agitator', 'Open Manhole and cleaning', 7, 4, 2, 2, 2),
(670, '2F-1725 Agitator', 'Visual inspection', 7, 7, 2, 2, 2),
(671, '2F-1725 Agitator', 'Open Manhole and cleaning', 7, 4, 1, 1, 2),
(672, '2F-1725 Agitator', 'Open and Inspection Expansion Joint', 7, 4, 2, 2, 2),
(673, '2F-1725 Agitator', 'Visual inspection', 7, 7, 1, 1, 2),
(674, '2F-1725 Agitator', 'PT check at all top nozzle', 7, 5, 1, 1, 2),
(675, '2F-1725 Agitator', 'Thickness check at shell (Fix point)', 7, 5, 1, 1, 2),
(676, '2F-1725 Agitator', 'Open Manhole & Manway, Cleaning', 7, 4, 1, 1, 2),
(677, '2F-1725 Agitator', 'Visual Inspection', 7, 7, 1, 1, 2),
(678, '2F-1725 Agitator', 'Thickness check at shell (Fix point)', 7, 5, 1, 1, 2),
(679, '2F-1725 Agitator', 'Visual Inspection', 7, 7, 1, 1, 2),
(680, '2F-1725 Agitator', 'Thickness check at shell (Fix point)', 7, 5, 1, 1, 2),
(681, '2F-1725 Agitator', 'PT check at N-5 nozzle sleeve weld line (interconnection to 2E-1764)', 7, 5, 2, 2, 2),
(682, '2F-1725 Agitator', 'Inspection nozzle from middle to bottom (Flange surface check *galvanic corrosion)', 7, 4, 2, 2, 2),
(683, '2F-1725 Agitator', 'Open Manhole & Manway , Cleaning', 7, 4, 1, 1, 2),
(684, '2F-1725 Agitator', 'Open Manhole & Manway', 7, 4, 2, 2, 2),
(685, '2F-1725 Agitator', 'Inspection the telerate packing (Replace Packing and cleaning if need)', 7, 4, 2, 2, 2),
(686, '2F-1725 Agitator', 'Visual Inspection', 7, 7, 2, 2, 2),
(687, '2F-1725 Agitator', 'Visual Inspection', 7, 7, 4, 4, 2),
(688, '2F-1725 Agitator', 'Open Manhole & Manway, Cleaning', 9, 4, 4, 4, 2),
(689, '2F-1725 Agitator', 'Open manhole', 9, 4, 1, 1, 2),
(690, '2F-1725 Agitator', 'Visual inspection', 8, 7, 1, 1, 2),
(691, '2F-1725 Agitator', 'Open Manhole and cleaning', 8, 4, 1, 1, 2),
(692, '2F-1725 Agitator', 'Visual inspection', 8, 7, 1, 1, 2),
(693, '2F-1725 Agitator', 'Open Handhole and cleaning', 8, 4, 3, 3, 2),
(694, '2F-1725 Agitator', 'Inspection the telerate packing (Replace Packing and cleaning if need)', 8, 4, 3, 3, 2),
(695, '2F-1725 Agitator', 'Visual inspection', 8, 7, 3, 3, 2),
(696, '2F-1725 Agitator', 'Replace Carbon active and silica gel', 8, 4, 1, 1, 2),
(697, '2F-1725 Agitator', 'Open Handhole and cleaning', 8, 4, 1, 1, 2),
(698, '2F-1725 Agitator', 'Replace Carbon active and silica gel', 8, 4, 1, 1, 2),
(699, '2F-1725 Agitator', 'Open Handhole and cleaning', 8, 4, 1, 1, 2),
(700, '2F-1725 Agitator', 'Open Cover, T/O Tube Bundle and Cleaning (Tube Cleaning by Low Pressure Jetter)', 8, 4, 1, 1, 2),
(701, '2F-1725 Agitator', 'Visual inspection', 8, 7, 1, 1, 2),
(702, '2F-1725 Agitator', 'Visual Inspection', 7, 7, 1, 1, 2),
(703, '2F-1725 Agitator', 'Change Demister', 7, 4, 2, 2, 2),
(704, '2F-1725 Agitator', 'Open Cover and Manhole, T/O Tube Bundle and Cleaning (Tube Cleaning by High Pressure Jetter)', 7, 4, 1, 1, 2),
(705, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 4, 2, 2, 2),
(706, '2F-1725 Agitator', 'Visual inspection', 7, 7, 1, 1, 2),
(707, '2F-1725 Agitator', 'Change Demister', 7, 4, 2, 2, 2),
(708, '2F-1725 Agitator', 'Open Cover and Manhole, T/O Tube Bundle and Cleaning (Tube Cleaning by High Pressure Jetter)', 7, 4, 1, 1, 2),
(709, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 4, 2, 2, 2),
(710, '2F-1725 Agitator', 'Visual inspection', 7, 7, 1, 1, 2),
(711, '2F-1725 Agitator', 'change Demister', 7, 4, 2, 2, 2),
(712, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 4, 2, 2, 2),
(713, '2F-1725 Agitator', 'Open Cover and Manhole, T/O Tube Bundle and Cleaning (Tube Cleaning by High Pressure Jetter)', 7, 4, 1, 1, 2),
(714, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 5, 3, 3, 2),
(715, '2F-1725 Agitator', 'Visual inspection', 7, 7, 1, 1, 2),
(716, '2F-1725 Agitator', 'Open Cover, T/O Tube Bundle and Cleaning (Tube Cleaning by Low Pressure Jetter)', 7, 4, 1, 1, 2),
(717, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 5, 4, 4, 2),
(718, '2F-1725 Agitator', 'Visual inspection', 7, 7, 2, 2, 2),
(719, '2F-1725 Agitator', 'Take out Channel cover and cleaning (Tube Cleaning by mini jetter)', 7, 4, 2, 2, 2),
(720, '2F-1725 Agitator', 'Take out Channel cover and cleaning', 7, 4, 2, 2, 2),
(721, '2F-1725 Agitator', 'Visual inspection', 7, 7, 2, 2, 2),
(722, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 5, 4, 4, 2),
(723, '2F-1725 Agitator', 'Visual inspection', 7, 7, 1, 1, 2),
(724, '2F-1725 Agitator', 'Open Cover and Cleaning (Tube Cleaning by High Pressure Jetter)', 7, 4, 1, 1, 2),
(725, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 4, 2, 2, 2),
(726, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 7, 4, 5, 5, 2),
(727, '2F-1725 Agitator', 'Visual inspection', 7, 7, 5, 5, 2),
(728, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 5, 5, 5, 2),
(729, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by High Pressure Jetter)', 7, 4, 3, 3, 2),
(730, '2F-1725 Agitator', 'UT check at CW0~CW10, LW1,2', 7, 5, 1, 1, 2),
(731, '2F-1725 Agitator', 'Visual inspection', 7, 7, 3, 3, 2),
(732, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by High Pressure Jetter)', 7, 4, 2, 2, 2),
(733, '2F-1725 Agitator', 'Visual inspection', 7, 5, 2, 2, 2),
(734, '2F-1725 Agitator', 'UT Check at flexble joint', 7, 7, 2, 2, 2),
(735, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 4, 2, 2, 2),
(736, '2F-1725 Agitator', 'UT check at CW0~CW10, LW1,2', 7, 5, 1, 1, 2),
(737, '2F-1725 Agitator', 'Visual Inspection', 7, 7, 3, 3, 2),
(738, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by High Pressure Jetter)', 7, 4, 3, 3, 2),
(739, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 4, 2, 2, 2),
(740, '2F-1725 Agitator', 'Visual Inspection', 7, 7, 5, 5, 2),
(741, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by High Pressure Jetter)', 7, 4, 5, 5, 2),
(742, '2F-1725 Agitator', 'Visual inspection', 7, 7, 3, 3, 2),
(743, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 5, 6, 1, 2),
(744, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by High Pressure Jetter)', 7, 4, 3, 3, 2),
(745, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 5, 3, 3, 2),
(746, '2F-1725 Agitator', 'Visual inspection', 7, 7, 1, 1, 2),
(747, '2F-1725 Agitator', 'PT Check at seal weld', 7, 5, 1, 1, 2),
(748, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by High Pressure Jetter)', 7, 4, 1, 1, 2),
(749, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 5, 4, 4, 2),
(750, '2F-1725 Agitator', 'Visual inspection', 7, 7, 2, 2, 2),
(751, '2F-1725 Agitator', 'PT Check at seal weld', 8, 5, 2, 2, 2),
(752, '2F-1725 Agitator', 'Open Cover and cleaning', 8, 4, 2, 2, 2),
(753, '2F-1725 Agitator', 'Open Cover and cleaning', 8, 4, 3, 3, 2),
(754, '2F-1725 Agitator', 'Visual inspection', 8, 7, 3, 3, 2),
(755, '2F-1725 Agitator', 'Tube Eddy current Examination', 8, 4, 2, 2, 2),
(756, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by High Pressure Jetter)', 8, 4, 3, 3, 2),
(757, '2F-1725 Agitator', 'Visual inspection', 8, 7, 3, 3, 2),
(758, '2F-1725 Agitator', 'Tube Eddy current Examination', 8, 4, 2, 2, 2),
(759, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 8, 4, 2, 2, 2),
(760, '2F-1725 Agitator', 'Tube Eddy current Examination', 8, 5, 2, 2, 2),
(761, '2F-1725 Agitator', 'Visual inspection', 9, 7, 2, 2, 2),
(762, '2F-1725 Agitator', 'PT Check at seal weld', 9, 5, 2, 2, 2),
(763, '2F-1725 Agitator', 'Tube Eddy current Examination', 9, 5, 1, 1, 2),
(764, '2F-1725 Agitator', 'Visual inspection', 9, 7, 1, 1, 2),
(765, '2F-1725 Agitator', 'PT Check at seal weld and channel cover', 8, 5, 1, 1, 2),
(766, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by High Pressure Jetter)', 8, 4, 1, 1, 2),
(767, '2F-1725 Agitator', 'Tube Eddy current Examination', 8, 5, 4, 4, 2),
(768, '2F-1725 Agitator', 'Visual inspection', 8, 7, 2, 2, 2),
(769, '2F-1725 Agitator', 'PT Check at seal weld', 9, 5, 2, 2, 2),
(770, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by High Pressure Jetter)', 9, 4, 2, 2, 2),
(771, '2F-1725 Agitator', 'Visual inspection', 9, 7, 2, 2, 2),
(772, '2F-1725 Agitator', 'PT Check at seal weld', 9, 5, 2, 2, 2),
(773, '2F-1725 Agitator', 'Tube Eddy current Examination', 9, 5, 2, 2, 2),
(774, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by High Pressure Jetter)', 9, 4, 2, 2, 2),
(775, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 9, 4, 1, 1, 2),
(776, '2F-1725 Agitator', 'Tube Eddy current Examination', 9, 5, 1, 1, 2),
(777, '2F-1725 Agitator', 'Visual Inspection', 8, 7, 1, 1, 2),
(778, '2F-1725 Agitator', 'PT Check at seal weld and channel cover', 8, 5, 1, 1, 2),
(779, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 8, 4, 1, 1, 2),
(780, '2F-1725 Agitator', 'Tube Eddy current Examination', 8, 5, 1, 1, 2),
(781, '2F-1725 Agitator', 'Visual Inspection', 8, 7, 1, 1, 2),
(782, '2F-1725 Agitator', 'PT Check at seal weld and channel cover', 8, 5, 1, 1, 2),
(783, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 8, 4, 1, 1, 2),
(784, '2F-1725 Agitator', 'Tube Eddy current Examination', 8, 5, 1, 1, 2),
(785, '2F-1725 Agitator', 'Visual Inspection', 8, 7, 1, 1, 2),
(786, '2F-1725 Agitator', 'PT Check at seal weld and channel cover', 8, 5, 1, 1, 2),
(787, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by High Pressure Jetter)', 8, 4, 2, 2, 2),
(788, '2F-1725 Agitator', 'Tube Eddy current Examination', 8, 5, 5, 5, 2),
(789, '2F-1725 Agitator', 'Visual Inspection', 8, 7, 2, 2, 2),
(790, '2F-1725 Agitator', 'PT Check at seal weld', 8, 5, 1, 1, 2),
(791, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 8, 4, 2, 2, 2),
(792, '2F-1725 Agitator', 'Tube Eddy current Examination', 9, 5, 5, 5, 2),
(793, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 2, 2, 2),
(794, '2F-1725 Agitator', 'PT Check at seal weld', 9, 5, 2, 2, 2),
(795, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 9, 4, 2, 2, 2),
(796, '2F-1725 Agitator', 'Tube Eddy current Examination', 9, 5, 5, 5, 2),
(797, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 2, 2, 2),
(798, '2F-1725 Agitator', 'PT Check at seal weld', 8, 5, 2, 2, 2),
(799, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 8, 4, 1, 1, 2),
(800, '2F-1725 Agitator', 'Tube Eddy current Examination', 8, 5, 1, 1, 2),
(801, '2F-1725 Agitator', 'Visual Inspection', 8, 7, 1, 1, 2),
(802, '2F-1725 Agitator', 'PT Check at seal weld', 9, 5, 1, 1, 2),
(803, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 9, 4, 2, 2, 2),
(804, '2F-1725 Agitator', 'Tube Eddy current Examination', 9, 5, 4, 4, 2),
(805, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 2, 2, 2),
(806, '2F-1725 Agitator', 'PT Check at seal weld and channel cover', 9, 5, 2, 2, 2),
(807, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 9, 4, 1, 1, 2),
(808, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 1, 1, 2),
(809, '2F-1725 Agitator', 'Tube Eddy current Examination', 9, 5, 1, 1, 2),
(810, '2F-1725 Agitator', 'PT Check at seal weld and channel cover', 9, 5, 1, 1, 2),
(811, '2F-1725 Agitator', 'Tube Eddy current Examination', 9, 5, 5, 5, 2),
(812, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 1, 1, 2),
(813, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 9, 4, 1, 1, 2),
(814, '2F-1725 Agitator', 'Tube Eddy current Examination', 9, 5, 5, 5, 2),
(815, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 1, 1, 2),
(816, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 9, 4, 1, 1, 2),
(817, '2F-1725 Agitator', 'Visual Inspection', 7, 7, 2, 2, 2),
(818, '2F-1725 Agitator', 'Visual Inspection', 7, 7, 2, 2, 2),
(819, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 7, 4, 2, 2, 2),
(820, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 9, 4, 1, 1, 2),
(821, '2F-1725 Agitator', 'Tube Eddy current Examination', 9, 5, 1, 1, 2),
(822, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 1, 1, 2),
(823, '2F-1725 Agitator', 'PT check at seal weld', 9, 5, 1, 1, 2),
(824, '2F-1725 Agitator', 'Visual Inspection', 7, 7, 3, 3, 2),
(825, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 5, 6, 1, 2),
(826, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 7, 4, 3, 3, 2),
(827, '2F-1725 Agitator', 'Visual Inspection', 7, 7, 2, 2, 2),
(828, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 5, 2, 2, 2),
(829, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 7, 4, 2, 2, 2),
(830, '2F-1725 Agitator', 'Visual Inspection', 7, 7, 2, 2, 2),
(831, '2F-1725 Agitator', 'Tube Eddy current Examination', 7, 5, 2, 2, 2),
(832, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 9, 4, 2, 2, 2),
(833, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 9, 4, 3, 3, 2),
(834, '2F-1725 Agitator', 'Tube Eddy current Examination', 9, 5, 6, 1, 2),
(835, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 3, 3, 2),
(836, '2F-1725 Agitator', 'PT check at Tube seal weld', 9, 5, 3, 3, 2),
(837, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 9, 4, 5, 5, 2),
(838, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 5, 5, 2),
(839, '2F-1725 Agitator', 'PT check at Tube seal weld', 9, 5, 5, 5, 2),
(840, '2F-1725 Agitator', 'Open Channel cover and cleaning', 9, 4, 2, 2, 2),
(841, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 2, 2, 2),
(842, '2F-1725 Agitator', 'Open Channel cover and cleaning', 9, 4, 2, 2, 2),
(843, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 2, 2, 2),
(844, '2F-1725 Agitator', 'PT check at Tube seal weld', 9, 5, 2, 2, 2),
(845, '2F-1725 Agitator', 'Open Channel cover and cleaning', 9, 4, 2, 2, 2),
(846, '2F-1725 Agitator', 'Tube Eddy current Examination', 9, 5, 6, 1, 2),
(847, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 2, 2, 2),
(848, '2F-1725 Agitator', 'PT check at Tube seal weld', 9, 5, 2, 2, 2),
(849, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 5, 5, 2),
(850, '2F-1725 Agitator', 'Open Channel cover and cleaning', 9, 4, 5, 5, 2),
(851, '2F-1725 Agitator', 'Open Channel cover and cleaning', 9, 4, 3, 3, 2),
(852, '2F-1725 Agitator', 'Tube Eddy current Examination', 8, 5, 6, 1, 2),
(853, '2F-1725 Agitator', 'Visual Inspection', 8, 7, 3, 3, 2),
(854, '2F-1725 Agitator', 'PT check at Tube seal weld', 9, 5, 3, 3, 2),
(855, '2F-1725 Agitator', 'Open Channel cover and cleaning', 8, 4, 3, 3, 2),
(856, '2F-1725 Agitator', 'Tube Eddy current Examination', 9, 5, 6, 1, 2),
(857, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 3, 3, 2),
(858, '2F-1725 Agitator', 'PT check at Tube seal weld', 9, 5, 3, 3, 2),
(859, '2F-1725 Agitator', 'Tube Eddy current Examination', 9, 5, 6, 1, 2),
(860, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 2, 2, 2),
(861, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by High Pressure Jetter)', 9, 4, 2, 2, 2),
(862, '2F-1725 Agitator', 'Tube Eddy current Examination', 9, 5, 6, 1, 2),
(863, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 2, 2, 2),
(864, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by High Pressure Jetter)', 9, 4, 2, 2, 2),
(865, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 9, 4, 5, 5, 2),
(866, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 5, 5, 2),
(867, '2F-1725 Agitator', 'Open Cover and cleaning (Tube Cleaning by Low Pressure Jetter)', 9, 4, 5, 5, 2),
(868, '2F-1725 Agitator', 'Visual Inspection', 9, 7, 5, 5, 2),
(869, '2C-1711 Lube Oil Tank', 'Open Manhole Inside Tank', 9, 4, 2, 2, 2),
(870, '2C-1711 Lube Oil Tank', 'Cleaning & Oil Replace', 9, 4, 2, 2, 2),
(871, 'Over Head Tank', 'Open M/H , Visual Inspection', 9, 4, 1, 1, 2),
(872, 'Over Head Tank', 'Inside Tank Cleaning', 8, 4, 2, 2, 2),
(873, 'HBR Tank', 'Open / Close manhole', 8, 4, 2, 2, 2),
(874, 'HBR Tank', 'Replace unit tank', 9, 4, 2, 2, 2),
(875, 'HAC Settler', 'Open Manhole and cleaning', 9, 4, 1, 1, 2),
(876, 'HAC Settler', 'Visual Inspection', 9, 7, 1, 1, 2),
(877, 'Feed Mixing Tank', 'Open Manhole and cleaning', 8, 4, 1, 1, 2),
(878, 'Feed Mixing Tank', 'Visual Inspection', 8, 7, 1, 1, 2),
(879, '2M-1741 Feed Drum', 'Open Manhole and cleaning', 8, 4, 1, 1, 2),
(880, '2M-1741 Feed Drum', 'Visual Inspection', 8, 7, 1, 1, 2),
(881, '2D-1750 NaOH Tank', 'Open M/H, Visual Inspection', 8, 4, 2, 2, 2),
(882, 'Mother Liquid Tank', 'Open Manhole and cleaning', 9, 4, 1, 1, 2),
(883, 'Mother Liquid Tank', 'Visual Inspection', 9, 7, 1, 1, 2),
(884, 'NBA Make Up Tank', 'Open Manhole and cleaning', 9, 4, 5, 5, 2),
(885, 'NBA Make Up Tank', 'Visual Inspection', 7, 7, 5, 5, 2),
(886, 'NBA Buffer Tank', 'Open Manhole and cleaning', 7, 4, 5, 5, 2),
(887, 'NBA Buffer Tank', 'Visual Inspection', 8, 7, 5, 5, 2),
(888, 'NBA Buffer Tank', 'Open Manhole and cleaning', 8, 4, 2, 2, 2),
(889, '2D-1764 Mist Separator', 'Open Manhole and cleaning', 8, 4, 4, 4, 2),
(890, '2D-1764 Mist Separator', 'Visual Inspection', 8, 7, 4, 4, 2),
(891, '2D-1764 Condensate Tank', 'Open Manhole and cleaning', 9, 4, 4, 4, 2),
(892, '2D-1764 Condensate Tank', 'Visual Inspection', 9, 7, 4, 4, 2),
(893, 'Flush Drum', 'Open Manhole and cleaning', 9, 4, 4, 4, 2),
(894, 'Flush Drum', 'Visual Inspection', 9, 7, 4, 4, 2),
(895, 'Dehydrated Solvent Tank', 'Open Manhole and cleaning', 9, 4, 2, 2, 2),
(896, 'Dehydrated Solvent Tank', 'Visual Inspection', 9, 7, 2, 2, 2),
(897, 'NBA Separator', 'Open Manhole and cleaning', 9, 4, 3, 3, 2),
(898, 'NBA Separator', 'Visual Inspection', 9, 7, 3, 3, 2),
(899, '2D-1769 B Condensate Tank', 'Open Manhole and cleaning', 9, 4, 2, 2, 2),
(900, '2D-1769 B Condensate Tank', 'Visual Inspection', 9, 7, 2, 2, 2),
(901, 'PX Separator', 'Open Manhole and cleaning', 9, 4, 5, 5, 2),
(902, 'PX Separator', 'Visual Inspection', 9, 7, 5, 5, 2),
(903, '6 S Steam Drum', 'Open Manhole and cleaning (weld line cleaning by wire brush)', 9, 4, 1, 1, 2),
(904, '6 S Steam Drum', 'Visual Inspection', 9, 7, 1, 1, 2),
(905, '6 S Steam Drum', 'MPI at all weld joint', 9, 5, 2, 2, 2),
(906, 'MS Condensate Drum', 'Open Manhole and cleaning (weld line cleaning by wire brush)', 9, 4, 1, 1, 2),
(907, 'MS Condensate Drum', 'Visual Inspection', 9, 7, 1, 1, 2),
(908, 'MS Condensate Drum', 'MPI at all weld joint', 8, 5, 2, 2, 2),
(909, '3.5 S Steam Drum', 'Open Manhole and cleaning (weld line cleaning by wire brush)', 8, 4, 1, 1, 2),
(910, '3.5 S Steam Drum', 'Visual Inspection', 8, 7, 1, 1, 2),
(911, '3.5 S Steam Drum', 'MPI at all weld joint', 9, 5, 2, 2, 2),
(912, 'BW Storage Drum', 'Open Manhole and cleaning', 9, 4, 5, 5, 2),
(913, 'BW Storage Drum', 'Visual Inspection', 9, 7, 5, 5, 2),
(914, 'BW Storage Drum', 'MPI at all weld joint', 9, 5, 5, 5, 2),
(915, '2E-1771 Steam Drum', 'Open Manhole and cleaning (weld line cleaning by wire brush)', 9, 4, 1, 1, 2),
(916, '2E-1771 Steam Drum', 'Visual Inspection', 9, 7, 1, 1, 2),
(917, '2E-1771 Steam Drum', 'MPI at all weld joint', 7, 5, 2, 2, 2),
(918, '0.5 S Steam Drum', 'Open Manhole and cleaning (weld line cleaning by wire brush)', 7, 4, 1, 1, 2),
(919, '0.5 S Steam Drum', 'Visual Inspection', 7, 7, 1, 1, 2),
(920, '0.5 S Steam Drum', 'MPI at all weld joint', 7, 5, 2, 2, 2),
(921, '2C-1711 Lube Oil Pump', 'Pump Overhaul', 8, 2, 1, 1, 2),
(922, '2C-1711 Lube Oil Pump', 'Pump Overhaul', 8, 2, 1, 1, 2),
(923, '2E-1718 Condensate Pump', 'Pump Overhaul', 8, 2, 1, 1, 2),
(924, '2E-1718 Condensate Pump', 'Pump Overhaul', 8, 2, 1, 1, 2),
(925, 'MC Head Tank', 'Open Cover, Visual Inspection', 8, 4, 5, 5, 2),
(926, 'HBR Head Tank', 'Open Cover, Visual Inspection', 8, 4, 5, 5, 2),
(927, '2E-1731 Condensate Tank', 'Open Flange and cover (Lift down to lower plateform)', 8, 4, 5, 5, 2),
(928, '2E-1731 Condensate Tank', 'Visual Inspection', 7, 7, 5, 5, 2),
(929, 'Catalyst Charge Tank', 'Open Handhole', 7, 4, 6, 1, 2),
(930, 'Catalyst Charge Tank', 'Visual Inspection', 7, 7, 6, 1, 2),
(931, '2M-1741 Separator', 'Open Manhole, take out demister and cleaning', 7, 4, 3, 3, 2),
(932, '2M-1741 Separator', 'Visual Inspection', 7, 7, 3, 3, 2),
(933, '2C-1741 Mist Separator', 'Open Manhole, take out demister and cleaning', 7, 4, 3, 3, 2),
(934, '2C-1741 Mist Separator', 'Visual Inspection', 9, 7, 3, 3, 2),
(935, '2C-1741 Mist Separator', 'Replace Demister', 9, 4, 2, 2, 2),
(936, 'M-1745 RAM ROD', 'Open Top Cover, Visual inspection', 9, 4, 2, 2, 2),
(937, 'N0. 2 Steam Separator', 'Visual Inspection', 9, 7, 3, 3, 2),
(938, 'N0. 2 Steam Separator', 'Open connection flange', 7, 4, 3, 3, 2),
(939, 'No. 1 Steam Separator', 'Open connection flange', 7, 4, 3, 3, 2),
(940, 'No. 1 Steam Separator', 'Visual Inspection', 7, 7, 3, 3, 2),
(941, 'Purge Heater', 'Take out / Install purge heater', 7, 4, 5, 3, 2),
(942, 'Purge Heater', 'Pneumatic test', 7, 4, 5, 3, 2),
(943, 'Purge Heater', 'PT check of coupling&support', 7, 5, 5, 3, 2),
(944, 'Purge Heater', 'Take out / Install purge heater', 7, 4, 5, 3, 2),
(945, 'Purge Heater', 'Pneumatic test', 8, 4, 5, 3, 2),
(946, 'Purge Heater', 'PT check of coupling&support', 8, 5, 5, 3, 2),
(947, 'Purge Heater', 'Take out / Install purge heater', 8, 4, 5, 3, 2),
(948, 'Purge Heater', 'Pneumatic test', 8, 4, 5, 3, 2),
(949, 'Purge Heater', 'PT check of coupling&support', 8, 5, 5, 3, 2),
(950, 'Purge Heater', 'Take out / Install purge heater', 8, 4, 5, 3, 2),
(951, 'Purge Heater', 'Pneumatic test', 8, 4, 5, 3, 2),
(952, 'Purge Heater', 'PT check of coupling&support', 8, 5, 5, 3, 2),
(953, 'Purge Heater', 'Take out / Install purge heater', 8, 4, 5, 3, 2),
(954, 'Purge Heater', 'Pneumatic test', 8, 4, 5, 3, 2),
(955, 'Purge Heater', 'PT check of coupling&support', 8, 5, 5, 3, 2),
(956, 'Purge Heater', 'Take out / Install purge heater', 8, 4, 5, 3, 2),
(957, 'Purge Heater', 'Pneumatic test', 8, 4, 5, 3, 2),
(958, 'Purge Heater', 'PT check of coupling&support', 8, 5, 5, 3, 2),
(959, '1 st Vacum Ejector', 'Take out / Install Ejector', 8, 4, 3, 3, 2),
(960, '1 st Vacum Ejector', 'Penetrant test of ejector', 8, 5, 3, 3, 2),
(961, '2 nd Vacum Ejector', 'Take out / Install Ejector', 8, 4, 3, 3, 2),
(962, '2 nd Vacum Ejector', 'Penetrant test of ejector', 8, 5, 3, 3, 2),
(963, 'Hogging Ejector', 'Take out / Install Ejector - Assembly and disassembly', 8, 4, 3, 3, 2),
(964, 'Hogging Ejector', 'Penetrant test of ejector', 8, 5, 3, 3, 2),
(965, '2D-1736 Ejector', 'Take out / Install Ejector - Assembly and disassembly', 8, 4, 3, 3, 2),
(966, '2D-1736 Ejector', 'Penetrant test of ejector', 8, 5, 3, 3, 2),
(967, '2D-1750 Ejector', 'Take out / Install Ejector - Assembly and disassembly', 8, 4, 5, 5, 2),
(968, '2D-1750 Ejector', 'Penetrant test of ejector', 8, 5, 5, 5, 2),
(969, '2D-1722 1st Ejector', 'Take out / Install Ejector - Assembly and disassembly', 8, 4, 2, 2, 2),
(970, '2D-1722 1st Ejector', 'Penetrant test of ejector', 8, 5, 2, 2, 2),
(971, '2D-1722 2nd Ejector', 'Take out / Install Ejector - Assembly and disassembly', 8, 4, 2, 2, 2),
(972, '2D-1722 2nd Ejector', 'Penetrant test of ejector', 8, 5, 2, 2, 2),
(973, '2D-1722 3rd Ejector', 'Take out / Install Ejector - Assembly and disassembly', 8, 4, 2, 2, 2),
(974, '2D-1722 3rd Ejector', 'Penetrant test of ejector', 8, 5, 2, 2, 2),
(975, 'CTA Vacum Filter', 'Replace Drive chain & sprocket inspection', 8, 3, 1, 1, 2),
(976, 'CTA Vacum Filter', 'Check Corrosion & Blow Back valve gap', 8, 3, 1, 1, 2),
(977, 'CTA Vacum Filter', 'Check damper and spray nozzle', 8, 3, 1, 1, 2),
(978, 'CTA Vacum Filter', 'PT check at casing , internal nozzle neck of center drum', 8, 5, 1, 1, 2),
(979, 'CTA Vacum Filter', 'Take out/ install casing, VI', 8, 3, 1, 1, 2),
(980, 'CTA Vacum Filter', 'Change filter clothes', 8, 3, 1, 1, 2),
(981, 'CTA Vacum Filter', 'Bearing inspection (Replace if needed)', 8, 3, 1, 1, 2),
(982, 'CTA Vacum Filter', 'Change gland packing', 8, 3, 1, 1, 2),
(983, 'CTA Vacum Filter', 'Replace Drive chain & sprocket inspection', 8, 3, 1, 1, 2),
(984, 'CTA Vacum Filter', 'Check Corrosion & Blow Back valve gap', 8, 3, 1, 1, 2),
(985, 'CTA Vacum Filter', 'Check damper and spray nozzle', 8, 3, 1, 1, 2),
(986, 'CTA Vacum Filter', 'PT check at casing , internal nozzle neck of center drum', 8, 5, 1, 1, 2),
(987, 'CTA Vacum Filter', 'Take out/ install casing, VI', 8, 3, 1, 1, 2),
(988, 'CTA Vacum Filter', 'Change filter clothes', 8, 3, 1, 1, 2),
(989, 'CTA Vacum Filter', 'Bearing inspection (Replace if needed)', 7, 3, 1, 1, 2),
(990, 'CTA Vacum Filter', 'Change gland packing', 7, 3, 1, 1, 2),
(991, 'CTA Dryer', 'Open Manhole and cleaning', 7, 3, 1, 1, 2),
(992, 'CTA Dryer', 'Visual Inspection', 7, 5, 1, 1, 2),
(993, 'CTA Dryer', 'Measurement gap or clearrance of tube support', 7, 3, 2, 2, 2),
(994, 'CTA Dryer', 'Inspection and measurement off ball knocker', 7, 3, 2, 2, 2),
(995, 'CTA Dryer', 'Overhaoul Oil pinion P/N (c)', 7, 3, 2, 2, 2),
(996, 'CTA Dryer', 'Replace Fuse plug of Fluid coupling', 7, 3, 2, 2, 2),
(997, 'CTA Dryer', 'Inspecction tube 2\" at base material by PAUT (45pcs)', 7, 5, 2, 2, 2),
(998, 'CTA Dryer', 'PT Check Steam header & Air vent tube', 7, 5, 2, 2, 2),
(999, 'CTA Dryer', 'PT Check at gir gear P/N-a', 7, 5, 2, 2, 2),
(1000, 'CTA Dryer', 'Radial Roller Bearing Replace (Inlet side)', 7, 3, 2, 2, 2),
(1001, 'CTA Dryer', 'Radial Roller Bearing Replace (Outlet side)', 7, 3, 2, 2, 2),
(1002, 'CTA Dryer', 'Thrust Roller Bearing Replace', 7, 3, 2, 2, 2),
(1003, 'CTA Dryer', 'Gear Reducer Overhaul', 7, 3, 3, 3, 2),
(1004, 'CTA Dryer', 'Change Fluid Coupling', 8, 3, 3, 3, 2),
(1005, 'CTA Dryer', 'PT check at Tube support, key plate and shim plate', 8, 5, 1, 1, 2),
(1006, 'CTA Dryer', 'UT check at shell outside (Tube support position)', 8, 5, 1, 1, 2),
(1007, '1 st Outlet Conveyor', 'Take out screw & Open Cover, Visual Inspection', 8, 3, 1, 1, 2),
(1008, '1 st Outlet Conveyor', 'Gland Check & Change', 8, 3, 1, 1, 2),
(1009, '1 st Outlet Conveyor', 'Bearing Replace', 8, 3, 1, 1, 2),
(1010, '1 st Outlet Conveyor', 'Check reamer bolt', 8, 3, 1, 1, 2),
(1011, '1 st Outlet Conveyor', 'PT check at Screw and reamer bolt', 8, 5, 1, 1, 2),
(1012, '1 st Outlet Conveyor', 'Replace Drive chain & sprocket inspection', 8, 3, 1, 1, 2),
(1013, '1 st Outlet Conveyor', 'Take out screw & Open Cover, Visual Inspection', 8, 3, 1, 1, 2),
(1014, '1 st Outlet Conveyor', 'Gland Check & Change', 8, 3, 1, 1, 2),
(1015, '1 st Outlet Conveyor', 'Bearing Replace', 8, 3, 1, 1, 2),
(1016, '1 st Outlet Conveyor', 'Check reamer bolt', 8, 3, 1, 1, 2),
(1017, '1 st Outlet Conveyor', 'PT check at Screw and reamer bolt', 8, 5, 1, 1, 2),
(1018, '1 st Outlet Conveyor', 'Replace Drive chain & sprocket inspection', 8, 3, 1, 1, 2),
(1019, '2 nd Outlet Conveyor', 'Gland Check & Change', 8, 3, 1, 1, 2),
(1020, '2 nd Outlet Conveyor', 'Bearing Replace', 8, 3, 1, 1, 2),
(1021, '2 nd Outlet Conveyor', 'Check reamer bolt', 8, 3, 1, 1, 2),
(1022, '2 nd Outlet Conveyor', 'PT check at Screw and reamer bolt', 8, 5, 1, 1, 2),
(1023, '2 nd Outlet Conveyor', 'Replace Drive chain & sprocket inspection', 8, 3, 1, 1, 2),
(1024, '2 nd Outlet Conveyor', 'Take out screw & Open Cover, Visual Inspection', 8, 3, 1, 1, 2),
(1025, '2M-1745 Inlet Conveyor', 'Visual inspection', 8, 7, 1, 1, 2),
(1026, '2M-1745 Inlet Conveyor', 'Replace Drive chain & sprocket inspection', 8, 3, 1, 1, 2),
(1027, '2M-1745 Inlet Conveyor', 'PT check at spokes and shaft', 8, 5, 1, 1, 2),
(1028, '2M-1745 Inlet Conveyor', 'Change gland packing and V-seal (Detail B and C)', 8, 3, 1, 1, 2),
(1029, '2M-1745 Inlet Conveyor', 'Change gland packing Steam tubes (Detail D and E)', 8, 3, 3, 3, 2),
(1030, '2M-1745 Inlet Conveyor', 'Change gland packing (Detail A)', 8, 3, 1, 1, 2),
(1031, '2M-1745 Inlet Conveyor', 'Bearing Replace', 8, 3, 2, 2, 2),
(1032, '2M-1745 Outlet Conveyor', 'Change Internal Bearing (Detail D)', 8, 3, 1, 1, 2),
(1033, '2M-1745 Outlet Conveyor', 'Bearing Replace', 8, 3, 1, 1, 2),
(1034, '2M-1745 Outlet Conveyor', 'Replace Drive chain & sprocket inspection', 8, 3, 1, 1, 2),
(1035, '2M-1745 Outlet Conveyor', 'PT check at screw and shaft', 8, 5, 1, 1, 2),
(1036, '2M-1745 Outlet Conveyor', 'Visual Inspection of Coil spring (spring support)', 8, 5, 2, 2, 2),
(1037, '2M-1745 Outlet Conveyor', 'Take out screw & Open H H, Visual Inspection', 8, 3, 1, 1, 2),
(1038, '2M-1745 Outlet Conveyor', 'Change gland packing (Detail A)', 8, 3, 1, 1, 2),
(1039, '2M-1745 Outlet Conveyor', 'Change gland packing (Detail B)', 8, 3, 1, 1, 2),
(1040, '2M-1745 Outlet Conveyor', 'Change gland packing (Detail C)', 8, 3, 1, 1, 2),
(1041, '2M-1745 Outlet Conveyor', 'Change bush (Detail E)', 8, 3, 1, 1, 2),
(1042, '2M-1745 Outlet Conveyor', 'Change bush (Detail F)', 8, 3, 1, 1, 2),
(1043, '2M-1745 Rotary Valve', 'Replace Drive chain & sprocket inspection', 9, 3, 1, 1, 2),
(1044, '2M-1745 Rotary Valve', 'Change ABC Ring', 9, 3, 2, 2, 2),
(1045, '2M-1745 Rotary Valve', 'Rotary Valve Overhaul', 9, 3, 1, 1, 2),
(1046, 'CTA Conveyor', 'Change Gland packing', 9, 2, 1, 1, 2),
(1047, 'CTA Conveyor', 'Open Cover, Visual Inspection', 9, 2, 1, 1, 2),
(1048, 'CTA Conveyor', 'Bearing Replace', 9, 2, 2, 2, 2),
(1049, 'CTA Conveyor', 'Conveyor chain inspection (sampling, measure deflection of conveyor chain)', 8, 2, 2, 2, 2),
(1050, 'CTA Conveyor', 'Replace Drive chain & sprocket inspection', 8, 2, 1, 1, 2),
(1051, 'CTA Conveyor', 'PT check at flight (take sampling flight 20%)', 8, 5, 2, 2, 2),
(1052, 'CTA Conveyor', 'Bearing Replace', 8, 3, 2, 2, 2),
(1053, 'CTA Conveyor', 'Change Gland packing', 8, 3, 1, 1, 2),
(1054, 'CTA Conveyor', 'Conveyor chain inspection (sampling, measure deflection of conveyor chain)', 8, 3, 2, 2, 2),
(1055, 'CTA Conveyor', 'PT check at flight (take sampling flight 20%)', 8, 5, 2, 2, 2),
(1056, 'CTA Conveyor', 'Replace Drive chain & sprocket inspection', 8, 3, 1, 1, 2),
(1057, 'CTA Conveyor', 'Open Cover, Visual Inspection', 8, 3, 1, 1, 2),
(1058, 'CTA Conveyor', 'Change Gland packing', 8, 3, 1, 1, 2),
(1059, 'CTA Conveyor', 'Conveyor chain inspection (sampling, measure deflection of conveyor chain)', 8, 3, 2, 2, 2),
(1060, 'CTA Conveyor', 'PT check at flight (take sampling flight 20%)', 8, 5, 2, 2, 2),
(1061, 'CTA Conveyor', 'Replace Drive chain & sprocket inspection', 8, 3, 1, 1, 2),
(1062, 'CTA Conveyor', 'Bearing Replace', 8, 3, 2, 2, 2),
(1063, 'CTA Conveyor', 'Open Cover, Visual Inspection', 8, 3, 1, 1, 2),
(1064, 'CTA Conveyor', 'Bearing Replace', 8, 3, 2, 2, 2),
(1065, 'CTA Conveyor', 'Change Gland packing', 8, 3, 1, 1, 2),
(1066, 'CTA Conveyor', 'Conveyor chain inspection (sampling, measure deflection of conveyor chain)', 8, 3, 2, 2, 2),
(1067, 'CTA Conveyor', 'PT check at flight (take sampling flight 20%)', 9, 5, 2, 2, 2),
(1068, 'CTA Conveyor', 'Replace Drive chain & sprocket inspection', 9, 3, 1, 1, 2),
(1069, 'CTA Conveyor', 'Open Cover, Visual Inspection', 9, 3, 1, 1, 2),
(1070, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1071, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1072, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1073, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1074, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1075, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1076, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1077, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1078, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1079, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1080, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1081, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1082, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1083, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1084, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1085, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1086, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1087, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1088, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1089, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1090, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1091, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1092, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1093, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1094, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1095, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1096, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1097, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1098, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1099, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1100, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1101, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1102, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1103, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1104, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1105, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1106, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1107, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1108, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1109, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1110, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1111, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1112, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1113, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1114, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1115, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1116, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1117, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1118, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1119, 'Pressure safety valve', 'Overhaul / Recondition', 8, 6, 2, 2, 2),
(1120, 'Pressure safety valve', 'Overhaul / Recondition', 8, 6, 2, 2, 2),
(1121, 'Pressure safety valve', 'Take out / install Safety valve', 8, 4, 2, 2, 2),
(1122, 'Pressure safety valve', 'Take out / install Safety valve', 9, 4, 2, 2, 2),
(1123, 'Pressure safety valve', 'Overhaul / Recondition', 9, 6, 2, 2, 2),
(1124, 'Off Gas Separator', 'Open Manhole and cleaning', 9, 4, 3, 3, 2),
(1125, 'Off Gas Separator', 'Visual Inspection', 9, 7, 3, 3, 2),
(1126, '2D-1772 Ejector', 'Take out / install top cover (include rubber tray)', 9, 4, 3, 3, 2),
(1127, '2D-1772 Ejector', 'Visual Inspection', 9, 7, 3, 3, 2),
(1128, '2D-1772 Ejector', 'Take out / install top cover (include rubber tray)', 9, 4, 3, 3, 2),
(1129, '2D-1772 Ejector', 'Visual Inspection', 9, 7, 3, 3, 2),
(1130, '2D-1772 Ejector After', 'Take out / install top cover (include rubber tray)', 7, 4, 3, 3, 2),
(1131, '2D-1772 Ejector After', 'Visual Inspection', 7, 7, 3, 3, 2),
(1132, 'Sea Water Header Nozzle and Header Side', 'Open / install Blind flange', 7, 4, 1, 1, 2),
(1133, 'Sea Water Header Nozzle and Header Side', 'Visual Inspection', 7, 7, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `id_grade` int(11) NOT NULL,
  `grade_name` varchar(20) NOT NULL,
  `grade_point` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`id_grade`, `grade_name`, `grade_point`) VALUES
(7, 'A', 4),
(8, 'B', 3),
(9, 'C', 2),
(10, 'D', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inspection_period`
--

CREATE TABLE `inspection_period` (
  `id_inspection_period` int(11) NOT NULL,
  `period_name` varchar(20) NOT NULL,
  `period_point` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inspection_period`
--

INSERT INTO `inspection_period` (`id_inspection_period`, `period_name`, `period_point`) VALUES
(1, '2', 6),
(2, '4', 5),
(3, '6', 4),
(4, '8', 3),
(5, '10', 2),
(6, '12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `last_inspection`
--

CREATE TABLE `last_inspection` (
  `id_last_inspection` int(11) NOT NULL,
  `year` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `last_inspection`
--

INSERT INTO `last_inspection` (`id_last_inspection`, `year`) VALUES
(1, '2021'),
(2, '2022'),
(3, '2023'),
(4, '2024'),
(5, '2025');

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `id_penilaian` int(11) NOT NULL,
  `id_equipment` int(11) NOT NULL,
  `id_criteria` int(11) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plant`
--

CREATE TABLE `plant` (
  `id_plant` int(11) NOT NULL,
  `plant_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plant`
--

INSERT INTO `plant` (`id_plant`, `plant_name`) VALUES
(1, 'CTA1'),
(2, 'CTA2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classification`
--
ALTER TABLE `classification`
  ADD PRIMARY KEY (`id_classification`);

--
-- Indexes for table `compute_history`
--
ALTER TABLE `compute_history`
  ADD PRIMARY KEY (`id_history`);

--
-- Indexes for table `compute_results`
--
ALTER TABLE `compute_results`
  ADD PRIMARY KEY (`id_result`);

--
-- Indexes for table `criteria_weight`
--
ALTER TABLE `criteria_weight`
  ADD PRIMARY KEY (`id_criteria`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id_equipment`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id_grade`);

--
-- Indexes for table `inspection_period`
--
ALTER TABLE `inspection_period`
  ADD PRIMARY KEY (`id_inspection_period`);

--
-- Indexes for table `last_inspection`
--
ALTER TABLE `last_inspection`
  ADD PRIMARY KEY (`id_last_inspection`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id_penilaian`);

--
-- Indexes for table `plant`
--
ALTER TABLE `plant`
  ADD PRIMARY KEY (`id_plant`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classification`
--
ALTER TABLE `classification`
  MODIFY `id_classification` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `compute_history`
--
ALTER TABLE `compute_history`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compute_results`
--
ALTER TABLE `compute_results`
  MODIFY `id_result` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `criteria_weight`
--
ALTER TABLE `criteria_weight`
  MODIFY `id_criteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id_equipment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1134;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `id_grade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `inspection_period`
--
ALTER TABLE `inspection_period`
  MODIFY `id_inspection_period` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `last_inspection`
--
ALTER TABLE `last_inspection`
  MODIFY `id_last_inspection` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plant`
--
ALTER TABLE `plant`
  MODIFY `id_plant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
