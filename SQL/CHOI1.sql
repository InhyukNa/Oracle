drop table casting;

create table casting(
episode_id number(5),
character_id number(5),
real_name varchar2(30),
primary key(episode_id, character_id),
foreign key(episode_id) references star_wars(episode_id),
foreign key(character_id) references characters(character_id)
);