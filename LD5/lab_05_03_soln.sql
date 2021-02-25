SET SERVEROUTPUT ON;
--=IF(OR(MOD(A1,400)=0,AND(MOD(A1,4)=0,MOD(A1,100)<>0)),"Leap Year", "NOT a Leap Year")  
CREATE OR REPLACE FUNCTION isleapyear (
    yeartocheck IN NUMBER
) RETURN VARCHAR2 IS
    answer VARCHAR2(20) := 'LEAP YEAR';
BEGIN
    IF MOD(yeartocheck, 400) = 0 OR MOD(yeartocheck, 4) = 0
    AND MOD(yeartocheck, 100) != 0 THEN
        RETURN yeartocheck
               || ' '
               || answer;
    ELSE
        RETURN yeartocheck
               || ' NOT A '
               || answer;
    END IF;
END;
/

BEGIN
    dbms_output.put_line(isleapyear(1900));
    dbms_output.put_line(isleapyear(2000));
    dbms_output.put_line(isleapyear(1996));
    dbms_output.put_line(isleapyear(1886));
    dbms_output.put_line(isleapyear(1992));
END;
/