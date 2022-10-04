SET SERVEROUTPUT ON;

--FETCH Statements

DECLARE  
   i emp.id%TYPE;  
   n emp.name%TYPE;  
   s emp.salary%TYPE;
   
   CURSOR c_emp IS 
   SELECT id, name, salary FROM emp WHERE id = 1;
   
BEGIN  
   OPEN c_emp;    
      FETCH c_emp into i,n,s;  	  
      DBMS_OUTPUT.PUT_LINE(i ||' '||n||' '||s);    
   CLOSE c_emp;  
END;  
/

--FETCH Statements Inside LOOP Statements

DECLARE  
   i emp.id%type;  
   n emp.name%type;  
   s emp.salary%type;
   
   CURSOR c_emp IS 
   SELECT id, name, salary FROM emp;
   
BEGIN  
   OPEN c_emp;  
   LOOP  
      FETCH c_emp into i,n,s;  
      EXIT WHEN c_emp%notfound;
	  
      DBMS_OUTPUT.PUT_LINE(i ||' '||n||' '||s);  
   END LOOP;  
   CLOSE c_emp;  
END;  
/


DECLARE  
   i emp.id%type;  
   n emp.name%type;  
   s emp.salary%type;
   
   CURSOR c_emp IS 
   SELECT id, name, salary FROM emp WHERE salary < 130;
   
BEGIN  
   OPEN c_emp;  
   LOOP  
      FETCH c_emp into i,n,s;  
      EXIT WHEN c_emp%notfound;
	  
      DBMS_OUTPUT.PUT_LINE(i ||' '||n||' '||s);  
   END LOOP;  
   CLOSE c_emp;  
END;  
/    

--Fetching Same Explicit Cursor into Different Variables

DECLARE   
   CURSOR c_emp IS 
   SELECT id, name FROM emp;
   
   emp1 c_emp%ROWTYPE;
   emp2 c_emp%ROWTYPE;
   emp3 c_emp%ROWTYPE;
   
BEGIN  
   OPEN c_emp;   
       FETCH c_emp into emp1;
       FETCH c_emp into emp2;
	   FETCH c_emp into emp3; 
   CLOSE c_emp;
   DBMS_OUTPUT.PUT_LINE(emp1.id ||' '||emp1.name); 
   DBMS_OUTPUT.PUT_LINE(emp2.id ||' '||emp2.name);
   DBMS_OUTPUT.PUT_LINE(emp3.id ||' '||emp3.name);   
END;  
/