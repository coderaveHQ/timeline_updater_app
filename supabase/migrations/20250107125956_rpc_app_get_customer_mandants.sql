CREATE FUNCTION public.app_get_customer_mandants (
    in_customer_id TEXT,
    in_offset INTEGER
)
RETURNS TABLE (
    id public.customer_mandants.id % TYPE,
    created_at public.customer_mandants.created_at % TYPE,
    updated_at public.customer_mandants.updated_at % TYPE,
    name public.customer_mandants.name % TYPE,
    is_production public.customer_mandants.is_production % TYPE
)
LANGUAGE SQL
AS $$
    SELECT
        cm.id,
        cm.created_at,
        cm.updated_at,
        cm.name,
        cm.is_production
    FROM
        public.customer_mandants cm
    WHERE
        cm.customer_id = in_customer_id::UUID
    ORDER BY
        cm.name DESC
    LIMIT 20
    OFFSET in_offset
    ;
$$;