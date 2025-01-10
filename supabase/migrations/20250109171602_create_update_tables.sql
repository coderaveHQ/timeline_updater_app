-- [ENUM] for the status of an update
CREATE TYPE public.update_status AS ENUM (
    'upcoming',
    'ongoing',
    'success',
    'warning',
    'error'
);

-- [BUCKET] for storing customer files
INSERT INTO storage.buckets (
    id, 
    name,
    public
)
VALUES
(
    'customer-files',
    'customer-files',
    false
);

-- [ENUM] for the update file type
CREATE TYPE public.update_file_type AS ENUM (
    'customization',
    'dynamic_assembly',
    'sql',
    'server',
    'client'
);

-- [TABLE] for the updates of a customer mandant
CREATE TABLE public.customer_mandant_updates (
    id UUID NOT NULL DEFAULT gen_random_UUID(),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    customer_mandant_id UUID NOT NULL,
    timed_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    status public.update_status NOT NULL DEFAULT 'upcoming'::public.update_status,
    title TEXT NOT NULL,
    release_notes TEXT NOT NULL,
    logs JSONB NOT NULL,
    CONSTRAINT customer_mandant_updates_pkey PRIMARY KEY (id),
    CONSTRAINT customer_mandant_updates_customer_mandant_id_fkey FOREIGN KEY (customer_mandant_id) REFERENCES public.customer_mandants (id) ON UPDATE CASCADE ON DELETE CASCADE
) TABLESPACE pg_default;

-- [COMMENT] on customer_mandant_updates
COMMENT ON TABLE public.customer_mandant_updates IS 'The updates of a customers mandant.';

-- [TABLE] for the files of a customer mandant update
CREATE TABLE public.customer_mandant_update_files (
    id UUID NOT NULL DEFAULT gen_random_UUID(),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    customer_mandant_update_id UUID NOT NULL,
    type public.update_file_type NOT NULL,
    file_path TEXT NOT NULL,
    CONSTRAINT customer_mandant_update_files_pkey PRIMARY KEY (id),
    CONSTRAINT customer_mandant_update_files_customer_mandant_update_id_fkey FOREIGN KEY (customer_mandant_update_id) REFERENCES public.customer_mandant_updates (id) ON UPDATE CASCADE ON DELETE CASCADE
) TABLESPACE pg_default;

-- [COMMENT] on customer_mandant_update_files
COMMENT ON TABLE public.customer_mandant_update_files IS 'The files of a customer mandant update.';