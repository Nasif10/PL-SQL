SET SERVEROUTPUT ON;

--SQL%FOUND, SQL%NOTFOUND
  
BEGIN  
	DELETE FROM emp WHERE id = 3; 
     
	IF SQL%FOUND THEN 
		DBMS_OUTPUT.PUT_LINE('Delete succeeded');
	ELSIF SQL%NOTFOUND THEN	
		DBMS_OUTPUT.PUT_LINE('Delete failed');	
	END IF;   
END;  
/ 

SELECT * FROM emp; 


--SQL%ROWCOUNT

DECLARE   
   total_rows number(2);
   
BEGIN  
   UPDATE emp SET salary = salary + 10 WHERE salary >= 130; 
    
   IF SQL%FOUND THEN  
      total_rows := SQL%ROWCOUNT;  
      DBMS_OUTPUT.PUT_LINE( total_rows || ' employee updated');  
   END IF;   
END;  
/ 

SELECT * FROM emp; 