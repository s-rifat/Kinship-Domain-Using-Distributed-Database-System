clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE FUNCTION IsInKB(S IN VARCHAR2)
RETURN NUMBER
IS
    bl number;
	A Parent1.parentName%Type;
	B Parent1.parentName%Type;
BEGIN 
	bl := 1;
	FOR R IN (SELECT parentName, childName FROM Parent1 NATURAL JOIN Parent2@site1) LOOP
	    A := R.parentName;
		B := R.childName;
		if A = S or B = S then
			bl :=0;
		end if;
	end loop;
	RETURN bl;
END IsInKB;
/

BEGIN 
    DBMS_OUTPUT.PUT_LINE('1 = GrandParent, 2 = Grandchildren, 3 = Brother, 4 = Sister, 5 = Uncle, 6 = Aunt');
END;
/

ACCEPT Y CHAR PROMPT   "Enter Name = "
ACCEPT X NUMBER PROMPT "Choose option = "
DECLARE
    N number;
	S Parent1.parentName%Type;
	RIFAT EXCEPTION;
BEGIN 
	S := '&Y';
	N := &X;
	
	if IsInKB(S) = 1 then
		RAISE RIFAT;
	end if;

	if N = 1 THEN
		grandparent.FindGrandParent(S);
    end if;	
	
	if N = 2 THEN
		grandchildren.FindGrandChildren(S);
    end if;	
	
	if N = 3 THEN
		brother.FindBrother(S);
    end if;
	
	if N = 4 THEN
		sister.FindSister(S);
    end if;
	
	if N = 5 THEN
		uncle.FindUncle(S);
    end if;
	
	if N = 6 THEN
		aunt.FindAunt(S);
    end if;
	EXCEPTION
		WHEN RIFAT THEN
		DBMS_OUTPUT.PUT_LINE('Name does not exist in knowledgebase');
END;
/