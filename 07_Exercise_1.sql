use alliance;
-- #1: Write a query to display trainer_id and batch_id details in such a way that
--                   we get all possible combinations of trainer IDs and batch IDs.
-- Hint: Use Trainer_Info and Batch_Info tables.
select trainer_id,batch_id from trainer_info as ti cross join batch_info bi;

-- #2: Write a query to display the records from all columns of tables
-- associate_status and batch_info, wherever the batch_id in the two tables matches.
select * from associate_status as ass inner join batch_info as bi on bi.Batch_Id = ass.Batch_Id;

--  #3: Write a query to display the associate IDs of the associates tagged to trainers and all the
-- trainer IDs irrespective of whether there are any associates tagged to them or not.
-- Hint: Use associate_status and trainer_info tables
-- Note: Use Right Outer Join
select ass.associate_id , ti.trainer_id from associate_status as ass
right outer join trainer_info as ti on ass.trainer_Id = ti.trainer_id;

-- #4: Write a query to display the associate IDs of the associates tagged to trainers and 
-- all the trainer IDs irrespective of whether there are any associates tagged to them or not.
-- Hint: Use associate_status and trainer_info tables.
-- Note: Use Left Outer Join
select ass.associate_id, ti.trainer_id from trainer_info as ti
left outer join associate_status as ass on ass.Trainer_Id = ti.trainer_id;

-- #5: Write a query to display the associate IDs of all the associates and trainer IDs of all trainers
-- irrespective of whether any associate is mapped to a trainer ID and vice versa.
-- Hint: Use associate_status and trainer_info tables.
-- (NOTE: ANSI syntax for Full Outer Join is supported by SQL Server, Not Supported by MySQL,
-- Oracle, and Sybase)
-- Prerequisite: Add an associate_id which is not mapped to any trainer ID. Take care of the
-- alteration in constraints to the other tables in order to achieve this.
alter table associate_status modify Trainer_Id varchar(20);

insert into associate_status(associate_id, module_id, batch_id) values('A007','EM004', 'B001');
select ass.associate_id, ti.trainer_id from trainer_info as ti
left outer join associate_status as ass on ass.Trainer_Id = ti.trainer_id
union 
select ass.associate_id, ti.trainer_id from trainer_info as ti
right outer join associate_status as ass on ass.Trainer_Id = ti.trainer_id;

delete from associate_status where Trainer_Id is null;
alter table associate_status modify Trainer_Id varchar(20) not null;

