CREATE FUNCTION public.app_get_updates (
    in_offset INTEGER
)
RETURNS TABLE (
    id public.customer_mandant_updates.id % TYPE,
    created_at public.customer_mandant_updates.created_at % TYPE,
    updated_at public.customer_mandant_updates.updated_at % TYPE,
    customer_name public.customers.name % TYPE,
    mandant_name public.customer_mandants.name % TYPE,
    timed_at public.customer_mandant_updates.timed_at % TYPE,
    status public.customer_mandant_updates.status % TYPE,
    title public.customer_mandant_updates.title % TYPE
)
LANGUAGE SQL
AS $$
    SELECT
        cmu.id,
        cmu.created_at,
        cmu.updated_at,
        c.name,
        cm.name,
        cmu.timed_at,
        cmu.status,
        cmu.title
    FROM
        public.customer_mandant_updates cmu
    INNER JOIN public.customer_mandants cm ON
        cm.id = cmu.customer_mandant_id
    INNER JOIN public.customers c ON
        c.id = cm.customer_id
    ORDER BY
        cmu.timed_at DESC
    LIMIT 20
    OFFSET in_offset
    ;
$$;