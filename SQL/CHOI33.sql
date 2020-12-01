create table star_wars2 as select * from star_wars;

alter table star_wars2 add primary key(episode_id);

drop table characters2;

create table characters2 as select * from characters where 1=2;

alter table characters2
add foreign key(character_id) references characters(character_id);


create table product(
code number(4) constraint product_pk primary key,
name varchar2(15) not null,
company varchar2(15),
price number(4),
qty number default 0
);

insert into product(code, name, company,price) values(100,'흰우유','서울',2100);
insert into product(code, name, company,price) values(101,'딸기우유','남양',1800);
insert into product(code, name, company,price) values(102,'바나나우유','남양',1800);
insert into product(code, name, company,price) values(103,'초코우유','상길',1900);

drop table product;

create table product(
code number(4) constraint product_pk primary key,
name varchar2(15) not null,
company varchar2(15),
price number(4),
qty number default 0
);

insert into product(code, name, company,price) values(100,'흰우유','서울',2100);
insert into product(code, name, company,price) values(101,'딸기우유','남양',1800);
insert into product(code, name, company,price) values(102,'바나나우유','남양',1800);
insert into product(code, name, company,price) values(103,'초코우유','상길',1900);

create table ibgo(
ibgo_no number(4) CONSTRAINT ibgo_pk PRIMARY KEY,
code number(4) constraint ibgo_fk REFERENCES product(code),
ibgo_date date default sysdate,
ibgo_qty number
);


create sequence ibgo_seq
start with 1
increment by 1
nocycle
nocache;

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 100, to_char(sysdate, 'yyyy.mm.dd'), 50);

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 101, to_char(sysdate, 'yyyy.mm.dd'), 30);

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 102, to_char(sysdate, 'yyyy.mm.dd'), 30);

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 103, to_char(sysdate, 'yyyy.mm.dd'), 30);

drop table ibgo;

create table ibgo(
ibgo_no number(4) CONSTRAINT ibgo_pk PRIMARY KEY,
code number(4) constraint ibgo_fk REFERENCES product(code),
ibgo_date date default sysdate,
ibgo_qty number
);

create sequence ibgo_seq
start with 800
increment by 1
nocycle
nocache;

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 100, to_char(sysdate, 'yyyy.mm.dd'), 50);

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 101, to_char(sysdate, 'yyyy.mm.dd'), 30);

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 102, to_char(sysdate, 'yyyy.mm.dd'), 30);

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 103, to_char(sysdate, 'yyyy.mm.dd'), 30);

drop table ibgo;

drop sequence ibgo_seq;

create table ibgo(
ibgo_no number(4) CONSTRAINT ibgo_pk PRIMARY KEY,
code number(4) constraint ibgo_fk REFERENCES product(code),
ibgo_date date default sysdate,
ibgo_qty number
);

create sequence ibgo_seq
start with 800
increment by 1
nocycle
nocache;

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 100, to_char(sysdate, 'yyyy.mm.dd'), 50);

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 101, to_char(sysdate, 'yyyy.mm.dd'), 30);

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 102, to_char(sysdate, 'yyyy.mm.dd'), 30);

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 103, to_char(sysdate, 'yyyy.mm.dd'), 30);

create table panmae(
panmae_no number(4) constraint panmae_pk primary key,
code number(4) constraint panmae_fk references product(code),
panmae_date date default sysdate,
panmae_qty number
);

create sequence panmae_seq
start with 2000
increment by 1
nocycle
nocache;

insert into panmae(panmae_no, code, panmae_date, panmae_qty)
values(panmae_seq.nextval, 100, to_char(sysdate, 'yyyy.mm.dd'), 20);

insert into panmae(panmae_no, code, panmae_date, panmae_qty)
values(panmae_seq.nextval, 101, to_char(sysdate, 'yyyy.mm.dd'), 10);

insert into panmae(panmae_no, code, panmae_date, panmae_qty)
values(panmae_seq.nextval, 102, to_char(sysdate, 'yyyy.mm.dd'), 13);

insert into panmae(panmae_no, code, panmae_date, panmae_qty)
values(panmae_seq.nextval, 103, to_char(sysdate, 'yyyy.mm.dd'), 11);

drop table panmae;

drop table ibgo;

drop sequence panmae_seq;

drop sequence ibgo_seq;

create table ibgo(
ibgo_no number(4) CONSTRAINT ibgo_pk PRIMARY KEY,
code number(4) constraint ibgo_fk REFERENCES product(code),
ibgo_date date default sysdate,
ibgo_qty number
);

create sequence ibgo_seq
start with 799
increment by 1
nocycle
nocache;

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 100, to_char(sysdate, 'yyyy.mm.dd'), 50);

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 101, to_char(sysdate, 'yyyy.mm.dd'), 30);

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 102, to_char(sysdate, 'yyyy.mm.dd'), 30);

insert into ibgo(ibgo_no, code, ibgo_date, ibgo_qty)
values(ibgo_seq.nextval, 103, to_char(sysdate, 'yyyy.mm.dd'), 30);

create table panmae(
panmae_no number(4) constraint panmae_pk primary key,
code number(4) constraint panmae_fk references product(code),
panmae_date date default sysdate,
panmae_qty number
);

create sequence panmae_seq
start with 1999
increment by 1
nocycle
nocache;

insert into panmae(panmae_no, code, panmae_date, panmae_qty)
values(panmae_seq.nextval, 100, to_char(sysdate, 'yyyy.mm.dd'), 20);

insert into panmae(panmae_no, code, panmae_date, panmae_qty)
values(panmae_seq.nextval, 101, to_char(sysdate, 'yyyy.mm.dd'), 10);

insert into panmae(panmae_no, code, panmae_date, panmae_qty)
values(panmae_seq.nextval, 102, to_char(sysdate, 'yyyy.mm.dd'), 13);

insert into panmae(panmae_no, code, panmae_date, panmae_qty)
values(panmae_seq.nextval, 103, to_char(sysdate, 'yyyy.mm.dd'), 11);

select * from panmae;

select * from ibgo;





