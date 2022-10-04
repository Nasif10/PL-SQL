SET SERVEROUTPUT ON;

DECLARE 
	TYPE emp_refCur IS REF CURSOR RETURN emp%ROWTYPE;
	c_emp emp_refCur;
	v_emp emp%ROWTYPE;
	
BEGIN  
   OPEN c_emp FOR SELECT * FROM emp WHERE id = 1;   
   FETCH c_emp into v_emp; 
   CLOSE c_emp;
   DBMS_OUTPUT.PUT_LINE(v_emp.id||' '||v_emp.name||' '||v_emp.salary);    
     
END;  
/	

--User defined record

DECLARE 
	TYPE emp_rec IS RECORD( 
		emp_salary emp.salary%TYPE
	);
	
	TYPE emp_refCur IS REF CURSOR RETURN emp_rec;
	c_emp emp_refCur;
	v_salary emp.salary%TYPE;
	
BEGIN  
   OPEN c_emp FOR SELECT salary FROM emp WHERE id = 1;   
   FETCH c_emp into v_salary; 
   CLOSE c_emp;
   DBMS_OUTPUT.PUT_LINE(v_salary);    
     
END;  
/	


--weak REF CURSOR 

DECLARE 
	TYPE emp_wkRefCur IS REF CURSOR;
	c_emp emp_wkRefCur;
	
	v_nam emp.name%TYPE;
	v_sal emp.salary%TYPE;
	
BEGIN  
   OPEN c_emp FOR SELECT name, salary FROM emp WHERE id = 1;   
   FETCH c_emp into v_nam,v_sal; 
   CLOSE c_emp;
   DBMS_OUTPUT.PUT_LINE(v_nam||' '||v_sal);    
     
END;  
/