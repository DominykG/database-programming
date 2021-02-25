SET SERVEROUTPUT ON;

DECLARE
    v_max_deptno  NUMBER;
    v_dept_name   departments.department_name%TYPE := 'Education';
    v_dept_id     NUMBER;
BEGIN
    SELECT
        MAX(department_id)
    INTO v_max_deptno
    FROM
        departments;

    dbms_output.put_line('The maximum department_id is: ' || v_max_deptno);
    v_dept_id := v_max_deptno + 10;
    INSERT INTO departments (
        department_name,
        department_id,
        location_id
    ) VALUES (
        v_dept_name,
        v_dept_id,
        NULL
    );

    dbms_output.put_line('sql%rowcount gives ' || SQL%rowcount);
END;
/

BEGIN
    UPDATE departments
    SET
        location_id = 3000
    WHERE
        department_name = 'Education';

END;
/

SELECT
    *
FROM
    departments
WHERE
    department_name = 'Education';

DELETE FROM departments
WHERE
    department_name = 'Education';