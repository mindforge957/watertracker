-- ============================================================
-- Water Tracker 💧 — Supabase Database Setup
-- Run this in your Supabase SQL Editor (https://supabase.com/dashboard)
-- ============================================================

-- 1. Create the water_log table
CREATE TABLE IF NOT EXISTS water_log (
  id         UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id    TEXT NOT NULL,
  log_date   DATE NOT NULL DEFAULT CURRENT_DATE,
  count      INTEGER NOT NULL DEFAULT 0,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  -- One row per user per day
  CONSTRAINT unique_user_date UNIQUE (user_id, log_date)
);

-- 2. Enable Row Level Security
ALTER TABLE water_log ENABLE ROW LEVEL SECURITY;

-- 3. RLS policies — allow all operations for anon key (simple demo)
--    For production, replace with proper auth policies.
CREATE POLICY "Allow anonymous read"
  ON water_log FOR SELECT
  USING (true);

CREATE POLICY "Allow anonymous insert"
  ON water_log FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Allow anonymous update"
  ON water_log FOR UPDATE
  USING (true)
  WITH CHECK (true);

-- 4. Enable Realtime on the table
ALTER PUBLICATION supabase_realtime ADD TABLE water_log;

-- 5. Index for fast lookups
CREATE INDEX IF NOT EXISTS idx_water_log_user_date
  ON water_log (user_id, log_date);

-- ✅ Done! Now paste your Supabase URL and anon key into index.html.
