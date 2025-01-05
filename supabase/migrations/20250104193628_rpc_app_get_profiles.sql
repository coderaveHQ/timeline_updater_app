CREATE FUNCTION public.app_get_profiles (
    in_offset INTEGER
)
RETURNS TABLE (
    id public.profiles.id % TYPE,
    created_at public.profiles.created_at % TYPE,
    updated_at public.profiles.updated_at % TYPE,
    name public.profiles.name % TYPE,
    type public.profiles.type % TYPE
)
LANGUAGE SQL
AS $$
    SELECT
        p.id,
        p.created_at,
        p.updated_at,
        p.name,
        p.type
    FROM
        public.profiles p
    ORDER BY
        p.name DESC
    LIMIT 20
    OFFSET in_offset
    ;
$$;