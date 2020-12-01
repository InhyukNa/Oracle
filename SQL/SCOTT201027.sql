SELECT 'WELCOME TO ORACLE' "적용전", INITCAP('WELCOME TO ORACLE') "INITCAP적용후" FROM DUAL;

SELECT SUBSTR ('Welcome to Oracle', 4, 3) FROM DUAL;

SELECT ENAME, 19||SUBSTR(HIREDATE, 1, 2)년도, SUBSTR(HIREDATE, 4, 2)달 FROM EMP;

SELECT SYSDATE-1 어제, SYSDATE 오늘, SYSDATE+1 내일 FROM DUAL;

SELECT ENAME, SYSDATE, HIREDATE, MONTHS_BETWEEN(SYSDATE, HIREDATE) 근무개월수 FROM EMP;
 
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 4) FROM EMP;

SELECT SYSDATE, NEXT_DAY(SYSDATE, '수요일') FROM DUAL;

SELECT HIREDATE, LAST_DAY(hiredate) FROM EMP;

SELECT SYSDATE, NEXT_DAY(SYSDATE, '일요일') FROM DUAL;

SELECT SYSDATE, NEXT_DAY(SYSDATE, 7) FROM DUAL;

SELECT SYSDATE, NEXT_DAY(SYSDATE, '토') FROM DUAL;

SELECT sysdate, NEXT_DAY(SYSDATE, '금') FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

SELECT HIREDATE, TO_CHAR(HIREDATE, 'YYYY/MM/DD DAY') FROM EMP;

SELECT ENAME, SAL, COMM, JOB FROM EMP ORDER BY JOB;

SELECT ENAME, SAL, COMM, SAL*12+COMM, NVL(COMM, 0), SAL*12+NVL(COMM, 0) FROM EMP ORDER BY JOB;
 
SELECT DEPTNO FROM EMP ORDER BY DEPTNO;

SELECT DEPTNO, DECODE(DEPTNO, 10, 'A', 20, 'B', 'DEFAULT') FROM EMP ORDER BY DEPTNO;

SELECT ENAME, DEPTNO, 
CASE 
WHEN DEPTNO=10 THEN 'ACCOUNTING' 
WHEN DEPTNO=20 THEN 'RESEARCH'
WHEN DEPTNO=30 THEN 'SALES' 
WHEN DEPTNO=40 THEN 'OPERATIONS' 
END AS ENAME FROM EMP;

SELECT MAX(SAL), MIN(SAL) FROM EMP;

SELECT ENAME, MAX(SAL) FROM EMP;

SELECT COUNT(COMM) FROM EMP;

SELECT COUNT(DISTINCT JOB) 업무수 FROM EMP;

SELECT DEPTNO FROM EMP GROUP BY DEPTNO;

SELECT AVG(SAL) FROM EMP GROUP BY DEPTNO;

SELECT DEPTNO, MAX(SAL), MIN(SAL) FROM EMP GROUP BY DEPTNO HAVING MAX(SAL) >= 2900;

SELECT DEPTNO, JOB, COUNT(*), SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO, JOB);

select deptno, job, count(*), sum(sal) from emp group by rollup(deptno, job);

select deptno, job, sum(sal) from emp group by rollup(deptno);

select deptno, job, sum(sal) from emp group by rollup(job);

select deptno, job, count(*), sum(sal) from emp group by cube(deptno, job);

select level, lpad(deptno, level*4, '*') as empno1, ename, mgr from emp 
start with mgr is null connect by prior empno = mgr;

select level, lpad(deptno, level*4, '^') as empno1, ename, mgr from emp 
start with mgr is null connect by prior empno = mgr;

COL ENAME1 FOR A20;

SELECT LEVEL, LPAD(ENAME, LEVEL＊4, '*') 
AS ENAME1, SUBSTR(SYS_CONNECT_BY_PATH(ENAME,'-'), 2) ENAME2, 
MGR FROM EMP START WITH MGR IS NULL CONNECT BY PRIOR EMPNO = MGR;

select ename, empno from emp where ename = 'KING';

SELECT LEVEL, SUM(SAL) TOTAL, COUNT(EMPNO) CNT FROM EMP 
START WITH MGR IS NULL CONNECT BY PRIOR EMPNO = MGR 
GROUP BY LEVEL ORDER BY LEVEL;

SELECT DEPTNO, LISTAGG(ENAME, '**')
WITHIN GROUP (ORDER BY HIREDATE) "LISTAGG" 
FROM EMP GROUP BY DEPTNO;

SELECT DEPTNO, COUNT(DECODE(JOB, 'CLERK', 0)) "CLERK", 
COUNT(DECODE(JOB, 'MANAGER', 0)) "MANAGER",
COUNT(DECODE(JOB, 'PRESIDENT', 0)) "PRESIDENT", 
COUNT(DECODE(JOB, 'ANALYST', 0)) "ANALYST",
COUNT(DECODE(JOB, 'SALESMAN', 0)) "SALESMAN" FROM EMP 
GROUP BY DEPTNO ORDER BY DEPTNO;

SELECT * FROM (SELECT DEPTNO, JOB, EMPNO FROM EMP) PIVOT (
COUNT(EMPNO) FOR JOB IN ( 'CLERK' AS "CLERK", 'MANAGER' AS "MANAGER",
'PRESIDENT' AS "PRESIDENT", 'ANALYST' AS "ANALYST", 'SALESMAN' AS "SALESMAN") )
ORDER BY DEPTNO;

SELECT * FROM (SELECT DEPTNO, JOB, EMPNO, SAL FROM EMP) PIVOT (
COUNT(EMPNO) AS CNT, SUM(NVL(SAL, 0)) AS SAL 
FOR JOB IN ( 'CLERK' AS "C", 'MANAGER' AS "M", 'PRESIDENT' AS "P", 
'ANALYST' AS "A", 'SALESMAN' AS "S") ) 
ORDER BY DEPTNO;

select empno, ename, sal, rank()
over(order by sal desc) "순위"
from emp where deptno = 10;

select * from emp, dept;

select ename, dname from emp, dept where emp.deptno = dept.deptno;

SELECT E.ENAME, D.DNAME, E.DEPTNO FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO AND ENAME = 'SCOTT';

select ename, sal, grade
from emp, salgrade
where sal between losal and hisal;

select * from salgrade;

SELECT E.ENAME, D.DNAME, S.GRADE FROM EMP E, DEPT D, SALGRADE S 
WHERE E.DEPTNO = D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT EMPLOYEE.ENAME||'의 매니저는 '|| MANAGER.ENAME||'입니다.'
FROM EMP EMPLOYEE, EMP MANAGER WHERE EMPLOYEE.MGR = MANAGER.EMPNO;

SELECT EMPLOYEE.ENAME||'의 매니저는 '|| MANAGER.ENAME||'입니다.' 
FROM EMP EMPLOYEE, EMP MANAGER WHERE EMPLOYEE.MGR = MANAGER.EMPNO(+);

SELECT E.ENAME, E.DEPTNO, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D WHERE E.DEPTNO(+) = D.DEPTNO;

SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT';

SELECT DNAME FROM DEPT WHERE DEPTNO = 20;

SELECT DNAME FROM DEPT 
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');

SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT';

SELECT DNAME FROM DEPT 
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');

SELECT DNAME FROM DEPT 
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');

SELECT ENAME, SAL FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP);

SELECT ENAME, SAL FROM EMP 
WHERE SAL>= (SELECT SAL FROM EMP WHERE ENAME = 'SCOTT');

select avg(sal) from emp;

select avg(comm) from emp;

select comm, NVL(comm, 0) from emp;

select round(avg(NVL(comm, 0))) from emp;

select ename "사원이름", floor(sysdate - hiredate) "근무일수" from emp
where hiredate = (select min(hiredate) from emp);

select empno, ename
from emp
where sal = (select max(sal) sal from emp);