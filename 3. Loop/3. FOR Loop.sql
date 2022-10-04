SET SERVEROUTPUT ON;

--FOR LOOP

BEGIN
	FOR i IN 1..5 LOOP
		DBMS_OUTPUT.PUT_LINE(i);
	END LOOP;	
END;
/


DECLARE
  step INTEGER := 2;
BEGIN
	FOR i IN 1..5 LOOP
		DBMS_OUTPUT.PUT_LINE(i*step);
	END LOOP;	
END;
/

--FOR LOOP Reverse

BEGIN
	FOR i IN REVERSE 1..5 LOOP
		DBMS_OUTPUT.PUT_LINE(i);
	END LOOP;	
END;
/


--Using variavle

DECLARE
	NUM int:=5; 
BEGIN
	FOR i IN 1..NUM LOOP
		DBMS_OUTPUT.PUT_LINE(i);
	END LOOP;
	
END;
/


--INSERT INTO TABLE USING FOR LOOP

DECLARE
	NUM emp.id%TYPE := 0; 
	
BEGIN
	SELECT COUNT(id) INTO NUM FROM emp;

	FOR i IN 1..5 LOOP
		NUM := NUM + 1;
		INSERT INTO emp VALUES(NUM, 'F', 200);
	END LOOP;	
END;
/


--CONTINUE statement

BEGIN
  FOR i IN 1 .. 10
  LOOP
     IF MOD(i,2) = 1 THEN
        CONTINUE;
     END IF;
     DBMS_OUTPUT.PUT_LINE(i);
  END LOOP;
END;
/
