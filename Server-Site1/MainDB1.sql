
drop table route cascade constraint;
drop table bus cascade constraint;
drop table schedule cascade constraint;
drop table transactions cascade constraint;

clear screen;

create table route(
	rid int not null,
	fromto varchar2(15),
	pickup_point varchar2(15),
	primary key(rid)
	);
drop sequence r_seq;
create sequence r_seq start with 1 increment by 1 nomaxvalue; 



create table bus(
	bid int not null,
	bname varchar2(15),
	rid int,
	sid int,
	avail int,
	total_seats int,
	price int,
	primary key(bid),
	foreign key(rid) references route(rid)
	);
drop sequence b_seq;
create sequence b_seq start with 1 increment by 1 nomaxvalue; 
	

create table transactions(
	tid int not null,  
	bid int,          
	rid int,         
	sid int,          
	pname varchar2(15), 
	phn varchar2(20),   
	quantity int,
	amount int,
	primary key(tid),
	foreign key(sid) references schedule(sid),
	foreign key(rid) references route(rid),
	foreign key(bid) references bus(bid)
);
drop sequence t_seq;
create sequence t_seq start with 1 increment by 1 nomaxvalue; 


insert into route(rid, fromto, pickup_point) values(r_seq.nextval, 'dhk_ctg', 'klpr'); 
insert into route(rid, fromto, pickup_point) values(r_seq.nextval, 'dhk_ctg', 'mtjl'); 
insert into route(rid, fromto, pickup_point) values(r_seq.nextval, 'dhk_svr', 'klpr'); 



insert into bus(bid, bname, avail, total_seats, price, rid, sid) values (b_seq.nextval, 'volvo', 40, 40, 1000, 1, 1);
insert into bus(bid, bname, avail, total_seats, price, rid, sid) values (b_seq.nextval, 'hino', 40, 40, 1000, 2, 2);
insert into bus(bid, bname, avail, total_seats, price, rid, sid) values (b_seq.nextval, 'mazda', 40, 40, 1000, 3, 3);

 
insert into transactions(tid, bid, rid, sid, pname, phn, quantity, amount) values (t_seq.nextval, 1, 1, 1, 'Dipu', '01910323262', 2, 2000);
insert into transactions(tid, bid, rid, sid, pname, phn, quantity, amount) values (t_seq.nextval, 2, 2, 2, 'Shovon', '01910325662', 1, 1000);
insert into transactions(tid, bid, rid, sid, pname, phn, quantity, amount) values (t_seq.nextval, 3, 3, 3, 'Farsheed', '01910409262', 3, 3000);

--select * from route;

--select * from bus;


commit;
