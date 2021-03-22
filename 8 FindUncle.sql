SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE uncle AS
	PROCEDURE FindUncle(S IN VARCHAR2);
END uncle;
/

CREATE OR REPLACE PACKAGE BODY uncle AS
	PROCEDURE FindUncle(S IN VARCHAR2)
	IS
	A Parent1.parentName%Type;
	B Parent1.parentName%Type;
	C Parent1.parentName%Type;
	D Parent1.parentName%Type;
	E Parent1.parentName%Type;
	F Parent1.parentName%Type;
	G Parent1.parentName%Type;
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
				if A = D Then
					FOR R3 IN (SELECT parentName, childName FROM Parent1 NATURAL JOIN Parent2@site1) LOOP
						E := R3.parentName;
						F := R3.childName;
						if C = E and A <> F Then
							FOR R4 IN (select name from Male1 union select * from Male2@site1) LOOP
								G := R4.name;
								if G = F then
									DBMS_OUTPUT.PUT_LINE(G);
									bl := 0;
								end if;
							end loop;
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
	END FindUncle;
END uncle;
/
