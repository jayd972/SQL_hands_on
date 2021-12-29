alter table trainer_info add  primary key(trainer_id);
alter table trainer_info add check (trainer_id like "f%");
select * from trainer_info;
alter table trainer_info modify trainer_id varchar(20) not null;
alter table trainer_info modify salutation varchar(7) not null;
alter table trainer_info modify trainer_name varchar(30) not null;
alter table trainer_info modify trainer_location varchar(30) not null;
alter table trainer_info modify trainer_track varchar(15) not null;
alter table trainer_info modify trainer_qualification varchar(100) not null;
alter table trainer_info modify trainer_email varchar(100) not null;
alter table trainer_info modify trainer_password varchar(20) not null;

alter table batch_info add primary key(batch_id);
alter table batch_info modify batch_id varchar(20) not null;
alter table batch_info modify batch_owner varchar(30) not null;
alter table batch_info modify BATCH_BU_OWNER varchar(30) not null;
alter table batch_info add check(batch_id like "b%");

alter table module_info add primary key(module_id);
alter table module_info modify Module_Id varchar(20) not null;
alter table module_info modify Module_Duration int not null;
alter table module_info modify Module_Name varchar(40) not null;
-- it will adcheck for all module_id that are not in lowrcase
alter table module_info add check(binary module_id <> binary lower(module_id));

alter table associate_info add primary key (associate_id);
alter table associate_info add check (associate_id like "a%");
alter table associate_info modify Associate_Id varchar(20) not null;
alter table associate_info modify Salutation varchar(7) not null;
alter table associate_info modify Associate_Name varchar(30) not null;
alter table associate_info modify Associate_Location varchar(30) not null;
alter table associate_info modify Associate_Track varchar(15) not null;
alter table associate_info modify Associate_Qualification varchar(100) not null;
alter table associate_info modify Associate_Email varchar(100) not null;
alter table associate_info modify Associate_Password varchar(20) not null;

alter table questions modify Question_Id varchar(20) primary key not null;
alter table questions add foreign key(Module_Id)  references module_info(module_id);
alter table questions modify question_text varchar(900) not null;

alter table associate_status add foreign key(associate_id) references associate_info(associate_id); 
alter table associate_status add foreign key(module_id) references module_info(module_id);
alter table associate_status add foreign key(batch_id) references batch_info(batch_id);
alter table associate_status add foreign key(trainer_id) references trainer_info(trainer_id);
alter table associate_status modify Associate_Id varchar(20) not null;
alter table associate_status modify module_Id varchar(20) not null;
alter table associate_status modify Batch_Id varchar(20) not null;
alter table associate_status modify Trainer_Id varchar(20) not null;

alter table trainer_feedback add foreign key(trainer_id) references trainer_info(trainer_id);
alter table trainer_feedback add foreign key(question_id) references questions(question_id);
alter table trainer_feedback add foreign key(batch_id) references batch_info(batch_id);
alter table trainer_feedback add foreign key(module_id) references module_info(module_id);
alter table trainer_feedback modify Trainer_Id varchar(20) not null;
alter table trainer_feedback modify Question_Id varchar(20) not null;
alter table trainer_feedback modify Batch_Id varchar(20) not null;
alter table trainer_feedback modify Module_Id varchar(20) not null;
alter table trainer_feedback modify Trainer_Rating smallint not null;

alter table associate_feedback add foreign key(associate_id) references associate_status(associate_id);
alter table associate_feedback add foreign key(question_id) references questions(question_id);
alter table associate_feedback add foreign key(module_id) references module_info(module_id);
alter table associate_feedback modify Associate_Id varchar(20) not null;
alter table associate_feedback modify Question_Id varchar(20) not null;
alter table associate_feedback modify Module_Id varchar(20) not null;
alter table associate_feedback modify Associate_Rating smallint not null;


create table product( product_id int primary key, product_name varchar(20), product_price int not null);
create table username(user_id varchar(10) primary key, 
product_id int,
username varchar(20),
foreign key(product_id) references product(product_id)); 

insert into product values(1,'A Dongle',290),(2,'B Dongle',1250);
insert into product(product_ID,product_name) values(3,'C Dongle');
select * from product;

-- disabling foreign key
set foreign_key_checks = 1;
select * from username;
drop table username;
insert into username(user_ID, product_ID, username) values('U001',1,'Ramesh'),
('U002',11,'Mahesh');