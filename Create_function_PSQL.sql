CREATE FUNCTION public.add_numbers2(a integer, b integer)
RETURNS integer AS $$
BEGIN
    RETURN a + b;
END; $$
LANGUAGE plpgsql;

select add_numbers(3,4)

--select * from information_schema.routines WHERE routine_type = 'FUNCTION' AND routine_schema = 'public'; 