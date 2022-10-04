SET SERVEROUTPUT ON;

--ANONYMOUS BLOCK

BEGIN
	DBMS_OUTPUT.PUT_LINE('Hello World!');
END;
/


--NULL BLOCK

BEGIN
	NULL;
END;
/



DROP TABLE emp;
CREATE TABLE emp(id number, name varchar2(20), salary number);

INSERT INTO emp VALUES(1,'A',100);
INSERT INTO emp VALUES(2,'B',110);
INSERT INTO emp VALUES(3,'C',120);
COMMIT;

SELECT * FROM emp;


BEGIN
	INSERT INTO emp VALUES(4,'D',130);
END;
/

COMMIT;