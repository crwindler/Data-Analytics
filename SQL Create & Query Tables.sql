Use m_windler
go

drop table shipment;
drop table CustBus;
drop table truck;
drop table customer;
drop table city;
drop table BusinessLine;


CREATE TABLE businessline (
  SIC INT primary key,
  IndustryName varchar(50));

  
INSERT INTO businessline (SIC, IndustryName) VALUES
(8994, 'Cereals'),
(2361, 'Poultry'),
(3324, 'Snails'),
(3698, 'Seafood'),
(6206, 'Produce'),
(6407, 'Meat'),
(7406, 'Beverages'),
(9143, 'Housewares'),
(9587, 'Chemicals'),
(9731, 'Confections');


CREATE TABLE city (
  CityID INT NOT NULL,
  CityName varchar(30) DEFAULT NULL,
  CityPop INT DEFAULT NULL,
  PRIMARY KEY (CityID)
) ;



INSERT INTO city (CityID, CityName, CityPop) VALUES
(1, 'Seattle', 3686348),
(2, 'Newark', 4330894),
(3, 'Cleveland', 4652020),
(4, 'St. Louis', 2775510),
(5, 'Fremont', 2180491),
(6, 'Portland', 931270),
(7, 'Milwaukee', 3080384),
(8, 'Rochester', 893357),
(9, 'Mobile', 4558878),
(10, 'New Orleans', 3081037),
(11, 'Honolulu', 928268),
(12, 'Anchorage', 2427660),
(13, 'Austin', 4789355),
(14, 'Baton Rouge', 1294520),
(15, 'Cincinnati', 808763),
(16, 'Milwaukee', 3954593),
(17, 'Baton Rouge', 796341),
(18, 'Toledo', 617550),
(19, 'Minneapolis', 2284418),
(20, 'Boston', 2954666),
(21, 'New York', 753296),
(22, 'Long Beach', 2839342),
(23, 'El Paso', 1985662),
(24, 'San Jose', 2334412),
(25, 'Columbus', 1306330),
(26, 'Mobile', 2188662),
(27, 'Washington', 311714),
(28, 'Mobile', 2056665),
(29, 'Rochester', 4709680),
(30, 'St. Paul', 1931247),
(31, 'Anaheim', 4819264),
(32, 'Honolulu', 3558197),
(33, 'Fresno', 4387989),
(34, 'Riverside', 3569468),
(35, 'Colorado', 4504828),
(36, 'Washington', 1177455),
(37, 'Phoenix', 4588073),
(38, 'Glendale', 3014019),
(39, 'Lubbock', 285622),
(40, 'Little Rock', 2640898),
(41, 'Oakland', 847788),
(42, 'Omaha', 3827988),
(43, 'Newark', 750279),
(44, 'Austin', 1929595),
(45, 'Long Beach', 4263495),
(46, 'Cincinnati', 1690134),
(47, 'Detroit', 2051035),
(48, 'Wichita', 2675564),
(49, 'Fort Worth', 1933825),
(50, 'Anchorage', 4144093);

CREATE TABLE customer (
  CustID INT NOT NULL,
  CustName varchar(30) DEFAULT NULL,
  AnnualRevenue INT DEFAULT NULL,
  CustType varchar(30) DEFAULT NULL,
  PRIMARY KEY (CustID)
) ;
INSERT INTO customer (CustID, CustName, AnnualRevenue, CustType) VALUES
(1, 'Lydia Lloyd', 3325213, 'Retail'),
(2, 'Chester Glover', 3941472, 'Retail'),
(3, 'Danny Phillips', 2312672, 'Retail'),
(4, 'Austin Chavez', 3424563, 'Foreign'),
(5, 'Kendall Ingram', 412326, 'Government'),
(6, 'Valerie Dickerson', 4607676, 'Foreign'),
(7, 'Lisa Aguilar', 1199961, 'Government'),
(8, 'Vicki Payne', 3119159, 'Retail'),
(9, 'Elias Garrett', 1449300, 'Wholesale'),
(10, 'Allison Hoffman', 4082164, 'Retail'),
(11, 'Betsy Mc Lean', 57668, 'Government'),
(12, 'Mike Larsen', 1948420, 'Retail'),
(13, 'Angelina Walker', 4293210, 'Government');




CREATE TABLE custbus (
  CustID INT NOT NULL,
  SIC INT NOT NULL,
  Marketshare decimal(2,2) DEFAULT NULL,
  PRIMARY KEY (CustID,SIC)) ;

ALTER TABLE custbus ADD CONSTRAINT fkCustID2 FOREIGN KEY (CustID) REFERENCES customer (CustID);
ALTER TABLE custbus ADD CONSTRAINT fkSIC FOREIGN KEY (SIC) REFERENCES businessline (SIC);

INSERT INTO custbus (CustID, SIC, Marketshare) VALUES
(1, 9143, 0.59),
(2, 2361, 0.75),
(2, 6206, 0.99),
(3, 8994, 0.22),
(4, 3324, 0.89),
(5, 9587, 0.93),
(6, 2361, 0.60),
(6, 3698, 0.12),
(7, 6206, 0.05),
(7, 9731, 0.17),
(8, 7406, 0.90),
(9, 3698, 0.30),
(9, 7406, 0.69),
(10, 9143, 0.70),
(10, 9587, 0.99),
(11, 7406, 0.92),
(11, 9587, 0.33),
(12, 6407, 0.60),
(13, 3324, 0.09),
(13, 9731, 0.42);

CREATE TABLE truck (
  TruckID INT NOT NULL,
  DriverName varchar(30) DEFAULT NULL,
  PRIMARY KEY (TruckID)
) ;



INSERT INTO truck (TruckID, DriverName) VALUES
(1, 'Jeanine Walton'),
(2, 'Claire Farrell'),
(3, 'Valerie Huynh'),
(4, 'Roy Massey'),
(5, 'Forrest Baxter'),
(6, 'Gerard Drake'),
(7, 'Gilberto Woodard'),
(8, 'Roberta Carroll'),
(9, 'Randal Anderson'),
(10, 'Max Peters'),
(11, 'Rolando Matthews'),
(12, 'Lee Sanchez'),
(13, 'Roderick Little'),
(14, 'Ty Mosley'),
(15, 'Donna Norris'),
(16, 'Yvonne Reeves'),
(17, 'Bridgette Hardy'),
(18, 'Daphne Woodard'),
(19, 'Damian Horton'),
(20, 'Andrea Eaton'),
(21, 'Lewis Rowe'),
(22, 'Dwayne Arias'),
(23, 'Glen Greer'),
(24, 'Garrett Preston'),
(25, 'Marco Rogers');

CREATE TABLE shipment (
  ShipmentID INT NOT NULL,
  CustID INT DEFAULT NULL,
  ShipWeight INT DEFAULT NULL,
  TruckID INT DEFAULT NULL,
  CityID INT DEFAULT NULL,
  ShipDate date DEFAULT NULL,
  PRIMARY KEY (ShipmentID)) ;



INSERT INTO shipment (ShipmentID, CustID, ShipWeight, TruckID, CityID, ShipDate) VALUES
(1, 10, 783, 19, 37, '2007-12-30'),
(2, 11, 312, 21, 41, '2007-08-28'),
(3, 10, 280, 20, 39, '2008-08-22'),
(4, 8, 313, 14, 28, '2011-08-02'),
(5, 3, 496, 6, 11, '2010-11-14'),
(6, 8, 991, 14, 28, '2009-02-19'),
(7, 12, 57, 23, 46, '2008-12-30'),
(8, 6, 434, 12, 23, '2011-05-23'),
(9, 13, 1211, 25, 49, '2008-10-03'),
(10, 4, 522, 7, 14, '2009-09-11'),
(11, 4, 520, 8, 15, '2010-03-23'),
(12, 7, 1045, 12, 24, '2007-12-01'),
(13, 9, 1010, 16, 32, '2011-06-29'),
(14, 7, 597, 12, 24, '2007-03-10'),
(15, 13, 586, 25, 50, '2009-12-05'),
(16, 1, 399, 1, 2, '2007-12-26'),
(17, 12, 620, 22, 44, '2010-11-25'),
(18, 13, 942, 25, 50, '2010-03-01'),
(19, 9, 767, 17, 34, '2010-07-31'),
(20, 5, 104, 8, 16, '2008-04-01'),
(21, 11, 404, 21, 41, '2010-09-18'),
(22, 12, 301, 22, 43, '2012-01-12'),
(23, 13, 720, 25, 50, '2007-06-03'),
(24, 1, 817, 1, 2, '2010-08-14'),
(25, 10, 412, 18, 35, '2010-03-18'),
(26, 7, 366, 14, 27, '2008-02-19'),
(27, 13, 317, 24, 47, '2011-04-16'),
(28, 9, 1052, 18, 35, '2010-08-13'),
(29, 8, 587, 14, 28, '2008-07-13'),
(30, 2, 559, 3, 5, '2011-06-13'),
(31, 3, 101, 5, 10, '2007-12-16'),
(32, 6, 1119, 12, 23, '2010-07-16'),
(33, 4, 255, 8, 15, '2009-02-08'),
(34, 13, 912, 25, 50, '2011-02-24'),
(35, 9, 723, 17, 33, '2010-03-23'),
(36, 10, 456, 20, 39, '2009-07-17'),
(37, 1, 759, 1, 2, '2007-06-21'),
(38, 5, 208, 10, 20, NULL),
(39, 5, 171, 9, 18, '2008-01-27'),
(40, 13, 1019, 24, 48, '2010-05-06'),
(41, 7, 656, 13, 26, '2009-09-04'),
(42, 10, 301, 18, 36, '2011-04-09'),
(43, 2, 972, 3, 6, '2007-05-15'),
(44, 4, 29, 7, 14, '2009-07-18'),
(45, 12, 653, 23, 46, '2008-11-08'),
(46, 11, 823, 20, 40, '2007-07-12'),
(47, 5, 707, 9, 17, '2008-07-18'),
(48, 6, 822, 12, 23, '2010-01-08'),
(49, 2, 622, 4, 8, '2010-08-19'),
(50, 3, 1065, 6, 12, NULL),
(51, 6, 644, 11, 21, '2011-01-28'),
(52, 10, 863, 18, 36, '2008-04-12'),
(53, 9, 1091, 16, 31, '2011-06-14'),
(54, 7, 454, 13, 25, '2007-03-19'),
(55, 3, 922, 5, 10, '2007-04-09'),
(56, 12, 487, 22, 44, '2012-01-09'),
(57, 11, 842, 21, 42, '2008-09-27'),
(58, 10, 713, 19, 37, '2008-02-17'),
(59, 12, 1151, 22, 43, '2007-03-28'),
(60, 9, 134, 17, 34, '2010-03-11'),
(61, 9, 679, 16, 32, '2008-05-17'),
(62, 3, 255, 6, 11, '2009-09-25'),
(63, 12, 1097, 23, 45, NULL),
(64, 12, 657, 23, 45, '2010-01-06'),
(65, 2, 426, 3, 5, '2010-07-19'),
(66, 11, 651, 21, 42, '2009-11-10'),
(67, 3, 794, 5, 9, '2009-06-22'),
(68, 9, 103, 17, 33, '2008-09-27'),
(69, 11, 1125, 21, 42, '2011-11-08'),
(70, 3, 135, 6, 11, '2010-12-23'),
(71, 13, 891, 25, 50, '2007-05-06'),
(72, 7, 417, 13, 25, '2009-02-16'),
(73, 9, 776, 17, 33, '2007-05-21'),
(74, 10, 998, 18, 36, '2007-07-08'),
(75, 11, 699, 21, 41, '2009-10-29');



ALTER TABLE shipment ADD CONSTRAINT fkCityID FOREIGN KEY (CityID) REFERENCES city (CityID);
ALTER TABLE shipment ADD CONSTRAINT fkCustID FOREIGN KEY (CustID) REFERENCES customer (CustID);
ALTER TABLE shipment ADD CONSTRAINT fkTruckID FOREIGN KEY (TruckID) REFERENCES truck (TruckID);
