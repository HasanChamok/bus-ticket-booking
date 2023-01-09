set serveroutput on;
set verify off;

create or replace trigger trig_bus
after insert or update on bus
begin

	dbms_output.put_line('Available number of seat of a bus is updated');
	
end;
/


create or replace trigger trig_auto_transaction
before insert on transactions
for each row
begin

	select t_seq.nextval into :new.tid from dual;
	
end;
/
