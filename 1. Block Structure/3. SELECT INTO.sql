SET SERVEROUTPUT ON;

--SELECT INTO statement

DECLARE
	v_name varchar2(20);
BEGIN
	SELECT name INTO v_name FROM emp WHERE id = 1;
	DBMS_OUTPUT.PUT_LINE(t_name);
END;
/


DECLARE
	t_name varchar2(20);
	t_salary number;
BEGIN
	SELECT name, salary INTO t_name, t_salary FROM emp WHERE id=1;
	DBMS_OUTPUT.PUT_LINE(t_name);
	DBMS_OUTPUT.PUT_LINE(t_salary);
END;
/


--ANCHOR Datatype

DECLARE
	t_name emp.name%TYPE;
	t_salary emp.salary%TYPE;
BEGIN
	SELECT name, salary INTO t_name, t_salary FROM emp WHERE id=3;
	DBMS_OUTPUT.PUT_LINE(t_name ||' '||t_salary);
END;
/