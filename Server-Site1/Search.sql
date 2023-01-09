set serveroutput on;
set verify off;

declare 

	
	r route.fromto%type := &route;
	d schedule.dates%type := &dates;
	t schedule.times%type := &times;  
	opt number := &options;
	
	
begin 
	
	if opt = 1 then
		searchAvail.isAvail1(r);
	elsif opt = 2 then
		searchAvail.isAvail2(r,d);
	elsif opt = 3 then
		searchAvail.isAvail3(r,d,t);
	end if;
end; 
/