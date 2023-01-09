set serveroutput on;
set verify off;

create or replace function totalPrice(bid_f in out number, num in out number)
	return number is
	
	n number;
	error exception;
	
begin
	
	dbms_output.put_line(bid_f);
	select price into n from bus@site_link where bid = bid_f;
	return n*num;
	exception when no_data_found then
		dbms_output.put_line('NO data found!');
	
	
         

end totalPrice;
/


create or replace function returnMon(Tidd in out transactions.tid%type)
	return number is
	
	n number;
	error exception;
	
begin
	
	
	select amount into n from transactions@site_link where tid = Tidd;
	return n;
	exception when no_data_found then
		dbms_output.put_line('No data found!'); 

	
	
end returnMon;
/
