SET SERVEROUTPUT ON;

--String Functions

DECLARE 
   v_string VARCHAR2(40) := 'This data type is supported';
   
BEGIN 
	DBMS_OUTPUT.PUT_LINE(LENGTH(v_string)); 
	DBMS_OUTPUT.PUT_LINE(UPPER(v_string));
	DBMS_OUTPUT.PUT_LINE(LOWER(v_string));
	DBMS_OUTPUT.PUT_LINE(SUBSTR(v_string,6));
	DBMS_OUTPUT.PUT_LINE(SUBSTR(v_string,6,9));
	DBMS_OUTPUT.PUT_LINE(SUBSTR(v_string,1,1));
END; 
/


--Math Functions

DECLARE 
   n1 INT := 9;
   n2 NUMBER(4,2) := 10.36;
   
BEGIN 
	DBMS_OUTPUT.PUT_LINE(MOD(n1,4));
	DBMS_OUTPUT.PUT_LINE(CEIL(n2));
	DBMS_OUTPUT.PUT_LINE(POWER(n1,2));
	DBMS_OUTPUT.PUT_LINE(LOG(3,n1));
END; 
/

--Date/Time Functions

DECLARE 
	v_date DATE;
	v_dt TIMESTAMP(0); 
BEGIN 
	SELECT SYSDATE INTO v_date FROM dual;
	DBMS_OUTPUT.PUT_LINE(v_date);
	SELECT SYSDATE INTO v_dt FROM dual;
	DBMS_OUTPUT.PUT_LINE(v_dt);
	SELECT CURRENT_TIMESTAMP INTO v_dt FROM DUAL;
	DBMS_OUTPUT.PUT_LINE(v_dt);
	
	DBMS_OUTPUT.PUT_LINE(MONTHS_BETWEEN('17-MAY-22',SYSDATE));
END; 
/


--Data Type Conversion

DECLARE 
	v_date DATE;
	v_dt TIMESTAMP(0); 
BEGIN 
	DBMS_OUTPUT.PUT_LINE(TO_CHAR(sysdate, 'YYYY/MM/DD'));
	DBMS_OUTPUT.PUT_LINE(TO_CHAR(sysdate, 'Month DD, YYYY'));
	DBMS_OUTPUT.PUT_LINE(TO_CHAR(sysdate, 'MONTH'));
	DBMS_OUTPUT.PUT_LINE(TO_CHAR(sysdate, 'Q'));
	DBMS_OUTPUT.PUT_LINE(TO_CHAR(sysdate, 'DDD'));
	DBMS_OUTPUT.PUT_LINE(TO_DATE('February 05, 2022', 'Month DD, YYYY'));
END; 
/