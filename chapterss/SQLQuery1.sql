create database University_database
use University_database

drop table classroom
create table classroom (
building varchar(100),
room_no varchar(20),
capacity tinyint ,
constraint pk_build_room primary key (building, room_no)
);



create table time_slot(
time_slot_id varchar(20),
day_ varchar(20),
start_time varchar(20) ,
end_time varchar(20),
constraint pk_timeID_day_Stime primary key (time_slot_id, day_,start_time)
);


create table department(
dept_name varchar(20),
building varchar(100),
budget  int ,

constraint pk_dept_name primary key (dept_name)
);


create table course(
course_id varchar(20),
title varchar(100),
dept_name  varchar(20) ,
credits tinyint,

constraint pk_course primary key (course_id),
foreign key (dept_name) references department (dept_name)
);


drop table prereq
create table prereq(
course_id varchar(20),
prereq_id varchar(20),

constraint pk_course_prereq primary key (course_id,prereq_id),
foreign key (course_id) references course ,
foreign key (prereq_id) references course 
);




create table section(
course_id varchar(20),
sec_id varchar(20),
semester varchar(20),
year_ varchar(20),
building varchar(100),
room_no varchar(20),
time_slot_id varchar(20),

constraint pk_course_sec_sem_year primary key (course_id,sec_id,semester,year_),
foreign key (building,room_no) references classroom ,

foreign key (course_id) references course ,
);

drop table section

create table section(
course_id varchar(20),
sec_id varchar(20),
semester varchar(20),
year_ varchar(20),
building varchar(100),
room_no varchar(20),
time_slot_id varchar(20),

constraint pk_course_sec_sem_year primary key (course_id,sec_id,semester,year_),
foreign key (building,room_no) references classroom ,

foreign key (course_id) references course ,
);

drop table instructor
create table instructor (
ID varchar(20),
name varchar(20),
dept_name varchar(20),
salary int,

constraint pk_Id primary key (ID),
foreign key (dept_name) references department ,
);
create table teaches (
Id varchar(20),
course_id varchar(20),
sec_id varchar(20),
semester varchar(20),
year_ varchar(20),

constraint pk_Id_course_sec_id_semester_year_ primary key (Id,course_id,sec_id,semester,year_),
foreign key (course_id,sec_id,semester,year_) references section,
foreign key (Id) references instructor,

);

create table student (
ID varchar(20) constraint pk_ID_ primary key,
name varchar(20),
dept_name varchar(20),
tot_cred varchar(20),

foreign key (dept_name) references department,

);


create table takes (
ID varchar(20) ,
course_id varchar(20),
sec_id varchar(20),
semester varchar(20),
year_ varchar(20),
grade varchar(20),
constraint pk_Id_course_sec_id_semester_year__ primary key (Id,course_id,sec_id,semester,year_),
foreign key (ID) references student,
foreign key (course_id,sec_id,semester,year_) references section

);



create table advisor (
s_id varchar(20) ,
i_id varchar(20),
constraint pk_IDs_ primary key(s_id),
foreign key (s_id) references student,
foreign key (i_id) references instructor ,

);




insert into classroom
values('main','713',50),
('main','702',50);


select * from classroom

DELETE FROM classroom
where


insert into department
values('cse','main',100),
('eee','RH',200);
select * from department

DELETE FROM department
where dept_name='cse';