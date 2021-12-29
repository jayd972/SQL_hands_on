use alliance;
-- #1: Create a view which displays associate ID and associated trainer ID and batch ID details.
create view view_1 as select associate_id, trainer_id, batch_id from associate_status;
select * from view_1;

-- #2: Create a new view which displays associate ID and associated trainer ID and
-- batch ID details of ‘b004’ batch.
create view view_2 as select associate_id, trainer_id, batch_id from associate_status where batch_id = 'b004';
select * from view_2; 

-- #3: Drop the view created in Exercise 2
drop view view_2;

-- #4: Create a non-unique index on associate_name column of associate_info table.
create index index_1 on associate_info(associate_name);

-- #5: Create a unique index on associate_name column of associate_info table.
create unique index index_2 on associate_info(associate_name);

-- #6: Drop the index created in Exercise 5
alter table associate_info drop index index_2;

-- #7: Create a view with:
-- a)Cascaded check option
create view view_3 as select associate_id , trainer_id, batch_id from associate_status with cascaded check option;
select * from view_3;
-- b)Local check option
create or replace view view_4 as select associate_id, trainer_id, batch_id from associate_status with local check option;
select * from view_4;