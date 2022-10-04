SET SERVEROUTPUT ON;

--INSTEAD OF trigger
--Defined only on a view 

DROP TABLE emp_id;
DROP TABLE emp_name;	
CREATE TABLE emp_id(id number);
CREATE TABLE emp_name(name varchar2(20));
INSERT INTO emp_id values(1);
INSERT INTO emp_name values('A');

CREATE VIEW emp_info AS
SELECT id, name FROM emp_id, emp_name;

SELECT * FROM emp_info;

-----------------------------------

DROP TRIGGER io_insert;

CREATE OR REPLACE TRIGGER io_insert 
INSTEAD OF INSERT ON emp_info
FOR EACH ROW

BEGIN
	INSERT INTO emp_id(id) VALUES (:NEW.id);
	INSERT INTO emp_name(name) VALUES (:NEW.name);
END;
/

INSERT INTO emp_info VALUES(2, 'B');
SELECT * FROM emp_info;
