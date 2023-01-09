set serveroutput on;
set verify off;

declare 
	
	x transactions.tid%type;
	y transactions.pname%type;
	z transactions.phn%type;
	q transactions.quantity%type;
	a transactions.amount%type;
	
	cursor cur
	is
	select tid, pname, phn, quantity, amount from transactions@site_link;
	
begin 
	
	open cur();
	loop
		fetch cur into x,y,z,q,a;
		exit when cur%notfound;
		DBMS_OUTPUT.PUT_LINE(x||'        '||y||'        '||z||'        '||q||'        '||a);
	end loop;
	close cur;
	
end; 
/