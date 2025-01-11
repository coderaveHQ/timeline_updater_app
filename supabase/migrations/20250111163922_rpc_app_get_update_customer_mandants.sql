CREATE FUNCTION public.app_get_update_customer_mandants (
    in_offset INTEGER
)
RETURNS TABLE (
    customer_id public.customers.id % TYPE,
    customer_name public.customers.name % TYPE,
    customer_mandant_id public.customer_mandants.id % TYPE,
    customer_mandant_name public.customer_mandants.name % TYPE
)
LANGUAGE SQL
AS $$
    SELECT
        c.id,
        c.name,
        cm.id,
        cm.name
    FROM
        public.customer_mandants cm
    INNER JOIN public.customers c ON
        c.id = cm.customer_id
    ORDER BY
        c.name DESC,
        cm.name DESC
    LIMIT 20
    OFFSET in_offset
    ;
$$;

CREATE POLICY "storage_objects_insert" ON "storage"."objects" FOR
INSERT TO authenticated WITH CHECK (
    bucket_id IN ('standards', 'customer-files')
);