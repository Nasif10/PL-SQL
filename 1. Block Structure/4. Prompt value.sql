SET SERVEROUTPUT ON;
SET VERIFY OFF;

--USER INPUT

DECLARE
	A int := &x;
	B int := &y;
	
BEGIN
	DBMS_OUTPUT.PUT_LINE(A+B);
END;
/


DECLARE
	A int := &x;
	B int := &y;
BEGIN
	DBMS_OUTPUT.PUT_LINE(A-B);
	
END;
/

--

DECLARE
	A int := &x;
	B int := &x;
BEGIN
	DBMS_OUTPUT.PUT_LINE(A+B);
	
END;
/


--CHARACTER INPUT

DECLARE
	A VARCHAR2(20) := '&name';
	B VARCHAR2(20) := '&address';
	
BEGIN
	DBMS_OUTPUT.PUT_LINE(A ||' '|| B);	
END;
/

--PROMPT VALUE

ACCEPT X NUMBER PROMPT "ENTER ID = "

DECLARE
	A NUMBER;
BEGIN
	A := &X;
	DBMS_OUTPUT.PUT_LINE('ID : '||A);
END;
/


ACCEPT Y CHAR PROMPT "ENTER NAME = "

DECLARE
	C VARCHAR2(10);
BEGIN
	C := '&Y';
	DBMS_OUTPUT.PUT_LINE(C);
END;
/