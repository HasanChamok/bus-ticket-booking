set serveroutput on;
set verify off;

declare 
 
	Tid transactions.tid%type := &TransactionId;
	x number;
	
begin 
	
	x := returnMon(Tid);
	DBMS_OUTPUT.PUT_LINE('Customer will get '||x);
	canUpdateSeats(Tid);
	
end; 
/