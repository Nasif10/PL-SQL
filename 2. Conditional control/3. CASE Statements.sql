SET SERVEROUTPUT ON;

--CASE Statement

DECLARE 
   grade CHAR(1) := 'A'; 
BEGIN 
   CASE grade 
      WHEN 'A+' THEN DBMS_OUTPUT.PUT_LINE('80-100'); 
      WHEN 'A'  THEN DBMS_OUTPUT.PUT_LINE('70-79'); 
      WHEN 'A-' THEN DBMS_OUTPUT.PUT_LINE('60-69'); 
      WHEN 'B'  THEN DBMS_OUTPUT.PUT_LINE('50-59'); 
      WHEN 'F'  THEN DBMS_OUTPUT.PUT_LINE('FAIL'); 
      ELSE  DBMS_OUTPUT.PUT_LINE('NO SUCH GRADE'); 
   END CASE; 
END; 
/



DECLARE
	NUM INT:=5;
	
BEGIN
	CASE MOD(NUM,3)
		WHEN 0 THEN
			DBMS_OUTPUT.PUT_LINE('ZERO');
		WHEN 1 THEN
			DBMS_OUTPUT.PUT_LINE('ONE');
		ELSE
			DBMS_OUTPUT.PUT_LINE('TWO');
	END CASE;
END;
/



DECLARE
	NUM EMP.salary%TYPE; 
	
BEGIN
	SELECT salary INTO NUM FROM EMP WHERE id=1;
	
	CASE
		WHEN MOD(NUM,3) = 0 THEN
			DBMS_OUTPUT.PUT_LINE('ZERO');
		WHEN MOD(NUM,3) = 1 THEN
			DBMS_OUTPUT.PUT_LINE('ONE');
		ELSE
			DBMS_OUTPUT.PUT_LINE('TWO');
	END CASE;
	
END;
/



--Searched CASE Statement

DECLARE 
   grade CHAR(1) := 'A'; 
BEGIN 
   CASE
      WHEN grade = 'A+' THEN DBMS_OUTPUT.PUT_LINE('80-100'); 
      WHEN grade = 'A'  THEN DBMS_OUTPUT.PUT_LINE('70-79'); 
      WHEN grade = 'A-' THEN DBMS_OUTPUT.PUT_LINE('60-69'); 
      WHEN grade = 'B'  THEN DBMS_OUTPUT.PUT_LINE('50-59'); 
      WHEN grade = 'F'  THEN DBMS_OUTPUT.PUT_LINE('FAIL'); 
      ELSE  DBMS_OUTPUT.PUT_LINE('NO SUCH GRADE'); 
   END CASE; 
END; 
/



DECLARE
	NUM emp.salary%TYPE; 
BEGIN
	SELECT salary INTO NUM FROM emp WHERE id = 1;
	
	CASE MOD(NUM,3)
		WHEN 0 THEN
			DBMS_OUTPUT.PUT_LINE('ZERO');
		WHEN 1 THEN
			DBMS_OUTPUT.PUT_LINE('ONE');
		ELSE
			DBMS_OUTPUT.PUT_LINE('TWO');
	END CASE;	
END;
/


--EXCEPTION Instead of ELSE Clause

DECLARE 
   grade CHAR(1) := 'G'; 
BEGIN 
   CASE
      WHEN grade = 'A+' THEN DBMS_OUTPUT.PUT_LINE('80-100'); 
      WHEN grade = 'A'  THEN DBMS_OUTPUT.PUT_LINE('70-79'); 
      WHEN grade = 'A-' THEN DBMS_OUTPUT.PUT_LINE('60-69'); 
      WHEN grade = 'B'  THEN DBMS_OUTPUT.PUT_LINE('50-59'); 
      WHEN grade = 'F'  THEN DBMS_OUTPUT.PUT_LINE('FAIL');  
   END CASE;

EXCEPTION
  WHEN CASE_NOT_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No such grade');   
END; 
/