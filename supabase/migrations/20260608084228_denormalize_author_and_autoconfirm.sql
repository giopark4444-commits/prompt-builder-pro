-- Denormalized author name so the feed displays exactly what the user typed,
-- independent of profile-username uniqueness collisions across devices.
alter table public.posts add column author_name text;
alter table public.comments add column author_name text;

-- Auto-confirm new users at the DB level. The app provisions cloud accounts
-- transparently with synthetic credentials, so there is no real inbox to
-- confirm. This lets signInWithPassword succeed immediately regardless of the
-- project's "Confirm email" setting.
create or replace function public.auto_confirm_user()
returns trigger
language plpgsql
security definer
set search_path = auth, public
as $$
begin
  if new.email_confirmed_at is null then
    new.email_confirmed_at := now();
  end if;
  return new;
end;
$$;

create trigger before_auth_user_autoconfirm
  before insert on auth.users
  for each row execute function public.auto_confirm_user();

revoke execute on function public.auto_confirm_user() from public, anon, authenticated;
