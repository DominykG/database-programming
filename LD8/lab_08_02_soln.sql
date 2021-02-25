SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE greet (
    p_name VARCHAR2
) AS
    v_today     DATE := sysdate;
    v_tomorrow  v_today%TYPE;
BEGIN
    v_tomorrow := v_today + 1;
    dbms_output.put_line('Hello ' || p_name);
    dbms_output.put_line('TODAY IS: ' || v_today);
    dbms_output.put_line('TOMORROW IS: ' || v_tomorrow);
END greet;