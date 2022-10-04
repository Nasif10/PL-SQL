SET SERVEROUTPUT ON;

--Nested Table

DECLARE
	TYPE t_emp_age IS TABLE OF NUMBER;
	v_nt t_emp_age := t_emp_age(20,32,25,30,42);
	
BEGIN
	DBMS_OUTPUT.PUT_LINE('Value at index 1 : ' || v_nt(1));
	DBMS_OUTPUT.PUT_LINE('Value at index 2 : ' || v_nt(2));
END;
/

--Using Loop

DECLARE
	TYPE t_emp_age_type IS TABLE OF NUMBER;
	v_nt t_emp_age_type := t_emp_age_type(20,32,25,30,42);
	
BEGIN
	FOR i IN 1..v_nt.COUNT
	LOOP	
	   DBMS_OUTPUT.PUT_LINE('Value at index'|| i ||' = '|| v_nt(i));
	END LOOP;   
END;
/


--Add elements to table

DECLARE
	TYPE t_emp_age IS TABLE OF NUMBER;
	v_nt t_emp_age := t_emp_age();
BEGIN
	v_nt.EXTEND(5);
	FOR i IN 1..v_nt.COUNT
	LOOP
	   v_nt(i) := i*10;
	   DBMS_OUTPUT.PUT_LINE(v_nt(i));
	END LOOP;
END;
/



DECLARE
	TYPE t_emp_age_type IS TABLE OF emp.salary%TYPE;
	v_nt  t_emp_age_type := t_emp_age_type();
	
BEGIN
	FOR i IN (SELECT salary FROM emp)
	LOOP
	   v_nt.EXTEND;
	   v_nt(v_nt.LAST) := i.salary;
	END LOOP;
	
	FOR j IN v_nt.FIRST..v_nt.LAST
	LOOP
	   DBMS_OUTPUT.PUT_LINE('Salary at index = '|| v_nt(j));
	END LOOP;
END;
/