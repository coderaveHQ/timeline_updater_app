CREATE FUNCTION public.app_create_update (
    in_customer_mandant_id public.customer_mandant_updates.customer_mandant_id %TYPE,
    in_timed_at public.customer_mandant_updates.timed_at %TYPE,
    in_title public.customer_mandant_updates.title %TYPE,
    in_release_notes public.customer_mandant_updates.release_notes %TYPE,
    in_files JSONB[]
)
RETURNS UUID
LANGUAGE plpgsql  -- Use plpgsql for procedural SQL functions
AS $$
DECLARE
    customer_mandant_update_id UUID;
    file_record JSONB;
    file_type public.update_file_type;
    file_path TEXT;
BEGIN
    -- Insert into customer_mandant_updates and capture the generated ID
    INSERT INTO public.customer_mandant_updates (
        customer_mandant_id,
        timed_at,
        title,
        release_notes
    )
    VALUES (
        in_customer_mandant_id,
        in_timed_at,
        in_title,
        in_release_notes
    )
    RETURNING id INTO customer_mandant_update_id;

    -- Loop through each file in the JSONB array
    FOREACH file_record IN ARRAY in_files LOOP
        file_type := (file_record->>'type')::public.update_file_type;
        file_path := file_record->>'path';

        -- Insert into customer_mandant_update_files
        INSERT INTO public.customer_mandant_update_files (
            customer_mandant_update_id,
            type,
            file_path
        )
        VALUES (
            customer_mandant_update_id,
            file_type,
            file_path
        );
    END LOOP;

    -- Return the generated ID
    RETURN customer_mandant_update_id;
END;
$$;
