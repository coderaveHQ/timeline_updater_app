-- [BUCKET] for storing standard files
INSERT INTO storage.buckets (
    id, 
    name, 
    public
)
VALUES
(
    'standards',
    'standards',
    false
);

-- [TABLE] for the standards
CREATE TABLE public.standards (
    id UUID NOT NULL DEFAULT gen_random_UUID(),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    file_path TEXT NOT NULL,
    type public.standard_type NOT NULL,
    evolution public.standard_evolution NOT NULL,
    version public.standard_version NOT NULL,
    flavor public.standard_flavor,
    patch DATE NOT NULL,
    CONSTRAINT standards_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

-- [COMMENT] on standards
COMMENT ON TABLE public.standards IS 'The uploaded standard files.';

-- [TRIGGER] to update the updated_at timestamp
CREATE TRIGGER update_standards_updated_at_trigger
AFTER UPDATE ON public.standards
FOR EACH ROW
EXECUTE FUNCTION update_updated_at();