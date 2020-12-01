drop table emp04;

create table emp04(empno number(4) constraint emp04_empno_uk unique,
ename varchar2(10) constraint emp04_ename_nn not null, 
job varchar2(9), deptno number(2));

select table_name, constraint_name from user_constraints
where table_name = 'emp04';

select table_name, constraint_name
from user_constraints
where TABLE_NAME = 'EMP04';

insert into emp04(empno, ename, job, deptno)
values (7499, 'allen', 'manager', 30);

insert into emp04(empno, ename, job, deptno)
values (7499, 'jones', 'manager', 20);

create table emp05(empno number(4) constraint emp05_empno_pk
primary key, ename varchar2(10) constraint emp05_ename_nn
not null, job varchar(9), deptno number(2));

insert into emp05
values(7499, 'allen', 'salesman', 30);

select * from emp05;

drop table emp05;

create table emp05 as select * from emp04
where 1 = 2;

select * from emp05;

alter table emp05 add constraint emp05_empno_pk 
primary key(empno);

insert into emp05 values(7499, 'jones', 'manager', 20);

insert into emp05 values(null, 'allen', 'salesman', 30);

select * from emp05;

--insert into emp(empno, ename, deptno)
--values (8000, 'min', 50);

SELECT TABLE_NAME, CONSTRAINT_TYPE, CONSTRAINT_NAME, 
R_CONSTRAINT_NAME 
FROM USER_CONSTRAINTS WHERE TABLE_NAME IN ('DEPT', 'EMP');

CREATE TABLE EMP06(EMPNO NUMBER(4) CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY, 
ENAME VARCHAR2(10) CONSTRAINT EMP06_ENAME_NN NOT NULL, 
JOB VARCHAR(9), DEPTNO NUMBER(2) CONSTRAINT EMP06_DEPTNO_FK 
REFERENCES DEPT(DEPTNO));

insert into emp06 values(7499, 'allen', 'salesman', 30);

select * from emp06;

drop table emp06;

create table emp06 as select * from emp05
where 1 = 2;

select * from emp06;

insert into emp06 values(7499, 'allen', 'salesman', 30);

select * from emp06;

insert into emp06 values(7566, 'joens', 'manager', 50);

drop table emp06;

create table emp06 as select * from emp05
where 1=2;

alter table emp06 add constraint emp06_empno_pk primary key(empno);

alter table emp06 add constraint emp06_deptno_fk foreign key(deptno) 
references dept(deptno);

insert into emp06 values(7499, 'allen', 'salesman', 30);

select * from emp06;

insert into emp06 values(7566, 'joens', 'manager', 50);

insert into dept values(50, 'insa', 'seoul');

insert into emp06 values(7566, 'joens', 'manager', 50);

select * from emp06;