--select * from test_table;

CREATE PROCEDURE  public.insert_data(a integer, b integer)
LANGUAGE SQL
AS $$
INSERT INTO test_table VALUES (a);
INSERT INTO test_table VALUES (b);
$$;

CALL insert_data('1', '2');