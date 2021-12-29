create database university_management_system;
use university_management_system;


create table student_info (Reg_Number Varchar(10),Student_Name  Varchar(30),
Branch Varchar(20),Contact_Number Varchar(20),
Date_of_Birth Date ,Date_of_Joining Date,
 Address Varchar(250),Email_id Varchar(250));
 
 create table subject_master (Subject_Code varchar(10),Subject_Name  Varchar(30),
Weightage  smallint);

create table student_marks( Reg_Number Varchar(10) ,Subject_Code varchar(10),
Semester smallint,Marks smallint);

create table student_result(Reg_Number Varchar(10),Semester smallint,
GPA decimal(5,3),Is_Eligible_Scholarship varchar(3));



insert into student_info(Reg_Number, Student_Name, Branch, Contact_Number, Date_of_Birth, Date_of_Joining,
                         Address, Email_id)
values
('MC101301' ,'James', 'MCA' ,'9714589787', '1984-1-12', '2010-7-08',
	   'No 10,South Block Nivea', 'james.mca@yahoo.com'),
('BEC111402' ,'Manio', 'ECE', '8912457875', '1983-2-23', '2011-6-25', 
	   '8/12,Park View,Sieera', 'manioma@gmail.com'),
('BEEI101204', 'Mike', 'EI', '8974567897', '1983-2-10', '2010-8-25' ,
	    'Cross villa,NY', 'mike.james@ymail.com'),
('MB111305', 'Paulson', 'MBA', '8547986123', '1984-12-13', '2010-8-08',
        'Lake view,NJ', 'paul.son@rediffmail.com');
        
insert into subject_master(Subject_Code, Subject_Name, Weightage)
values('EE01DCF', 'DCF', 30),('EC02MUP' ,'Microprocessor', 40),
('MC06DIP' ,'Digital Image Processing', 30),('MB03MAR' ,'Marketing Techniques', 20),
('EI05IP' ,'Instrumentation Precision', 40),('CPSC02DS', 'Data Structures', 40);

insert into student_marks (Reg_Number, Subject_Code, Semester, Marks)
values('MC101301', 'EE01DCF', 1, 75),('MC101301', 'EC02MUP', 1, 65),('MC101301', 'MC06DIP', 1, 70),
('BEC111402', 'EE01DCF', 1, 55),('BEC111402', 'EC02MUP', 1, 80),
('BEC111402', 'MC06DIP', 1, 60),('BEEI101204', 'EE01DCF', 1, 85),
('BEEI101204', 'EC02MUP', 1, 78),('BEEI101204', 'MC06DIP', 1, 80),
('BEEI101204', 'MB03MAR', 2, 75),('BEEI101204', 'EI05IP', 2, 65),
('BEEI101204', 'CPSC02DS', 2, 75),('MB111305', 'EE01DCF', 1, 65),
('MB111305', 'EC02MUP', 1, 68),('MB111305', 'MC06DIP', 1, 63),
('MB111305', 'MB03MAR', 2, 85),('MB111305', 'EI05IP', 2, 74),
('MB111305', 'CPSC02DS', 2, 62);

insert into student_result (Reg_Number, Semester, GPA, Is_Eligible_Scholarship)
values('MC101301', 1, 7.5, 'Y'),('BEC111402', 1, 7.1, 'Y'),
('BEEI101204', 1, 8.3, 'Y'),('BEEI101204', 2, 6.9, 'N'),
('MB111305', 1, 6.5, 'N'),('MB111305', 2, 6.8, 'N');
