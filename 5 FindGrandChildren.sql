SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE grandchildren AS
	PROCEDURE FindGrandChildren(S IN VARCHAR2);
END grandchildren;
/

CREATE OR REPLACE PACKAGE BODY grandchildren AS
	PROCEDURE FindGrandChildren(S IN VARCHAR2)
	IS
	A Parent1.parentName%Type;
	B Parent1.parentName%Type;
	C Parent1.parentName%Type;
	D Parent1.parentName%Type;
	bl Number;
	BEGIN
    bl := 1;
	FOR R IN (SELECT parentName, childName FROM Parent1 NATURAL JOIN Parent2@site1) LOOP
		A := R.parentName;
		B := R.childName;
		if A = S Then
			FOR R2 IN (SELECT parentName, childName FROM Parent1 NATURAL JOIN Parent2@site1) LOOP
				C := R2.parentName;
				D := R2.childName;
				if B = C Then
					DBMS_OUTPUT.PUT_LINE(D);
					bl := 0;
				end if;
			end loop;
		end if;		
    END Loop;
	if bl = 1 then
		DBMS_OUTPUT.PUT_LINE('N/A');
	end if;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
	END FindGrandChildren;
END grandchildren;
/
