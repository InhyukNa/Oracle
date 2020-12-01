SELECT ENAME, SAL, DEPTNO FROM EMP 
WHERE DEPTNO = (SELECT DISTINCT DEPTNO FROM EMP WHERE SAL >= 3000);

SELECT ENAME, SAL, DEPTNO FROM EMP 
WHERE DEPTNO IN (SELECT DISTINCT DEPTNO FROM EMP WHERE SAL >= 3000);

select ename, sal, deptno from emp where sal >= 3000;

select ename, sal, deptno from emp
where deptno in (select distinct deptno from emp where sal >= 3000);

select ename, sal, deptno from emp
where sal > any (select sal from emp where deptno = 30);

select ename, sal from emp
where sal > min(sal);

select ename, sal from emp
where sal > any (select sal from emp where deptno = 30);

select ename, sal from emp 
where sal > all (select sal from emp where deptno = 30);

select min(sal) from emp where deptno = 30;

select max(sal) from emp where deptno = 30;

select ename, deptno, sal from emp e
where exists (select 1 from dept d 
where d.deptno in (10, 20) and e.deptno = d.deptno);

select ename, deptno, sal from emp e
where not exists (select 1 from dept d 
where d.deptno = 40 and e.deptno = d.deptno);

select 1, deptno from dept;

select 1, deptno from dept
where deptno in (10, 20);

select ename, deptno, sal from emp e
where exists (select 1 from dept d
where d.deptno in (10, 20) and e.deptno = d.deptno);

select ename, deptno, sal from emp e
where not exists (select 1 from dept d
where d.deptno = 40 and e.deptno = d.deptno);

CREATE TABLE DEPT_COPY AS SELECT * FROM DEPT;

CREATE TABLE EMP_COPY AS SELECT * FROM EMP;

SELECT EMPNO, ENAME, DEPTNO FROM EMP_COPY WHERE DEPTNO=30;

CREATE VIEW EMP_VIEW30 AS SELECT EMPNO, ENAME, DEPTNO 
FROM EMP_COPY WHERE DEPTNO=30;

