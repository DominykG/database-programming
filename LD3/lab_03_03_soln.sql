SET SERVEROUTPUT ON;

--VARIABLE b_basic_percent NUMBER
--VARIABLE b_pf_percent NUMBER

VARIABLE v_basic_percent NUMBER;

DECLARE
    --v_today DATE := SYSDATE;
    --v_tomorrow v_today%TYPE;
    v_basic_percent  NUMBER := 45;
    v_pf_percent     NUMBER := 12;
    v_fname          VARCHAR2(15);
    v_emp_sal        NUMBER(10);
BEGIN 
    --v_tomorrow := v_today+1;

    /*:b_basic_percent := 45;
    :b_pf_percent := 12;*/

    SELECT
        first_name,
        salary
    INTO
        v_fname,
        v_emp_sal
    FROM
        employees
    WHERE
        employee_id = 110;

    dbms_output.put_line('Hello ' || v_fname);
    --dbms_output.put_line('TODAY IS: ' || v_today);
    --dbms_output.put_line('TOMORROW IS: ' || v_tomorrow);
    dbms_output.put_line('Your salary is ' || v_emp_sal);
    dbms_output.put_line('Your contribution towards PF '
                         || v_emp_sal / 100 * v_basic_percent / 100 * v_pf_percent);
END;
/
--PRINT b_basic_percent
--PRINT b_pf_percent