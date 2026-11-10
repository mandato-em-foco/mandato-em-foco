-- Modelo inicial ilustrativo para Supabase/PostgreSQL.
-- Revisar e aplicar políticas RLS antes de armazenar dados reais.
create extension if not exists pgcrypto;

create table public.legislatures (
  id uuid primary key default gen_random_uuid(),
  level text not null check (level in ('estadual','municipal')),
  institution text not null,
  municipality text,
  state_code char(2) not null default 'RJ',
  mandate_start date,
  mandate_end date,
  created_at timestamptz not null default now()
);

create table public.parliamentarians (
  id uuid primary key default gen_random_uuid(),
  legislature_id uuid not null references public.legislatures(id),
  full_name text not null,
  party text,
  role text,
  official_profile_url text,
  source_url text not null,
  last_verified_at timestamptz,
  created_at timestamptz not null default now()
);

create table public.activities (
  id uuid primary key default gen_random_uuid(),
  legislature_id uuid not null references public.legislatures(id),
  parliamentarian_id uuid references public.parliamentarians(id),
  activity_type text not null check (activity_type in
    ('proposicao','votacao','comissao','audiencia','fiscalizacao','outro')),
  title text not null,
  description text,
  official_identifier text,
  official_status text,
  source_url text not null,
  source_document_date date,
  collected_at timestamptz not null default now(),
  last_verified_at timestamptz,
  verification_level text not null check (verification_level in
    ('sistema_oficial','documento_oficial','declarado_nao_verificado','contestado','corrigido')),
  created_at timestamptz not null default now()
);

create table public.activity_history (
  id uuid primary key default gen_random_uuid(),
  activity_id uuid not null references public.activities(id),
  changed_at timestamptz not null default now(),
  change_note text not null,
  previous_value jsonb,
  new_value jsonb,
  changed_by uuid
);

create index activities_type_idx on public.activities(activity_type);
create index activities_parliamentarian_idx on public.activities(parliamentarian_id);
create index activities_verified_idx on public.activities(last_verified_at desc);

-- IMPORTANTE:
-- 1. Ativar RLS em todas as tabelas antes de conectar o frontend.
-- 2. Leitura pública apenas dos campos destinados à transparência.
-- 3. Escrita somente por usuários administrativos autenticados e autorizados.
-- 4. Nunca guardar dados pessoais de cidadãos/apoiadores sem base legal e necessidade.
-- 5. Não expor chaves service_role no navegador.
