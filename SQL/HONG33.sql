
create table product(
code number(4) constraint product_pk primary key,
name varchar2(10),
company varchar2(10),
price number(8),
qty number(4)
);

create table ibgo(
ibgo_no number(4) constraint ibgo_pk primary key,
code number(4),
ibgo_date varchar2(20),
ibgo_qty number(4),
foreign key(code) references product(code)
);

create table panmae(
panmae_no number(4) constraint panmae_pk primary key,
code number(4),
panmae_date varchar2(20),
panmae_qty number(4),
foreign key(code) references product(code)
);
