set serveroutput on;
--=IF(OR(MOD(A1,400)=0,AND(MOD(A1,4)=0,MOD(A1,100)<>0)),"Leap Year", "NOT a Leap Year")  
create or replace function isLeapYear(yearToCheck in number)
return varchar2 
is 
    answer varchar2(20) := 'LEAP YEAR';
begin
    if mod(yearToCheck, 400) = 0 
    or
    mod(yearToCheck, 4) = 0
    and 
    mod(yearToCheck, 100) != 0
    then
        return yearToCheck || ' ' || answer;
    else        
        return yearToCheck || ' NOT A ' || answer;
    end if;    
end;
/
begin
    dbms_output.put_line(isLeapYear(1900));
    dbms_output.put_line(isLeapYear(2000));
    dbms_output.put_line(isLeapYear(1996));
    dbms_output.put_line(isLeapYear(1886));
    dbms_output.put_line(isLeapYear(1992));
end;
/