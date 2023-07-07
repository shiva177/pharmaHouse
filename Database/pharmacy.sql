SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `id` int(11) NOT NULL,
  `Batch_ID` varchar(255) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Cost_Price` float NOT NULL,
  `Sell_Price` float NOT NULL,
  `Production_Date` date NOT NULL,
  `Expire_Date` date NOT NULL,
  `Purchase_ID` int(11) NOT NULL,
  `Medicine_ID` int(11) NOT NULL,
  `Supplier_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`id`, `Batch_ID`, `Quantity`, `Cost_Price`, `Sell_Price`, `Production_Date`, `Expire_Date`, `Purchase_ID`, `Medicine_ID`, `Supplier_ID`) VALUES
(1, '112', 20, 200, 555, '2017-09-12', '2017-09-30', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bill_information`
--

CREATE TABLE `bill_information` (
  `id` int(11) NOT NULL,
  `Invoice_No` varchar(255) NOT NULL,
  `Total_Amount` float NOT NULL,
  `Discount` varchar(10) NOT NULL,
  `Discount_Amount` float NOT NULL,
  `Total_Payable` float NOT NULL,
  `Paid` float NOT NULL,
  `Returned` float NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_information`
--

INSERT INTO `bill_information` (`id`, `Invoice_No`, `Total_Amount`, `Discount`, `Discount_Amount`, `Total_Payable`, `Paid`, `Returned`, `Date`) VALUES
(1, '525', 1200, '10', 120, 1080, 1080, 0, '2017-09-06'),
(2, 'IN-11143543444', 50, '5', 2.5, 47.5, 66, 18.5, '2017-09-23'),
(3, '324', 60, '5', 3, 57, 100, 43, '2017-09-19'),
(4, 'IN-101342434', 67, '3', 2.01, 64.99, 100, 35.01, '2017-09-29'),
(5, 'IN-111213213', 17, '5', 0.85, 16.15, 34, 17.85, '2017-09-28'),
(6, 'B1014', 30, '2', 0.6, 29.4, 25, -4.4, '2017-09-28'),
(7, 'IN-111', 6, '2', 0.12, 5.88, 10, 4.12, '2017-09-19'),
(8, 'New101', 4, '0', 0, 4, 5, 1, '2017-09-19'),
(11, 'New-102', 4, '1', 0.04, 3.96, 23, 19.04, '2017-09-20'),
(12, 'IN-1111', 62, '5', 3.1, 58.9, 100, 41.1, '2017-09-19');

-- --------------------------------------------------------

--
-- Table structure for table `category` this is actually for the shops info
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `Category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID`, `Category`) VALUES
(6, 'Yash Pharma'),
(7, 'Shivam Medicals'),
(8, 'Shashank Shop'),
(9, 'Jithu ki dukaan'),
(10, 'Aman Medicine'),
(11, 'Sravan Shop'),
(12, 'India Medicals'),
(13, 'Eye Care'),
(14, 'Capsule Shop'),
(22, 'Mohalla Dawa Khana ');

-- --------------------------------------------------------

--
-- Table structure for table `drug_generic_name`
--

CREATE TABLE `drug_generic_name` (
  `ID` int(11) NOT NULL,
  `Generic_Name` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drug_generic_name`
--

INSERT INTO `drug_generic_name` (`ID`, `Generic_Name`, `Description`) VALUES
(3, 'PARACETAMOL (ACETAMINOPHEN)', 'Paracetamol 500mgs'),
(4, 'PARACETAMOL + CAFFEINE', 'Paracetamol 500mg + Caffeine 65mg'),
(5, 'Basak extract', 'Basak extract'),
(6, 'PARACETAMOL + TRAMADOL', 'Paracetamol 325mg + Tramadol 37.5mg'),
(7, 'DIPHENHYDRAMINE', 'Diphenhydramine 10mg/5ml'),
(8, 'CLOTRIMAZOLE', 'Clotrimazole 10mg/gm'),
(9, 'KETOTIFEN', 'Ketotifen Fumarate 0.025%'),
(10, 'OLOPATADINE', 'Olopatadine 0.1%'),
(11, 'CETIRIZINE', 'Cetirizine 10mg'),
(12, 'ALBENDAZOLE', 'Albendazole 400mg'),
(13, 'AMBRISENTAN', 'Ambrisentan 5mg'),
(14, 'AMBROXOL', 'Ambroxol 75mg'),
(15, 'AAA', 'VVB');

-- --------------------------------------------------------


--
-- Table Structure for table 'contact'
--
CREATE TABLE `contact` (
  `fullName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



ALTER TABLE `contact`
  ADD PRIMARY KEY (`email`);


  INSERT INTO `contact` (`fullName`, `email`,`message`) VALUES
('Yash', 'yash@gmail.com','This is a great project guys'),
('Shivam', 'shivam@gmail.com','I loved ur work guys'),
('JIthu', 'jithu@gmail.com','Greattttttttt');




--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `ID` int(11) NOT NULL,
  `Manufacturer_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`ID`, `Manufacturer_Name`) VALUES
(1, 'SQUARE'),
(2, 'INCEPTA PHARMA'),
(3, 'BEXIMCO'),
(4, 'OPSONIN PHARMA'),
(5, 'RENATA'),
(6, 'ESKAYEF'),
(7, 'ACME'),
(8, 'A.C.I.'),
(9, 'ARISTOPHARMA'),
(10, 'DRUG INTERNATIONAL'),
(11, 'HEALTHCARE PHARMA'),
(12, 'ORION PHARMA LTD.');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_information`
--

CREATE TABLE `medicine_information` (
  `ID` int(11) NOT NULL,
  `Medicine_Name` varchar(255) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `Generic_ID` int(11) NOT NULL,
  `Manufacturer_ID` int(11) NOT NULL,
  `Category_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine_information`
--

INSERT INTO `medicine_information` (`ID`, `Medicine_Name`, `Category`, `Generic_ID`, `Manufacturer_ID`, `Category_ID`) VALUES
(1, 'paracetmol', '', 3, 1, 6),
(3, 'Cetrigin', '', 6, 1, 6),
(5, 'Grillinctus', '', 5, 1, 10),
(6, 'Azithromycin', '', 7, 1, 10),
(7, 'Glucon D', '', 8, 1, 11),
(8, 'Complain', '', 9, 1, 13),
(9, 'Pain killer', '', 10, 1, 13),
(10, 'Dettol', '', 12, 1, 9),
(11, 'Condom', '', 14, 1, 14);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `ID` int(11) NOT NULL,
  `Supplier_Name` varchar(50) NOT NULL,
  `Contact` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`ID`, `Supplier_Name`, `Contact`, `Email`) VALUES
(1, 'SQUARE 1', '45782222', 'square@gmail.com'),
(2, 'SQUARE 2', '666445435', 'square2@gmail.com'),
(3, 'SQUARE 3', '123445', 'square@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_access`
--

CREATE TABLE `user_access` (
  `Username` varchar(25) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Usertype` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_access`
--

INSERT INTO `user_access` (`Username`, `Password`, `Usertype`) VALUES
('Admin', 'Admin', 'Admin'),
('bappy', 'bappy', 'Admin'),
('Staff', 'Staff', 'Staff'),
('yash', 'yash', 'Staff'),
('jithu', 'jithu', 'Staff'),
('tusar', 'tusar', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_information`
--

CREATE TABLE `user_information` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Date_of_Birth` date NOT NULL,
  `Age` int(11) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Contact` varchar(50) NOT NULL,
  `Blood_Group` varchar(15) NOT NULL,
  `Marital_Status` varchar(10) NOT NULL,
  `Join_Date` date NOT NULL,
  `Salary` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_information`
--

INSERT INTO `user_information` (`ID`, `Name`, `Email`, `Gender`, `Date_of_Birth`, `Age`, `Address`, `Contact`, `Blood_Group`, `Marital_Status`, `Join_Date`, `Salary`, `Username`) VALUES
(3, 'bappy', 'bappy@gmail.com', 'Male', '2017-09-19', 24, 'Allahabad ,India', 100000, 'B+', 'Unmarried', '2017-09-27', 777893, 'bappy'),
(5, 'jithu', 'jithu@gmail.com', 'Male', '2017-09-19', 24, 'Allahabad ,India', 100000, 'B+', 'Unmarried', '2017-09-27', 90492, 'jithu'),
(7, 'yash', 'yash@gmail.com', 'Male', '2017-09-19', 24, 'Allahabad ,India', 100000, 'B+', 'Unmarried', '2017-09-27', 77702, 'yash'),
(4, 'Tusar', 'tusar@gmail.com', 'Male', '2017-09-13', 24, 'Allahabad ,India', 123445, 'A+', 'Married', '2017-09-27', 222, 'tusar');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Supplier_ID` (`Supplier_ID`),
  ADD KEY `Medicine_ID` (`Medicine_ID`);

--
-- Indexes for table `bill_information`
--
ALTER TABLE `bill_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `drug_generic_name`
--
ALTER TABLE `drug_generic_name`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `medicine_information`
--
ALTER TABLE `medicine_information`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Generic_ID` (`Generic_ID`),
  ADD KEY `Manufacturer_ID` (`Manufacturer_ID`),
  ADD KEY `Category_ID` (`Category_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_access`
--
ALTER TABLE `user_access`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `user_information`
--
ALTER TABLE `user_information`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batch`

ALTER TABLE `batch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bill_information`
--
ALTER TABLE `bill_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `drug_generic_name`
--
ALTER TABLE `drug_generic_name`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `medicine_information`
--
ALTER TABLE `medicine_information`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_information`
--
ALTER TABLE `user_information`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `batch`

ALTER TABLE `batch`
  ADD CONSTRAINT `batch_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`ID`),
  ADD CONSTRAINT `batch_ibfk_2` FOREIGN KEY (`Medicine_ID`) REFERENCES `medicine_information` (`ID`);

--
-- Constraints for table `medicine_information`
--
ALTER TABLE `medicine_information`
  ADD CONSTRAINT `medicine_information_ibfk_1` FOREIGN KEY (`Generic_ID`) REFERENCES `drug_generic_name` (`ID`),
  ADD CONSTRAINT `medicine_information_ibfk_2` FOREIGN KEY (`Manufacturer_ID`) REFERENCES `manufacturer` (`ID`),
  ADD CONSTRAINT `medicine_information_ibfk_3` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`ID`);

--
-- Constraints for table `user_information`
--
ALTER TABLE `user_information`
  ADD CONSTRAINT `user_information_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `user_access` (`Username`);
COMMIT;


