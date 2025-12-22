create table users (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  email text not null unique,
  password text not null,
  created_at timestamp with time zone default now()
);

create table agents (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  name text not null,
  image_url text,
  created_at timestamp with time zone default now()
);


create table transactions (
  id uuid primary key default gen_random_uuid(),
  agent_id uuid not null references agents(id) on delete cascade,
  amount numeric not null,
  currency text not null check (currency in ('USD', 'TRY', 'EUR')),
  type text not null check (type in ('credit', 'debit')),
  details text,
  created_at timestamp with time zone default now()
);

