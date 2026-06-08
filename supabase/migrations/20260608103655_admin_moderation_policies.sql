-- Admin moderation: allow the app superuser to delete ANY post or comment.
-- The superuser's transparently-provisioned cloud account is identified by its
-- deterministic synthetic email (derived from the fixed SUPER_ID + username in
-- the client). Owners can still delete their own content via the existing
-- owner-only policies; these add the moderator capability on top.
create policy "posts_delete_admin" on public.posts
  for delete using ((auth.jwt()->>'email') = 'giopark.ugioparkroot@users.pbp.local');
create policy "comments_delete_admin" on public.comments
  for delete using ((auth.jwt()->>'email') = 'giopark.ugioparkroot@users.pbp.local');
