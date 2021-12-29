use university_management_system;
-- #1: Write a query to pick up the maximum marks from students marks table and display
-- the student registration number and name of those students who have secured the maximum marks.
select si.student_name,marks, sm.Reg_Number, subject_code from student_marks as sm
inner join student_info as si on si.reg_number = sm.Reg_Number
where sm.Reg_Number in (select reg_number from student_marks group by subject_code having max(marks));

-- #2: Write a query to pick up the maximum marks secured in the subject “EI05IP” and display
--                  the student nameand registration number of the student who has secured it.

select si.reg_number , si.student_name, sm.marks from student_marks as sm
inner join student_info as si on si.reg_number = sm.reg_number
where sm.Reg_Number in (select reg_number from student_marks group by subject_code having max(marks)) and 
subject_code = 'EI05IP'; 

-- #3: Write a query to display the student name and registration number of the student
--                   who has secured second highest marks in the subject El05lP subject.
select student_name, reg_number from student_info 
where reg_number = (select reg_number from student_marks where subject_code = 'EI05IP'
 order by marks desc
 limit 1 offset 1);

-- #4: Write a query to display registration numbers of those students who scored
-- more than the average score scored by students in the subject El05lP.
select reg_number from student_marks where marks > 
(select avg(marks) from student_marks where subject_code = 'EI05IP');