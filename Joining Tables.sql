use c_windler2;
go




--List the name and truckid for every driver that has made a shipment, along each driver’s average shipment weight.
select DriverName, Truck.TruckID, avg(ShipWeight) "Average ShipWeight"
from Truck
join Shipment on Truck.TruckID = Shipment.TruckID
group by DriverName,Truck.TruckID;


--What are the names of customers who have sent packages (shipments) to Honolulu?
select CustName
from Customer
join Shipment on Customer.CustID = Shipment.CustID
join City on Shipment.CityID = City.CityID
where CityName =  'Honolulu';


--Who are the customers (id, name and cityname) either: 1) have over $2 million in annual revenue 
--and have sent shipments weighing over 900 pounds or 2) have sent a shipment to
--Lubbock. No duplicates please, and alphabetize the city name backwards (Z to A).
Select distinct Customer.CustID, CustName, CityName
from Customer
join Shipment on Customer.CustID = Shipment.CustID
join City on Shipment.CityID = City.CityID
where AnnualRevenue > 2000000 and
ShipWeight > 900 or
CityName = 'Lubbock'
Order by CityName desc;


--Who are the drivers (by name) who have delivered shipments for customers with annual 
--revenue over $2 million to cities with populations over 4 million?
select DriverName
From Truck
join Shipment on Truck.TruckID = Shipment.TruckID
join Customer on Shipment.CustID = Customer.CustID
join City on Shipment.CityID = City.CityID
where AnnualRevenue > 2000000 or 
CityPop > 4000000;

--To what cities have customers with revenue less than $300,000 sent packages?
select distinct CityName
from City
join Shipment on City.CityID = Shipment.CityID
join Customer on Shipment.CustID = Customer.CustID
where AnnualRevenue <  300000;