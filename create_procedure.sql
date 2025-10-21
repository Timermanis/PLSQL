CREATE PROCEDURE  public.insert_data(a integer, b integer)
LANGUAGE SQL
AS $$
INSERT INTO test VALUES (a);
INSERT INTO test VALUES (b);
$$;

select * from information_schema.routines WHERE routine_type = 'PROCEDURE' AND routine_schema = 'public'; 

CALL insert_data('1', '2');