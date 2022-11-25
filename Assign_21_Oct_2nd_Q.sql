CREATE TABLE student1 (s_id int NOT NULL, s_name varchar(20), course varchar(20),marks int, UNIQUE(s_id) )

insert into student1 values (1001,'Reeta','Maths',40)
insert into student1 values (1002,'Ramu','Chem',50)
insert into student1 values (1003,'Reena','Phys',60)
insert into student1 values (1004,'Raju','Maths',60)
insert into student1 values (1005,'Ramesh','Maths',80)
insert into student1 values (1006,'Ravi','chem',89)
insert into student1 values (1007,'Neelam','Phys',85)
insert into student1 values (1008,'Raksha','Maths',95)

SELECT * from student1

SELECT * FROM student1  WHERE marks IN (SELECT MAX(marks) FROM student1 GROUP BY course)  ORDER BY course
