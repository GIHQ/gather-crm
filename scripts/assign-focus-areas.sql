-- Auto-assign focus areas to fellows using keyword matching
-- Paste this entire block into the Supabase SQL Editor and click Run

DO $$
DECLARE
  focus_cat_id UUID;
  inserted_count INT;
BEGIN
  SELECT id INTO focus_cat_id FROM focus_categories WHERE slug = 'focus-areas';

  DROP TABLE IF EXISTS _tkw;
  CREATE TEMP TABLE _tkw (tag_name TEXT, keywords TEXT[]);

  INSERT INTO _tkw VALUES
    ('Arts & Culture', ARRAY['arts', 'creative expression', 'music', 'dance', 'theater', 'visual art', 'painting', 'sculpture', 'poetry', 'literary', 'mural', 'performing art']),
    ('Arts, Culture & Media', ARRAY['media', 'journalism', 'journalist', 'storytelling', 'documentary', 'broadcast', 'photography', 'film', 'podcast', 'reporter']),
    ('Child Protection & Rights', ARRAY['child protection', 'child rights', 'child welfare', 'child abuse', 'orphan', 'child safety']),
    ('Civic Engagement', ARRAY['civic engagement', 'civic participation', 'voter', 'voting', 'democracy', 'election', 'political participation']),
    ('Climate Action', ARRAY['climate change', 'climate action', 'carbon', 'global warming', 'renewable energy', 'clean energy']),
    ('Climate Action & Environmental Justice', ARRAY['climate justice', 'environmental justice', 'environmental racism', 'pollution', 'environmental advocacy']),
    ('Community Building', ARRAY['community building', 'community organizing', 'grassroots', 'community engagement', 'community leader', 'neighborhood organizing']),
    ('Community Development & Empowerment', ARRAY['community development', 'empowerment', 'capacity building', 'community empowerment']),
    ('Criminal Justice Reform & Reentry', ARRAY['criminal justice', 'reentry', 're-entry', 'incarcerat', 'prison', 'restorative justice', 'justice reform']),
    ('Economic Development', ARRAY['economic development', 'economic growth', 'financial literacy', 'microfinance', 'economic empowerment']),
    ('Economic Development & Entrepreneurship', ARRAY['entrepreneurship', 'entrepreneur', 'business development', 'startup', 'small business', 'enterprise']),
    ('Education', ARRAY['education', 'school', 'teaching', 'teacher', 'curriculum', 'literacy', 'academic', 'classroom']),
    ('Education & Academic Support', ARRAY['tutoring', 'tutor', 'academic support', 'after-school', 'afterschool', 'scholarship', 'college prep']),
    ('Environmental Justice', ARRAY['environmental', 'conservation', 'ecological', 'natural resource', 'biodiversity', 'ecosystem']),
    ('Food Security', ARRAY['food security', 'hunger', 'nutrition', 'agriculture', 'farming', 'food access', 'food desert', 'urban farm']),
    ('Gender Equality', ARRAY['gender equality', 'gender equity', 'feminist', 'feminism', 'gender parity']),
    ('Gender Justice & Womens Empowerment', ARRAY['women empowerment', 'girls empowerment', 'gender justice', 'maternal', 'reproductive', 'gender-based violence']),
    ('Health & Disability Justice', ARRAY['disability', 'disabled', 'accessibility', 'health equity', 'health justice']),
    ('Health/Wellness', ARRAY['health', 'wellness', 'wellbeing', 'well-being', 'medical', 'healthcare', 'public health', 'clinic']),
    ('Housing', ARRAY['housing', 'homeless', 'homelessness', 'shelter', 'affordable housing', 'tenant', 'eviction']),
    ('Human Rights', ARRAY['human rights', 'civil rights', 'civil liberties', 'fundamental rights']),
    ('Human Rights & Advocacy', ARRAY['advocacy', 'advocate', 'policy advocacy', 'campaigning', 'activist', 'activism']),
    ('Humanitarian Aid & Disaster Response', ARRAY['humanitarian', 'disaster', 'relief', 'emergency response', 'crisis response', 'aid worker']),
    ('Immigration Services', ARRAY['immigration', 'immigrant', 'undocumented', 'deportation', 'asylum', 'citizenship', 'naturalization']),
    ('Indigenous Rights & Cultural Preservation', ARRAY['indigenous', 'native', 'tribal', 'aboriginal', 'cultural preservation', 'ancestral']),
    ('Interfaith Dialogue & Spiritual Wellness', ARRAY['interfaith', 'faith-based', 'spiritual', 'religious', 'church', 'mosque', 'temple', 'ministry']),
    ('Legal Services', ARRAY['legal services', 'lawyer', 'attorney', 'legal aid', 'paralegal', 'legal clinic', 'pro bono']),
    ('LGBTQ+ Rights & Inclusion', ARRAY['lgbtq', 'lgbt', 'queer', 'transgender', 'gay rights', 'lesbian', 'sexual orientation', 'gender identity']),
    ('Mental Health', ARRAY['mental health', 'counseling', 'therapy', 'therapist', 'psychological', 'counselor', 'psychologist']),
    ('Mental Health & Trauma Support', ARRAY['trauma', 'ptsd', 'trauma-informed', 'healing', 'grief', 'crisis intervention']),
    ('Migration & Refugee Support', ARRAY['refugee', 'displaced', 'asylum seeker', 'resettlement', 'forced migration', 'migrant']),
    ('Peacebuilding', ARRAY['peace', 'peacebuilding', 'peace building', 'nonviolence', 'non-violence', 'peacemaker']),
    ('Peacebuilding & Conflict Resolution', ARRAY['conflict resolution', 'mediation', 'reconciliation', 'conflict transformation', 'negotiation', 'mediator']),
    ('Public Safety', ARRAY['public safety', 'crime prevention', 'safe community', 'community safety', 'violence reduction']),
    ('Racial Justice', ARRAY['racial justice', 'racial equity', 'anti-racism', 'racial discrimination', 'racial healing']),
    ('Social Enterprise', ARRAY['social enterprise', 'social entrepreneurship', 'social impact', 'impact investing', 'social business']),
    ('Social Justice & Racial Equity', ARRAY['social justice', 'racial equity', 'inequality', 'systemic racism', 'marginalized', 'oppression']),
    ('Substance Abuse', ARRAY['substance abuse', 'addiction', 'drug abuse', 'alcohol abuse', 'recovery program', 'sobriety', 'opioid']),
    ('Technology Access', ARRAY['technology', 'digital literacy', 'computer', 'coding', 'software', 'internet access', 'stem']),
    ('Violence Prevention', ARRAY['violence prevention', 'gun violence', 'anti-violence', 'ceasefire', 'gang prevention', 'street violence']),
    ('Violence Prevention & Survivor Support', ARRAY['survivor', 'domestic violence', 'sexual violence', 'victim services', 'sexual assault']),
    ('Workforce Development', ARRAY['workforce', 'job training', 'employment', 'career development', 'vocational', 'job readiness']),
    ('Youth Development', ARRAY['youth', 'young people', 'teenager', 'adolescent', 'youth program', 'youth services']),
    ('Youth Development & Leadership', ARRAY['youth leadership', 'youth empowerment', 'youth mentor', 'leadership development', 'young leader']);

  -- Find fellows without any focus area tags
  DROP TABLE IF EXISTS _fnt;
  CREATE TEMP TABLE _fnt AS
  SELECT f.id, f.biography, f.job_title, f.organization
  FROM fellows f
  WHERE f.status = 'Alumni'
  AND NOT EXISTS (
    SELECT 1 FROM fellow_focus_tags fft
    JOIN focus_tags ft ON fft.tag_id = ft.id
    WHERE fft.fellow_id = f.id AND ft.category_id = focus_cat_id
  );

  RAISE NOTICE 'Fellows without focus area tags: %', (SELECT COUNT(*) FROM _fnt);

  -- Score each fellow-tag pair by counting keyword matches, then insert top 4
  INSERT INTO fellow_focus_tags (fellow_id, tag_id, is_primary)
  SELECT fellow_id, tag_id, false
  FROM (
    SELECT fellow_id, tag_id, score,
      ROW_NUMBER() OVER (PARTITION BY fellow_id ORDER BY score DESC, random()) AS rn
    FROM (
      SELECT f.id AS fellow_id, ft.id AS tag_id,
        (SELECT COUNT(*) FROM unnest(tk.keywords) AS kw(word)
         WHERE lower(
           COALESCE(f.biography, '') || ' ' ||
           COALESCE(f.job_title, '') || ' ' ||
           COALESCE(f.organization, '')
         ) LIKE '%' || lower(kw.word) || '%'
        )::int AS score
      FROM _fnt f
      CROSS JOIN focus_tags ft
      JOIN _tkw tk ON tk.tag_name = ft.name
      WHERE ft.category_id = focus_cat_id
    ) scored
    WHERE score > 0
  ) ranked
  WHERE rn <= 4;

  GET DIAGNOSTICS inserted_count = ROW_COUNT;
  RAISE NOTICE 'Done! Assigned % focus area tags.', inserted_count;

  DROP TABLE IF EXISTS _tkw;
  DROP TABLE IF EXISTS _fnt;
END $$;

-- Verify results
SELECT COUNT(DISTINCT fellow_id) as fellows_with_tags FROM fellow_focus_tags;
