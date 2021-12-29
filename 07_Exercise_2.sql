use university_management_system;
-- #1: Write a query to display student names along with the subject codes 
--                   and corresponding marks of the students.
-- Hint: Use Student_Marks and Student_Info tables.
select student_name, subject_code, marks from student_marks as smarks
inner join student_info as sinfo on sinfo.reg_number = smarks.Reg_Number;

-- #2: Write a query to display student names along with the subject codes and corresponding marks of
-- the students, for all students who have scored greater than or equal to 65 marks in all subjects.
-- Hint: Use Student_Marks and Student_Info tables.
select student_name, subject_code,marks from student_marks as smarks
inner join student_info as sinfo on sinfo.reg_number = smarks.reg_number
 where smarks.Reg_Number not in (select Reg_Number from student_marks where marks<65) ;


-- #3: Write a query to display the reg number, student name, 
-- CGPA for the student with highest CGPA.
-- Hint: Use Student_Results and Student_Info tables.
select si.reg_number, student_name, gpa from student_info as si
inner join student_result as sr on sr.Reg_Number = si.reg_number
where gpa = (select max(gpa) from student_result);

Create table Backup_Student_Info(
Reg_Number  Varchar(20) Primary Key ,
Student_Name  Varchar(30) not null,
Branch  Varchar(30),
Contact_Number  Varchar(20),
Date_of_Birth Date  not null,
Date_of_Joining Date  Default(current_date),
Address Varchar(250),
Email_id Varchar(250),
foreign key (reg_number) references student_info(reg_number));
-- Copy all records of Student_Info<employee_id> into Backup_Student_Info<employee_id>
insert into backup_student_info select * from student_info;
-- Insert few records into Student_Info<employee_id> These records should not exist in Backup_Student_Info<employee_id>.
insert into student_info values('MC101305' ,'Jamie', 'BCA' ,'9714589788', '1983-1-12', '2011-7-08',
	   'No 7,South Block Nivea', 'jamie.bca@yahoo.com'),
('BEC111408' ,'Marie', 'ECE', '8912457888', '1983-2-27', '2011-8-25', 
	   '8/12,manyata Park View,Sieera', 'marie@gmail.com');

-- #4: Write a query to display all columns of Student_Info<employee_id> table 
-- irrespective of whether there is a match in Backup_Student_Info<employee_id> or not.
-- Note: Use Left outer Join
select * from student_info as sinfo 
left outer join backup_student_info as bup on bup.Reg_Number = sinfo.reg_number;

-- #5: Solve the problem statement in Exercise 4 using Right Outer Join.
select * from backup_student_info as bup
right outer join student_info as sinfo on sinfo.reg_number = bup.Reg_Number;