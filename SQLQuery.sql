use Database_Exam_4_Practice;
go

--1.  List the Superior name, Superior beard length, minion name and minion beard length for all troll 
--Superiors who have a beard length at least two times greater than their minion’s beard.  A minion is 
--just a troll being supervised.  Label the columns as per the example.  Sort the output by Superior names A-Z.

select t2.trollname "Superior", t2.beardlength, t1.trollname "Minion", t1.beardlength
from troll t1
join troll t2 on t1.superiorname = t2.trollname
where t2.beardlength > t1.beardlength * 2
order by t2.trollname

--2.  List the last name, first name and sector for managers who have not had any training and have 
--a CMSL less than six.  Sort the output A-Z by last name.

select lastname, firstname, sector
from manager
where managerid not in (
	select managerid
	from training)
and cmsl < 6
order by lastname

--3.  Provide the first and last name of all managers who get more money from the council 
--(managercut) than the average made by champions (championcut).

select firstname, lastname
from council
join manager on manager.managerid = council.managerid
where managercut > (
	select avg(championcut)
	from council)

--4.  Only use subqueries for this problem.  Provide the bridge names for all bridges 
--leading to cities with over 100,000 people and having roads with the condition "Great".

select name "Bridge Name"
from bridge
where bridgeid in (
	select bridgeid
	from route
	where roadcondition = 'Great' and
	cityid in (
		select cityid
		from city
		where population > 100000))

--5.  We need the names of bridges and their average route distance, but only for average route 
--distances longer than 90 kilometers.  List the bridge names from A-Z.

select name "Bridge Name", avg(distance) "Average Distance"
from bridge b
join route r on b.bridgeid = r.bridgeid
group by name
having avg(distance) > 90
order by name

--6.  Is it true that most roads are in terrible condition?  Give me a list of road conditions and 
--the number of times each occurs.  Label the number of times each occurs as "Times Occurring" and 
--sort the output from the most times to the least times.

select roadcondition, count(roadcondition) "Times Occurring"
from route
group by roadcondition
order by count(roadcondition) desc;

--7.  List all the data from training sessions for the 24 month period starting June 1, 2014 and ending 
--May 31, 2016.  Show the dates from earliest to latest (2022 to 1900).

select *
from training
where datelearned between '6/1/2014' and '5/31/2016'
order by datelearned desc

--8.  We need the names of all champion horses that have "on" anywhere in their name or have a name ending in “y”.

select horsename 
from champion
where horsename like '%on%' or
horsename like '%y'

--9.  Nasty trolls.  Nasty humans.  Give me each cityid and troll name where the troll is Ripe and the city 
--has an odor index greater than five.

select c.cityid, t.trollname
from troll t
join bridge b on t.trollname = b.trollname
join route r on r.bridgeid = b.bridgeid
join city c on c.cityid = r.cityid
where trolltype = 'Ripe' and
odorindex > 5;

--10.  List the different roads conditions without any duplicates.

select distinct roadcondition
from route;
