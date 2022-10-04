SET SERVEROUTPUT ON;

--Procedure

CREATE OR REPLACE PROCEDURE sampleProcedure
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE('HELLO PROCEDURE');
END sampleProcedure;
/


--Calling procedure from block

BEGIN
	sampleProcedure;
END;
/


--EXECUTE

EXEC sampleProcedure;



--PROCEDURE with variables

CREATE OR REPLACE PROCEDURE salTotalProc
IS

A emp.id%TYPE;
B emp.salary%TYPE;
C emp.salary%TYPE;

BEGIN
	C := 0;
	FOR R IN (SELECT * FROM emp) LOOP
		A := R.id;
		B := R.salary;
		C := C + B;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('Total : '|| C);
END salTotalProc;
/

BEGIN
	salTotalProc;
END;
/