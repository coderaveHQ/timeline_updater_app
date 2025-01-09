CREATE FUNCTION public.app_upload_standard (
    in_file_path public.standards.file_path % TYPE,
    in_type public.standards.type % TYPE,
    in_evolution public.standards.evolution % TYPE,
    in_version public.standards.version % TYPE,
    in_patch public.standards.patch % TYPE,
    in_flavor public.standards.flavor % TYPE DEFAULT NULL
)
RETURNS VOID
LANGUAGE SQL
AS $$
    INSERT INTO public.standards (
        file_path,
        type,
        evolution,
        version,
        flavor,
        patch
    )
    VALUES (
        in_file_path,
        in_type,
        in_evolution,
        in_version,
        in_flavor,
        in_patch
    )
    ;
$$;