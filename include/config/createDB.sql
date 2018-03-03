-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2017 at 02:36 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


--
-- Database: `bokshop`
--
CREATE DATABASE IF NOT EXISTS `bokshop` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bokshop`;

-- --------------------------------------------------------

--
-- Table structure for table `Details`
--

CREATE TABLE `Details` (
	`ID_Details` int(11) NOT NULL AUTO_INCREMENT,
	`Sml_Description` TEXT,
	`Lng_Description` TEXT,
	`Published_Day` DATE NOT NULL,
	`Published_By` VARCHAR(50) NOT NULL,
	`lang` VARCHAR(15) NOT NULL,
	`Review` TEXT NOT NULL,
	`aboutAuthor` TEXT NOT NULL,
	constraint Details_pk primary key (ID_Details)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `Cart` (
	`ID_Cart` int(11) NOT NULL AUTO_INCREMENT,
	constraint Details_pk primary key (ID_Cart)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
	`ID_Category` int(11) NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(150) NOT NULL,
	constraint Details_pk primary key (ID_Category)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Seller`
--

CREATE TABLE `Seller` (
	`ID_Seller` INT(11) NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(100),
	`Email` FLOAT NOT NULL,
	`Password` INT NOT NULL,
	constraint Details_pk primary key (ID_Seller)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
	`ID_Product` INT(11) NOT NULL AUTO_INCREMENT,
	`ID_Category` INT NOT NULL,
	`ID_Details` INT NOT NULL,
	`ID_Seller` INT NOT NULL,
	`Title` VARCHAR(100),
	`Price` FLOAT NOT NULL,
	`Amount` INT NOT NULL,
	`Evaluation` INT NOT NULL,
	`Nb_Evaluation` INT NOT NULL,
	`Nb_Orders` INT NOT NULL,
	`Promotion` INT NOT NULL,
	`Shipping` TEXT NOT NULL,
	constraint ID_Product primary key (ID_Product),

	constraint fk_Product_Category foreign key (ID_Category)
	references Category(ID_Category),

	constraint fk_Product_Details foreign key (ID_Details)
	references Details(ID_Details),

	constraint fk_Product_Seller foreign key (ID_Seller)
	references Seller(ID_Seller)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

--
-- Table structure for table `R_Cart_Product`
--

CREATE TABLE `R_Cart_Product` (
	`ID_R_Cart_Product` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`ID_Product` INT NOT NULL,
	`ID_Cart` INT NOT NULL,

	constraint fk_Cart_Product_Cart foreign key (ID_Cart)
	references Cart(ID_Cart),

	constraint fk_Cart_Product_Product foreign key (ID_Product)
	references Product(ID_Product)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

--
-- Table structure for table `Client`
--

CREATE TABLE `Client` (
	`ID_Client` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`ID_Cart` INT NOT NULL,
	`Name` VARCHAR(100),
	`Email` VARCHAR(150),
	`Passwrd` VARCHAR(40),

	constraint fk_Client_Cart foreign key (ID_Cart)
	references Cart(ID_Cart)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Client`
--

CREATE TABLE `News` (
	`ID_News` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`Title` VARCHAR(100) NOT NULL,
	`Container` TEXT(100)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

-- ----------------------------------------------------- --
-- --------------           ALTER          ------------- --
-- ----------------------------------------------------- --


ALTER TABLE Category ADD urlPic TEXT;
ALTER TABLE Category ADD Nu_Items INT;

-- ----------------------------------------------------- --
-- --------------         insertion        ------------- --
-- ----------------------------------------------------- --

--
-- insert into table category values.
--

--
-- insert and modify into table category values.
--

INSERT INTO `category` (`ID_Category`, `Name`) VALUES (NULL, 'Children'),(NULL, 'Education'),(NULL, 'Sport'),(NULL, 'Cooking');
UPDATE `category` SET `urlPic` = 'data/uploads/images/bg/children.jpg', `Nu_Items` = '55' WHERE `category`.`ID_Category` = 10; UPDATE `category` SET `urlPic` = 'data/uploads/images/bg/education.jpg' WHERE `category`.`ID_Category` = 11; UPDATE `category` SET `urlPic` = 'data/uploads/images/bg/sport.jpg', `Nu_Items` = '21' WHERE `category`.`ID_Category` = 12; UPDATE `category` SET `urlPic` = 'data/uploads/images/bg/cooking.jpg', `Nu_Items` = '44' WHERE `category`.`ID_Category` = 13;



INSERT INTO `category` (`ID_Category`, `Name`) VALUES (NULL, 'Children'),(NULL, 'Education'),(NULL, 'Sport'),(NULL, 'Cooking');
