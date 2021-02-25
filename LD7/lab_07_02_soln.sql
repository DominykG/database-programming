SET SERVEROUTPUT ON;

DECLARE
    e_childrecord_exists EXCEPTION;
    PRAGMA exception_init ( e_childrecord_exists, -02292 );
BEGIN
    dbms_output.put_line('Deleting department 40….');
    DELETE FROM departments
    WHERE
        department_id = 40;

EXCEPTION
    WHEN e_childrecord_exists THEN
        dbms_output.put_line('Cannot delete this department. There are employees in this department (child records exist).');
END;
/