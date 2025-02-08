use da_2025;

-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Assessment 1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
CREATE TABLE Worker (
    WORKER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(50)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');
select * from worker;

-- 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. 
select * from worker order by DEPARTMENT Asc,FIRST_NAME DESC;

-- 2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish" from the Worker table 
select * from worker where FIRST_NAME in ("Vipul","Satish");

-- 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 
select * from worker where FIRST_NAME like "_____h";

-- 4. Write an SQL query to print details of the Workers whose SALARY lies between 1.
select * from worker where salary between 70000 and 100000;

-- 5.Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
select DEPARTMENT,COUNT(*) AS TOTAL from worker group by DEPARTMENT;

-- 6. Write an SQL query to show the top 6 records of a table. 
select * from worker limit 6;

-- 7. Write an SQL query to fetch the departments that have less than five people in them.
SELECT department, COUNT(*) AS employee_count  FROM employees  GROUP BY department  HAVING COUNT(*) < 5;

-- 8. Write an SQL query to show all departments along with the number of people in there.
select DEPARTMENT,COUNT(*) AS TOTAL from worker group by DEPARTMENT;

-- 9. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT FIRST_NAME,SALARY,DEPARTMENT FROM WORKER WHERE SALARY IN(SELECT MAX(SALARY) FROM WORKER GROUP BY DEPARTMENT);

-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Assessment 2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

CREATE TABLE STUDENT (
    stdID INT PRIMARY KEY,
    stdName VARCHAR(50),
    sex VARCHAR(10),
    percentage INT,
    class INT,
    sec CHAR(1),
    stream VARCHAR(20),
    DOB DATE
);

INSERT INTO STUDENT (StdID, StdName, Sex, Percentage, Class, Sec, Stream, DOB) VALUES
(1001, 'Surekha Joshi', 'Female', 82, 12, 'A', 'Science', '1998-03-08'),
(1002, 'Maahi Agarwal', 'Female', 56, 11, 'C', 'Commerce', '2008-11-23'),
(1003, 'Sanam Verma', 'Male', 59, 11, 'C', 'Commerce', '2006-06-29'),
(1004, 'Ronit Kumar', 'Male', 63, 11, 'C', 'Commerce', '1997-11-05'),
(1005, 'Dipesh Pulkit', 'Male', 78, 11, 'B', 'Science', '2003-09-14'),
(1006, 'Jahanvi Puri', 'Female', 60, 11, 'B', 'Commerce', '2008-11-07'),
(1007, 'Sanam Kumar', 'Male', 23, 12, 'F', 'Commerce', '1998-03-08'),
(1008, 'Sahil Saras', 'Male', 56, 11, 'C', 'Commerce', '2008-11-07'),
(1009, 'Akshra Agarwal', 'Female', 72, 12, 'B', 'Commerce', '1996-10-01'),
(1010, 'Stuti Mishra', 'Female', 39, 11, 'F', 'Science', '2008-11-23'),
(1011, 'Harsh Agarwal', 'Male', 42, 11, 'C', 'Science', '1998-03-08'),
(1012, 'Nikunj Agarwal', 'Male', 49, 12, 'C', 'Commerce', '1996-06-28'),
(1013, 'Akriti Saxena', 'Female', 89, 12, 'A', 'Science', '2008-11-23'),
(1014, 'Tani Rastogi', 'Female', 82, 12, 'A', 'Science', '2008-11-23');

-- 1 To display all the records form STUDENT table. SELECT * FROM student ; 
select * from student;

-- 2. To display any name and date of birth from the table   
select stdname,dob from student;

-- 3. To display all students record where percentage is greater of equal to 80 FROM student table. 
SELECT * FROM student WHERE percentage >= 80; 

-- 4. To display student name, stream and percentage where percentage of student is more than 80 
SELECT StdName, Stream, Percentage from student WHERE percentage > 80; 

-- 5. To display all records of science students whose percentage is more than 75 form student table. 
SELECT * From student WHERE stream = "Science" AND percentage > 75;