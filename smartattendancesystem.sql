-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2026 at 08:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartattendancesystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `attendance_time` time NOT NULL,
  `attendance_status` enum('Present','Absent') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `student_id`, `attendance_date`, `attendance_time`, `attendance_status`) VALUES
(33, 3, '2026-06-15', '02:47:00', 'Present'),
(34, 4, '2026-06-15', '02:47:06', 'Present'),
(35, 5, '2026-06-15', '02:47:11', 'Present'),
(36, 5, '2026-06-15', '02:47:16', 'Absent'),
(37, 6, '2026-06-15', '02:47:21', 'Present'),
(38, 7, '2026-06-15', '02:47:34', 'Absent'),
(39, 7, '2026-06-15', '02:48:15', 'Present'),
(40, 7, '2026-06-15', '02:48:19', 'Present'),
(41, 3, '2026-06-15', '19:15:28', 'Present'),
(42, 7, '2026-06-15', '19:16:32', 'Absent'),
(43, 5, '2026-06-15', '19:17:35', 'Present'),
(44, 8, '2026-06-15', '19:18:17', 'Present'),
(45, 8, '2026-06-15', '19:18:23', 'Absent'),
(46, 9, '2026-06-15', '19:18:32', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `lecturer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `lecturer`) VALUES
(2, 'Math', 'Nurul'),
(3, 'English', 'Kamil'),
(4, 'Malay', 'Amy'),
(5, 'Science', 'Steven'),
(6, 'Chinese', 'Michelle');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `course` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `name`, `course`, `email`, `phone`, `status`, `course_id`) VALUES
(1, 'Rachel Tan', 'BITP', 'rachel_tan@gmail.com', '01122334455', 'Inactive', 2),
(2, 'Ali', 'BITM', 'ali@gmail.com', '0123456789', 'Inactive', 3),
(3, 'David', 'BITS', 'david@gmail.com', '0198765445', 'Active', 3),
(4, 'Siti', 'BITP', 'siti@gmail.com', '0134567890', 'Active', 2),
(5, 'John', 'BITM', 'john@gmail.com', '0121275367', 'Active', 4),
(6, 'Crystal', 'BITZ', 'crystal@gmail.com', '0165328746', 'Active', 5),
(7, 'Amil', 'BITE', 'amil@gmail.com', '0167248765', 'Active', 6),
(8, 'Sharil', 'BITZ', 'sharil@gamil.com', '01218142456', 'Active', NULL),
(9, 'Micheal', 'BITU', 'micheal@gmail.com', '0124804829', 'Active', NULL),
(10, 'Belly', 'BITZ', 'belly@gmail.com', '0124878465', 'Inactive', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin123', 'Admin'),
(2, 'Annie', 'annie123', 'Staff'),
(3, 'Charles', '12345', 'Admin'),
(4, 'Amil', '1234747', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
