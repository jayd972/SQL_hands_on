use alliance;
-- # 1:
-- Write a query which fetches and displays all the trainers who don’t have an email.
select * from trainer_info where trainer_email is null;

-- # 2:
-- Write a query which displays the id, name, track and location of all trainers who has 
-- Experience > 4 years.
select trainer_id, trainer_name, trainer_track, trainer_location from trainer_info where Trainer_Experiance>4;

-- # 3: Select all the modules whose duration > 200.
select * from module_info where Module_Duration>200;

-- # 4:
-- Display the trainer Id, trainer name whose trainer qualification is not ‘Bachelor of Technology’.
select trainer_id, trainer_name from trainer_info 
where trainer_qualification != 'Bachelor of Technology';
-- # 5:
-- Select all the modules whose duration is in the range 200 and 300.
select * from module_info where Module_Duration >= 200 and Module_Duration <= 300;

-- # 6:
-- Display the trainer Id, trainer name whose first name starts with ‘M’
select trainer_id , trainer_name from trainer_info where trainer_name like 'M%';

-- # 7:
-- Display the trainer Id, trainer name whose first name has a character ‘O’
select trainer_id, trainer_name from trainer_info where substring_index(trainer_name," ",1) like "%o%";

-- # 8:
-- Display the names of all the modules where the module name is not null.
select module_name from module_info where Module_Name is not null;