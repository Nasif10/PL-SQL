SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION circle_area(r NUMBER)
RETURN NUMBER IS

area NUMBER;

BEGIN
    area := 3.1416 * r * r;
    RETURN area;
END;
/


--Calling function

DECLARE
	res NUMBER;
BEGIN
	res := circle_area(2);
	DBMS_OUTPUT.PUT_LINE(res);
END;
/


--IN parameter

CREATE OR REPLACE FUNCTION inParamFun(A IN emp.id%TYPE)
RETURN NUMBER
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE(A);
	return A+10; 
END inParamFun;
/



DECLARE
	NUM NUMBER;
BEGIN
	NUM:=inParamFun(5);
	DBMS_OUTPUT.PUT_LINE(num);
END;
/



--OUT parameter

CREATE OR REPLACE FUNCTION outParamFunction(A IN emp.id%TYPE, B OUT emp.id%TYPE)
RETURN NUMBER
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE('printing A: '|| A);
	B:=10;
	return A+20; 
END outParamFunction;
/



DECLARE
	NUM NUMBER;
	NUM2 NUMBER;
BEGIN
	NUM:=outParamFunction(5,NUM2);
	DBMS_OUTPUT.PUT_LINE('printing num: '|| NUM);
	DBMS_OUTPUT.PUT_LINE('printing num2: '|| NUM2);
END;
/




--Executing function using dual

CREATE OR REPLACE FUNCTION inParamFunction(A IN emp.id%TYPE)
RETURN NUMBER
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE(A);
	return A+10; 
END inParamFunction;
/

SELECT inParamFunction(20) from dual;



--Declaring function with variables

CREATE OR REPLACE FUNCTION myfunc
RETURN emp.taka%TYPE
IS

A emp.id%TYPE;
B emp.taka%TYPE;
C emp.taka%TYPE;

BEGIN
	C := 0;
	FOR R IN (SELECT * FROM emp) LOOP
		A := R.id;
		B := R.taka;
		C := C + B;
	END LOOP;
	return C;
END myfunc;
/
