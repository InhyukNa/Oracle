drop table tb_department;

create table tb_department(
    department_no varchar2(10) not null constraint department_no_pk primary key,
    department_name varchar2(20) not null,
    category varchar2(20),
    open_yn char(1),
    capacity number
);
    
comment on column tb_department.department_no is '�а� ��ȣ';
comment on column tb_department.department_name is '�а� �̸�';
comment on column tb_department.category is '�迭';
comment on column tb_department.open_yn is '���� ����';
comment on column tb_department.capacity is '����';

select * from tb_department;


create table tb_professor(
    professor_no varchar2(10) not null constraint professor_no_pk primary key,
    professor_name varchar2(30) not null,
    professor_ssn varchar2(14),
    professor_address varchar2(100),
    department_no varchar2(10) 
    constraint professor_department_no_fk references tb_department(department_no)
);

comment on column tb_professor.professor_no is '���� ��ȣ';
comment on column tb_professor.professor_name is '���� �̸�';
comment on column tb_professor.professor_ssn is '���� �ֹι�ȣ';
comment on column tb_professor.professor_address is '���� �ּ�';
comment on column tb_professor.department_no is '�а� ��ȣ';


create table tb_student(
    student_no varchar2(10) not null constraint student_no_pk primary key,
    department_no varchar2(10) not null
    constraint student_department_no_fk references tb_department(department_no),
    student_name varchar2(30) not null,
    student_ssn varchar2(14),
    student_address varchar2(100),
    entrance_date date,
    absence_yn char(1),
    coach_professor_no varchar2(10)
    constraint coach_professor_no_fk references tb_professor(professor_no)
);

comment on column tb_student.student_no is '�л� ��ȣ';
comment on column tb_student.department_no is '�а� ��ȣ';
comment on column tb_student.student_name is '�л� �̸�';
comment on column tb_student.student_ssn is '�л� �ֹι�ȣ';
comment on column tb_student.student_address is '�л� �ּ�';
comment on column tb_student.entrance_date is '���� ����';
comment on column tb_student.absence_yn is '���� ����';
comment on column tb_student.coach_professor_no is '���� ���� ��ȣ';


create table tb_class(
    class_no varchar2(10) not null constraint class_no_pk primary key,
    department_no varchar2(10) not null
    constraint class_department_no_fk references tb_department(department_no),
    preattending_class_no varchar2(10),
    class_name varchar2(30) not null,
    class_type varchar2(10)
);

comment on column tb_class.class_no is '���� ��ȣ';
comment on column tb_class.department_no is '�а� ��ȣ';
comment on column tb_class.preattending_class_no is '���� ���� ��ȣ';
comment on column tb_class.class_name is '���� �̸�';
comment on column tb_class.class_type is '���� ����';


create table tb_class_professor(
    class_no varchar2(10) not null 
    constraint professor_class_no_fk references tb_class(class_no),
    professor_no varchar2(10) not null 
    constraint class_professor_no_fk references tb_professor(professor_no),
    constraint professor_class_no_pk primary key(class_no, professor_no)
);

comment on column tb_class_professor.class_no is '���� ��ȣ';
comment on column tb_class_professor.professor_no is '���� ��ȣ';


create table tb_grade(
    term_no varchar2(10) not null,
    class_no varchar2(10) not null
    constraint grade_class_no_fk references tb_class(class_no),
    student_no varchar2(10) not null
    constraint grade_student_no_fk references tb_student(student_no),
    point number(3, 2),
    constraint grade_pk primary key(term_no, class_no, student_no)
);

comment on column tb_grade.term_no is '�б� ��ȣ';
comment on column tb_grade.class_no is '���� ��ȣ';
comment on column tb_grade.student_no is '�л� ��ȣ';
comment on column tb_grade.point is '����';
    
