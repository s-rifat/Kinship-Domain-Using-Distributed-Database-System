SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE sister AS
	PROCEDURE FindSister(S IN VARCHAR2);
END sister;
/

CREATE OR REPLACE PACKAGE BODY sister AS
	PROCEDURE FindSister(S IN VARCHAR2)
	IS
	A Parent1.parentName%Type;
	B Parent1.parentName%Type;
	C Parent1.parentName%Type;
	D Parent1.parentName%Type;
	E Parent1.parentName%Type;
	bl Number;
	BEGIN
    bl := 1;
	FOR R IN (SELECT parentName, childName FROM Parent1 NATURAL JOIN Parent2@site1) LOOP
		A := R.parentName;
		B := R.childName;
		if B = S Then
			FOR R2 IN (SELECT parentName, childName FROM Parent1 NATURAL JOIN Parent2@site1) LOOP
				C := R2.parentName;
				D := R2.childName;
				if A = C and B <> D Then
					FOR R3 IN (select name from Female1 union select * from Female2@site1) LOOP
						E := R3.name;
						if E = D THEN
							DBMS_OUTPUT.PUT_LINE(E);
							bl := 0;
						end if;
					end loop;
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
	END FindSister;
END sister;
/
