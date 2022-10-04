SET SERVEROUTPUT ON;

DECLARE
	TYPE book IS RECORD( 
		title VARCHAR2(30), 
		author varchar(30)
	);
	
	v_b1 book;
	v_b2 book;
   
BEGIN
	v_b1.title  := 'Clean Code'; 
	v_b1.author := 'Robert Cecil';
	DBMS_OUTPUT.PUT_LINE(v_b1.title||' '||v_b1.author);
	
	v_b2.title  := 'Refactoring'; 
	v_b2.author := 'Kent Beck';
	DBMS_OUTPUT.PUT_LINE(v_b2.title||' '||v_b2.author);
END;
/

--From table

DECLARE
   TYPE rv_emp IS RECORD (name VARCHAR2(20), salary emp.salary%TYPE);
   v_emp rv_emp;
   
BEGIN
	SELECT name, salary INTO v_emp.name, v_emp.salary FROM emp WHERE id = 1;
	DBMS_OUTPUT.PUT_LINE(v_emp.name||' '||v_emp.salary);
END;
/

--RECORD Type with Varray Field

DECLARE
	TYPE full_name IS VARRAY(2) OF VARCHAR2(20);
 
	TYPE detail IS RECORD (
		name full_name := full_name('John', 'Smith'),
		phone VARCHAR2(20)
	);
 
	v_detail detail;
	
BEGIN
	v_detail.phone := '16505551234';
  
	DBMS_OUTPUT.PUT_LINE (v_detail.name(1) ||' '|| v_detail.name(2) || ', ' || v_detail.phone);
END;
/