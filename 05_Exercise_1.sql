use alliance;
-- #1: Develop a query which will display the module name and module Infra fees of the entire
--            module.The infra fee should be rounded to 2 decimal point.
alter table module_info add column module_fees decimal(10,4);
set sql_safe_updates = 0;
update module_info set module_fees = cast(module_duration as decimal) * 5.54321 where module_duration != 0; 
select module_name , round(module_fees,2) from module_info ;

-- #2: Develop a query which will list all the module id and module names in Module_Info table
--            where in the first letter should be capital letter.
select * from module_info ;
select module_id, module_name from module_info where substring(module_name,1,1) = binary upper(substring(module_name,1,1));
 
-- #3: Develop a query which will display the module id and the number of days 
--            between the current date and module start date in associate_status table
select module_id,start_date,datediff(current_date(), start_date) from associate_status;

-- #4: Develop a query which will concatenate the Module Name and Module id in the 
--            following format and display all the modules in the module_info table.
--            “< Module Name><Module id>”
select concat_ws('><',concat_ws('<','',module_name),concat_ws('>',module_id,'')) as concatenated 
from module_info ;

-- #5: Develop a query which will display all the Module Name in upper case.
select upper(module_name) from module_info;

-- #6: Develop a query which will display all the characters between 1 and 3 of the Module name 
--            column for all the modules in the Module_Info table.
select substring(module_name,1,3) as module_name from module_info;

-- #7: Develop a query calculate average of all the module base fees, any records whose base
--            fee is null needs to be considered as zero.
select sum(ifnull(module_fees,0))/count(*) as average from module_info;

-- #8: Write a query which will convert Trainer_Info’s Trainer_Id to Number and add 100000 and 
--            display it for all the trainers in the Trainer_Info table.
select * from trainer_info;
select convert(trainer_id+100000,unsigned) as display from trainer_info;

-- #9:Write a query which will convert Base_Fees into Varchar from the Module_info table.
--           And display in the following format
--         ‘The Base Fees Amount for the module name’ <Module Name>’ is ’<Base Fees>
select concat('The Base Fees Amount for the module name ',convert(module_name, char),' is ',
convert(module_fees, char)) as fees from module_info;

-- #10: Write a query which will display the total number of records in Module_Info table.
select count(*) as total_no_of_record from module_info;

-- #11: Develop a query which will give the sum of all base fees of all modules in the Module_Fees
--             table.
select sum(ifnull(module_fees,0)) from module_info;

-- #12: Display the minimum and maximum base fees of the modules.
select min(ifnull(module_fees,0)) as minimum , max(module_fees) as maximum from module_info;