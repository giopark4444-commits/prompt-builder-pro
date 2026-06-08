-- ════ PROFILES ════════════════════════════════════════════════
create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  username text unique not null,
  display_name text,
  bio text,
  website text,
  avatar_url text,
  created_at timestamptz not null default now()
);
alter table public.profiles enable row level security;

create policy "profiles_select_all" on public.profiles
  for select using (true);
create policy "profiles_insert_own" on public.profiles
  for insert with check (auth.uid() = id);
create policy "profiles_update_own" on public.profiles
  for update using (auth.uid() = id);

-- Auto-create a profile when a new auth user signs up.
-- Username comes from signup metadata; falls back to a unique stub.
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  uname text;
begin
  uname := coalesce(nullif(trim(new.raw_user_meta_data->>'username'), ''),
                    'user_' || substr(new.id::text, 1, 8));
  -- Guarantee uniqueness if the chosen username is taken.
  if exists (select 1 from public.profiles where lower(username) = lower(uname)) then
    uname := uname || '_' || substr(new.id::text, 1, 4);
  end if;
  insert into public.profiles (id, username, display_name, avatar_url, website, bio)
  values (
    new.id,
    uname,
    nullif(new.raw_user_meta_data->>'display_name', ''),
    nullif(new.raw_user_meta_data->>'avatar_url', ''),
    nullif(new.raw_user_meta_data->>'website', ''),
    nullif(new.raw_user_meta_data->>'bio', '')
  );
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- ════ POSTS ═══════════════════════════════════════════════════
create table public.posts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  title text not null check (char_length(title) <= 200),
  prompt text not null check (char_length(prompt) <= 8000),
  media_type text not null default 'none'
    check (media_type in ('none','image','link','upload')),
  media_url text,
  ai_engine text,
  created_at timestamptz not null default now()
);
alter table public.posts enable row level security;
create index posts_created_idx on public.posts (created_at desc);
create index posts_user_idx on public.posts (user_id);

create policy "posts_select_all" on public.posts
  for select using (true);
create policy "posts_insert_own" on public.posts
  for insert with check (auth.uid() = user_id);
create policy "posts_delete_own" on public.posts
  for delete using (auth.uid() = user_id);

-- ════ COMMENTS ════════════════════════════════════════════════
create table public.comments (
  id uuid primary key default gen_random_uuid(),
  post_id uuid not null references public.posts(id) on delete cascade,
  user_id uuid not null references public.profiles(id) on delete cascade,
  body text not null check (char_length(body) <= 2000),
  created_at timestamptz not null default now()
);
alter table public.comments enable row level security;
create index comments_post_idx on public.comments (post_id, created_at);

create policy "comments_select_all" on public.comments
  for select using (true);
create policy "comments_insert_own" on public.comments
  for insert with check (auth.uid() = user_id);
create policy "comments_delete_own" on public.comments
  for delete using (auth.uid() = user_id);

-- ════ LIKES ═══════════════════════════════════════════════════
create table public.likes (
  post_id uuid not null references public.posts(id) on delete cascade,
  user_id uuid not null references public.profiles(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (post_id, user_id)
);
alter table public.likes enable row level security;

create policy "likes_select_all" on public.likes
  for select using (true);
create policy "likes_insert_own" on public.likes
  for insert with check (auth.uid() = user_id);
create policy "likes_delete_own" on public.likes
  for delete using (auth.uid() = user_id);
