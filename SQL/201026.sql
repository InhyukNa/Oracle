select tablespace_name, status, contents from user_tablespaces;

create table star_wars(
episode_id number(10) constraint star_wars_pk primary key,
episode_name varchar2(50) not null,
open_year number(10)
);

drop table star_wars;

create table characters(character_id number(5) constraint characters_pk primary key,
character_name varchar2(50) not null,
master_id number(5),
role_id number(5, 2),
email varchar2(40)
);


drop table characters;

create table characters(character_id number(5) constraint characters_pk primary key,
character_name varchar2(30) not null,
master_id number(5),
role_id number(5, 0),
email varchar2(40)
);

drop table characters;

create table characters(character_id number(5) constraint characters_pk primary key,
character_name varchar2(30) not null,
master_id number(5),
role_id number(5, 0),
email varchar2(40)
);

create table casting(
episode_id number(5) constraint casting_pk1 primary key,
foreign key(episode_id) references star_wars(episode_id) on delete cascade,
character_id number(5) constraint casting_pk2 primary key
references characters(character_id) on delete cascade,
real_name varchar2(30)
);

create table casting(
episode_id number(5),
character_id number(5),
real_name varchar2(30),
primary key(episode_id, character_id),
foreign key(episode_id) references star_wars(episode_id) on delete cascade,
foreign key(character_id) references characters(character_id) on delete cascade
);


