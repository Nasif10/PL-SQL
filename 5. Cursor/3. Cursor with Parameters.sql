SET SERVEROUTPUT ON;


DECLARE    
   n emp.name%type;  
   s emp.salary%type;
   
   CURSOR c_emp (s NUMBER) IS 
   SELECT name, salary FROM emp WHERE salary < s;
   
BEGIN  
   OPEN c_emp(130);  
   LOOP  
      FETCH c_emp into n,s;  
      EXIT WHEN c_emp%notfound;  
      DBMS_OUTPUT.PUT_LINE(n||' '||s);  
   END LOOP;  
   CLOSE c_emp;  
END;  
/ 


DECLARE  
   i emp.id%type;  
   n emp.name%type;  
   s emp.salary%type;
   
   CURSOR c_emp (n1 NUMBER, n2 NUMBER) IS 
   SELECT id, name, salary FROM emp WHERE id BETWEEN n1 AND n2;
   
BEGIN  
   OPEN c_emp(2,4);  
   LOOP  
      FETCH c_emp into i,n,s;  
      EXIT WHEN c_emp%notfound;  
      DBMS_OUTPUT.PUT_LINE(i ||' '||n||' '||s);  
   END LOOP;  
   CLOSE c_emp;  
END;  
/ 


--Parameterized cursor with default values 

DECLARE  
   i emp.id%type;  
   n emp.name%type;  
   s emp.salary%type;
   
   CURSOR c_emp (n1 NUMBER := 1, n2 NUMBER := 3) IS 
	   SELECT id, name, salary FROM emp WHERE id BETWEEN n1 AND n2;
   
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