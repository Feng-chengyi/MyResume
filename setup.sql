CREATE TABLE IF NOT EXISTS resumes (
  id TEXT PRIMARY KEY,
  data JSONB NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE resumes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public insert" ON resumes FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public read" ON resumes FOR SELECT USING (true);
