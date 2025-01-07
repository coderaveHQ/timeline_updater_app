CREATE FUNCTION public.app_get_customer_profiles (
    in_customer_id TEXT,
    in_offset INTEGER
)
RETURNS TABLE (
    id public.profiles.id % TYPE,
    created_at public.profiles.created_at % TYPE,
    updated_at public.profiles.updated_at % TYPE,
    name public.profiles.name % TYPE
)
LANGUAGE SQL
AS $$
    SELECT
        p.id,
        p.created_at,
        p.updated_at,
        p.name
    FROM
        public.customer_profiles cp
    LEFT JOIN public.profiles p ON
        cp.profile_id = p.id
    WHERE
        cp.customer_id = in_customer_id::UUID
    ORDER BY
        p.name DESC
    LIMIT 20
    OFFSET in_offset
    ;
$$;