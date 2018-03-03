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
	`Name` VARCHAR(100) NOT NULL,
	`Email` VARCHAR(100) NOT NULL,
	`Password` VARCHAR(40) NOT NULL,
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
	`Evaluation` FLOAT(5) NOT NULL,
	`Nb_Evaluation` INT NOT NULL,
	`Nb_Orders` INT NOT NULL,
	`Promotion` FLOAT(5) NOT NULL,
	`Shipping` FLOAT(5) NOT NULL,
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
ALTER TABLE `details` ADD `urlBook` TEXT NULL DEFAULT NULL AFTER `aboutAuthor`;
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


INSERT INTO `details` (`ID_Details`, `Sml_Description`, `Lng_Description`, `Published_Day`, `Published_By`, `lang`, `Review`, `aboutAuthor`) VALUES (NULL, 'When Grace Ozmian, the beautiful and reckless daughter of a wealthy tech billionaire, first goes missing, the NYPD assumes she has simply sped off on another wild adventure. Until the young woman\'s body is discovered in an abandoned warehouse in Queens, the head nowhere to be found.', 'Lieutenant CDS Vincent D\'Agosta quickly takes the lead. He knows his investigation will attract fierce scrutiny, so D\'Agosta is delighted when FBI Special Agent A.X.L. Pendergast shows up at the crime scene assigned to the case. \"I feel rather like Brer Rabbit being thrown into the briar patch,\" Pendergast tells D\'Agosta, \"because I have found you here, in charge. Just like when we first met, back at the Museum of Natural History.\"\r\nBut neither Pendergast nor D\'Agosta are prepared for what lies ahead. A diabolical presence is haunting the greater metropolitan area, and Grace Ozmian was only the first of many victims to be murdered . . . and decapitated. Worse still, there\'s something unique to the city itself that has attracted the evil eye of the killer.\r\n', '2017-02-07', 'Grand Central Publishing', 'English', 'As always, the authors have crafted a story that is almost impossible to pull away from, and their prose is as elegant as fans have come to expect. Pendergast continues to be one of thrillerdom\'s most exciting and intriguing series leads, and the series remains among the most reliable in the genre.', 'The thrillers of Douglas Preston and Lincoln Child \"stand head and shoulders above their rivals\" (Publishers Weekly). Preston and Child\'s Relic and The Cabinet of Curiosities were chosen by readers in a National Public Radio poll as being among the one hundred greatest thrillers ever written, and Relic was made into a number-one box office hit movie. They are coauthors of the famed Pendergast series and their recent novels include Fever Dream, Cold Vengeance, Two Graves, and Gideon\'s Corpse. In addition to his novels, Preston writes about archaeology for the New Yorker and Smithsonian magazines. Lincoln Child is a former book editor who has published five novels of his own, including the huge bestseller Deep Storm. \r\nReaders can sign up for The Pendergast File, a monthly \"strangely entertaining note\" from the authors, at their website, www.PrestonChild.com. The authors welcome visitors to their alarmingly active Facebook page, where they post regularly.');


INSERT INTO `seller` (`ID_Seller`, `Name`, `Email`, `Password`) VALUES (NULL, 'Alis MIAZI', 'alis.m@gmail.com', '159852fdsg');


INSERT INTO `seller` (`ID_Seller`, `Name`, `Email`, `Password`) VALUES (NULL, 'Alis MIAZI', 'alis.m@gmail.com', '159852fdsg');
UPDATE `details` SET `urlBook` = 'data\\uploads\\images\\books\\child\\CH-00.jpg' WHERE `details`.`ID_Details` = 1;


INSERT INTO `details` (`ID_Details`, `Sml_Description`, `Lng_Description`, `Published_Day`, `Published_By`, `lang`, `Review`, `aboutAuthor`, `urlBook`) VALUES (NULL, 'Dog Man and Cat Kid: From the Creator of Captain Underpants (Dog Man #4)', 'Hot diggity dog! Dog Man, the newest hero from Dav Pilkey, the creator of Captain Underpants, is back -- and this time he\'s not alone. The heroic hound with a real nose for justice now has a furry feline sidekick, and together they have a mystery to sniff out! When a new kitty sitter arrives and a glamorous movie starlet goes missing, it\'s up to Dog Man and Cat Kid to save the day! Will these heroes stay hot on the trail, or will Petey, the World\'s Most Evil Cat, send them barking up the wrong tree?', '2015-05-06', 'Graphix', 'English', 'While the sentence structure is simple and concise, Pilkey displays a sense of sophistication, including clever puns and wordplay, as well as a clear mastery of sequential art, making this an ideal option for both reluctant and more advanced readers', 'Dav Pilkey has written and illustrated numerous popular, award-winning books for children, including the Captain Underpants and Dumb Bunnies series; Dog Breath, winner of the California Young Reader Medal; and The Paperboy, a Caldecott Honor Book. He lives with his wife in the Pacific Northwest. Visit him online at pilkey.com.\r\n', 'data\\uploads\\images\\books\\child\\CH-01.jpg');


INSERT INTO `details` (`ID_Details`, `Sml_Description`, `Lng_Description`, `Published_Day`, `Published_By`, `lang`, `Review`, `aboutAuthor`, `urlBook`) VALUES (NULL, 'Recovering from the fight and furious for revenge, Triple Threats member Tokuga solidifies his ties with the duplicitous Wonyong. ', 'Meanwhile, when Republic City’s housing crisis reaches its peak, Zhu Li sets her sights on the biggest public figure in the city—President Raiko—in a bid for the presidency! With her friend’s success, the future of the spirit portal, and the wellbeing of Republic City’s citizens at stake, can Korra remain neutral and fulfill her duties as the Avatar?\r\nWritten by series co-creator Michael Dante DiMartino and drawn by Irene Koh (Teenage Mutant Ninja Turtles, Afrina and the Glass Coffin), with consultation by Bryan Konietzko, this is the official continuation of The Legend of Korra!', '2014-02-22', 'Dark Horse Books', 'English', '', '', 'data\\uploads\\images\\books\\child\\CH-02.jpg');


INSERT INTO `details` (`ID_Details`, `Sml_Description`, `Lng_Description`, `Published_Day`, `Published_By`, `lang`, `Review`, `aboutAuthor`, `urlBook`) VALUES (NULL, 'Join your favorite heroes as they work together to save the day in this Level 1 Ready-to-Read based on PJ Masks, the hit preschool series airing on Disney Junior!', 'Owlette can’t wait to try the new train ride at the amusement park! But when Romeo steals the train for himself, it’s up to Owlette, Catboy, and Gekko to stop him! Can Owlette put aside her excitement to track down Romeo and derail his plot?\r\n\r\nPJ Masks © Frog Box / Entertainment One UK Limited / Walt Disney EMEA Productions Limited 2014', '2017-12-07', 'Simon Spotlight', 'English', '', '', 'data\\\\uploads\\\\images\\\\books\\\\child\\\\CH-03.jpg');
INSERT INTO `details` (`ID_Details`, `Sml_Description`, `Lng_Description`, `Published_Day`, `Published_By`, `lang`, `Review`, `aboutAuthor`, `urlBook`) VALUES (NULL, 'A collection of four all-new strange stories from the sleepy town of Gravity Falls in one original graphic novel. Written by Alex Hirsch.', 'Illustrated by Asaf Hanuka, Dana Terrace, Ian Worrel, Jacob Chabot, Jim Campbell, Joe Pitt, Kyle Smeallie, Meredith Gran, Mike Holmes, Priscilla Tang, Serina Hernandez, Stephanie Ramirez, and Valerie Halla.', '2018-01-22', 'Disney Press', 'English', '', 'Alex Hirsch is a writer, animator, voice actor, and director. He is best known for creating Gravity Falls on Disney XD and for co-writing the #1 New York Times best-selling book Journal 3. He was raised in Piedmont, California, and received a BFA in Character Animation from The California Institute of the Arts. He currently lives in Los Angeles, and is at work developing projects for Film & TV. Follow him on Twitter at @_AlexHirsch.', 'data\\uploads\\images\\books\\child\\CH-05.jpg');

INSERT INTO `details` (`ID_Details`, `Sml_Description`, `Lng_Description`, `Published_Day`, `Published_By`, `lang`, `Review`, `aboutAuthor`, `urlBook`) VALUES (NULL, 'Middle school is a breeding ground for mischief and dreaming big for Big Nate and his pals! \r\n', '\r\nEveryone’s favorite sixth grader is back for more misadventures, and Big Nate: Silent But Deadly smells like a winner!\r\n \r\nWhether he’s showing the ropes to a detention rookie, campaigning for the Student of the Month Award, or writing hilarious movie reviews for The Weekly Bugle, Nate Wright never fails to make his mark at P.S. 38. But middle school’s no bed of roses. In fact, sometimes it just plain stinks. Just ask the Great Nose-ini! Nate’s alter ego with a sense for scents can smell trouble a mile away . . . or at the very next desk. Was that you, Gina?\r\n\r\nJoin Nate and the gang for nonstop laughs in this latest collection of Big Nate comics!', '2010-11-25', 'Andrews McMeel Publishing', 'English', '', 'Lincoln Peirce has been drawing the Big Nate comic strip for more than 20 years. Born in Ames, Iowa, Peirce grew up in Durham, New Hampshire. As a kid, he began creating his own strips in the sixth grade. Peirce taught high school in New York City and has created several animated pilots for Cartoon Network and Nickelodeon. He lives in Portland, Maine, with his family.', 'data\\uploads\\images\\books\\child\\CH-06.jpg');


INSERT INTO `product` (`ID_Product`, `ID_Category`, `ID_Details`, `ID_Seller`, `Title`, `Price`, `Amount`, `Evaluation`, `Nb_Evaluation`, `Nb_Orders`, `Promotion`, `Shipping`) VALUES (NULL, '10', '2', '1', 'The Legend of Korra Turf Wars Part Two', '9.7', '10', '4.8', '110', '22', '50', '0'), (NULL, '10', '5', '1', 'Black Panther Little Golden Book', '17.6', '11', '3.9', '12', '7', '0', '2')
INSERT INTO `product` (`ID_Product`, `ID_Category`, `ID_Details`, `ID_Seller`, `Title`, `Price`, `Amount`, `Evaluation`, `Nb_Evaluation`, `Nb_Orders`, `Promotion`, `Shipping`) VALUES (NULL, '10', '6', '1', 'Time to Be a Hero (PJ Masks)', '22', '22', '3.6', '22', '25', '27', '1.5'), (NULL, '10', '5', '1', 'Big Nate: Silent But Deadly', '7.6', '66', '3.3', '55', '5', '55', '2.5');

INSERT INTO `product` (`ID_Product`, `ID_Category`, `ID_Details`, `ID_Seller`, `Title`, `Price`, `Amount`, `Evaluation`, `Nb_Evaluation`, `Nb_Orders`, `Promotion`, `Shipping`) VALUES (NULL, '10', '3', '1', 'A is for Activist', '25', '5', '4.5', '53', '66', '32', '22');
