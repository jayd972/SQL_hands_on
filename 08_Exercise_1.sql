use alliance;
-- #1: Write a query to display trainer IDs for all associates whose names contain the
-- letter 'i'. Note: Use sub-query to achieve this.
select distinct trainer_id from associate_status
 where Associate_Id in (select Associate_Id from associate_info where Associate_Name like '%i%'); 
 
-- #2: Write a query to display trainer IDs for all associates whose names do not contain
-- the letter 'i'.
-- Note: Use sub-query to achieve this.
select distinct trainer_id from associate_status
 where Associate_Id in (select Associate_Id from associate_info where Associate_Name not like '%i%'); 
 
 -- #3: Write a query to display trainer ID and trainer rating for the trainers who handled
 -- J2EE module. Hint: Use trainer_feedback and associate status tables.
-- Note: Use sub-query to achieve this.
select trainer_id, trainer_rating from trainer_feedback 
where trainer_id in (select trainer_id from associate_status where module_Id = 'J2EE'); 

-- Prerequisite: Create a new table trainer_info_sabbatical with similar structure as that of trainer_info.
-- Insert few records into the newly created table (to copy these records into trainer_info table using 
-- subquery)

-- create the below table

CREATE TABLE Trainer_Info_Sabbatical
(Trainer_Id VARCHAR(20) PRIMARY KEY,
Salutation VARCHAR(7) NOT NULL,
Trainer_Name VARCHAR(30) NOT NULL,
Trainer_Location VARCHAR(30) NOT NULL,
Trainer_Track VARCHAR(15) NOT NULL,
Trainer_Qualification VARCHAR(100) NOT NULL,
Trainer_Experiance int ,
Trainer_Email VARCHAR(100) NOT NULL,
Trainer_Password VARCHAR(20) NOT NULL
);

-- insert the below records
insert into Trainer_Info_Sabbatical values 
('F011','Mr.','Shyju K', 'Kochi','Java','Bachelor of Technology',9,'shyju@alliance.com','fac11@123');
insert into Trainer_Info_Sabbatical values
('F012','Mr.','Raviraj Kumar', 'Kochi','Java','Bachelor of Technology',8,'raviarajkumar@alliance.com','fac12@123');
insert into Trainer_Info_Sabbatical values
('F013','Mr.','Suresh Babu N', 'Mumbai','Testing','Bachelor of Technology',19,'sureshbabun@alliance.com','fac13@123');


-- #4: Copy all records of a table into another table using sub-query.
insert into trainer_info select * from trainer_info_sabbatical; 

-- #5: Write a query to update trainer locations in trainer_info table as ‘Kochi’ 
-- for all trainers having their experience, figuring in the output of a query which displays all
-- trainer experiences greater than 10 from trainer_info_sabbatical table.
update trainer_info set trainer_location = 'kochi'
 where trainer_id in (select trainer_id from trainer_info_sabbatical where Trainer_Experiance >10); 
 
-- #6: From trainer_info table, delete all records where trainer_experiance matches
-- those in trainer_info_sabbatical which are greater than 12.
-- Prerequisite : Have atleast one trainer with experience greater than 12 in both tables.
delete from trainer_info where trainer_id 
in (select trainer_id from trainer_info_sabbatical where Trainer_Experiance > 12);

-- #7: Using a corelated subquery display all records from trainer_info_sabbatical
--                   table which also exist in trainer_info table
-- Prerequisite: insert atleast one recored into trainer_info_sabbatical which is not inserted 
--                into trainer_info table and some records which are common to both.
select * from trainer_info_sabbatical as t1 where t1.trainer_id in 
(select trainer_id from trainer_info as t2 where t1.Trainer_Id = t2.trainer_id);