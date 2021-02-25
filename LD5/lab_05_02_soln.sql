--lab_05_02.sql
DROP TABLE emp;

CREATE TABLE emp
    AS
        SELECT
            *
        FROM
            employees;

ALTER TABLE emp ADD stars VARCHAR2(50);

DECLARE
    v_empno     emp.employee_id%TYPE := 176;
    v_asterisk  emp.stars%TYPE := NULL;
    sal         emp.salary%TYPE;
BEGIN
    SELECT
        salary
    INTO sal
    FROM
        emp
    WHERE
        employee_id = v_empno;

    FOR thousand IN 1..round(sal / 1000) LOOP
        v_asterisk := v_asterisk || '*';
    END LOOP;

    UPDATE emp
    SET
        stars = v_asterisk
    WHERE
        employee_id = v_empno;

    COMMIT;
END;
/

SELECT
    employee_id,
    salary,
    stars
FROM
    emp
WHERE
    employee_id = 176;