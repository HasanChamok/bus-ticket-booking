set serveroutput on;
set verify off;


create or replace procedure createTransaction( BIdd in out bus.bid%type, quan in out number, name in out transactions.pname%type, phnn in out transactions.phn%type)
	is
	
	TIdd transactions.tid%type;
	RIdd transactions.rid%type;
	SIdd transactions.sid%type;
	amnt transactions.sid%type; 
	x number;
	error exception;
	
begin
	
	select rid,sid,price into RIdd,SIdd,x from bus@site_link where bid = BIdd;
	amnt := x * quan;
	insert into transactions@site_link(tid, bid, rid, sid, pname, phn, quantity, amount) 
	values (1000, BIdd, RIdd, SIdd, name, phnn, quan, amnt);
	commit;
	
	exception when no_data_found then 
	
		dbms_output.put_line('No data found');
		
	when others then
        dbms_output.put_line('Error in create!'); 

end createTransaction;
/



create or replace procedure updateSeats(bid_f in out number, num in out number)
	is
	
	n int;
	error exception;

begin

	select avail into n from bus@site_link where bid_f = bid;

	if n-num >= 0 then
		n := n-num;
		update bus@site_link set avail = n where bid_f = bid;
		commit;
	elsif n-num < 0 then
		raise error;
	end if;
	
	exception when no_data_found then 
		dbms_output.put_line('No such bus!'); 
		when error then
		dbms_output.put_line('Not enough seats available');
		when others then
        dbms_output.put_line('Error at update!'); 

end updateSeats;
/




create or replace procedure canUpdateSeats(Tidd in out transactions.tid%type)
	is
	
	n int;
	Bidd bus.bid%type;
	error exception;

begin

	select quantity, bid into n, Bidd from transactions@site_link where tid = Tidd;
	update bus@site_link set avail = avail + n where Bidd = bus.bid;
	delete from transactions@site_link where tid = Tidd;
	commit;
	

end canUpdateSeats;
/


