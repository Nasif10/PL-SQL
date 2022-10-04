SET SERVEROUTPUT ON;
SET VERIFY OFF;

--GOTO statement

BEGIN
  GOTO second_msg;

  <<first_msg>>
  DBMS_OUTPUT.PUT_LINE('Hello');
  GOTO end_msg;

  <<second_msg>>
  DBMS_OUTPUT.PUT_LINE('GOTO Demo');
  GOTO first_msg;

  <<end_msg>>
  DBMS_OUTPUT.PUT_LINE('Good bye...');

END;
/


DECLARE
   n number := &x;
   
BEGIN
	IF n < 5 THEN 
		GOTO small_number;
	ELSE 
		GOTO large_number;
    END IF;
  
    n := 25;
  
    <<small_number>>
    dbms_output.put_line('Small Number.');
    goto end_message;
 
    <<large_number>>
    dbms_output.put_line('Large Number.');
    goto end_message;
 
    n := 0;
 
    <<end_message>>
    dbms_output.put_line ('End');

END;
/