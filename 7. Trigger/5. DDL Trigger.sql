SET SERVEROUTPUT ON;

DROP TABLE schema_audit;
CREATE TABLE schema_audit(
	ddl_date date, 
	ddl_user varchar2(20), 
	object_created varchar2(20), 
	object_name varchar2(20), 
	ddl_operation varchar2(20)
);


CREATE OR REPLACE TRIGGER sys_audit_tr 
AFTER DDL ON SCHEMA

BEGIN
	INSERT INTO schema_audit VALUES(SYSDATE, SYS_CONTEXT('USERENV','CURRENT_USER'), ORA_DICT_OBJ_TYPE, ORA_DICT_OBJ_NAME, ORA_SYSEVENT );
END;
/

--CREATE TABLE dummy(name varchar2(10));
--SELECT * FROM schema_audit;
--TRUNCATE table dummy;
--DROP table dummy;