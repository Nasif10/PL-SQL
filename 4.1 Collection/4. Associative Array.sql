SET SERVEROUTPUT ON;

--Associative Array

DECLARE
	TYPE emp IS TABLE OF NUMBER 
    INDEX BY VARCHAR2(20);
	v_name emp;
	
BEGIN
	v_name('A') := 100;
	v_name('B') := 110;
	
	DBMS_OUTPUT.PUT_LINE('Salary of A : '||v_name('A'));
END;
/	

--Iterate over the keys

DECLARE
	TYPE emp IS TABLE OF NUMBER 
    INDEX BY VARCHAR2(20);
	v_name emp;
	
	flag VARCHAR2(20);
	
BEGIN
	v_name('A') := 100;
	v_name('B') := 110;
	v_name('C') := 120;
	
	flag := v_name.FIRST;
	WHILE flag IS NOT NULL
	LOOP
	   DBMS_OUTPUT.PUT_LINE('Key ->'||flag||' Value ->'||v_name(flag));
	   flag := v_name.NEXT(flag);
	END LOOP;
END;
/	