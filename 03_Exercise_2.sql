
alter table student_info modify reg_number varchar(20) primary key;
alter table student_info modify Date_of_Joining date default(current_date);
alter table student_info modify student_name varchar(30) not null;
alter table student_info modify branch varchar(20);
alter table student_info modify Contact_Number varchar(20);

-- a. Subject_Code- Primarykey-varchar2(10)
alter table subject_master modify subject_code varchar(20) primary key; 
-- b. Subject_Name- Varchar, not null
alter table subject_master modify subject_name varchar(30) not null;
-- c. Weightage- Number(3), not null
alter table subject_master modify weightage smallint not null; 

-- c. Semester-Number(3) not null
alter table student_marks modify Semester smallint not null;
-- d. Marks-Number (3) default value 0
alter table student_marks modify marks smallint default 0;
alter table student_marks modify Reg_Number varchar(20);
alter table student_marks modify subject_code varchar(20);
---  a. Reg_Number-Foreignkey (Student_Info)-Varchar
alter table student_marks add foreign key(reg_number) references student_info(reg_number); 
-- b. Subject_Code-Foreignkey (Subject_Master)-varchar2(10)
alter table student_marks add foreign key(subject_code) references subject_master(subject_code);
-- b. Semester-Number(3) Not null

alter table student_result modify semester smallint not null; 
-- c. GPA-Number (5,3)- Not Null
alter table student_result modify gpa decimal(5,3) not null;
-- d. Is_Eligible_Scholarship char(3) Default value is Yes
alter table student_result modify Is_Eligible_Scholarship varchar(3) default 'yes';


-- a) Create a constraint which does not allow repeated entries of subjects having the same Subject Name.
alter table subject_master add constraint con1_ unique(subject_name); 
-- b) Create a constraint which does not allow two students having the same Contact Number.
alter table student_info add constraint con2_ unique(contact_number);
-- c) Create a constraint which does not allow date of birth after date of joining.
alter table student_info add check(datediff(date_of_joining, date_of_birth)>0);
-- d) Create a constraint that does not allow value greater than 100 be inserted into Marks.
alter table student_marks add check(marks <= 100);
-- e) Create a constraint which mandates GPA values to be less than or equal to 10.
alter table student_result add check(gpa <= 10);
-- f) Create a constraint which mandates that value for Is_Eligible_Scholarship is either ‘Y’ or ‘N’.
alter table student_result add check(Is_Eligible_Scholarship in ('y','n'));