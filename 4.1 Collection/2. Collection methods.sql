SET SERVEROUTPUT ON;

--COUNT() function

DECLARE
	TYPE t_emp_age IS TABLE OF NUMBER;
	v_nt t_emp_age := t_emp_age(20,32,25,30,42);
	
BEGIN
	DBMS_OUTPUT.PUT_LINE ('Size of the Nested Table is ' ||v_nt.COUNT);
END;
/


--COUNT() with Loop

DECLARE
	TYPE t_emp_age IS TABLE OF NUMBER;
	v_nt t_emp_age := t_emp_age(20,32,25,30,42);
	
BEGIN
	FOR i IN 1..v_nt.COUNT
	LOOP	
	   DBMS_OUTPUT.PUT_LINE('Value at index'|| i ||' = '|| v_nt(i));
	END LOOP; 
END;
/


--EXISTS() function

DECLARE
	TYPE t_emp_age IS TABLE OF NUMBER;
	v_nt t_emp_age := t_emp_age(20,32,25,30,42);
	
BEGIN
	IF v_nt.EXISTS (1) THEN
	   DBMS_OUTPUT.PUT_LINE('Found : ' || v_nt(1));
	ELSE   
	   DBMS_OUTPUT.PUT_LINE('No data at this index');
	END IF;   
END;
/ 


--EXTEND method

DECLARE
	TYPE t_emp_age IS TABLE OF NUMBER;
	v_nt t_emp_age := t_emp_age();	
BEGIN
	v_nt.EXTEND;
	v_nt(1) := 10;
	DBMS_OUTPUT.PUT_LINE('Value at index 1 : ' || v_nt(1));
END;
/


DECLARE
	TYPE t_emp_age IS TABLE OF NUMBER;
	v_nt t_emp_age := t_emp_age();
BEGIN
	v_nt.EXTEND(2);
	v_nt(1) := 10;
	v_nt(2) := 20;
	DBMS_OUTPUT.PUT_LINE('Value at index 1 : ' || v_nt(1));
	DBMS_OUTPUT.PUT_LINE('Value at index 1 : ' || v_nt(2));
END;
/


DECLARE
	TYPE t_emp_age IS TABLE OF NUMBER;
	v_nt t_emp_age := t_emp_age();
BEGIN
	v_nt.EXTEND;
	v_nt(1) := 10;
	DBMS_OUTPUT.PUT_LINE('Value at index 1 : ' || v_nt(1));
	v_nt.EXTEND(5,1);
	DBMS_OUTPUT.PUT_LINE('Value at index 1 : ' || v_nt(3));
	DBMS_OUTPUT.PUT_LINE('Value at index 1 : ' || v_nt(4));
END;
/



--DELETE Method

DECLARE
	TYPE t_emp_age IS TABLE OF NUMBER;
	v_nt t_emp_age := t_emp_age(20,32,25,30,42);
	
BEGIN
	DBMS_OUTPUT.PUT_LINE ('VALUE AT INDEX 5 BEFORE DELETE : ' ||v_nt(5));
	v_nt.DELETE(5);
	DBMS_OUTPUT.PUT_LINE ('VALUE AT INDEX 5 BEFORE DELETE : ' ||v_nt(5));
END;
/

--DELETE Range

DECLARE
	TYPE t_emp_age IS TABLE OF NUMBER;
	v_nt t_emp_age := t_emp_age(20,32,25,30,42);
	
BEGIN
	v_nt.DELETE(2,4);
	FOR i IN 1..v_nt.LAST
	LOOP
	   IF v_nt.EXISTS(i) THEN
	      DBMS_OUTPUT.PUT_LINE('Value at index'|| i ||' = '|| v_nt(i));
	   END IF;
	END LOOP;
END;
/


--FIRST & LAST methods

DECLARE
	TYPE t_emp_age IS TABLE OF NUMBER;
	v_nt t_emp_age := t_emp_age(20,32,25,30,42);
	
BEGIN	
	DBMS_OUTPUT.PUT_LINE('FIRST INDEX OF THE TABLE : ' || v_nt.FIRST);
	DBMS_OUTPUT.PUT_LINE('LAST INDEX OF THE TABLE : ' || v_nt.LAST);
	v_nt.DELETE(1);
	DBMS_OUTPUT.PUT_LINE('FIRST INDEX AFTER DELETE : ' || v_nt.FIRST);
	DBMS_OUTPUT.PUT_LINE('LAST INDEX OF THE TABLE : ' || v_nt.LAST);
	v_nt.TRIM;
	DBMS_OUTPUT.PUT_LINE('FIRST INDEX AFTER DELETE : ' || v_nt.FIRST);
	DBMS_OUTPUT.PUT_LINE('LAST INDEX AFTER TRIM : ' || v_nt.LAST);
END;
/


--TRIM Function

DECLARE
	TYPE t_emp_age IS TABLE OF NUMBER;
	v_nt t_emp_age := t_emp_age(20,32,25,30,42);
	
BEGIN
	v_nt.TRIM;
	FOR i IN 1..v_nt.COUNT
	LOOP	
	   DBMS_OUTPUT.PUT_LINE(v_nt(i));
	END LOOP; 
END;
/


DECLARE
	TYPE t_emp_age IS TABLE OF NUMBER;
	v_nt t_emp_age := t_emp_age(20,32,25,30,42);
	
BEGIN
	v_nt.TRIM(3);
	FOR i IN 1..v_nt.COUNT
	LOOP	
	   DBMS_OUTPUT.PUT_LINE(v_nt(i));
	END LOOP; 
END;
/


--PRIOR Method

DECLARE
	TYPE t_emp_age IS TABLE OF NUMBER;
	v_nt t_emp_age := t_emp_age(20,32,25,30,42);
	
BEGIN
	DBMS_OUTPUT.PUT_LINE ('INDEX BEFORE 3RD INDEX : ' ||v_nt.PRIOR(3));
	DBMS_OUTPUT.PUT_LINE ('VALUE BEFORE 3RD INDEX : ' ||v_nt(v_nt.PRIOR(3)));
END;
/


--NEXT Method

DECLARE
	TYPE t_emp_age IS TABLE OF NUMBER;
	v_nt t_emp_age := t_emp_age(20,32,25,30,42);
	
BEGIN
	DBMS_OUTPUT.PUT_LINE ('INDEX AFTER 3RD INDEX : ' ||v_nt.NEXT(3));
	DBMS_OUTPUT.PUT_LINE ('VALUE AFTER 3RD INDEX : ' ||v_nt(v_nt.NEXT(3)));
END;
/



--LIMIT Function

DECLARE
	TYPE inBlock_vry IS VARRAY(5) OF NUMBER;
	v_varr inBlock_vry := inBlock_vry();
	
BEGIN
	v_varr.EXTEND;
	v_varr(1) := 10;
	DBMS_OUTPUT.PUT_LINE('TOTAL INDEXES : ' || v_varr.LIMIT);
	DBMS_OUTPUT.PUT_LINE('RESULT OF COUNT : ' || v_varr.COUNT);
END;
/