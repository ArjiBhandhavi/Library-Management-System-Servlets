create database library;

use library;

CREATE TABLE `books` (
  `bid` int NOT NULL,
  `bname` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `isbn` varchar(25) DEFAULT NULL,
  `price` int NOT NULL,
  `descr` varchar(100) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `createdon` datetime NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `btrans`
--

CREATE TABLE `btrans` (
  `id` int NOT NULL,
  `bid` int NOT NULL,
  `stdid` int NOT NULL,
  `trandate` datetime NOT NULL,
  `issue` bit(1) DEFAULT NULL,
  `breturn` bit(1) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `active` bit(1) NOT NULL,
  `createdon` datetime NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` varchar(50) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  `id` int NOT NULL,
  `createdon` datetime NOT NULL,
  `active` bit(1) NOT NULL
);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `uname`, `pwd`, `role`, `id`, `createdon`, `active`) VALUES
('admin', 'Administrator', 'anand', 'Admin', 0, '2021-11-05 07:22:46', b'1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `btrans`
--
ALTER TABLE `btrans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `btrans`
--
ALTER TABLE `btrans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
