--lab_05_02.sql
DROP TABLE emp;
CREATE TABLE emp AS SELECT * FROM employees;
ALTER TABLE emp ADD stars VARCHAR2(50);

declare
    v_empno emp.employee_id%type := 176;
    v_asterisk emp.stars%type := null;
    sal emp.salary%type;
begin 
    select salary into sal from emp where employee_id = v_empno;

    for thousand in 1..round(sal/1000) loop 
        v_asterisk := v_asterisk || '*';
    end loop;
    
    update emp set stars = v_asterisk where employee_id = v_empno;
    
    commit;
    
end;
/
select employee_id, salary, stars from emp where employee_id = 176;