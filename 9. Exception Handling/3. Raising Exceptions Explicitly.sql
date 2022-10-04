SET SERVEROUTPUT ON;

--RAISE_APPLICATION_ERROR

DECLARE
	A NUMBER := 20;
	B NUMBER := 0;
	res NUMBER;
	
BEGIN		
	IF B = 0 THEN
		RAISE_APPLICATION_ERROR(-20008, 'DIVISOR IS ZERO');
	END IF;
	
	res := A/B;
	DBMS_OUTPUT.PUT_LINE(res);

EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/


--Exception propagation

DECLARE
	A NUMBER := 20;
	B NUMBER := 0;
	res NUMBER;
	
	e1 EXCEPTION;
    PRAGMA exception_init (e1, -20007);
	
BEGIN		
	IF B = 0 THEN
		RAISE_APPLICATION_ERROR(-20007, 'DIVISOR IS ZERO');
	END IF;
	
	res := A/B;
	DBMS_OUTPUT.PUT_LINE(res);

EXCEPTION
  WHEN e1 THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/


--Explicitly Raising Predefined Exception

DECLARE
	A NUMBER := -1;
	val number;
	
BEGIN	
	IF A < 0 THEN
		RAISE INVALID_NUMBER;
	END IF;

EXCEPTION
  WHEN INVALID_NUMBER THEN
	DBMS_OUTPUT.PUT_LINE('Substituting default value for invalid number.');
END;
/


--Reraising Exception

DECLARE
  salary_too_high   EXCEPTION;
  current_salary    NUMBER := 20000;
  max_salary        NUMBER := 10000;
  erroneous_salary  NUMBER;
BEGIN
	BEGIN
      IF current_salary > max_salary THEN
        RAISE salary_too_high;
      END IF;
    EXCEPTION
      WHEN salary_too_high THEN
        erroneous_salary := current_salary;
        DBMS_OUTPUT.PUT_LINE('Salary ' || erroneous_salary ||' is out of range.');
        DBMS_OUTPUT.PUT_LINE ('Maximum salary is ' || max_salary || '.');
        RAISE;  -- reraise current exception
    END;

EXCEPTION
  WHEN salary_too_high THEN
    current_salary := max_salary;
    DBMS_OUTPUT.PUT_LINE ('Revising salary from ' || erroneous_salary ||' to ' || current_salary || '.');
END;
/