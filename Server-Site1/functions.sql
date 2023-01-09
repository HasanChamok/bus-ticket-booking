set serveroutput on;
set verify off;

create or replace function totalPrice(bid_f in out number, num in out number)
	return number is
	
	n number;
	error exception;
	
begin
	
	select price into n from bus where bid_f = bus.bid;
		
	return n*num;
	exception when no_data_found then 
        dbms_output.put_line('No data found!'); 
		
end totalPrice;
/


create or replace function returnMon(Tidd in out transactions.tid%type)
	return number is
	
	n number;
	error exception;
	
begin
	
	select amount into n from transactions where transactions.tid = Tidd;
		
	return n;
	exception when no_data_found then 
		dbms_output.put_line('No data found'); 
		when others then
        dbms_output.put_line('Error!'); 

	
	
end returnMon;
/
