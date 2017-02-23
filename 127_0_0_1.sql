-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2017 at 04:36 AM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amlyp`
--
CREATE DATABASE IF NOT EXISTS `amlyp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `amlyp`;

-- --------------------------------------------------------

--
-- Table structure for table `scrumboard`
--

CREATE TABLE `scrumboard` (
  `id` int(100) NOT NULL,
  `productbacklog` varchar(100) NOT NULL,
  `sprintbacklog` varchar(100) NOT NULL,
  `tasks` varchar(100) NOT NULL,
  `done` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scrumboard`
--

INSERT INTO `scrumboard` (`id`, `productbacklog`, `sprintbacklog`, `tasks`, `done`) VALUES
(1, 'This is the first epic. ', 'As a user I want to be able to create an epic. ', 'Create the epic functionality', 'Epic Created'),
(2, 'This is the 2nd epic. ', 'As a member I need to be able to skydive so I can get a thrill.', 'Someone needs to order the plane. ', 'We did the dive. \r\n'),
(3, 'Thomas is the BEST!!!', 'For real he is.', 'This is not a joke.', 'He is a doctor now.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `scrumboard`
--
ALTER TABLE `scrumboard`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `scrumboard`
--
ALTER TABLE `scrumboard`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
