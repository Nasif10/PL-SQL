SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE showNum(A number)
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE(A);

END showNum;
/

EXEC showNum(2);



CREATE OR REPLACE PROCEDURE emp_sal_raise(e_id NUMBER, sal_raise NUMBER)
IS

BEGIN
	UPDATE emp SET salary = salary + sal_raise WHERE id = e_id;
END;
/


EXEC emp_sal_raise(1, 100);
EXEC emp_sal_raise(4, 50);

SELECT * FROM emp;


--IN PARAMETER 

CREATE OR REPLACE PROCEDURE inParam(A IN emp.id%TYPE)
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE(A);

END inParam;
/

EXEC inParam(2);
EXEC inParam(4);



---OUT PARAMETER

CREATE OR REPLACE PROCEDURE outParam(A IN emp.id%TYPE, B OUT emp.id%TYPE)
IS

BEGIN
	B:= 10;
	DBMS_OUTPUT.PUT_LINE(A);

END outParam;
/


DECLARE
	NUM emp.id%TYPE;
BEGIN
	outParam(2,NUM);           
	DBMS_OUTPUT.PUT_LINE(NUM);
END;
/


--IN OUT PARAMETER

CREATE OR REPLACE PROCEDURE inOutParam(A IN OUT emp.id%TYPE)
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE(A);
	A := 10;
END inOutParam;
/



DECLARE
	NUM emp.id%TYPE;
BEGIN
	NUM := 2;
	inOutParam(NUM);
	DBMS_OUTPUT.PUT_LINE(NUM);
END;
/

--Default Parameter Values

CREATE OR REPLACE PROCEDURE emp_sal_raise(e_id NUMBER, sal_raise NUMBER := 100)
IS

BEGIN
	UPDATE emp SET salary = salary + sal_raise WHERE id = e_id;
END;
/


EXEC emp_sal_raise(1);
EXEC emp_sal_raise(2, 50);

SELECT * FROM emp;