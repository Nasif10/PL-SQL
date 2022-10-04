SET SERVEROUTPUT ON;

--VARRAY

DECLARE
	TYPE inBlock_vry IS VARRAY(5) OF NUMBER;
	v_varr inBlock_vry := inBlock_vry(NULL,NULL,NULL,NULL,NULL);
	
BEGIN
	FOR i IN 1..v_varr.LIMIT
	LOOP
	   v_varr(i) := i*10;
	   DBMS_OUTPUT.PUT_LINE(v_varr(i));
	END LOOP;
END;
/


--Append n null elements

DECLARE
	TYPE inBlock_vry IS VARRAY(5) OF NUMBER;
	v_varr inBlock_vry := inBlock_vry();
	
BEGIN
	v_varr.EXTEND(5);
	FOR i IN 1..v_varr.LIMIT
	LOOP
	   v_varr(i) := i*5;
	   DBMS_OUTPUT.PUT_LINE(v_varr(i));
	END LOOP;
END;
/

--Alternative : Append one null element

DECLARE
	TYPE inBlock_vry IS VARRAY(5) OF NUMBER;
	v_varr inBlock_vry := inBlock_vry();
	
BEGIN
	FOR i IN 1..v_varr.LIMIT
	LOOP
	   v_varr.EXTEND;
	   v_varr(i) := i*5;
	   DBMS_OUTPUT.PUT_LINE(v_varr(i));
	END LOOP;
END;
/


--VARRAY as Database object

CREATE OR REPLACE TYPE dbObj_vry IS VARRAY(5) OF NUMBER;
/
CREATE TABLE calendar(
	day_name varchar2(20), 
	day_date dbObj_vry
);
INSERT INTO calendar VALUES('Saturday', dbObj_vry(1,8,15,23));

SELECT * FROM calendar;