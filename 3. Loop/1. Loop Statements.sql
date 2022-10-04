SET SERVEROUTPUT ON;

--Basic LOOP

DECLARE
	NUM int:=0; 
BEGIN
	LOOP
		NUM := NUM + 1;
		DBMS_OUTPUT.PUT_LINE(NUM);
		IF NUM = 5 THEN
			EXIT;
		END IF;
	END LOOP;	
END;
/


--EXIT WHEN

DECLARE
	NUM int:=0; 
BEGIN
	LOOP
		NUM := NUM + 1;
		DBMS_OUTPUT.PUT_LINE(NUM);
		EXIT WHEN NUM = 5;
	END LOOP;
	
END;
/


DECLARE
  NUM NUMBER := 0;
  
BEGIN
  LOOP
    NUM := NUM + 1;
    EXIT WHEN NUM > 3;
    DBMS_OUTPUT.PUT_LINE('INSIDE LOOP:' || NUM )  ;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('OUTSIDE LOOP:' || NUM );
END;
/


--NESTED LOOP

DECLARE
  i NUMBER := 0;
  j NUMBER := 0;
  
BEGIN
   LOOP
      i := i+1;
      EXIT WHEN i>2;    
      DBMS_OUTPUT.PUT_LINE('Outer counter ' || i);

      j := 10;
      LOOP
		 DBMS_OUTPUT.PUT_LINE(' Inner counter ' || j);
		 j := j+1;
		 EXIT WHEN j>12;
      END LOOP;
   END LOOP;
END;
/