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

DO $$
DECLARE
    standard_data jsonb;
    standard_list jsonb[] := ARRAY[
        '{"id": "4064a936-f1a1-4742-8922-7a36db01183b", "file_path": "", "type": "client", "evolution": "e3", "version": "v15.5", "flavor": "enterprise", "patch": "2024-01-24"}',
        '{"id": "90261503-8d8b-44ff-ad0f-eb2f6f7092f9", "file_path": "", "type": "server", "evolution": "e3", "version": "v15", "patch": "2024-03-03"}',
        '{"id": "8f8775b0-dcbc-4c24-a80a-393c9a6ce3a5", "file_path": "", "type": "server", "evolution": "e3", "version": "v15", "patch": "2024-04-09"}',
        '{"id": "fd31abfd-3ec3-43ce-9196-22c8f9e0cdc9", "file_path": "", "type": "client", "evolution": "e3", "version": "v16", "flavor": "electronics", "patch": "2024-06-15"}',
        '{"id": "ad5712ee-9c3d-4904-b10d-94b1db0e4e9f", "file_path": "", "type": "server", "evolution": "e3", "version": "v16", "patch": "2024-07-30"}',
        '{"id": "2837cd79-3f1c-4b6b-83cf-4d565c5bfaa2", "file_path": "", "type": "client", "evolution": "e3", "version": "v15", "flavor": "enterprise", "patch": "2024-10-01"}',
        '{"id": "35a8245c-35d5-4d95-be3e-bd769e68696a", "file_path": "", "type": "client", "evolution": "e3", "version": "v16", "flavor": "enterprise", "patch": "2025-01-06"}'
    ];
BEGIN
    FOREACH standard_data IN ARRAY standard_list
    LOOP
        INSERT INTO public.standards (
            id,
            file_path,
            type,
            evolution,
            version,
            flavor,
            patch
        ) VALUES (
            (standard_data->>'id')::UUID,
            standard_data->>'file_path',
            (standard_data->>'type')::public.standard_type,
            (standard_data->>'evolution')::public.standard_evolution,
            (standard_data->>'version')::public.standard_version,
            (standard_data->>'flavor')::public.standard_flavor,
            (standard_data->>'patch')::DATE
        );
    END LOOP;
END $$;

DO $$
DECLARE
    customer_mandant_update_data jsonb;
    customer_mandant_update_list jsonb[] := ARRAY[
        '{"id": "439b8bc3-015f-4898-ba74-6413615d5397", "customer_mandant_id": "7f5f8c2f-b5b0-4c72-9a0d-90ac1dbb7630", "timed_at": "2025-02-10 12:12:56+02:00", "status": "upcoming", "title": "Standard-Kit-Update", "release_notes": "ABC"}',
        '{"id": "5c740c92-728e-40b7-a15e-788ec4079c44", "customer_mandant_id": "79a3f2b2-e52e-4213-8e0c-c39f421b479f", "timed_at": "2025-01-13 10:20:56+02:00", "status": "ongoing", "title": "Anpassungen 2024-11-09", "release_notes": "ABC"}',
        '{"id": "77fd8482-395c-4cec-8b1c-57498e765810", "customer_mandant_id": "e0c4e05f-83b7-4416-8a6b-07144d79c51d", "timed_at": "2024-12-20 18:58:56+02:00", "status": "success", "title": "Neues Update", "release_notes": "ABC"}',
        '{"id": "4bd1a1fc-7e73-4f1d-bfef-b973a57e2bd8", "customer_mandant_id": "6311ec1a-5c4a-4b0e-9513-4cb68da211cd", "timed_at": "2024-11-19 19:33:56+02:00", "status": "error", "title": "Standard-Kit-Update", "release_notes": "ABC"}',
        '{"id": "94c6ac2d-1acc-499d-9c09-4d01ebd78805", "customer_mandant_id": "17b79d4a-d57c-49d0-8c97-2b09753d7bda", "timed_at": "2024-11-19 19:33:56+02:00", "status": "success", "title": "Anpassungen 2024-11-09 (01)", "release_notes": "ABC"}'
    ];
BEGIN
    FOREACH customer_mandant_update_data IN ARRAY customer_mandant_update_list
    LOOP
        INSERT INTO public.customer_mandant_updates (
            id,
            customer_mandant_id,
            timed_at,
            status,
            title,
            release_notes
        ) VALUES (
            (customer_mandant_update_data->>'id')::UUID,
            (customer_mandant_update_data->>'customer_mandant_id')::UUID,
            (customer_mandant_update_data->>'timed_at')::TIMESTAMP WITH TIME ZONE,
            (customer_mandant_update_data->>'status')::public.update_status,
            (customer_mandant_update_data->>'title')::TEXT,
            (customer_mandant_update_data->>'release_notes')::TEXT
        );
    END LOOP;
END $$;