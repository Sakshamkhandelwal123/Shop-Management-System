-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `userId` varchar(12) NOT NULL,
  `customerName` varchar(30) NOT NULL,
  `phoneNumber` varchar(14) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`userId`, `customerName`, `phoneNumber`, `address`) VALUES
('c001', 'Customer', '+8801234567890', 'banani'),
('deba', 'Debashish', '+8801763923789', 'Kuril');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `userId` varchar(12) NOT NULL,
  `employeeName` varchar(50) NOT NULL,
  `phoneNumber` varchar(14) NOT NULL,
  `role` varchar(8) NOT NULL,
  `salary` double(8,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`userId`, `employeeName`, `phoneNumber`, `role`, `salary`) VALUES
('e001', 'Employee1', '+8801234567890', 'Manager', 50000.00),
('e002', 'Employee2', '+8801234567891', 'General', 30000.00);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `userId` varchar(12) NOT NULL,
  `password` varchar(12) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`userId`, `password`, `status`) VALUES
('e001', 'e001', 0),
('e002', 'e002', 0),
('c001', 'c001', 1),
('deba', 'aaaa', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` int(5) UNSIGNED ZEROFILL NOT NULL,
  `productName` varchar(50) NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `productName`, `price`, `quantity`) VALUES
(00001, 'Juice 1L', 66.00, 7),
(00002, 'Mi Band', 2000.00, 5),
(00003, 'Frutika', 55.00, 21),
(00004, 'Samsung S9', 89999.00, 5),
(00005, 'Bagpack XL', 2500.00, 6);

-- --------------------------------------------------------

--
-- Table structure for table `purchaseinfo`
--

CREATE TABLE `purchaseinfo` (
  `purchaseId` int(5) UNSIGNED ZEROFILL NOT NULL,
  `userId` varchar(12) NOT NULL,
  `productId` varchar(12) NOT NULL,
  `cost` double(12,2) UNSIGNED NOT NULL,
  `amount` int(8) UNSIGNED NOT NULL,
  `date` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchaseinfo`
--

INSERT INTO `purchaseinfo` (`purchaseId`, `userId`, `productId`, `cost`, `amount`, `date`) VALUES
(00001, 'deba', '00003', 55.00, 1, '2018-09-26'),
(00002, 'c001', '00005', 2500.00, 1, '2018-09-28'),
(00006, 'c001', '00003', 110.00, 2, '2018-09-28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD UNIQUE KEY `userId` (`userId`),
  ADD UNIQUE KEY `userId_2` (`userId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `purchaseinfo`
--
ALTER TABLE `purchaseinfo`
  ADD PRIMARY KEY (`purchaseId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `userId_2` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productId` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `purchaseinfo`
--
ALTER TABLE `purchaseinfo`
  MODIFY `purchaseId` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `purchaseinfo`
--
ALTER TABLE `purchaseinfo`
  ADD CONSTRAINT `FK_PUR_CUS` FOREIGN KEY (`userId`) REFERENCES `purchaseinfo` (`userId`);