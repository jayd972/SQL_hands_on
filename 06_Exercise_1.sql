use alliance;
-- #1: Develop a sql query which would retrieve the number of associates enrolled for modules
--  on a specific date grouped by start date and display start date and total number of associates.
select start_date, count(*) as total_no_of_associate_joined from associate_status group by start_date;

-- #2: Develop a sql query which would retrieve the number of associates enrolled for modules
-- where trainer id is ‘F001’ grouped by start date and display start date and total number of associates.
select start_date, count(*) as number_of_associates from associate_status where Trainer_Id = 'F001' group by start_date;

-- #3: Develop a sql query which would retrieve the number of associates enrolled for modules
-- where trainer id is ‘F001’ grouped by module start date and display module start date and total
-- number of associates where the total number of associates > 2.
select start_date, count(*) as number_of_associates from associate_status group by start_date having count(*)>2;

-- #4: Develop a SQL query which displays all the modules in increasing order of module duration.
select * from module_info order by Module_Duration;

-- #5: Develop a sql query which would retrieve and display the associates name, their module
-- enrolled (module name and module id), base fees. Display the records ordering the base fees in
-- descending order.
select ainfo.associate_name, minfo.module_id, minfo.module_name, minfo.module_fees from associate_status as astatus
inner join associate_info as ainfo on ainfo.Associate_Id = astatus.Associate_Id
inner join module_info as minfo on minfo.Module_Id = astatus.module_Id
order by minfo.module_fees desc;