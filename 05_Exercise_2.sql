use university_management_system;
-- # 1:Write a query to display student information such as name, branch in capital letters.
select upper(student_name), upper(branch) from student_info;

-- # 2:Write a query to displays all details in subject_master in small letters.
select lower(subject_code), lower(subject_name), lower(weightage) from subject_master;

-- # 3:Write two separate queries to display the registration number date of birth 
--             of all the students in the following formats
-- • 2011/07/23
select reg_number, date_format(date_of_birth,'%Y/%m/%d') from student_info;
-- • July 23, 2011
select reg_number, date_format(date_of_birth, '%M %d, %Y') from student_info;

-- # 4:Write a query to display age of each student along with name, contact number and email id.
--             Age = Number of months between DOB and current date /12.
select student_name, (period_diff(extract(year_month from current_date), extract(year_month from date_of_birth))/12)
 as age , contact_number,email_id from student_info;

-- # 5:Write a query to display the registration number, student name and average marks secured 
--             by students in each semester.
select reg_number, student_name, 
(select avg(marks) from student_marks as smarks where smarks.Reg_Number = sinfo.Reg_Number) 
from student_info as sinfo;

-- # 6:Pick the maximum mark from the students_marks and display the student registration 
--             number and name of those students who have secured the maximum mark.
select smarks.Reg_Number, sinfo.student_name, max(marks) from student_info as sinfo
inner join student_marks as smarks on smarks.Reg_Number = sinfo.reg_number
group by smarks.subject_code;

-- # 7:Pick the maximum marks secured in the subject “ EI05IP” and display the student name
--             and registration number of the student who has secured it.
select student_name , max(marks) from student_info as sinfo
inner join student_marks as smarks on sinfo.reg_number = smarks.reg_number
where subject_code = 'EI05IP';

-- # 8:Write a query to display the average GPA for each semester. Display the semester number and the average.
-- Hint: Average = Total GPA of all students in a semester/total number of students in a semester
-- Rule: Use AVG function
select semester, avg(gpa) from student_result group by semester;

-- # 9:display all the student records, if the student email id is null it should be displayed 
--             as “no valid email address”.
select student_name, reg_number,branch, Contact_Number,Date_of_Birth,Date_of_Joining,Address,
case when Email_id is null then 'no valid email address'
else Email_id end as email_id   from student_info;

-- # 10:Write a query which will display the student name, branch, registration number, 
-- semester number and result. Display the full name of EEE as well as ECE branch as mentioned below,
-- If EEE then ‘Electrical and Electronic Engineering’
-- If ECE then Electronics and Communication Engineering.

select student_name, case when branch = 'EEE' then 'Electrical and Electronic Engineering'
                     when branch = 'ECE' then 'Electronics and Communication Engineering'
                     else branch end as branch, sinfo.reg_number,
sresult.semester, sresult.gpa
from student_info as sinfo
inner join student_result as sresult on sresult.Reg_Number = sinfo.reg_number;