SET SERVEROUTPUT ON;

DECLARE
    v_ename    employees.last_name%TYPE;
    v_emp_sal  employees.salary%TYPE := 6000;
BEGIN
    SELECT
        last_name
    INTO v_ename
    FROM
        employees
    WHERE
        salary = v_emp_sal;

EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line(' Your select statement retrieved no data.');
        INSERT INTO messages ( results ) VALUES ( 'No employee with a salary of ' || v_emp_sal );

    WHEN too_many_rows THEN
        dbms_output.put_line(' Your select statement retrieved multiple rows. Consider using a cursor.');
        INSERT INTO messages ( results ) VALUES ( 'More than one employee with a salary of ' || v_emp_sal );

    WHEN OTHERS THEN
        dbms_output.put_line('Some other error occurred.');
        INSERT INTO messagess ( results ) VALUES ( 'Some other error occurred.' );

END;
/

SELECT
    *
FROM
    messages;