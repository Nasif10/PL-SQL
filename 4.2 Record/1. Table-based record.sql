SET SERVEROUTPUT ON;

--Table-based Records

DECLARE
	v_emp emp%ROWTYPE;
BEGIN
	SELECT * INTO v_emp FROM emp WHERE id = 1;
	DBMS_OUTPUT.PUT_LINE(v_emp.id||' '||v_emp.name||' '||v_emp.salary);
END;
/

--for selected column

DECLARE
	v_emp emp%ROWTYPE;
BEGIN
	SELECT name INTO v_emp.name FROM emp WHERE id = 1;
	DBMS_OUTPUT.PUT_LINE(v_emp.name);
END;
/

--Assign values to its fields

DECLARE
	v_emp emp%ROWTYPE;
BEGIN
	v_emp.id := 5;
	v_emp.name := 'E';
	v_emp.salary := 150;
	
	DBMS_OUTPUT.PUT_LINE(v_emp.id||' '||v_emp.name||' '||v_emp.salary);
END;
/