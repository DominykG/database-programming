set serveroutput on;

declare
    v_max_deptno number;
    v_dept_name departments.department_name%type := 'Education';
    v_dept_id number;
begin
    select max(department_id) into v_max_deptno from departments;
    dbms_output.put_line('The maximum department_id is: ' || v_max_deptno);
        
    v_dept_id := v_max_deptno + 10;
    
    insert into departments (department_name, department_id, location_id)
    values(v_dept_name, v_dept_id, null);
        
    dbms_output.put_line('sql%rowcount gives ' || sql%rowcount);
           
end;
/
select * from departments where department_name = 'Education'; 
