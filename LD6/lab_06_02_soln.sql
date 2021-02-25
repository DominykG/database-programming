ALTER SESSION SET nls_date_format = 'YYYY.MM.DD';

SET SERVEROUTPUT ON;

DECLARE
    CURSOR dept_cursor IS
    SELECT
        department_id,
        department_name
    FROM
        departments
    WHERE
        department_id < 100
    ORDER BY
        department_id;

    CURSOR emp_cursor (
        deptno NUMBER
    ) IS
    SELECT
        last_name,
        job_id,
        hire_date,
        salary
    FROM
        employees
    WHERE
            employee_id < 120
        AND department_id = deptno;

    v_deptno        departments.department_id%TYPE;
    v_deptname      departments.department_name%TYPE;
    v_emp_lastname  employees.last_name%TYPE;
    v_emp_job_id    employees.job_id%TYPE;
    v_emp_hiredate  employees.hire_date%TYPE;
    v_emp_salary    employees.salary%TYPE;
BEGIN
    OPEN dept_cursor;
    LOOP
        FETCH dept_cursor INTO
            v_deptno,
            v_deptname;
        EXIT WHEN dept_cursor%notfound;
        dbms_output.put_line('Department number '
                             || v_deptno
                             || ' Department name '
                             || v_deptname);
        OPEN emp_cursor(v_deptno);
        LOOP
            FETCH emp_cursor INTO
                v_emp_lastname,
                v_emp_job_id,
                v_emp_hiredate,
                v_emp_salary;
            EXIT WHEN emp_cursor%notfound;
            dbms_output.put_line(v_emp_lastname
                                 || ' '
                                 || v_emp_job_id
                                 || ' '
                                 || v_emp_hiredate
                                 || ' '
                                 || v_emp_salary);

        END LOOP;

        CLOSE emp_cursor;
        dbms_output.put_line('----------------------------------------------------------');
    END LOOP;

    CLOSE dept_cursor;
END;
/