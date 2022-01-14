-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 12, 2018 at 02:34 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rescue`
--

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lat` text NOT NULL,
  `lon` text NOT NULL,
  `description` text NOT NULL,
  `img` text NOT NULL,
  `time_stamp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `t_id`, `user_id`, `lat`, `lon`, `description`, `img`, `time_stamp`) VALUES
(1, 2, 1, '0.2222', '3.15645456', 'No Description', 'http://localhost/rescue/accident_image/a1.jpg', '11/Oct/2018 15:10:34'),
(2, 2, 3, '0.2222', '3.15645456', 'This is Animal Accident, We need AID for Animal', 'http://localhost/rescue/accident_image/a1.jpg', '11-Oct-2018 15:10:56'),
(4, 4, 5, '31.4515157', '74.2903787', 'this is medical request', 'http://192.168.10.19/rescue/accident_image/511-Oct-2018 17:10:23.jpeg', '11-Oct-2018 17:10:23'),
(5, 2, 1, '0.2222', '3.15645456', 'kuch b ni', 'http://192.168.10.19/rescue/accident_image/111-Oct-2018 17:10:37.jpeg', '11-Oct-2018 17:10:37'),
(6, 4, 5, '31.4515167', '74.2903867', 'this is medical request', 'http://192.168.10.19/rescue/accident_image/511-Oct-2018 17:10:48.jpeg', '11-Oct-2018 17:10:48'),
(7, 2, 5, '31.4515157', '74.2903787', 'animal ka accident ho gya hai...', 'http://192.168.10.19/rescue/accident_image/511-Oct-2018 17:10:46.jpeg', '11-Oct-2018 17:10:46'),
(8, 1, 5, '31.4515157', '74.2903787', 'hzjzhz', 'http://192.168.10.19/rescue/accident_image/511-Oct-2018 17:10:31.jpeg', '11-Oct-2018 17:10:31'),
(9, 1, 5, '31.4515157', '74.2903787', 'hzjzhz', 'http://192.168.10.19/rescue/accident_image/511-Oct-2018 17:10:33.jpeg', '11-Oct-2018 17:10:33'),
(10, 2, 1, '0.2222', '3.15645456', 'kuch b ni', 'http://192.168.10.19/rescue/accident_image/111-Oct-2018 17:10:45.jpeg', '11-Oct-2018 17:10:45'),
(11, 1, 5, '31.4515157', '74.2903787', 'hzjzhz', 'http://192.168.10.19/rescue/accident_image/511-Oct-2018 17:10:52.jpeg', '11-Oct-2018 17:10:52'),
(12, 3, 5, '31.4515132', '74.2903874', 'This is fire request', 'http://192.168.10.19/rescue/accident_image/511-Oct-2018 17:10:28.jpeg', '11-Oct-2018 17:10:28'),
(13, 5, 5, '31.454353', '74.288220', 'This is other request', 'http://192.168.10.19/rescue/accident_image/511-Oct-2018 17:10:25.jpeg', '11-Oct-2018 17:10:25');

-- --------------------------------------------------------

--
-- Table structure for table `request_type`
--

CREATE TABLE `request_type` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_type`
--

INSERT INTO `request_type` (`id`, `name`, `img`) VALUES
(1, 'Accident', 'http://localhost/rescue/accident_image/a1.jpg'),
(2, 'Animal Accident', 'http://localhost/rescue/accident_image/a1.jpg'),
(3, 'Fire', 'http://localhost/rescue/accident_image/a1.jpg'),
(4, 'Medical', 'http://localhost/rescue/accident_image/a1.jpg'),
(5, 'Other', 'http://localhost/rescue/accident_image/a1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `contact` text NOT NULL,
  `cnic` text NOT NULL,
  `type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `contact`, `cnic`, `type`) VALUES
(1, 'Hamza', 'hamzashaikh1480@gmail.com', 'hamza', '03058222281', '38403-5792559-7', 'user'),
(3, 'Tahreem', 'tahreem@gmail.com', 'tahreem', '1234', '456789', 'user'),
(5, 'Sara', 'sara@gmail.com', 'sara', '123458', '9978757', 'user'),
(6, 'Sara', 'saraa@gmail.com', 'saraa', '1122334455', '456464321', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_type`
--
ALTER TABLE `request_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `request_type`
--
ALTER TABLE `request_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
