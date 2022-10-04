SET SERVEROUTPUT ON;

--Executing function from main

DECLARE
	NUM number;

BEGIN
	NUM := inParamFunction(10);
	DBMS_OUTPUT.PUT_LINE(NUM);
END;
/


DECLARE
	NUM number;

BEGIN
	NUM := mytest;
	DBMS_OUTPUT.PUT_LINE(NUM);
END;
/
