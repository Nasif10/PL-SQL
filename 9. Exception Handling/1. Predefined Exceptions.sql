SET SERVEROUTPUT ON;
SET VERIFY OFF;

--NO_DATA_FOUND

DECLARE
	A emp.salary%TYPE;
	
BEGIN
	SELECT salary into A from emp where id = 5;

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
END;
/


--TOO_MANY_ROWS

DECLARE
	A emp.salary%TYPE;
BEGIN
	SELECT salary into A from emp;
	
EXCEPTION
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('MANY ROWS DETECTED');
END;
/



DECLARE
	A emp.salary%TYPE;
BEGIN
	SELECT salary into A from emp where id = 5;

EXCEPTION
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('MANY ROWS DETECTED');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');	
END;
/


--Default exception handler OTHERS

DECLARE
	A emp.salary%TYPE;
	B NUMBER := 0;
	val number;
	
BEGIN	
	SELECT salary into A from emp where id = 1;
	val:= A/B;

EXCEPTION
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('MANY ROWS DETECTED');
		
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
	
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('OTHER ERRORS FOUND');
END;
/


--ZERO_DIVIDE

DECLARE
	A money.taka%TYPE;
	B NUMBER := 0;
	val number;
	
BEGIN
	SELECT taka into A from money where id=1;
	val:= A/B;

EXCEPTION
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('MANY ROWS DETECTED');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
	WHEN ZERO_DIVIDE THEN
		DBMS_OUTPUT.PUT_LINE('CANNOT DIVIDE BY ZERO');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('OTHER ERRORS FOUND');
END;
/