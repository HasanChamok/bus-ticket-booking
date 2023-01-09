create or replace package searchAvail as 
	
	procedure isAvail1(r in out route.fromto%type);
	procedure isAvail2(r in out route.fromto%type, d in out schedule.dates%type);
	procedure isAvail3(r in out route.fromto%type, t in out schedule.times%type, d in out schedule.dates%type);
	
end searchAvail;
/


create or replace package body searchAvail as
 
	procedure isAvail1(r in out route.fromto%type)
	is

	x bus.bid%type;
	y bus.bname%type;
	z bus.price%type;
	v bus.avail%type;
	
	cursor cur
	is
	select bid, bname, price, avail from bus@site_link 
	where avail > 0 and rid in( select rid from route@site_link where fromto = r and pickup_point = 'klpr');
	
	error exception ;
	cnt number := 0;
	
	
	begin
		
		open cur();
		loop
			fetch cur into x,y,z,v;
			if cur%notfound and cnt < 1 then
				raise error;
			end if;
			exit when cur%notfound;
			DBMS_OUTPUT.PUT_LINE(x||' '||y||' '||z||' '||v);
			cnt := cnt + 1;
		end loop;
		close cur;
		
		exception when error then
			DBMS_OUTPUT.PUT_LINE('No bus in this schedule');
		

	end isAvail1;


	procedure isAvail2(r in out route.fromto%type, d in out schedule.dates%type)
		is

		x bus.bid%type;
		y bus.bname%type;
		z bus.price%type;
		v bus.avail%type;
		
		cursor cur
		is
		select bid, bname, price, avail from bus@site_link 
		where avail > 0 and sid 
		in(select sid from schedule@site_link where dates = d and rid 
		in(select rid from route@site_link where fromto = r and pickup_point = 'klpr'));
		
		
		error exception ;
		cnt number := 0;
		
		
	begin
		
		open cur();
		loop
			fetch cur into x,y,z,v;
			if cur%notfound and cnt < 1 then
				raise error;
			end if;
			exit when cur%notfound;
			DBMS_OUTPUT.PUT_LINE(x||' '||y||' '||z||' '||v);
			cnt := cnt + 1;
		end loop;
		close cur;
		
		exception when error then
			DBMS_OUTPUT.PUT_LINE('No bus in this schedule');

	end isAvail2;


	procedure isAvail3(r in out route.fromto%type, t in out schedule.times%type, d in out schedule.dates%type)
		is

		x bus.bid%type;
		y bus.bname%type;
		z bus.price%type;
		v bus.avail%type;
		
		cursor cur
		is
		select bid, bname, price, avail from bus@site_link 
		where avail > 0 and sid 
		in(select sid from schedule@site_link where times = t and dates = d and rid 
		in(select rid from route@site_link where fromto = r and pickup_point = 'klpr'));
		
		error exception ;
		cnt number := 0;

	begin
		
		open cur();
		loop
			fetch cur into x,y,z,v;
			if cur%notfound and cnt < 1 then
				raise error;
			end if;
			exit when cur%notfound;
			DBMS_OUTPUT.PUT_LINE(x||' '||y||' '||z||' '||v);
			cnt := cnt + 1;
		end loop;
		close cur;
		
		exception when error then
			DBMS_OUTPUT.PUT_LINE('No bus in this schedule');
			
	end isAvail3;
 

end searchAvail; 
/