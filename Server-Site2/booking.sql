set serveroutput on;
set verify off;

declare 
 
	Bid bus.bid%type := &Bus_Id;
	seats number := &Number_of_seats;
	name transactions.pname%type := &Passenger_Name;
	phn transactions.phn%type := &Phn_Number;
	x number;
	Tidd number;
	tidd2 number;
	amnt number;
	
begin 
	
	x := totalPrice(Bid,seats);
	DBMS_OUTPUT.PUT_LINE('Total price of tickets is '||x);
	createTransaction(Bid,seats,name,phn);
	updateSeats(Bid,seats);
	select max(tid) into Tidd from transactions@site_link;
	select tid, pname, phn, amount into tidd2, name, phn, amnt from transactions@site_link where tid  = Tidd;
	dbms_output.put_line(tidd2||' '||name||' '||phn||' '||amnt);
	
	
end; 
/