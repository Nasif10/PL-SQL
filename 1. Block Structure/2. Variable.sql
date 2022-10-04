SET SERVEROUTPUT ON;

--DECLARING VARIABLES

DECLARE
  msg VARCHAR2(20);
BEGIN
   msg := 'Hello World!';
   DBMS_OUTPUT.PUT_LINE(msg);
END;
/


--ANCHORED DECLARATIONS

DECLARE
	t_salary emp.salary%TYPE;
BEGIN
	t_salary := 200;
	UPDATE emp SET salary = t_salary where id = 1;
END;
/

SELECT * FROM emp;


--INITIALIZATION

DECLARE
	t_salary emp.salary%TYPE := 210;
BEGIN
	UPDATE emp SET salary = t_salary where id = 2;
	DBMS_OUTPUT.PUT_LINE(t_salary);
END;
/
commit;

SELECT * FROM emp;


--BIND VARIABLE

VARIABLE v_bind VARCHAR2(20);
EXEC :v_bind := 'Hello Bind';


VARIABLE b_res NUMBER;

BEGIN
   SELECT salary*12 INTO :b_res FROM emp WHERE id = 1;
END;
/

PRINT b_res;

--CONSTANTS

DECLARE
  v_pi CONSTANT NUMBER(7,6) := 3.141592;
BEGIN
  DBMS_OUTPUT.PUT_LINE(v_pi);
END;
/


--DEFAULT values

DECLARE
  v_pi CONSTANT NUMBER(7,6) DEFAULT 3.141592;
BEGIN
  DBMS_OUTPUT.PUT_LINE(v_pi);
END;
/


--NOT NULL constraint

DECLARE
  status VARCHAR2(20) NOT NULL := 'Hello';
BEGIN
  status := '';
END;
/

--Concatenation Operator

DECLARE
  x VARCHAR2(4) := 'suit';
  y VARCHAR2(4) := 'case';
BEGIN
  DBMS_OUTPUT.PUT_LINE (x || y);
END;
/
