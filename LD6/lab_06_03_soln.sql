-- lab_06_01.sql
DROP TABLE top_salaries;
/

CREATE TABLE top_salaries (
    salary NUMBER(8, 2)
);
/

DECLARE
    v_num  NUMBER := 5;
    sal    employees.salary%TYPE;
    CURSOR c_emp_cursor IS
    SELECT
        salary
    FROM
        employees
    ORDER BY
        salary DESC;

BEGIN
    OPEN c_emp_cursor;
    LOOP
        FETCH c_emp_cursor INTO sal;
        EXIT WHEN c_emp_cursor%notfound OR c_emp_cursor%rowcount > v_num;
        INSERT INTO top_salaries ( salary ) VALUES ( sal );

    END LOOP;

    CLOSE c_emp_cursor;
END;
/

SELECT
    *
FROM
    top_salaries;