drop table tb_department;

create table tb_department(
    department_no varchar2(10) not null constraint department_no_pk primary key,
    department_name varchar2(20) not null,
    category varchar2(20),
    open_yn char(1),
    capacity number
);
    
comment on column tb_department.department_no is '학과 번호';
comment on column tb_department.department_name is '학과 이름';
comment on column tb_department.category is '계열';
comment on column tb_department.open_yn is '개설 여부';
comment on column tb_department.capacity is '정원';

select * from tb_department;


create table tb_professor(
    professor_no varchar2(10) not null constraint professor_no_pk primary key,
    professor_name varchar2(30) not null,
    professor_ssn varchar2(14),
    professor_address varchar2(100),
    department_no varchar2(10) 
    constraint professor_department_no_fk references tb_department(department_no)
);

comment on column tb_professor.professor_no is '교수 번호';
comment on column tb_professor.professor_name is '교수 이름';
comment on column tb_professor.professor_ssn is '교수 주민번호';
comment on column tb_professor.professor_address is '교수 주소';
comment on column tb_professor.department_no is '학과 번호';


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

comment on column tb_student.student_no is '학생 번호';
comment on column tb_student.department_no is '학과 번호';
comment on column tb_student.student_name is '학생 이름';
comment on column tb_student.student_ssn is '학생 주민번호';
comment on column tb_student.student_address is '학생 주소';
comment on column tb_student.entrance_date is '입학 일자';
comment on column tb_student.absence_yn is '휴학 여부';
comment on column tb_student.coach_professor_no is '지도 교수 번호';


create table tb_class(
    class_no varchar2(10) not null constraint class_no_pk primary key,
    department_no varchar2(10) not null
    constraint class_department_no_fk references tb_department(department_no),
    preattending_class_no varchar2(10),
    class_name varchar2(30) not null,
    class_type varchar2(10)
);

comment on column tb_class.class_no is '과목 번호';
comment on column tb_class.department_no is '학과 번호';
comment on column tb_class.preattending_class_no is '선수 과목 번호';
comment on column tb_class.class_name is '과목 이름';
comment on column tb_class.class_type is '과목 구분';


create table tb_class_professor(
    class_no varchar2(10) not null 
    constraint professor_class_no_fk references tb_class(class_no),
    professor_no varchar2(10) not null 
    constraint class_professor_no_fk references tb_professor(professor_no),
    constraint professor_class_no_pk primary key(class_no, professor_no)
);

comment on column tb_class_professor.class_no is '과목 번호';
comment on column tb_class_professor.professor_no is '교수 번호';


create table tb_grade(
    term_no varchar2(10) not null,
    class_no varchar2(10) not null
    constraint grade_class_no_fk references tb_class(class_no),
    student_no varchar2(10) not null
    constraint grade_student_no_fk references tb_student(student_no),
    point number(3, 2),
    constraint grade_pk primary key(term_no, class_no, student_no)
);

comment on column tb_grade.term_no is '학기 번호';
comment on column tb_grade.class_no is '과목 번호';
comment on column tb_grade.student_no is '학생 번호';
comment on column tb_grade.point is '학점';
    
