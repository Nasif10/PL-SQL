SET SERVEROUTPUT ON;

--Implicit Cursor FOR LOOP

DECLARE
  A  emp.id%TYPE;
  B  emp.salary%TYPE;
  
BEGIN
	FOR R IN (SELECT * FROM emp) 
	LOOP
		A := R.id;
		B := R.salary;
		DBMS_OUTPUT.PUT_LINE(A ||' '|| B);
	END LOOP;
END;
/

--Explicit Cursor FOR LOOP

DECLARE
  CURSOR c_emp IS 
  SELECT * FROM emp;
  
BEGIN
	FOR R IN c_emp LOOP
		DBMS_OUTPUT.PUT_LINE(R.id ||''||R.name||' '|| R.salary);
	END LOOP;
END;
/


--Passing Parameters

DECLARE
  CURSOR c_emp(s emp.salary%TYPE) IS 
  SELECT * FROM emp WHERE salary < s;
  
BEGIN
	FOR R IN c_emp(130) LOOP
		DBMS_OUTPUT.PUT_LINE(R.id ||' '|| R.salary);
	END LOOP;
END;
/



DECLARE
  A emp.id%TYPE;
  B emp.salary%TYPE;
  
BEGIN
	FOR R IN (SELECT * FROM emp) LOOP
		A := R.id;
		B := R.salary;
		DBMS_OUTPUT.PUT_LINE(A ||' '|| B);
		
		IF MOD(B, 2) = 0 THEN
			DBMS_OUTPUT.PUT_LINE(B ||' = EVEN');
		ELSE
			DBMS_OUTPUT.PUT_LINE(B ||' = ODD');
		END IF;
	END LOOP;
END;
/

--Cursor FOR Loop References Virtual Columns

DECLARE
  CURSOR c_emp IS 
  SELECT id||'_'||name AS username, salary+100 AS inc_salary FROM emp;
  
BEGIN
	FOR R IN c_emp LOOP
		DBMS_OUTPUT.PUT_LINE(R.username ||' '||R.inc_salary);
	END LOOP;
END;
/