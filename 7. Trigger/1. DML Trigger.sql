SET SERVEROUTPUT ON;

--{BEFORE | AFTER}

CREATE OR REPLACE TRIGGER ai_emp 
AFTER INSERT ON emp

BEGIN
	DBMS_OUTPUT.PUT_LINE('Inserted After');
END;
/

INSERT INTO emp VALUES(6,'F',160);


--BEFORE INSERT

CREATE OR REPLACE TRIGGER bi_emp
BEFORE INSERT ON emp

BEGIN
	DBMS_OUTPUT.PUT_LINE('Inserted Before');
END;
/

INSERT INTO emp VALUES(7,'G',170);


--AFTER INSERT OR DELETE Trigger

CREATE OR REPLACE TRIGGER trig3 
AFTER INSERT OR DELETE 
ON emp

BEGIN
	DBMS_OUTPUT.PUT_LINE('Inserted or Deleted');
END;
/

DELETE FROM emp WHERE id=1;
DELETE FROM emp WHERE id=2;
INSERT INTO emp VALUES(8,'H',180);


--AFTER UPDATE Trigger

CREATE OR REPLACE TRIGGER trig4 
AFTER UPDATE
ON emp

BEGIN
	DBMS_OUTPUT.PUT_LINE('EMP UPDATED');
END;
/

UPDATE emp SET salary = 140 where id = 5;
UPDATE emp SET name = 'ux' where id = 4;


--SPECIFIC ATTRIBUTE TRIGGER

CREATE OR REPLACE TRIGGER trig5 
AFTER UPDATE
OF salary ON emp

BEGIN
	DBMS_OUTPUT.PUT_LINE('SALARY UPDATED');
END;
/

UPDATE emp SET salary = 50 where id=1;


--ROW LEVEL TRIGGER

CREATE OR REPLACE TRIGGER trig2
AFTER UPDATE 
OF salary ON emp
FOR EACH ROW

BEGIN
	DBMS_OUTPUT.PUT_LINE('FOR EACH ROW TRIGGER');
END;
/

UPDATE emp SET salary = 100;
UPDATE emp SET salary = 100 WHERE ID = 10;


SELECT * FROM emp;