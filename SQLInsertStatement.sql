create table salestaff
(
	staffid int not null primary key,
	fName nvarchar(30) not null,
	lName nvarchar(30) not null ) 



insert into salestaff (staffid,fName,lName) values (200,'abbas','mehmood')

select * from salestaff 

insert into salestaff (staffid,fName,lName) values (300,'imran','afzal'),(325,'john','vick'),(314,'john','dino')

--we now want to add rows for specific columns

create table salestaffnew
(
	ID INT NOT NULL IDENTITY primary key,
	staffid int not null ,
	fName nvarchar(30) ,
	lName nvarchar(30) ) 

insert into salestaffnew (staffid,fName,lName) values (200,'abbas','mehmood')
insert into salestaffnew (staffid,fName,lName) values (300,'imran','afzal'),(325,'john','vick'),(314,'john','dino')
select * from salestaffnew 

--copying the data from one table into another table
create table nameOnlyTable
(
	fName nvarchar(30) ,
	lName nvarchar(30) ) 

select * from nameOnlyTable

insert nameOnlyTable (fname,lname)
select fname,lname from salestaffnew where id>=3

--creating a copy of a new table

select * into salestaffnew_bkp from salestaffnew 

select * from salestaffnew_bkp