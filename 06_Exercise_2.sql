-- Problem # 1:Write aquery which displays the student name, registration number and 
--             their GPA in descending order of GPA.
select sinfo.student_name, sinfo.reg_number, sresult.gpa from student_info as sinfo
inner join student_result as sresult on sresult.Reg_Number = sinfo.reg_number
 order by sresult.gpa desc;

-- Problem # 2:Write a query which displays the student information in ascending order of 
--             the student’s name.
select * from student_info order by student_name asc;

-- Problem # 3:Write a query which displays the information of students in ascending order of their age.
select * from student_info order by datediff(date_of_joining, date_of_birth) asc;

-- Problem # 4:Write a query to display the registration number, student name, semester number 
--             and GPA of students such that students with high GPA are displayed on top.
select sinfo.reg_number, sinfo.student_name, semester, gpa from student_info as sinfo
inner join student_result as sresult on sresult.Reg_Number = sinfo.reg_number
order by sresult.gpa desc;

-- Problem # 5:Write a query to display the registration number and GPA of each student 
-- in such a way that the students who are eligible for scholarship are displayed first.
select reg_number, gpa from student_result
order by Is_Eligible_Scholarship desc;

-- Problem # 6:Write a query to display the registration number and GPA of each student in
--  such a way that the students who are eligible for scholarship are displayed first.
select reg_number, gpa from student_result order by Is_Eligible_Scholarship desc;

-- Problem # 7:Write a query to display the details of students who have secured maximum 
--             GPA in each semester. Hint: Use GROUPBY
select * from student_info as sinfo
inner join student_result as sresult on sresult.reg_number = sinfo.reg_number
where sresult.gpa in (select  max(gpa) from student_result group by semester);

-- Problem # 8:Write a query to display the details of students who have secured mimimum
--             GPA in each semester. Hint: Use GROUPBY
select * from student_info as sinfo
inner join student_result as sresult on sresult.reg_number = sinfo.reg_number
where sresult.gpa in (select  min(gpa) from student_result group by semester);