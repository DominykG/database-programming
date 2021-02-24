set serveroutput on;
declare
    v_max_deptno number;
begin
    select max(department_id) into v_max_deptno from departments;
    dbms_output.put_line(v_max_deptno);
end;