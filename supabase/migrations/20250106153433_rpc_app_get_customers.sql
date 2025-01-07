CREATE FUNCTION public.app_get_customers (
    in_offset INTEGER
)
RETURNS TABLE (
    id public.customers.id % TYPE,
    created_at public.customers.created_at % TYPE,
    updated_at public.customers.updated_at % TYPE,
    name public.customers.name % TYPE,
    evolution public.customers.evolution % TYPE,
    version public.customers.version % TYPE,
    flavor public.customers.flavor % TYPE
)
LANGUAGE SQL
AS $$
    SELECT
        c.id,
        c.created_at,
        c.updated_at,
        c.name,
        c.evolution,
        c.version,
        c.flavor
    FROM
        public.customers c
    ORDER BY
        c.name DESC
    LIMIT 20
    OFFSET in_offset
    ;
$$;