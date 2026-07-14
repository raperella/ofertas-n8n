-- ============================================================
-- Schema: amazon-ofertas-n8n
-- Banco: Supabase (PostgreSQL)
-- Gerado via: Supabase Dashboard / supabase db dump --schema-only
-- Última atualização: 2026-07-14
-- ------------------------------------------------------------
-- ATENÇÃO: Este schema é apenas para documentação/contexto.
-- A ordem das tabelas e constraints pode não ser válida para
-- execução direta (ex: extensões necessárias, grants, policies
-- de RLS não estão incluídas neste dump).
-- ============================================================

CREATE TABLE public.products (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  external_id text NOT NULL UNIQUE,
  title text NOT NULL,
  image text,
  url text,
  store text DEFAULT 'amazon'::text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now(),
  CONSTRAINT products_pkey PRIMARY KEY (id)
);

CREATE TABLE public.offers (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  product_id uuid NOT NULL,
  price numeric NOT NULL,
  old_price numeric,
  discount integer,
  affiliate_url text,
  published boolean DEFAULT false,
  available boolean DEFAULT true,
  captured_at timestamp with time zone DEFAULT now(),
  CONSTRAINT offers_pkey PRIMARY KEY (id),
  CONSTRAINT fk_offer_product FOREIGN KEY (product_id) REFERENCES public.products(id)
);
