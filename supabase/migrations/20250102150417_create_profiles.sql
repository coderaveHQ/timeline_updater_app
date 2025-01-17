-- [ENUM] for the type of user
CREATE TYPE public.user_type AS ENUM (
    'admin',
    'employee',
    'customer'
);

-- [FUNCTION] to update the updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- [TABLE] for the users profiles
CREATE TABLE public.profiles (
    id UUID NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    name TEXT NOT NULL,
    type public.user_type NOT NULL,
    CONSTRAINT profiles_pkey PRIMARY KEY (id),
    CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users (id) ON UPDATE CASCADE ON DELETE CASCADE
) TABLESPACE pg_default;

-- [COMMENT] on profiles
COMMENT ON TABLE public.profiles IS 'The users profiles.';

-- Enable RLS for profiles
--ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- [POLICY] (only authenticated) Allow selects to all profiles but for customers which can only select their own
/*CREATE POLICY "public_profiles_select" 
ON "public"."profiles"
FOR SELECT 
TO authenticated 
USING (
    profiles.id = auth.uid() 
    OR EXISTS (
        SELECT 1 
        FROM profiles p 
        WHERE p.id = auth.uid() 
        AND p.type <> 'customer'::public.user_type
    )
);*/

-- [POLICY] (only authenticated) Allow updates to the users own profile or if the user is an admin
/*CREATE POLICY "public_profiles_update" 
ON "public"."profiles" 
FOR UPDATE 
TO authenticated 
USING (
    profiles.id = auth.uid() 
    OR EXISTS (
        SELECT 1 
        FROM profiles p 
        WHERE p.id = auth.uid() 
        AND p.type = 'admin'::public.user_type
    )
);*/

-- [TRIGGER] to update the updated_at timestamp
CREATE TRIGGER update_profiles_updated_at_trigger
AFTER UPDATE ON public.profiles
FOR EACH ROW
EXECUTE FUNCTION update_updated_at();

CREATE TYPE public.standard_type AS ENUM (
    'server',
    'client'
);

CREATE TYPE public.standard_evolution AS ENUM (
    'e3'
);

CREATE TYPE public.standard_version AS ENUM (
    'v15',
    'v15.5',
    'v16'
);

CREATE TYPE public.standard_flavor AS ENUM (
    'enterprise',
    'plastics',
    'neo',
    'components',
    'electronics',
    'guss'
);

-- [TABLE] for the customers
CREATE TABLE public.customers (
    id UUID NOT NULL DEFAULT gen_random_UUID(),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    name TEXT NOT NULL,
    evolution public.standard_evolution NOT NULL,
    version public.standard_version NOT NULL,
    flavor public.standard_flavor NOT NULL,
    CONSTRAINT customers_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

-- [COMMENT] on customers
COMMENT ON TABLE public.customers IS 'The available customers.';

-- Enable RLS for customers
-- ALTER TABLE public.customers ENABLE ROW LEVEL SECURITY;

-- [POLICY] (only authenticated) Allow updates to admins only
/*CREATE POLICY "public_customers_update" 
ON "public"."customers" 
FOR UPDATE 
TO authenticated USING (
    EXISTS (
        SELECT 1 
        FROM profiles p 
        WHERE p.id = auth.uid() 
        AND p.type = 'admin'::public.user_type
    )
);*/

-- [POLICY] (only authenticated) Allow inserts to admins only
/*CREATE POLICY "public_customers_insert" 
ON "public"."customers" 
FOR INSERT TO authenticated 
WITH CHECK (
    EXISTS (
        SELECT 1 
        FROM profiles p 
        WHERE p.id = auth.uid() 
        AND p.type = 'admin'::public.user_type
    )
);*/

-- [POLICY] (only authenticated) Allow deletion to admins only
/*CREATE POLICY "public_customers_delete" 
ON "public"."customers" 
FOR DELETE 
TO authenticated 
USING (
    EXISTS (
        SELECT 1 
        FROM profiles p 
        WHERE p.id = auth.uid() 
        AND p.type = 'admin'::public.user_type
    )
);*/

-- [TRIGGER] to update the updated_at timestamp
CREATE TRIGGER update_customers_updated_at_trigger
AFTER UPDATE ON public.customers
FOR EACH ROW
EXECUTE FUNCTION update_updated_at();

-- [TABLE] for customer mandants
CREATE TABLE public.customer_mandants (
    id UUID NOT NULL DEFAULT gen_random_UUID(),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    customer_id UUID NOT NULL,
    name TEXT NOT NULL,
    is_production BOOLEAN NOT NULL,
    CONSTRAINT public_customer_mandants_pkey PRIMARY KEY (id),
    CONSTRAINT public_customer_mandants_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers (id) ON UPDATE CASCADE ON DELETE CASCADE
) TABLESPACE pg_default;

-- [COMMENT] on customer_mandants
COMMENT ON TABLE public.customer_mandants IS 'The mandants of a customer.';

-- TODO Policies for customer_mandants

-- [TRIGGER] to update the updated_at timestamp
CREATE TRIGGER update_customer_mandants_updated_at_trigger
AFTER UPDATE ON public.customer_mandants
FOR EACH ROW
EXECUTE FUNCTION update_updated_at();

-- [TABLE] for the connection between a customer and THEIR employees
CREATE TABLE public.customer_profiles (
    customer_id UUID NOT NULL,
    profile_id UUID NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    CONSTRAINT customer_profiles_pkey PRIMARY KEY (profile_id, customer_id),
    CONSTRAINT customer_profiles_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers (id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT customer_profiles_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.profiles (id) ON UPDATE CASCADE ON DELETE CASCADE
) TABLESPACE pg_default;

-- [COMMENT] on profiles
COMMENT ON TABLE public.customer_profiles IS 'The connection between customer and customers employees profiles.';

-- Enable RLS for customer_profiles
--ALTER TABLE public.customer_profiles ENABLE ROW LEVEL SECURITY;

-- [POLICY] (only authenticated) Allow selects to customers where user is part of or user is not a customer
/*CREATE POLICY "public_customers_select" 
ON "public"."customers" 
FOR SELECT 
TO authenticated 
USING (
    EXISTS (
        SELECT 1 
        FROM customer_profiles cp 
        WHERE cp.profile_id = auth.uid()
        AND cp.customer_id = customers.id
    )
    OR EXISTS (
        SELECT 1 
        FROM profiles p 
        WHERE p.id = auth.uid() 
        AND p.type <> 'customer'::public.user_type
    )
);*/

-- [POLICY] (only authenticated) Allow selects to rows where user is part of or user is not a customer
/*CREATE POLICY "public_customer_profiles_select" 
ON "public"."customer_profiles" 
FOR SELECT 
TO authenticated 
USING (
    EXISTS (
        SELECT 1 
        FROM customer_profiles cp 
        WHERE cp.profile_id = auth.uid()
        AND cp.customer_id = customer_profiles.customer_id
    )
    OR EXISTS (
        SELECT 1 
        FROM profiles p 
        WHERE p.id = auth.uid() 
        AND p.type <> 'customer'::public.user_type
    )
);*/

-- [POLICY] (only authenticated) Allow updates to admins only
/*CREATE POLICY "public_customer_profiles_update" 
ON "public"."customer_profiles" 
FOR UPDATE 
TO authenticated USING (
    EXISTS (
        SELECT 1 
        FROM profiles p 
        WHERE p.id = auth.uid() 
        AND p.type = 'admin'::public.user_type
    )
);*/

-- [TRIGGER] to update the updated_at timestamp
CREATE TRIGGER update_customer_profiles_updated_at_trigger
AFTER UPDATE ON public.customer_profiles
FOR EACH ROW
EXECUTE FUNCTION update_updated_at();

-- [FUNCTION] for creation of profiles after creation of a new user
CREATE FUNCTION public.create_profile()
RETURNS TRIGGER 
LANGUAGE plpgsql 
SECURITY DEFINER
SET search_path = public AS $$
BEGIN
    INSERT INTO public.profiles (
        id, 
        name, 
        type
    )
    VALUES (
        NEW.id, 
        NEW.raw_user_meta_data->>'name',
        (NEW.raw_user_meta_data->>'type')::public.user_type
    );

    IF NEW.raw_user_meta_data->>'customer_id' IS NOT NULL THEN
        INSERT INTO public.customer_profiles (
            customer_id, 
            profile_id
        )
        VALUES (
            (NEW.raw_user_meta_data->>'customer_id')::UUID,
            NEW.id
        );
    END IF;

    RETURN NEW;
END;
$$;

-- [TRIGGER] for profile creation after new user
CREATE TRIGGER after_insert_on_auth_users_create_profile
AFTER
INSERT ON auth.users FOR EACH ROW EXECUTE PROCEDURE public.create_profile();