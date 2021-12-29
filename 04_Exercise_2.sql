use university_management_system;
-- # 1: Write a query which fetches and displays all the students who have an email id.
select * from student_info where email_id is not null;

-- # 2:
-- Write a query which displays the marks and register number of all students who has scored marks > 50%.
select marks, reg_number from student_marks where marks>50;

-- # 3:Write a query which will retrieve the registration number, student name,
--             subject name, semester # and the respective marks of the subject
select sinfo.reg_number, sinfo.student_name, smaster.subject_name, smarks.Semester, smarks.marks from student_marks as smarks
inner join student_info as sinfo on sinfo.reg_number = smarks.Reg_Number
inner join subject_master as smaster on smaster.subject_code = smarks.subject_code;

-- # 4:Write a query to display the student name, registration number, subject code,subject name,
--             marks and semester # of all the students who have scored more than 50%.
select sinfo.student_name, sinfo.reg_number,smaster.subject_code, smaster.subject_name,
smarks.marks,smarks.semester from student_marks as smarks
inner join student_info as sinfo on sinfo.reg_number = smarks.reg_number 
inner join subject_master as smaster on smaster.subject_code = smarks.subject_code
where smarks.marks >50; 

-- # 5:Write a query to display the registration number and GPA of each student in
-- such a way that the students who are eligible for scholarship are displayed first.
select reg_number, gpa,Is_Eligible_Scholarship from student_result
order by Is_Eligible_Scholarship desc;

-- # 6:Write a query to display registration number, student name, the marks of the students,
--             and the weighted marks. Weighted Marks= marks * weightage %/100.
select sinfo.reg_number, sinfo.student_name, smarks.marks,
 (smaster.weightage* smarks.marks/100) as weighted_marks from student_marks as smarks
inner join subject_master as smaster on smarks.subject_code = smaster.subject_code
inner join student_info as sinfo on sinfo.reg_number = smarks.Reg_Number ;

-- # 7:Write a query to display all the students whose name starts with “M”.
select student_name from student_info where student_name like 'm%';

-- # 8:Write a query which retrieves the student name, registration number and
--             their respective marks in all semesters whose has an email address.
select sinfo.student_name, sinfo.reg_number, smarks.marks from student_info as sinfo
inner join student_marks as smarks on smarks.Reg_Number = sinfo.reg_number
where sinfo.Email_id is not null;

-- # 9:Write a query which retrieves student name, registration number and student marks
--             whose mark is between 60 and 100.
select sinfo.student_name, sinfo.reg_number, smarks.marks from student_marks as smarks
inner join student_info as sinfo on sinfo.reg_number = smarks.Reg_Number
where smarks.marks >= 60 and smarks.marks <= 100;

-- # 10:Write a query which retrieves student name, registration number and student marks
--              whose name does not start with Character “J”.
select sinfo.student_name, sinfo.reg_number, smarks.marks from student_info as sinfo
inner join student_marks as smarks on sinfo.reg_number = smarks.Reg_Number
where student_name not like 'j%';

-- # 11:Write a query which retrieves student name, registration number and marks of those
--              subjects whose subject code is either EE01DCF or EC02MUP.
-- Rule: Do not use OR operator
select sinfo.student_name, sinfo.reg_number, smarks.marks from student_marks as smarks
inner join student_info as sinfo on sinfo.reg_number = smarks.Reg_Number
where smarks.subject_code in ('EE01DCF', 'EC02MUP');


-- # 12:Write a query which retrieves all the students whose name ends with “on”.
select student_name from student_info where student_name like '%on';