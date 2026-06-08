-- The trigger function must never be callable via the public REST RPC.
-- It only runs as the AFTER INSERT trigger on auth.users.
revoke execute on function public.handle_new_user() from public, anon, authenticated;
