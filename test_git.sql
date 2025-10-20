create or replace function test
return varchar2
is
a varchar2(100);

begin
a:='Janis cope from git';
dbms_output.put_line (a);
return a;
end;
