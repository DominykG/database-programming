set serveroutput on;
VARIABLE b_basic_percent NUMBER
VARIABLE b_pf_percent NUMBER

DECLARE
    v_today DATE := SYSDATE;
    v_tomorrow v_today%TYPE;
BEGIN 
    v_tomorrow := v_today+1;
    dbms_output.put_line('Hello World.');
    dbms_output.put_line('TODAY IS: ' || v_today);
    dbms_output.put_line('TOMORROW IS: ' || v_tomorrow);

    :b_basic_percent := 45;
    :b_pf_percent := 12;
END;
/
PRINT b_basic_percent
PRINT b_pf_percent