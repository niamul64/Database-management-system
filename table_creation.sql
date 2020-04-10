create database [Rooppur Nuclear Power Plnat]

go
use [Rooppur Nuclear Power Plnat];

create table Working_Role(
Role_title varchar(30) constraint Pk_Role primary key ,
Unit varchar(40),
Minimum_Required_Workers smallint,
);

create table Designation(
Designation varchar(40) constraint Pk_Designation primary key,
Working_Role varchar (30),
Salary int,
constraint Fk_Role foreign key(Working_Role) references Working_Role,
); 



create table Work_Place(
Building_No_or_Place varchar(30) constraint Pk_place primary key ,
Sector_No varchar(20),
Sector_Name varchar(40),
);

create table Time_slot(
Shift_Id varchar(10) constraint Pk_shift primary key ,
Week1 TIME,
Week2 TIME,
);

create table Accomodation_INFO (
Apartment_No varchar(15) constraint Pk_Apartment_Number primary key ,
Building_No varchar(10),
Block_No varchar(5),
);



create table Workers(
ID varchar(15) constraint Pk_ID primary key ,
Worker_Name varchar(50),
Designation varchar(40),
Shift_ID varchar(10),
Work_Place varchar(30),
Worker_Age tinyint,
Address1 varchar(90),
Address2 varchar(90),
Phone_No varchar(20),
Joining_date DATE,
constraint Fk_designation foreign key(Designation) references Designation,
constraint Fk_Shift foreign key(Shift_ID) references Time_slot,
constraint Fk_Work_place foreign key(Work_Place) references Work_Place,
);

create table Accommodation (
Apartment_No varchar(15) constraint Pk_Apartment_No primary key ,
ID varchar(15),
constraint Fk_Apartment_No foreign key(Apartment_No) references Accomodation_INFO,
constraint Fk_ID foreign key(ID) references Workers,
);

create table Vacation_Date (
ID varchar(15) constraint Pk_WR_ID primary key ,
Start_Vac DATE,
End_Vac DATE,

constraint Fk_workr_ID foreign key(ID) references Workers,
);