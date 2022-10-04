SET SERVEROUTPUT ON;

--Executing procedure from main

BEGIN
	sampleProcedure;
END;
/

BEGIN
	salTotalProc;
END;
/


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
