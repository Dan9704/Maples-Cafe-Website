-- Table structure for table `units`
CREATE TABLE units (
  `code` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `cp` DECIMAL(10, 1) NOT NULL,
  `type` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table `idd_person`

-- Insert data into "units"
INSERT INTO units (`code`, `description`, `cp`, `type`)
VALUES 
  ('ICT10001', 'Problem Solving with ICT', 12.5, 'Core'),
  ('COS10005', 'Web Development', 12.5, 'Core'),
  ('INF10003', 'Introduction to Business Information Systems', 12.5, 'Core'),
  ('INF10002', 'Database Analysis and Design', 12.5, 'Core'),
  ('COS10009', 'Introduction to Programming', 12.5, 'Core'),
  ('INF30029', 'Information Technology Project Management', 12.5, 'Core'),
  ('ICT30005', 'Professional Issues in Information Technology', 12.5, 'Core'),
  ('ICT30001', 'Information Technology Project', 12.5, 'Core'),
  ('COS20001', 'User-Centred Design', 12.5, 'Software Development'),
  ('TNE10005', 'Network Administration', 12.5, 'Software Development'),
  ('COS20016', 'Operating System Configuration', 12.5, 'Software Development'),
  ('SWE20001', 'Development Project 1 - Tools and Practices', 12.5, 'Software Development'),
  ('COS20007', 'Object Oriented Programming', 12.5, 'Software Development'),
  ('COS30015', 'IT Security', 12.5, 'Software Development'),
  ('COS30043', 'Interface Design and Development', 12.5, 'Software Development'),
  ('COS30017', 'Software Development for Mobile Devices', 12.5, 'Software Development'),
  ('INF20012', 'Enterprise Systems', 12.5, 'Systems Analysis'),
  ('ACC10007', 'Financial Information for Decision Making', 12.5, 'Systems Analysis'),
  ('INF20003', 'Requirements Analysis and Modelling', 12.5, 'Systems Analysis'),
  ('ACC20014', 'Management Decision Making', 12.5, 'Systems Analysis'),
  ('INF30005', 'Business Process Management', 12.5, 'Systems Analysis'),
  ('INF30003', 'Business Information Systems Analysis', 12.5, 'Systems Analysis'),
  ('INF30020', 'Information Systems Risk and Security', 12.5, 'Systems Analysis'),
  ('INF30001', 'Systems Acquisition & Implementation Management', 12.5, 'Systems Analysis');


-- --------------------------------------------------------
-- Table structure for table `users`
-- --------------------------------------------------------
CREATE TABLE users (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `users`
INSERT INTO users (`id`, `username`, `password`) VALUES
(1, 'admin', 'hellovue');
