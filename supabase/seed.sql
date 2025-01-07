DO $$
DECLARE
    customer_data jsonb;
    customer_list jsonb[] := ARRAY[
        '{"id": "c6ffe4c3-a5c4-474a-8772-acb2c4a15ffe", "name": "TimeLine Consulting Wuppertal GmbH", "evolution": "e3", "version": "v15", "flavor": "enterprise"}',
        '{"id": "e52d7366-5cd4-4f77-a087-880359702996", "name": "Service Team Kathi Hofmann", "evolution": "e3", "version": "v15", "flavor": "guss"}',
        '{"id": "e193c7f5-a4ce-4e5f-b43c-6037f2561ed9", "name": "Heinz Hesse KG", "evolution": "e3", "version": "v15", "flavor": "enterprise"}',
        '{"id": "a0cef95c-c79f-47ac-90fc-5b9b88356811", "name": "Brehmer GmbH & Co. KG", "evolution": "e3", "version": "v16", "flavor": "electronics"}'
    ];
BEGIN
    FOREACH customer_data IN ARRAY customer_list
    LOOP
        INSERT INTO public.customers (
            id,
            name,
            evolution,
            version,
            flavor
        ) VALUES (
            (customer_data->>'id')::UUID,
            customer_data->>'name',
            (customer_data->>'evolution')::public.standard_evolution,
            (customer_data->>'version')::public.standard_version,
            (customer_data->>'flavor')::public.standard_flavor
        );
    END LOOP;
END $$;

DO $$
DECLARE
    user_data jsonb;
    user_list jsonb[] := ARRAY[
        '{"id": "f95c9e45-0b17-4e85-88db-e150ab486634", "email": "fleeser@tlcw.de", "password": "password", "name": "Florian Leeser", "type": "admin", "customer_id": "c6ffe4c3-a5c4-474a-8772-acb2c4a15ffe"}',
        '{"id": "e9eb6a38-47fc-4fbc-99f8-400fe90aaad3", "email": "aleickel@tlcw.de", "password": "password", "name": "André Leickel", "type": "admin", "customer_id": "c6ffe4c3-a5c4-474a-8772-acb2c4a15ffe"}',
        '{"id": "05f9ef7e-23d8-4a4e-975e-3127f530572b", "email": "bduerholt@tlcw.de", "password": "password", "name": "Benjamin Dürholt", "type": "admin", "customer_id": "c6ffe4c3-a5c4-474a-8772-acb2c4a15ffe"}',

        '{"id": "660a1048-285a-496b-ac51-399099234feb", "email": "nkusenberg@tlcw.de", "password": "password", "name": "Nick Kusenberg", "type": "employee", "customer_id": "c6ffe4c3-a5c4-474a-8772-acb2c4a15ffe"}',
        '{"id": "3467b6a6-3304-4ddc-8134-850f3cdc5abf", "email": "dbarth@tlcw.de", "password": "password", "name": "Damian Barth", "type": "employee", "customer_id": "c6ffe4c3-a5c4-474a-8772-acb2c4a15ffe"}',
        '{"id": "934e59e6-1464-4165-876a-afaea4137745", "email": "erukundo@tlcw.de", "password": "password", "name": "Emmanuel Rukundo", "type": "employee", "customer_id": "c6ffe4c3-a5c4-474a-8772-acb2c4a15ffe"}',
        '{"id": "41bfd91a-a0fe-418c-a8f7-d3f3721f27f5", "email": "cschmidt@tlcw.de", "password": "password", "name": "Christoph Schmidt", "type": "employee", "customer_id": "c6ffe4c3-a5c4-474a-8772-acb2c4a15ffe"}',
        '{"id": "14772654-d3be-4ea5-aa2b-bd4a4e9b8ce5", "email": "hliebermann@tlcw.de", "password": "password", "name": "Holger Liebermann", "type": "employee", "customer_id": "c6ffe4c3-a5c4-474a-8772-acb2c4a15ffe"}',
        '{"id": "73dbf896-0219-472a-9e77-44c3162b45c7", "email": "fsteinert@tlcw.de", "password": "password", "name": "Frank Steinert", "type": "employee", "customer_id": "c6ffe4c3-a5c4-474a-8772-acb2c4a15ffe"}',

        '{"id": "5f8d2bfa-9181-45c2-a17c-871340592bf8", "email": "amueller@test.de", "password": "password", "name": "Anna Müller", "type": "customer", "customer_id": "e52d7366-5cd4-4f77-a087-880359702996"}',
        '{"id": "2389d6d7-5805-48a4-921d-9a7b4324f2d3", "email": "bschneider@test.de", "password": "password", "name": "Bernd Schneider", "type": "customer", "customer_id": "e52d7366-5cd4-4f77-a087-880359702996"}',
        '{"id": "7d9faed1-67ac-4f55-ae56-3d2f6a5267cb", "email": "cfischer@test.de", "password": "password", "name": "Clara Fischer", "type": "customer", "customer_id": "e52d7366-5cd4-4f77-a087-880359702996"}',

        '{"id": "682a9ed7-9dda-49c8-b819-51c3ba2a5b98", "email": "dwagner@test.de", "password": "password", "name": "David Wagner", "type": "customer", "customer_id": "e193c7f5-a4ce-4e5f-b43c-6037f2561ed9"}',
        '{"id": "9369d970-10a8-4e56-95e7-358d6781ce38", "email": "ebraun@test.de", "password": "password", "name": "Emma Braun", "type": "customer", "customer_id": "e193c7f5-a4ce-4e5f-b43c-6037f2561ed9"}',
        '{"id": "864b71fc-0621-4773-9825-b1b4c8bf108c", "email": "fkeller@test.de", "password": "password", "name": "Felix Keller", "type": "customer", "customer_id": "e193c7f5-a4ce-4e5f-b43c-6037f2561ed9"}',

        '{"id": "c7027f1f-4ea3-46fd-abe7-262ea609a606", "email": "gweber@test.de", "password": "password", "name": "Gina Weber", "type": "customer", "customer_id": "a0cef95c-c79f-47ac-90fc-5b9b88356811"}',
        '{"id": "7216a0fa-292c-4546-b734-aefb66596cd3", "email": "hmayer@test.de", "password": "password", "name": "Hannah Mayer", "type": "customer", "customer_id": "a0cef95c-c79f-47ac-90fc-5b9b88356811"}',
        '{"id": "65c13094-9175-4026-820e-774542cc5b47", "email": "ilehmann@test.de", "password": "password", "name": "Igor Lehmann", "type": "customer", "customer_id": "a0cef95c-c79f-47ac-90fc-5b9b88356811"}'
    ];
BEGIN
    FOREACH user_data IN ARRAY user_list
    LOOP
        INSERT INTO auth.users (
            instance_id,
            id,
            aud,
            role,
            email,
            encrypted_password,
            email_confirmed_at,
            recovery_sent_at,
            last_sign_in_at,
            raw_app_meta_data,
            raw_user_meta_data,
            created_at,
            updated_at,
            confirmation_token,
            email_change,
            email_change_token_new,
            recovery_token
        )
        VALUES (
            '00000000-0000-0000-0000-000000000000',
            (user_data->>'id')::UUID,
            'authenticated',
            'authenticated',
            user_data->>'email',
            crypt(user_data->>'password', gen_salt('bf')),
            current_timestamp,
            current_timestamp,
            current_timestamp,
            '{"provider":"email","providers":["email"]}',
            json_build_object(
                'name', user_data->>'name',
                'type', user_data->>'type',
                'customer_id', user_data->>'customer_id'
            ),
            current_timestamp,
            current_timestamp,
            '',
            '',
            '',
            ''
        );

        INSERT INTO auth.identities (
            id,
            user_id,
            provider_id,
            identity_data,
            provider,
            last_sign_in_at,
            created_at,
            updated_at
        )
        SELECT
            uuid_generate_v4(),
            id,
            id,
            format('{"sub":"%s","email":"%s"}', id::text, email)::jsonb,
            'email',
            current_timestamp,
            current_timestamp,
            current_timestamp
        FROM auth.users
        WHERE email = user_data->>'email';
    END LOOP;
END $$;

DO $$
DECLARE
    customer_mandant_data jsonb;
    customer_mandant_list jsonb[] := ARRAY[
        '{"id": "7f5f8c2f-b5b0-4c72-9a0d-90ac1dbb7630", "customer_id": "c6ffe4c3-a5c4-474a-8772-acb2c4a15ffe", "name": "tlcw_demo", "is_production": false}',
        '{"id": "3e9c5e84-9b13-4ed4-8311-370de1c6b7c2", "customer_id": "c6ffe4c3-a5c4-474a-8772-acb2c4a15ffe", "name": "tlcw_live", "is_production": true}',

        '{"id": "79a3f2b2-e52e-4213-8e0c-c39f421b479f", "customer_id": "e52d7366-5cd4-4f77-a087-880359702996", "name": "kathi_hofmann_demo", "is_production": false}',
        '{"id": "e6575720-19a9-4f43-b79e-3f71a25b35b7", "customer_id": "e52d7366-5cd4-4f77-a087-880359702996", "name": "kathi_hofmann_live", "is_production": true}',

        '{"id": "578d7db4-7b3a-441e-ae8a-7e8e42925f51", "customer_id": "e193c7f5-a4ce-4e5f-b43c-6037f2561ed9", "name": "heinz_hesse_demo", "is_production": false}',
        '{"id": "e0c4e05f-83b7-4416-8a6b-07144d79c51d", "customer_id": "e193c7f5-a4ce-4e5f-b43c-6037f2561ed9", "name": "heinz_hesse_live", "is_production": true}',

        '{"id": "6311ec1a-5c4a-4b0e-9513-4cb68da211cd", "customer_id": "a0cef95c-c79f-47ac-90fc-5b9b88356811", "name": "brehmer_demo", "is_production": false}',
        '{"id": "17b79d4a-d57c-49d0-8c97-2b09753d7bda", "customer_id": "a0cef95c-c79f-47ac-90fc-5b9b88356811", "name": "brehmer_live", "is_production": true}'
    ];
BEGIN
    FOREACH customer_mandant_data IN ARRAY customer_mandant_list
    LOOP
        INSERT INTO public.customer_mandants (
            id,
            customer_id,
            name,
            is_production
        ) VALUES (
            (customer_mandant_data->>'id')::UUID,
            (customer_mandant_data->>'customer_id')::UUID,
            customer_mandant_data->>'name',
            (customer_mandant_data->>'is_production')::BOOLEAN
        );
    END LOOP;
END $$;