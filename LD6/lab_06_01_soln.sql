SET SERVEROUTPUT ON;

DECLARE
    v_deptno NUMBER := 50;
    CURSOR c_emp_cursor IS
    SELECT
        last_name,
        salary,
        manager_id
    FROM
        employees
    WHERE
        department_id = v_deptno;

BEGIN
    FOR v_emp IN c_emp_cursor LOOP
        IF
            v_emp.salary < 5000
            AND v_emp.manager_id IN ( 101, 124 )
        THEN
            dbms_output.put_line(v_emp.last_name || ' Due for a raise');
        ELSE
            dbms_output.put_line(v_emp.last_name || ' Not due for a raise');
        END IF;
    END LOOP;
END;
/