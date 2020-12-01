--Basic SELECT
select department_name "�а� ��", category "�迭"
from tb_department;

select DEPARTMENT_NAME || '�� ������ ' || CAPACITY || '�� �Դϴ�.'
as "�а��� ����"
from tb_department;

select student_name from tb_student
where department_no = (select department_no from tb_department 
                        where department_name = '������а�')
    and absence_yn = 'Y'
    and student_ssn like '_______2%';
                        
select student_name from tb_student
where student_no IN('A547038', 'A547060', 'A350020', 'A350005', 'A351011');

select department_name, category from tb_department
where capacity <= 30 and capacity >=20;

select professor_name from tb_professor
where department_no is null;

select student_name from tb_student
where department_no is null;

select class_no from tb_class
where preattending_class_no is not null;

select distinct category from tb_department;

select student_no, student_name, student_ssn from tb_student
where absence_yn = 'N' and entrance_date like '02%' 
and student_address like '����%';

--Additional SELECT - �Լ�
select student_no "�й�", student_name "�̸�", entrance_date "���г⵵"
from tb_student
where department_no = '002'
order by entrance_date;

select professor_name, professor_ssn from tb_professor
where length(professor_name) != 3;

select professor_name "�����̸�", 
(substr(to_char(sysdate, 'YYMMDD'), 0, 2) 
        - to_char(substr(professor_ssn, 0, 2)) + 100) "����"
from tb_professor
where substr(professor_ssn, 8, 1) = '1'
order by "����";

select substr(professor_name, 2) "�̸�" from tb_professor;

select student_no, student_name from tb_student
where (to_char(substr(entrance_date, 0, 2))
        - to_char(substr(student_ssn, 0, 2)) + 100) > 19;

select to_char(to_date('20201225', 'YYYYMMDD'), 'day')"2020 ũ��������"
from dual;

--99/10/11, 49/10/11
select TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD')
from dual;
--99/10/11, 49/10/11
select TO_DATE('99/10/11','RR/MM/DD'), TO_DATE('49/10/11','RR/MM/DD')
from dual;

select student_no, student_name from tb_student
where student_no not like 'A%';

select round(avg(point), 1) "����" from tb_grade
where student_no = 'A241053';

select department_no "�а���ȣ", count(*) "�л���(��)" from tb_student
group by department_no
order by department_no;

select count(*) from tb_student
where coach_professor_no is null;

select substr(term_no, 0, 4) "�⵵" , avg(point) "�⵵ �� ����"
from tb_grade
where student_no = 'A241053'
group by substr(term_no, 0, 4)
order by substr(term_no, 0, 4);

select department_no "�а��ڵ��", count(*) "���л� ��"
from tb_student
where absence_yn = 'Y'
group by department_no
order by department_no;

select student_name "�����̸�", count(student_name) "������ ��"
from tb_student
group by student_name having count(student_name) > 1;

select NVL(substr(term_no, 0, 4), '') "�⵵", NVL(substr(term_no, 5, 2), '') "�б�",
        round(avg(point), 1) "����"
from tb_grade
group by rollup(substr(term_no, 0, 4), substr(term_no, 5, 2));


--additional SELECT - Option
select student_name "�л� �̸�", student_address "�ּ���"
from tb_student
order by student_name;

select student_name, student_ssn
from tb_student
order by student_ssn desc;

select student_name "�л��̸�", student_no "�й�", student_address "������ �ּ�"
from tb_student
where student_address like '��⵵%' or student_address like '������%'
order by student_name;

select professor_name, professor_ssn
from tb_professor
where department_no = (select department_no from tb_department
                        where department_name = '���а�')
order by professor_ssn;

select student_no, point
from tb_grade
where term_no = '200402' and class_no = 'C0000004'
order by point desc;

select student_no, student_name, department_name
from tb_student, tb_department
order by student_name;

select class_name, department_name
from tb_class, tb_department;

select class_name, professor_name
from tb_class, tb_professor;

select class_name, professor_name
from tb_class, tb_professor
where class_type = '�ι���ȸ';

select student_no "�й�", student_name "�л� �̸�", round(avg(point), 1) "��ü ����"
from tb_department
join tb_student using(department_no)
join tb_grade using(student_no)
where department_name = '�����а�'
group by student_no, student_name
order by 3 desc;

select department_name "�а��̸�", student_name "�л��̸�", professor_name "���������̸�"
from tb_student
join tb_department using(department_no)
join tb_professor on (coach_professor_no = professor_no)
where student_no = 'A650002';

select student_name, term_no
from tb_class
join tb_grade using(class_no)
join tb_student using(student_no)
where term_no like '2007%'
        and class_name = '�ΰ������';

select class_name, department_name
from tb_class
join tb_department using(department_no)
left join tb_class_professor using(class_no)
where category = '��ü��'
    and professor_no is null;
    
select student_name "�л��̸�", nvl(professor_name, '�������� ������') "��������"
from tb_student
join tb_professor using(department_no)
join tb_department using(department_no)
where department_name = '�Ź�����а�'
order by student_no desc;

--14.
SELECT S.STUDENT_NAME �л��̸�, NVL(P.PROFESSOR_NAME, '�������� ������') ��������
FROM TB_DEPARTMENT D, TB_STUDENT S, TB_PROFESSOR P
WHERE D.DEPARTMENT_NO = S.DEPARTMENT_NO AND P.PROFESSOR_NO(+) = S.COACH_PROFESSOR_NO
AND D.DEPARTMENT_NAME = '���ݾƾ��а�'
ORDER BY S.ENTRANCE_DATE ASC;
--15.
SELECT S.STUDENT_NO, S.STUDENT_NAME, D.DEPARTMENT_NAME, ROUND(AVG(G.POINT),1) ����
FROM TB_STUDENT S, TB_GRADE G, TB_DEPARTMENT D
WHERE S.STUDENT_NO = G.STUDENT_NO AND S.DEPARTMENT_NO = D.DEPARTMENT_NO
AND S.ABSENCE_YN = 'N'
GROUP BY S.STUDENT_NO, S.STUDENT_NAME, D.DEPARTMENT_NAME
HAVING AVG(G.POINT) >= 4.0;
--16.
SELECT C.CLASS_NO, C.CLASS_NAME, ROUND(AVG(POINT),1) AS AVG
FROM TB_GRADE G, TB_DEPARTMENT D, TB_CLASS C
WHERE C.DEPARTMENT_NO = D.DEPARTMENT_NO AND C.CLASS_NO = G.CLASS_NO
AND C.CLASS_TYPE LIKE '����%' AND D.DEPARTMENT_NAME = 'ȯ�������а�'
GROUP BY C.CLASS_NO, C.CLASS_NAME;
--17.
SELECT STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO FROM TB_STUDENT WHERE STUDENT_NAME = '�ְ���');
--18.
WITH AVG_POINT AS
(
SELECT S.STUDENT_NO, S.STUDENT_NAME, AVG(G.POINT) AS SCORE
FROM TB_GRADE G,TB_STUDENT S,TB_DEPARTMENT D
WHERE G.STUDENT_NO = S.STUDENT_NO AND S.DEPARTMENT_NO = D.DEPARTMENT_NO
GROUP BY S.STUDENT_NO, S.STUDENT_NAME
)
SELECT STUDENT_NO, STUDENT_NAME, SCORE
FROM AVG_POINT
WHERE SCORE = (SELECT MAX(SCORE) FROM AVG_POINT)
;
--19.
SELECT D.DEPARTMENT_NAME "�迭 �а���", ROUND(AVG(G.POINT),1) ��������
FROM TB_GRADE G, TB_DEPARTMENT D, TB_CLASS C
WHERE D.DEPARTMENT_NO = C.DEPARTMENT_NO AND C.CLASS_NO = G.CLASS_NO
AND D.CATEGORY = (SELECT CATEGORY FROM TB_DEPARTMENT WHERE DEPARTMENT_NAME = 'ȯ�������а�')
GROUP BY D.DEPARTMENT_NAME;


