
Use m_windler
go

Drop table OrderLine;
Drop table Orders;
Drop table OrderSource;
Drop table Customer;
Drop table ShipmentLine;
Drop table Inventory;
Drop table Category;
Drop table Shipment;

create table Shipment (
ShipID int PRIMARY KEY not null,
ShipDate Date,
ArrivalDate date);

create table Category (
CatID int PRIMARY KEY,
CatDesc varchar(40));

create table Inventory (
InvID int PRIMARY KEY not null,
InvSize varchar(10) not null,
InvPrice decimal(6,2) not null,
InvQoh int not null,
ItemDesc varchar(30),
Color varchar(20),
CatID int);

alter table Inventory add constraint CatIDFK foreign key (CatID) references Category (CatID);

create table ShipmentLine (
ShipID int not null,
InvID int not null, 
SLQuantityOrdered int,
SLQuantityReceived int);

alter table ShipmentLine add constraint ShipInvidPK primary key (ShipID, InvID);

create table Customer (
CID int PRIMARY KEY not null,
CLast varchar(30),
CFirst varchar(30),
CMI varchar(1),
CBirthDate date,
CAddress varchar(50),
CCity varchar(30),
CState varchar(2),
CZip varchar(10),
CPhone1 varchar(12),
CPhone2 varchar(12),
CUserID varchar(50),
CPassword varchar(15));

create table OrderSource (
OsID int primary key not null,
OsDesc varchar(30));

create table Orders (
OID int primary key not null,
ODate date,
OMethPmt varchar(10),
CID int,
OsID int);

alter table orders add constraint CustOrdFK foreign key (CID) references Customer(CID);
alter table orders add constraint OrsOrdFK foreign key (OsID) references OrderSource(OsID);

create table OrderLine (
OID int not null,
InvID int not null,
OLQuantity int not null);

alter table OrderLine add constraint OInIDPK primary key (OID, InvID);

---------------------------------------------------------------------------------------

insert into OrderLine values (1, 1, 7);
insert into OrderLine values (1, 16, 21);
insert into OrderLine values (2, 2, 6);
insert into OrderLine values (2, 15, 21);
insert into OrderLine values (3, 3, 3);
insert into OrderLine values (3, 9, 23);
insert into OrderLine values (4, 4, 8);
insert into OrderLine values (4, 11, 18);
insert into OrderLine values (4, 19, 27);
insert into OrderLine values (5, 3, 10);
insert into OrderLine values (5, 5, 20);
insert into OrderLine values (5, 9, 2);
insert into OrderLine values (6, 2, 10);
insert into OrderLine values (6, 6, 10);
insert into OrderLine values (7, 5, 21);
insert into OrderLine values (7, 7, 18);
insert into OrderLine values (7, 20, 21);
insert into OrderLine values (8, 8, 21);
insert into OrderLine values (8, 18, 12);
insert into OrderLine values (9, 9, 16);
insert into OrderLine values (9, 13, 11);
insert into OrderLine values (10, 4, 1);
insert into OrderLine values (10, 10, 18);
insert into OrderLine values (10, 11, 24);
insert into OrderLine values (11, 7, 17);
insert into OrderLine values (11, 11, 24);
insert into OrderLine values (11, 19, 8);
insert into OrderLine values (12, 6, 11);
insert into OrderLine values (12, 12, 1);
insert into OrderLine values (13, 8, 18);
insert into OrderLine values (13, 13, 3);
insert into OrderLine values (14, 4, 3);
insert into OrderLine values (14, 10, 14);
insert into OrderLine values (14, 14, 9);
insert into OrderLine values (15, 14, 27);
insert into OrderLine values (15, 15, 2);
insert into OrderLine values (15, 17, 8);
insert into OrderLine values (16, 12, 1);
insert into OrderLine values (16, 16, 16);
insert into OrderLine values (17, 10, 14);
insert into OrderLine values (17, 14, 7);
insert into OrderLine values (17, 17, 13);
insert into OrderLine values (18, 1, 24);
insert into OrderLine values (18, 18, 17);
insert into OrderLine values (19, 7, 24);
insert into OrderLine values (19, 19, 13);
insert into OrderLine values (19, 20, 19);
insert into OrderLine values (20, 3, 14);
insert into OrderLine values (20, 5, 2);
insert into OrderLine values (20, 20, 16);

insert into OrderSource values (1, 'Online');
insert into OrderSource values (2, 'Retail');
insert into OrderSource values (3, 'Winter Catalog Mail Order');
insert into OrderSource values (4, 'Summer Catalog Mail Order');
insert into OrderSource values (5, 'Spring Catalog Mail Order');
insert into OrderSource values (6, 'Phone');
insert into OrderSource values (7, 'Fall Catalog Mail Order');
insert into OrderSource values (8, 'Children''s Catalog Mail Order');

insert into customer values (1, 'Herrera', 'Glenda', 'E', '1982/2/4', '676 Rocky New Boulevard', 'Mobile', 'KS', '8342', '534-634-2654', '806-579-6431', 'gherree', 'GgFGmtupt');
insert into customer values (2, 'Allen', 'Garry', 'A', '1991/12/1', '443 New Way', 'Toledo', 'SC', '93406', '612-436-3061', '376-477-4377', 'gallena', 'jmCvXnCRx');
insert into customer values (3, 'Murillo', 'Josh', 'Z', '1944/4/19', '773 Rocky Fabien Road', 'Omaha', 'GA', '11017', '689-306-0292', '307-546-1064', 'jmurilz', 'E8gaT34X7');
insert into customer values (4, 'Waller', 'Janice', 'X', '1970/7/1', '47 Yellow Clarendon St.', 'Fremont', 'GA', '49242', '733-575-4686', '458-068-5790', 'jwallex', '4fdw2QG7d');
insert into customer values (5, 'Contreras', 'Aisha', 'H', '1976/12/23', '987 Fabien Way', 'Tampa', 'AL', '96649', '389-375-6502', '502-683-4832', 'acontrh', '2jO0uBjOU');
insert into customer values (6, 'Herrera', 'Rick', 'E', '1985/3/28', '87 Green Narwhal Avenue', 'Colorado', 'MA', '558', '484-925-6318', '845-709-2288', 'rherree', 'AjAfg7zem');
insert into customer values (7, 'Riddle', 'Levi', 'Z', '1957/6/19', '159 Nobel Drive', 'El Paso', 'ND', '54389', '851-104-7738', '180-373-9647', 'lriddlz', 'pMiCs49Fs');
insert into customer values (8, 'Rojas', 'Lakesha', 'K', '1991/2/13', '33 Yellow Fabien Parkway', 'Garland', 'MA', '99386', '174-722-3739', '700-754-8413', 'lrojask', 'X4ozUVkfg');
insert into customer values (9, 'French', 'Bryan', 'M', '1987/12/19', '86 South Yellow New Street', 'Phoenix', 'HI', '92383', '501-574-8954', '904-835-7577', 'bfrencm', 'Jg3NWKVxG');
insert into customer values (10, 'Bean', 'Anthony', 'V', '1994/2/27', '905 Liberty Circle', 'Riverside', 'AZ', '56515', '974-007-0885', '584-814-2972', 'abeanv', 'QbKt8f1B7');

insert into Orders values (1, '1954/8/22', 'VISA', 8, 5);
insert into Orders values (2, '2001/2/9', 'Paypal', 9, 5);
insert into Orders values (3, '1955/9/16', 'Checking', 8, 5);
insert into Orders values (4, '1962/1/27', 'Checking', 6, 4);
insert into Orders values (5, '1985/3/23', 'Paypal', 3, 2);
insert into Orders values (6, '1989/5/8', 'Paypal', 6, 4);
insert into Orders values (7, '1964/10/17', 'Checking', 10, 6);
insert into Orders values (8, '1969/2/8', 'AmEx', 5, 3);
insert into Orders values (9, '1964/12/1', 'Paypal', 10, 6);
insert into Orders values (10, '1966/9/15', 'AmEx', 3, 2);
insert into Orders values (11, '1980/7/22', 'Checking', 3, 2);
insert into Orders values (12, '2005/8/31', 'Mastercard', 5, 3);
insert into Orders values (13, '1954/1/26', 'Paypal', 7, 4);
insert into Orders values (14, '1977/2/5', 'Mastercard', 5, 3);
insert into Orders values (15, '1970/1/4', 'Mastercard', 10, 6);
insert into Orders values (16, '1992/2/14', 'Checking', 1, 1);
insert into Orders values (17, '2006/4/15', 'Checking', 9, 6);
insert into Orders values (18, '2002/1/6', 'Paypal', 10, 6);
insert into Orders values (19, '1954/5/12', 'Mastercard', 7, 5);
insert into Orders values (20, '1990/11/15', 'VISA', 4, 2);

insert into shipment values (1, '2006/12/9', '2007/1/29');
insert into shipment values (2, '2008/9/3', '2008/11/14');
insert into shipment values (3, '2001/3/7', '2001/4/8');
insert into shipment values (4, '1996/4/4', '1996/6/2');
insert into shipment values (5, '2002/6/3', '2002/7/7');
insert into shipment values (6, '1993/11/16', '1994/1/11');
insert into shipment values (7, '2005/6/20', '2005/8/18');
insert into shipment values (8, '2012/3/13', 'NULL');
insert into shipment values (9, '2001/1/16', '2001/2/6');
insert into shipment values (10, '2001/3/9', '2001/4/19');
insert into shipment values (11, '1994/5/24', '1994/9/10');
insert into shipment values (12, '1993/10/13', '1993/12/2');
insert into shipment values (13, '2006/11/9', '2007/3/5');
insert into shipment values (14, '2011/1/9', '2011/3/17');
insert into shipment values (15, '2006/2/7', '2006/3/16');

insert into category values (1, 'Women''s Clothing');
insert into category values (2, 'Camping');
insert into category values (3, 'Imports');
insert into category values (4, 'Hiking');
insert into category values (5, 'New');
insert into category values (6, 'Hipster');
insert into category values (7, 'Children''s Clothing');
insert into category values (8, 'Misc. Sporting');
insert into category values (9, 'Men''s Clothing');
insert into category values (10, 'Sale');

insert into inventory values (1, 'S', 247.57, 34, 'egreddior trepicandor novum', 'DarkViolet', 9);
insert into inventory values (2, 'XS', 131.17, 123, 'plorum Tam quo Versus Multum', 'DarkSlateGray', 6);
insert into inventory values (3, 'XS', 299.43, 190, 'non Quad gravis plurissimum', 'Turquoise', 6);
insert into inventory values (4, 'XXL', 38.9, 117, 'nomen quartu e transit. vobis', 'PaleTurquoise', 5);
insert into inventory values (5, 'L', 341.69, 156, 'transit. non novum gravis ut', 'ForestGreen', 3);
insert into inventory values (6, 'XXL', 234.32, 11, 'brevens, quartu nomen Quad Sed', 'DeepSkyBlue', 5);
insert into inventory values (7, 'XL', 45.82, 196, 'si Tam quad travissimantor quo', 'LightCoral', 5);
insert into inventory values (8, 'XS', 218.57, 29, 'in glavans quo non quis', 'Cornsilk', 1);
insert into inventory values (9, 'M', 186.01, 39, 'venit. habitatio cognitio, non', 'SlateGrey', 10);
insert into inventory values (10, 'S', 193.68, 111, 'Id si et plorum funem.', 'MintCream', 4);
insert into inventory values (11, 'XL', 166.78, 66, 'estum. linguens fecit, Versus', 'Navy', 9);
insert into inventory values (12, 'XS', 330.79, 151, 'non volcans et Multum quartu', 'DeepSkyBlue', 1);
insert into inventory values (13, 'L', 82.01, 42, 'NULL', 'DimGray', 6);
insert into inventory values (14, 'S', 271.38, 53, 'bono venit. Longam, delerium.', 'Fuchsia', 7);
insert into inventory values (15, 'M', 34.36, 249, 'volcans Longam, in linguens', 'DarkMagenta', 1);
insert into inventory values (16, 'M', 20.76, 45, 'quis et trepicandor quantare', 'Tan', 5);
insert into inventory values (17, 'M', 310.52, 157, 'transit. travissimantor si', 'DarkBlue', 10);
insert into inventory values (18, 'L', 40.53, 63, 'esset glavans in in pladior', 'White', 8);
insert into inventory values (19, 'XXXL', 329.05, 216, 'quo parte rarendum et', 'Aquamarine', 4);
insert into inventory values (20, 'XXXXL', 125.53, 48, 'pladior plurissimum Id', 'LightSalmon', 10);

insert into ShipmentLine values (1, 8, 58, 2);
insert into ShipmentLine values (2, 5, 42, 33);
insert into ShipmentLine values (3, 2, 58, 1);
insert into ShipmentLine values (3, 4, 28, 11);
insert into ShipmentLine values (4, 3, 54, 41);
insert into ShipmentLine values (5, 7, 37, 5);
insert into ShipmentLine values (6, 9, 34, 3);
insert into ShipmentLine values (7, 6, 23, 16);
insert into ShipmentLine values (7, 10, 56, 22);
insert into ShipmentLine values (8, 11, 61, 49);
insert into ShipmentLine values (9, 13, 49, 40);
insert into ShipmentLine values (10, 12, 1, 0);
insert into ShipmentLine values (10, 14, 11, 0);
insert into ShipmentLine values (10, 17, 8, 1);
insert into ShipmentLine values (11, 1, 58, 37);
insert into ShipmentLine values (11, 15, 1, 1);
insert into ShipmentLine values (12, 18, 33, 16);
insert into ShipmentLine values (13, 15, 2, 0);
insert into ShipmentLine values (13, 16, 78, 23);
insert into ShipmentLine values (13, 17, 34, 18);
insert into ShipmentLine values (14, 20, 61, 16);
insert into ShipmentLine values (15, 19, 35, 14);




