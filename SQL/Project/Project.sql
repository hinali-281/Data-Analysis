
use da_2025;
CREATE TABLE dept (
    deptno INT PRIMARY KEY,
    deptname VARCHAR(14),
    loc VARCHAR(14)
);
INSERT INTO dept (deptno, deptname, loc) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

CREATE TABLE emp (
    empno INT(4) PRIMARY KEY,
    empname VARCHAR(10),
    job VARCHAR(9),
    mgr INT,
    hiredate DATE,
    sal DECIMAL(7 , 2 ),
    comm DECIMAL(7 , 2 ) default null,
    deptno INT,
    FOREIGN KEY (deptno)
        REFERENCES dept (deptno)
);
INSERT INTO emp (empno, empname, job, mgr, hiredate, sal, comm, deptno) VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.00, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1987-06-11', 3000.00, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000.00, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-08-09', 1500.00, 0.00, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1987-07-13', 1100.00, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-03-12', 950.00, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-03-12', 3000.00, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL, 10);

CREATE TABLE student (
    Rno INT PRIMARY KEY DEFAULT 0,
    Sname VARCHAR(14) DEFAULT NULL,
    City VARCHAR(20) DEFAULT NULL,
    stat VARCHAR(20) DEFAULT NULL
);

CREATE TABLE EMP_LOG1 (
    Emp_id INT DEFAULT NULL,
    Log_date DATE DEFAULT NULL,
    New_salary INT DEFAULT NULL,
    Action VARCHAR(20) DEFAULT NULL
);

-- 1. Select unique job from EMP table.
select job from emp group by job;

-- 2. List the details of the emps in asc order of the Dptnos and desc of Jobs?
select * from emp order by deptno asc,job desc;

-- 3. Display all the unique job groups in the descending order?
select job from emp group by job order by job desc;

-- 4. List the emps who joined before 1981.
select empname,hiredate from emp where hiredate < '1981-02-20';

-- 5. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal. 
select empno,empname,sal,(sal/30)as daily_sal,(sal*12)as Ann_sal from emp order by Ann_sal asc;

-- 6. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7839.
select Empno,Empname,sal,TIMESTAMPDIFF(YEAR, hiredate, CURDATE())as Exp_years from emp where mgr=7839;

-- 7. Display all the details of the emps who’s Comm. Is more than their Sal?
select * from emp where comm>sal;

-- 8. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order. 
select * from emp where job in("CLERK","ANALYST") order by sal desc;

-- 9. List the emps Who Annual sal ranging from 22000 and 45000.
select Empno,empname,(sal*12)as Ann_Sal from emp having Ann_Sal  between 22000 and 45000;

-- 10. List the Enames those are starting with ‘S’ and with five characters. 
select Empname from emp where Empname like 'S%' ;

-- 11. List the emps whose Empno not starting with digit78.
select * from emp where empno not like '78%';

-- 12. List all the Clerks of Deptno 20.
select empno,empname,job,deptno from emp where job='clerk' and deptno='20';

-- 13. List the Emps who are senior to their own MGRS.
select empno,empname,hiredate,mgr from emp where hiredate <(select hiredate from emp where empno=mgr);

-- 14. List the Emps of Deptno 20 who’s Jobs are same as Deptno10.
select deptno,empno,empname,job from emp where deptno="20" and job in (select job from emp where deptno ="10");

-- 15. List the Emps who’s Sal is same as FORD or SMITH in desc order of Sal.
select * from emp where sal in(select sal from emp where empname='ford' or empname= 'smith') order by sal desc;

-- 16. List the emps whose jobs same as SMITH or ALLEN. 
select * from emp where job in(select job from emp where empname='smith' or empname='allen');

-- 17. Any jobs of deptno 10 those that are not found in deptno 20.
select job,deptno from emp where deptno='10' and job  not in (select job from emp where deptno='20');

-- 18. Find the highest sal of EMP table.
select max(sal)as highest_sal from emp;

-- 19. Find details of highest paid employee.
select * from emp  order by sal desc limit 1;

-- 20. Find the total sal given to the MGR. 
select sum(sal) from emp where Empno in (select mgr from emp); 

-- 21. List the emps whose names contains ‘A’. 
select empno,empname from emp where empname like "%a%";

-- 22. Find all the emps who earn the minimum Salary for each job wise in ascending order. 
select empno,empname,job,sal from emp where sal in (select min(sal) from emp  group by job  order by sal);

-- 23. List the emps whose sal greater than Blake’s sal. 
select * from emp where sal >(select sal from emp where empname="Blake");

-- 24. Create view v1 to select ename, job, dname, loc whose deptno are same.
create view v1 as select e.empname,e.job,e.deptno,d.deptname,d.loc from emp e join dept d on e.deptno=d.deptno;
select * from v1;

-- 25. Create a procedure with dno as input parameter to fetch ename and dname.
CALL project(20);

-- 26. Add column Pin with bigint data type in table student. 
ALTER TABLE student 
ADD COLUMN Pin BIGINT;

-- 27. Modify the student table to change the sname length from 14 to 40. 
ALTER TABLE student  
MODIFY COLUMN sname VARCHAR(40);

-- Create trigger to insert data in emp_log table whenever any update of sal in EMP table. You can set action as ‘New Salary’. 

create table emp_log(empno int primary key,empname varchar(10),sal DECIMAL(7 , 2 ));

delimiter $$
create trigger up_empsal
 before update on emp
 for each row
begin 
	insert into emp_log(empno,empname,sal)values(old.empno,old.empname,old.sal);
end$$

UPDATE emp  
SET sal = 4000  
WHERE empno = 7902;
