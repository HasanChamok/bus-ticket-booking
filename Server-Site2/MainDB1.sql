
drop table route cascade constraint;
drop table bus cascade constraint;
drop table schedule cascade constraint;
drop table transactions cascade constraint;

clear screen;



create table schedule(
	sid int not null,
	times varchar2(15),
	dates varchar2(15),
	rid int,
	primary key(sid),
	foreign key(rid) references route(rid)
	);
drop sequence s_seq;
create sequence s_seq start with 1 increment by 1 nomaxvalue; 



insert into schedule(sid, times, dates, rid) values(s_seq.nextval, '09:00pm', '30.09.2019', 1);
insert into schedule(sid, times, dates, rid) values(s_seq.nextval, '10:00pm', '30.09.2019', 2);
insert into schedule(sid, times, dates, rid) values(s_seq.nextval, '08:00pm', '29.09.2019', 3);


commit;
