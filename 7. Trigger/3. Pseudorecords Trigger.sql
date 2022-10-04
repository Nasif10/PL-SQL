SET SERVEROUTPUT ON;

--AUDIT SPECIFIC ATTRIBUTE

CREATE OR REPLACE TRIGGER emp_audit 
BEFORE UPDATE 
OF salary
ON emp
FOR EACH ROW
DECLARE
  sal_diff NUMBER;
BEGIN
	sal_diff := :NEW.salary - :OLD.salary;
	DBMS_OUTPUT.PUT(:NEW.name || ': ');
	DBMS_OUTPUT.PUT('Old salary = ' || :OLD.salary || ' ');
	DBMS_OUTPUT.PUT('New salary = ' || :NEW.salary || ' ');
	DBMS_OUTPUT.PUT_LINE('Difference: ' || sal_diff);
END;
/

UPDATE emp SET salary = 175 WHERE ID = 1;


--log table after any UPDATE statement

DROP TABLE emp_log_old;
DROP TABLE emp_log_new;
CREATE TABLE emp_log_old(id number, name varchar2(20), salary number, log_date DATE);
CREATE TABLE emp_log_new(id number, name varchar2(20), salary number, log_date DATE);

CREATE OR REPLACE TRIGGER emp_audit 
BEFORE UPDATE 
OF salary
ON emp
FOR EACH ROW

BEGIN
	INSERT INTO emp_log_old VALUES(:OLD.id, :OLD.name, :OLD.salary, SYSDATE);
	INSERT INTO emp_log_new VALUES(:NEW.id, :NEW.name, :NEW.salary, SYSDATE);
END;
/

UPDATE emp SET salary = 200 WHERE ID = 1;

SELECT * FROM emp;
SELECT * FROM emp_log_old;
SELECT * FROM emp_log_new;


--AUDIT USER

CREATE OR REPLACE TRIGGER ubi_emp
BEFORE INSERT ON emp

DECLARE
	v_user VARCHAR2(20);
BEGIN
	SELECT user INTO v_user FROM dual;
	DBMS_OUTPUT.PUT_LINE('Inserted by '||v_user);
END;
/

INSERT INTO emp VALUES(6,'F',160);


--AUDIT ACTIVITIES

CREATE OR REPLACE TRIGGER bidu_emp
BEFORE INSERT OR DELETE OR UPDATE 
ON emp

DECLARE
	v_user VARCHAR2(20);
BEGIN
	SELECT user INTO v_user FROM dual;
	
	IF INSERTING THEN
		DBMS_OUTPUT.PUT_LINE('Row Inserted by '||v_user);
	ELSIF DELETING THEN
		DBMS_OUTPUT.PUT_LINE('Row Deleted by '||v_user);	
	ELSIF UPDATING THEN
		DBMS_OUTPUT.PUT_LINE('Row Updated by '||v_user);
	END IF;		
END;
/

INSERT INTO emp VALUES(6,'F',160);
DELETE FROM emp WHERE id = 1;
UPDATE emp SET name = 'X' WHERE id = 4;
