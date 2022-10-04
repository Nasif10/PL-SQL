SET SERVEROUTPUT ON;

--Cursor-based record

DECLARE
   CURSOR c_emp IS 
   SELECT name, salary FROM emp WHERE id = 3;

   v_emp c_emp%ROWTYPE;
   
BEGIN
	OPEN c_emp;
	   FETCH c_emp into v_emp;	
	   DBMS_OUTPUT.PUT_LINE(v_emp.name||' '||v_emp.salary);
	CLOSE c_emp;
END;
/


--For multiple row

DECLARE
   CURSOR c_emp IS 
   SELECT name, salary FROM emp WHERE salary < 130;

   v_emp c_emp%ROWTYPE;
   
BEGIN
	OPEN c_emp;
	LOOP 
	   FETCH c_emp into v_emp;
	   EXIT WHEN c_emp%notfound;
	   DBMS_OUTPUT.PUT_LINE(v_emp.name||' '||v_emp.salary);
    END LOOP; 
	CLOSE c_emp;
END;
/