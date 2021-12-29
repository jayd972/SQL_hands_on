use university_management_system;
-- #1: Write a query to create a view “STUDENT_GPA_<employee_id>” 
-- which has the following details: student name, registration number, semester number and GPA.
create view   STUDENT_GPA_emp_id as
select si.student_name, sr.reg_number, sr.semester, sr.GPA from student_result as sr
join student_info as si on si.reg_number = sr.reg_number; 

-- #2: From the view STUDENT_GPA _<employee_id> display student name, registration number, 
--                   semester number and GPA, whose GPA is greater than 5.
select * from STUDENT_GPA_emp_id where gpa>5;

-- #3: Write a query to create a view “STUDENT_AVERAGE_GPA_<employee_id>” 
-- which has the following details. Student name, registration number and average GPA 
-- he has scored across semesters.
create or replace view STUDENT_AVERAGE_GPA_emp_id as select si.student_name, sr.reg_number,
avg(gpa) 'average_gpa' from student_result as sr
join student_info as si on si.reg_number = sr.Reg_Number group by reg_number;
select * from student_average_gpa_emp_id;

-- #4: From the view STUDENT_AVERAGE_GPA_<employee_id> diplay Student name,
--                   registration number and average GPA whose average GPA is greater than 7.
SELECT * from student_average_gpa_emp_id where average_gpa>7;

-- #5: Create a index on semester column of student_marks table and drop the same thereafter
create index index_1 on student_marks(semester);
alter table student_marks drop index index_1 ;

-- #6: Create a unique index on email_id column of student_info table
 create unique index index_2 on student_info(email_id);