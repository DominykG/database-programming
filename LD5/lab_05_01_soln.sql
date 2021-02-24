-- lab_05_01.sql 
DROP TABLE messages;
CREATE TABLE messages (results VARCHAR2(80));

begin
    for i in 1 .. 10 loop
        continue when i = 6 OR i = 8;
        insert into messages (results) values (i);
    end loop;
    
    commit;
end;
/
select * from messages;