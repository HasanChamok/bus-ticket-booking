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
	
	
	select rid,sid,price into RIdd,SIdd,x from bus where bus.bid = BIdd;
	amnt := x * quan;
	insert into transactions(tid, bid, rid, sid, pname, phn, quantity, amount) values (1000, BIdd, RIdd, SIdd, name, phnn, quan, amnt);
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

	select avail into n from bus where bid_f = bus.bid;

	if n-num >= 0 then
		n := n-num;
		update bus set avail = n where bid_f = bus.bid;
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

	select quantity, bid into n, Bidd from transactions where transactions.tid = Tidd;
	update bus set avail = avail + n where Bidd = bus.bid;
	delete from transactions where transactions.tid = Tidd;
	commit;
	
	

end canUpdateSeats;
/


