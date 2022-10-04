drop table Customer CASCADE CONSTRAINTS;
drop table ShiftDetails CASCADE CONSTRAINTS;
drop table Server CASCADE CONSTRAINTS;
drop table Food CASCADE CONSTRAINTS;
drop table Orders CASCADE CONSTRAINTS;

create table Customer(cid int, cname VARCHAR2(50), phone VARCHAR2(15), PRIMARY KEY (cid));
create table ShiftDetails(shiftid int, duration_hours VARCHAR2(50), PRIMARY KEY (shiftid));
create table Server(sid int, sname VARCHAR2(50), shiftid int, PRIMARY KEY (sid), FOREIGN KEY (shiftid) REFERENCES ShiftDetails (shiftid));
create table Food(fid int, fname VARCHAR2(50), price int, PRIMARY KEY (fid));
create table Orders(oid int, sid int, cid int, fid int, datePlaced date, FOREIGN KEY (sid) REFERENCES Server (sid), FOREIGN KEY (cid) REFERENCES Customer (cid), FOREIGN KEY (fid) REFERENCES Food (fid));

insert into Customer(cid, cname, phone) values (1,'Shadhin','0112233');
insert into Customer(cid, cname, phone) values (2,'Shahrin','0112234');
insert into Customer(cid, cname, phone) values (3,'Ramisa','0112235');
insert into Customer(cid, cname, phone) values (4,'Maisha','0112236');
insert into Customer(cid, cname, phone) values (5,'Jim','0112237');

insert into ShiftDetails(shiftid, duration_hours) values (1,5);
insert into ShiftDetails(shiftid, duration_hours) values (2,8);

insert into Server(sid, sname, shiftid) values (1,'mohammad',1);
insert into Server(sid, sname, shiftid) values (2,'ahmed',1);
insert into Server(sid, sname, shiftid) values (3,'abdullah',2);
insert into Server(sid, sname, shiftid) values (4,'masud',2);
insert into Server(sid, sname, shiftid) values (5,'mamun',1);

insert into Food(fid, fname, price) values (1,'tacos',199);
insert into Food(fid, fname, price) values (2,'nachos',159);
insert into Food(fid, fname, price) values (3,'fried rice',299);
insert into Food(fid, fname, price) values (4,'chicken fry',99);
insert into Food(fid, fname, price) values (5,'milkshake',149);

insert into Orders(oid, sid, cid, fid, datePlaced) values (1,2,1,1,'11-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (1,2,1,2,'11-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (1,2,1,3,'11-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (1,2,1,4,'11-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (2,3,3,1,'11-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (2,3,3,2,'11-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (2,3,3,3,'11-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (3,2,2,1,'12-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (3,2,2,2,'12-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (4,2,5,3,'12-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (4,2,4,4,'12-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (5,1,4,1,'13-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (5,1,4,2,'13-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (6,4,1,1,'13-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (6,4,1,2,'13-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (6,4,1,3,'13-Feb-22');
insert into Orders(oid, sid, cid, fid, datePlaced) values (6,4,1,5,'13-Feb-22');
commit;

-------
clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE TRIGGER t1
AFTER UPDATE OR INSERT
ON Customer
FOR EACH ROW

BEGIN
    DBMS_OUTPUT.PUT_LINE('New Customer Added');
END;
/

CREATE OR REPLACE PACKAGE repack AS
    FUNCTION finding(A in Customer.cid%TYPE)
	RETURN number;
	   
	PROCEDURE showDetails(A in Customer.cid%TYPE);
	PROCEDURE InsertCustomer(A in Customer.cid%TYPE, B in Customer.cname%TYPE, C in Customer.phone%TYPE);
	
END repack;
/

CREATE OR REPLACE PACKAGE BODY repack AS

    FUNCTION finding(A in Customer.cid%TYPE)
    RETURN number
    IS
	c number := 0;
	toatal Food.price%TYPE := 0;
    BEGIN	
		select count(distinct oid) into c from Orders where cid = A;	
		if c = 0 then
			return 0;
		else
			DBMS_OUTPUT.PUT_LINE('No. of times customer ate that restaurant : '||c);
			for R in (select distinct datePlaced from Orders where cid = A) loop
				DBMS_OUTPUT.PUT_LINE('The order date : '||R.datePlaced);
			end loop;
			
			for S in (select fid from Orders where cid = A) loop
				for T in (select price from Food where fid = S.fid) loop
					toatal := T.price + toatal;		
				end loop;
			end loop;
			DBMS_OUTPUT.PUT_LINE('Total spent : '||toatal);
			return 1;
		end if;	
    END finding;
	
	PROCEDURE showDetails(A in Customer.cid%TYPE)
    IS 
    BEGIN 
	    for R in (select distinct sid from Orders where cid = A) loop
			for S in (select * from Server where sid = R.sid) loop
				DBMS_OUTPUT.PUT_LINE('Servers Name : '||S.sname ||', ShiftID : '||S.shiftid );
			end loop;  
		end loop;
    END showDetails;
	
    PROCEDURE InsertCustomer(A in Customer.cid%TYPE, B in Customer.cname%TYPE, C in Customer.phone%TYPE)
    IS 
    BEGIN 
        insert into Customer values (A, B, C);
    END InsertCustomer;
    
END repack;
/


Accept X  number prompt "Enter Customer ID = "

DECLARE
    cid int := &x;
    flag number := 0;	
	Error Exception;
	
BEGIN
    IF cid <= 0 THEN 
	    RAISE Error;  
	END IF;
	
	flag := repack.finding(cid);
	
	IF flag = 0 THEN
		repack.InsertCustomer(cid, 'x','0112238');
	ELSE
	    repack.showDetails(cid);
	END IF;
	
EXCEPTION
    WHEN Error THEN
	    DBMS_OUTPUT.PUT_LINE('Customer ID can''t be less than or equal to Zero.');
END;
/