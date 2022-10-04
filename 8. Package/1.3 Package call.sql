--Call functions/procedures in package

SELECT mypack.F1(20) FROM DUAL;
EXEC mypack.P1(21);

DECLARE
	D number;
BEGIN
	D := mypack.F1(21);
	DBMS_OUTPUT.PUT_LINE(D);
	mypack.P1(20);
END;
/