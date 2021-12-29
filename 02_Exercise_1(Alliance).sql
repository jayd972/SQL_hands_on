create database Alliance;
use Alliance;

create table Trainer_info(
Trainer_id VARCHAR(20),
Salutation VARCHAR(7),
Trainer_Name VARCHAR(30),
Trainer_Location VARCHAR(30),
Trainer_Track VARCHAR(15),
Trainer_Qualification VARCHAR(100) ,
Trainer_Experiance INT,
Trainer_Email VARCHAR(100) ,
Trainer_Password VARCHAR(20) 
) ;

CREATE TABLE BATCH_INFO(
BATCH_ID CHAR(20) ,
BATCH_OWNER CHAR(30) ,
BATCH_BU_OWNER CHAR(30)
);

CREATE TABLE MODULE_INFO(
MODULE_ID CHAR(20) ,
MODULE_NAME CHAR(40) ,
MODULE_DURATION int
) ;


CREATE TABLE ASSOCIATE_INFO(
ASSOCIATE_ID CHAR(20) ,
SALUTATION CHAR(7) ,
ASSOCIATE_NAME CHAR(30) ,
ASSOCIATE_LOCATION CHAR(30) ,
ASSOCIATE_TRACK CHAR(15) ,
ASSOCIATE_QUALIFICATION CHAR(200) ,
ASSOCIATE_EMAIL CHAR(100),
ASSOCIATE_PASSWORD CHAR(20)
);

CREATE TABLE QUESTIONS(
QUESTION_ID VARCHAR(20) ,
MODULE_ID CHAR(20),
QUESTION_TEXT CHAR(255)
);

CREATE TABLE ASSOCIATE_STATUS(
ASSOCIATE_ID VARCHAR(20) ,
MODULE_ID VARCHAR(20) ,
START_DATE VARCHAR(20) ,
END_DATE VARCHAR(20) ,
AFeedbackGiven VARCHAR(20) ,
TFeedbackGiven VARCHAR(20) 
) ;

CREATE TABLE TRAINER_FEEDBACK(
TRAINER_ID VARCHAR(20) ,
QUESTION_ID VARCHAR(20) ,
BATCH_ID VARCHAR(20) ,
MODULE_ID VARCHAR(20) ,
TRAINER_RATING int 
) ;

CREATE TABLE ASSOCIATE_FEEDBACK(
ASSOCIATE_ID VARCHAR(20),
QUESTION_ID VARCHAR(20) ,
MODULE_ID VARCHAR(20) ,
ASSOCIATE_RATING int
) ;

ALTER TABLE ASSOCIATE_STATUS
ADD BATCH_ID VARCHAR(20);
ALTER TABLE ASSOCIATE_STATUS
ADD TRAINER_ID VARCHAR(20);
ALTER TABLE ASSOCIATE_STATUS
MODIFY START_date DATE ;
ALTER TABLE ASSOCIATE_STATUS
MODIFY END_DATE DATE;

insert into Trainer_info(Trainer_Id,Salutation,Trainer_Name,Trainer_Location,Trainer_Track,Trainer_Qualification,Trainer_Experiance,Trainer_Email,Trainer_Password)
 values('F001','MR.','PANKAJ GHOSH','PUNE','JAVA','BACHELOR OF TECHNOLOGY',12,'Pankaj.Ghosh@alliance.com','fac@123'),
('F002','MR.','SANJAY RADHAKRISHNAN','Bangalore','DotNet','Bachelor of Technology',12,'Sanjay.Radhakrishnan@alliance.com','fac2@123'),
('F003','Mr.','VIJAY MATHUR','Chennai','Mainframe','Bachelor of Technology',10,'Vijay.Mathur@alliance.com','fac3@123'),
('F004','Mrs.','NANDINI NAIR','Kolkata','Java','Master of Computer Applications',9,'Nandini.Nair@alliance.com','fac4@123'),
('F005','Miss.','ANITHA PAREKH','Hyderabad','Testing','Master of Computer Applications',6,'Anitha.Parekh@alliance.com','fac5@123'),
('F006','Mr.','MANOJ AGRAWAL','Mumbai','Mainframe','Bachelor of Technology',9,'Manoj.Agrawal@alliance.com','fac6@123'),
('F007','Ms.','MEENA KULKARNI','Coimbatore','Testing','Bachelor of Technology',5,'Meena.Kulkarni@alliance.com','fac7@123'),
('F009','Mr.','SAGAR MENON','Mumbai','Java','Master of Science In Information Technology',12,'Sagar.Menon@alliance.com','fac8@123');

insert into BATCH_INFO(BATCH_ID,BATCH_OWNER,BATCH_BU_OWNER)
VALUES ('B001','MRS.SWATI ROY','MSP'),
('B002','MRS.ARURNA K','HEALTHCARE'),
('B003','MR.RAJESH KRISHNAN','LIFE SCIENCES'),
('B004','MR.SACHIN SHETTY','BFS'),
('B005','MR.RAMESH PATEL','COMMUNICATIONS'),
('B006','MRS.SUSAN CHERIAN','RETAIL & HOSPITALITY'),
('B007','MRS.SAMPADA JAIN','MSP'),
('B008','MRS.KAVITA REGE','BPO'),
('B009','MR.RAVI SEJPAL','MSP');

INSERT INTO ASSOCIATE_INFO 
VALUES ('A001','Miss.','GAYATHRI NARAYANAN','Gurgaon','Java','Bachelor of Technology','Gayathri.Narayanan@hp.com','tne1@123'),
('A002','Mrs.','RADHIKA MOHAN','Kerala','Java','Bachelor of Engineering In Information Technology','Radhika.Mohan@cognizant.com','tne2@123'),
('A003','Mr.','KISHORE SRINIVAS','Chennai','Java','Bachelor of Engineering In Computers','Kishore.Srinivas@ibm.com','tne3@123'),
('A004','Mr.','ANAND RANGANATHAN','Mumbai','DotNet','Master of Computer Applications','Anand.Ranganathan@finolex.com','tne4@123'),
('A005','Miss.','LEELA MENON','Kerala','Mainframe','Bachelor of Engineering In Information Technology','Leela.Menon@microsoft.com','tne5@123'),
('A006','Mrs.','ARTI KRISHNAN','Pune','Testing','Master of Computer Applications','Arti.Krishnan@cognizant.com','tne6@123');


INSERT INTO QUESTIONS
VALUES(Question_Id,Module_Id,Question_Text),
('Q001','EM001','Instructor knowledgeable and able to handle all your queries'),
('Q002','EM001','All the topics in a particular course handled by the trainer without any gaps or slippages'),
('Q003','EM002','The course materials presentation, handson, etc. refered during the training are relevant and useful'),
('Q004','EM002','The Hands on session adequate enough to grasp the understanding of the topic.'),
('Q005','EM002','The reference materials suggested for each module are adequate.'),
('Q006','EM003','Knowledge and skills presented in this training are applicatible at your work.'),
('Q007','EM003','This training increases my proficiency level.'),
('Q008','EM004','The physical environment e.g. classroom space, air-conditioning was conducive to learning.'),
('Q009','EM004','The software/hardware environment provided was sufficient for the purpose of the training.'),
('Q010','EM005','This training will improve your job performance.'),
('Q011','EM005','This training align with the business priorities and goals.'),
('Q012','TM001','Participants were receptive and had attitude towards learning.'),
('Q013','TM001','All participats gained the knowledge and the practical skills after this training.'),
('Q014','TM002','The course materials presentation, handson, etc. available for the session covers the entire objectives of the course.'),
('Q015','TM002','Complexity of the course is adequate for the particpate level.'),
('Q016','TM002','Case study and practical demos helpful in understanding of the topic'),
('Q017','TM003','The physical environment e.g. classroom space air-conditioning was conducive to learning.'),
('Q018','TM003','The software/hardware environment provided was adequate for the purpose of the training');

INSERT INTO ASSOCIATE_STATUS(Associate_Id,Module_Id,Batch_Id,Trainer_Id,Start_Date,End_Date)
VALUES ('A001','O10SQL','B001','F001','2000-12-15','2000-12-25'),
('A002','O10SQL','B001','F001','2000-12-15','2000-12-25'),
('A003','O10SQL','B001','F001','2000-12-15','2000-12-25'),
('A001','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),
('A002','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),
('A003','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),
('A001','J2SE','B003','F003','2002-8-20','2002-10-25'),
('A001','J2EE','B004','F004','2005-12-1','2005-12-25'),
('A002','J2EE','B004','F004','2005-12-1','2005-12-25'),
('A003','J2EE','B004','F004','2005-12-1','2005-12-25'),
('A004','J2EE','B004','F004','2005-12-1','2005-12-25'),
('A005','JAVAFX','B005','F006','2005-12-4','2005-12-2'),
('A006','JAVAFX','B005','F006','2005-12-4','2005-12-20'),
('A006','SQL2008','B006','F007','2007-6-21','2007-6-28'),
('A007','SQL2008','B006','F007','2007-6-21','2007-6-28'),
('A002','MSBI08','B007','F006','2009-6-26','2009-6-29'),
('A003','MSBI08','B007','F006','2009-6-26','2009-6-29'),
('A004','MSBI08','B007','F006','2009-6-26','2009-6-29'),
('A002','ANDRD4','B008','F005','2010-6-5','2010-6-28');

SET SQL_SAFE_UPDATES=0;
UPDATE Trainer_info SET Trainer_Password = 'nn4@123' 
WHERE Trainer_ID= 'F004';

DELETE FROM ASSOCIATE_STATUS 
WHERE ASSOCIATE_ID='A003';
SELECT * FROM ASSOCIATE_STATUS;

select * FROM trainer_info order by Trainer_Experiance DESC LIMIT 5;

create table login_details(User_Id varchar(20) unique,User_Password varchar(20));
INSERT INTO LOGIN_DETAILS
VALUES('U001','ADMIN1@123'),
('U002','ADMI2@123');


START TRANSACTION;
DELETE FROM LOGIN_DETAILS
WHERE USER_ID='U001';
DELETE FROM LOGIN_DETAILS
WHERE USER_ID='U002';
SELECT * FROM LOGIN_DETAILS;
ROLLBACK;

create user dummy_user
identified by "qwerty";
grant create , select on login_details to dummy_user;
show grants for dummy_user;
revoke create , select on login_details from dummy_user;

DROP TABLE login_details;




