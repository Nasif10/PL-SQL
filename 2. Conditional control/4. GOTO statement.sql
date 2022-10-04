SET SERVEROUTPUT ON;

--GOTO STATEMENT

BEGIN
   GOTO second_output;
   DBMS_OUTPUT.PUT_LINE('This line will never execute.');
   
  <<second_output>>
  DBMS_OUTPUT.PUT_LINE('We are here!');
END;
/


BEGIN
  GOTO second_message;

  <<first_message>>
  DBMS_OUTPUT.PUT_LINE('1st message');
  GOTO the_end;

  <<second_message>>
  DBMS_OUTPUT.PUT_LINE('2nd message');
  GOTO first_message;

  <<the_end>>
  DBMS_OUTPUT.PUT_LINE('end message');

END;
/


--NULL statement

DECLARE
  status BOOLEAN:= TRUE; 

BEGIN
  IF status THEN
    GOTO end_of_program;
  END IF;
  <<end_of_program>>
  NULL;
END;
/
