CREATE FUNCTION public.app_get_standards (
    in_offset INTEGER
)
RETURNS TABLE (
    id public.standards.id % TYPE,
    created_at public.standards.created_at % TYPE,
    updated_at public.standards.updated_at % TYPE,
    file_path public.standards.file_path % TYPE,
    type public.standards.type % TYPE,
    evolution public.standards.evolution % TYPE,
    version public.standards.version % TYPE,
    flavor public.standards.flavor % TYPE,
    patch public.standards.patch % TYPE
)
LANGUAGE SQL
AS $$
    SELECT
        s.id,
        s.created_at,
        s.updated_at,
        s.file_path,
        s.type,
        s.evolution,
        s.version,
        s.flavor,
        s.patch
    FROM
        public.standards s
    ORDER BY
        s.evolution DESC,
        s.version DESC,
        s.patch DESC,
        s.type DESC,
        s.flavor
    LIMIT 20
    OFFSET in_offset
    ;
$$;