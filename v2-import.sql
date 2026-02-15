-- =============================================
-- GATHER v2 — Data Import
-- =============================================

-- Fix cohorts: replace 2026 seeds with real data
DELETE FROM cohort_members WHERE cohort_id IN (SELECT id FROM cohorts WHERE cohort_year = 2026);
DELETE FROM cohorts WHERE cohort_year = 2026;

-- Insert cohorts (2025 = live, all others = archived)
INSERT INTO cohorts (name, program, city, country, cohort_year, status)
VALUES ('Chicago Peace Fellows 2019', 'CPF', 'Chicago', 'USA', 2019, 'archived')
ON CONFLICT DO NOTHING;
INSERT INTO cohorts (name, program, city, country, cohort_year, status)
VALUES ('Chicago Peace Fellows 2020', 'CPF', 'Chicago', 'USA', 2020, 'archived')
ON CONFLICT DO NOTHING;
INSERT INTO cohorts (name, program, city, country, cohort_year, status)
VALUES ('Chicago Peace Fellows 2021', 'CPF', 'Chicago', 'USA', 2021, 'archived')
ON CONFLICT DO NOTHING;
INSERT INTO cohorts (name, program, city, country, cohort_year, status)
VALUES ('Chicago Peace Fellows 2022', 'CPF', 'Chicago', 'USA', 2022, 'archived')
ON CONFLICT DO NOTHING;
INSERT INTO cohorts (name, program, city, country, cohort_year, status)
VALUES ('Chicago Peace Fellows 2023', 'CPF', 'Chicago', 'USA', 2023, 'archived')
ON CONFLICT DO NOTHING;
INSERT INTO cohorts (name, program, city, country, cohort_year, status)
VALUES ('Chicago Peace Fellows 2024', 'CPF', 'Chicago', 'USA', 2024, 'archived')
ON CONFLICT DO NOTHING;
INSERT INTO cohorts (name, program, city, country, cohort_year, status)
VALUES ('Chicago Peace Fellows 2025', 'CPF', 'Chicago', 'USA', 2025, 'live')
ON CONFLICT DO NOTHING;
INSERT INTO cohorts (name, program, city, country, cohort_year, status)
VALUES ('Spanish Language Fellows 2022', 'ESP', 'Global', 'Global', 2022, 'archived')
ON CONFLICT DO NOTHING;
INSERT INTO cohorts (name, program, city, country, cohort_year, status)
VALUES ('Spanish Language Fellows 2023', 'ESP', 'Global', 'Global', 2023, 'archived')
ON CONFLICT DO NOTHING;
INSERT INTO cohorts (name, program, city, country, cohort_year, status)
VALUES ('Global Gather Fellows 2018', 'GGF', 'Global', 'Global', 2018, 'archived')
ON CONFLICT DO NOTHING;
INSERT INTO cohorts (name, program, city, country, cohort_year, status)
VALUES ('Global Gather Fellows 2021', 'GGF', 'Global', 'Global', 2021, 'archived')
ON CONFLICT DO NOTHING;
INSERT INTO cohorts (name, program, city, country, cohort_year, status)
VALUES ('Global Gather Fellows 2022', 'GGF', 'Global', 'Global', 2022, 'archived')
ON CONFLICT DO NOTHING;
INSERT INTO cohorts (name, program, city, country, cohort_year, status)
VALUES ('Global Gather Fellows 2023', 'GGF', 'Global', 'Global', 2023, 'archived')
ON CONFLICT DO NOTHING;
INSERT INTO cohorts (name, program, city, country, cohort_year, status)
VALUES ('Global Gather Fellows 2024', 'GGF', 'Global', 'Global', 2024, 'archived')
ON CONFLICT DO NOTHING;
INSERT INTO cohorts (name, program, city, country, cohort_year, status)
VALUES ('Global Gather Fellows 2025', 'GGF', 'Global', 'Global', 2025, 'live')
ON CONFLICT DO NOTHING;

-- =============================================
-- Contacts (299 total)
-- =============================================

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, facebook)
VALUES ('Alexander', 'Gwanvalla', 'alexandergwanvalla@gmail.com', '+237 6 52 26 39 08', 'GGF', '2018', 'Alumni', '2000-01-24', true, '@alexandergwanv1', 'Alex Gwan')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, instagram, facebook, twitter_org)
VALUES ('Lissette', 'Mateus Roa', 'lissymatster@gmail.com', '+57 (315) 876-5443', 'GGF', '2018', 'Alumni', '1984-02-05', false, '@lissettemateus', 'Lissette Mateus Roa', '@inserendipia')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, instagram, facebook)
VALUES ('Ana', 'Źnidarec Čučković', 'anaznidarec@aol.com', '+38 59157 42818', 'GGF', '2018', 'Alumni', '1977-01-19', false, '@znidareccuckovic', 'Ana Źnidarec Čučković')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook)
VALUES ('Eyob', 'Yishak', 'emu4jesus@yahoo.com', '+251 91 213 2279', 'GGF', '2018', 'Alumni', '2000-09-11', true, '@eyobyishak', '@yishakeyob', 'Eyob Yishak')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook, website, instagram_org)
VALUES ('Daniel', 'Tillias', 'datillias@gmail.com', '+509 3649 1493', 'GGF', '2018', 'Alumni', '2000-09-28', true, '@Fosyongreen', 'https://www.instagram.com/fosyongrenn_tillias', 'Daniel Tillias', 'http://www.sakala-haiti.org', 'https://www.instagram.com/sakalasitesoley')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook, website, twitter_org, instagram_org, facebook_org)
VALUES ('Jamal', 'Alkirnawi', 'jamal@anewdawninthenegev.org', '+972 52-8655737', 'GGF', '2018', 'Alumni', '1979-08-06', false, 'Jamal Alkirnawi', 'https://www.anewdawninthenegevblog.com', '@anewdawnegev', '@anewdawninthenegev', 'A New Dawn')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook)
VALUES ('Mariam', 'Ali', 'famau456@gmail.com', '+254 (0) 714 938 495', 'GGF', '2018', 'Alumni', '1965-03-10', false, 'Marish Kamau')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook)
VALUES ('Geoffrey "Jeff"', 'Waringa', 'djdiezlj@gmail.com', '+254 733 883 886', 'GGF', '2018', 'Alumni', '2000-04-15', true, '@djdiezlj', '@djdiezlj', 'Jeff Waringa')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, twitter, facebook, website)
VALUES ('Neabei', 'Toah', 'toahgbaye@gmail.com', '+231 7705 78071', 'GGF', '2018', 'Alumni', '@toahgbaye', 'Neabei Toah', 'http://www.worldkindnessliberia.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, twitter, instagram, facebook, instagram_org, facebook_org)
VALUES ('Lo Ivan', 'Castillon', 'ivan8castillon@gmail.com', '+63 917 305 6006', 'GGF', '2018', 'Alumni', '@ivan8castillon', '@ivanexplorer', 'Lo Ivan Castillon', '@vibesorgph', 'Positive VIBES')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, instagram, facebook, facebook_org)
VALUES ('Laura', 'Molnar', 'molnar_laura@hotmail.com', '+40 (731) 001 122', 'GGF', '2018', 'Alumni', '2000-05-06', true, '@molnar.laura.7', 'Molnar Laura', 'Education 4 Change')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook)
VALUES ('Emmanuel "Emma"', 'Rutikanga', 'emmarutikanga@gmail.com', '+250 739 345 0', 'GGF', '2018', 'Alumni', '2000-08-04', true, '@emma_rutikanga', '@rutikangaemma', 'Emma Rutikanga')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook)
VALUES ('Abdiweli', 'Waberi', 'waberijokar@gmail.com', '+252 907751887', 'GGF', '2018', 'Alumni', '1997-12-01', false, '@A_waberi', '@abdiweli_waberi', 'Abdiweli Waberi')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, twitter, facebook, website, facebook_org)
VALUES ('Dieudonne', 'Allo', 'dgetgoing1@gmail.com', '+27 (81) 264-7144', 'GGF', '2018', 'Alumni', '@cocoboyda', 'Dieudonne Allo', 'https://globalleadinglight.org', 'Global Leading Light Initiatives')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook)
VALUES ('Yusuph', 'Masanja', 'masanja2110@gmail.com', '+255 2226664449', 'GGF', '2018', 'Alumni', '1989-06-20', false, '@yusuph_masanja', '@brusuph', 'Masanja Yusuph')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook, website, twitter_org, instagram_org, facebook_org)
VALUES ('Diana', 'Alaroker', 'alarokerd@gmail.com', '+256 782 376 257', 'GGF', '2018', 'Alumni', '2000-08-08', true, 'Alaroker Diana', 'http://www.yolred.org', '@Yolred_Uganda', 'https://www.instagram.com/yolred_ngo', 'Yolred - Youth Leaders for Restoration and Development')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, facebook, website, twitter_org, instagram_org, facebook_org)
VALUES ('Geoffrey', 'Omony', 'omonyjeff@gmail.com', '+256 773 348 688', 'GGF', '2018', 'Alumni', '2000-12-10', true, '@GeoffreyOmony', 'Omony Geoffrey', 'http://www.yolred.org', '@Yolred_Uganda', 'https://www.instagram.com/yolred_ngo', 'Yolred - Youth Leaders for Restoration and Development')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, website, twitter_org, instagram_org, facebook_org)
VALUES ('Raymond', 'Richard', 'raymondrichard67@yahoo.com', '17736585270', 'GGF', '2018', 'Alumni', 'Raymond Richard', 'http://www.brothersstandingtogether.com', '@BrothersStand', '@brothersstand', 'Brothers Standing Together - BST')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook, website)
VALUES ('Michelle', 'Kuiper', 'emmajanekuip@gmail.com', '15026122585', 'GGF', '2018', 'Alumni', '1969-12-08', false, '@Michellekuiper4', '@kuip2', 'Michelle Brooks Kuiper', 'https://www.kasap.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, facebook, website, twitter_org, instagram_org, facebook_org)
VALUES ('Cynthia', 'Austin', 'shynesd@gmail.com', '16196433941', 'GGF', '2018', 'Alumni', '1975-07-19', false, 'http://twitter.com/cynthia.luvlee', 'Cynthia Luvlee', 'https://www.shynesd.org', '@shynesandiego', '@shynesandiego', 'Shyne San Diego')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, facebook, facebook_org)
VALUES ('Robert', 'Biekman', 'passab39@yahoo.com', '17739285220', 'CPF', '2019', 'Alumni', '2020-04-05', true, '@PassaBee', 'Robert Biekman', 'Chicago ATI Collaborative')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, website, facebook_org)
VALUES ('Velvian', 'Boswell', 'velvian@cwapchicago.org', '17737074381', 'CPF', '2019', 'Alumni', 'Velvian Boswell', 'https://cwapchicago.org', 'Chicago Women''s AIDS Project')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook_org)
VALUES ('Pamela', 'Butts', 'pdbutts.neca@gmail.com', '17735384957', 'CPF', '2019', 'Alumni', '2000-10-24', true, 'New Eclipse Community Alliance-NECA')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook, website, facebook_org)
VALUES ('Robin', 'Cline', 'rcline@neighbor-space.org', '17734129629', 'CPF', '2019', 'Alumni', '2000-07-04', true, 'Robin Cline', 'http://neighbor-space.org', 'Neighbor-Space')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook_org)
VALUES ('Jeanette', 'Coleman', 'jcole1226@gmail.com', '17734937500', 'CPF', '2019', 'Alumni', '2000-12-26', true, 'I Am My Brother''s Keeper Unity Day')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, facebook, website, twitter_org, facebook_org)
VALUES ('Lisa', 'Daniels', 'ldaniels@dbefoundation.org', '17082991034', 'CPF', '2019', 'Alumni', '2000-02-18', true, '@LisaDDaniels', 'Lisa D. Daniels', 'https://www.dbefoundation.org', '@DBECenter', 'Darren B. Easterling Center for Restorative Practices')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook, website, facebook_org)
VALUES ('Dawn', 'Hodges', 'drhodges@imanicommunity.org', '17737579682', 'CPF', '2019', 'Alumni', '1980-02-23', false, 'Dawn Hodges', 'http://imanicommunity.org', 'IMANI Community Development Corporation')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook_org)
VALUES ('Sokoni', 'Karanja', 'maat2016sk@yahoo.com', '13123428161', 'CPF', '2019', 'Alumni', '2000-02-11', true, '2016 MA''AT')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook, website, facebook_org)
VALUES ('Diane', 'Latiker', 'dianekob@hotmail.com', '13126470089', 'CPF', '2019', 'Alumni', '1957-01-22', false, '@dianekob', '@latikerdiane', 'Diane Latiker', 'https://kidsofftheblock.us', 'Kids Off the Block, Inc. (KOB)')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, website, twitter_org, instagram_org, facebook_org)
VALUES ('Frank', 'Latin', 'frank.latin@westsidewriting.org', '13124985857', 'CPF', '2019', 'Alumni', '2000-08-16', true, 'http://www.westsideproject.org', '@WestsideProject', '@westsidemediaproject', 'Westside Media Project')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, website, twitter_org, facebook_org)
VALUES ('Adi', 'Lerner', 'adi@westsidejustice.org', '13128741808', 'CPF', '2019', 'Alumni', 'Adi Lerner', 'https://www.westsidejustice.org', '@Westside_JC', 'Westside Justice Center')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, website, instagram_org, facebook_org)
VALUES ('Alex', 'Levesque', 'amgmentoring@gmail.com', '17735630034', 'CPF', '2019', 'Alumni', 'https://automotivementoringgroup.wordpress.com', '@automotivementoringgroup', 'Automotive Mentoring Group')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, facebook, website, twitter_org, facebook_org)
VALUES ('Jacquelyn "Jackie"', 'Moore', 'roboticslady@gmail.com', '17738173621', 'CPF', '2019', 'Alumni', '2000-05-10', true, '@Roboticslady', 'Jackie Moore', 'https://about.me/roboticslady', '@LevelUPChgo', 'LevelUP Makerspace')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, website, twitter_org, instagram_org, facebook_org)
VALUES ('Johnny', 'Payton', 'johnnypayton34@yahoo.com', '17736540286', 'CPF', '2019', 'Alumni', 'Johnny Payton', 'http://www.brothersstandingtogether.com', '@BrothersStand', 'https://www.instagram.com/brothersstand', 'Brothers Standing Together - BST')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, instagram, facebook, website, facebook_org)
VALUES ('Pamela', 'Phoenix', 'drphoenix26@gmail.com', '13123470796', 'CPF', '2019', 'Alumni', '2000-07-27', true, '@Phoenix.alkaline', 'Phoenix Holistics', 'https://www.phoenix8lifesolutions.com', 'Phoenix Life Solutions')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, website, facebook_org)
VALUES ('Gloria', 'Smith', 'gloria@blackstarproject.org', '17732859600', 'CPF', '2019', 'Alumni', 'Gloria Smith', 'https://www.blackstarproject.org', 'Black Star Project')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook, website, twitter_org, instagram_org, facebook_org)
VALUES ('Jamila', 'Trimuel', 'jtrimuel@lovchicago.org', '13123398475', 'CPF', '2019', 'Alumni', '2000-04-06', true, '@MrsLadyofVirtue', '@mrsladyofvirtue', 'Jamila Makini Trimuel', 'https://www.lovchicago.org', '@LOVChicago', '@LOVChicago', 'Ladies Of Virtue, NFP Transforming Lives. Destined for Greatness.')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, website, facebook_org)
VALUES ('Maria', 'Velazquez', 'mvelazquez@tcepchicago.org', '17735341403', 'CPF', '2019', 'Alumni', '1967-04-27', false, 'https://www.tcepchicago.org/about-us', 'Telpochcalli Community Education Project - TCEP')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, facebook, website, instagram_org, facebook_org)
VALUES ('Mona', 'Antwan', 'mona@mindfulnessleader.org', '17737151782', 'CPF', '2020', 'Alumni', 'www.linkedin.com/in/mona-antwan-85a938109', 'https://www.facebook.com/mona.antwan', 'www.mindfulnessleader.org', 'www.instagram.com/mindfulness_leader', 'www.facebook.com/Mindfulnessleader')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, website, instagram_org, facebook_org)
VALUES ('Quilen', 'Blackwell', 'qblackwell@chicagoecohouse.org', '17733584227', 'CPF', '2020', 'Alumni', 'https://www.linkedin.com/in/quilen-blackwell-2b00781', 'https://www.chicagoecohouse.org', 'https://www.instagram.com/chicagoeco', 'https://www.facebook.com/ChicagoEcoHouse')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, facebook, website, twitter_org, instagram_org, facebook_org)
VALUES ('Victoria', 'Brady', 'victoriabrady@abjchicago.org', '1773-209-4586', 'CPF', '2020', 'Alumni', 'https://www.linkedin.com/in/pastor-victoria-c-brady-925104124', 'https://www.facebook.com/profile.php?id=100012650464996', 'http://www.abjchicago.org', 'https://twitter.com/abjchicago', 'https://www.instagram.com/a.b.j.community.services', 'https://www.facebook.com/abjchicago')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, instagram)
VALUES ('Marqus', 'Crockett', 'loveartliveart@gmail.com', '17734015969', 'CPF', '2020', 'Alumni', 'https://www.instagram.com/holygos')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, website)
VALUES ('Michelle', 'Day', 'mday2@sbcglobal.net', '1312 852 8520', 'CPF', '2020', 'Alumni', 'https://www.linkedin.com/in/michelle-day-246a294', 'https://www.nehemiahtrinityrising.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, website, instagram_org, facebook_org)
VALUES ('David', 'Gonzalez', 'dhgonzalez@theportministries.org', '14019969661', 'CPF', '2020', 'Alumni', 'https://www.linkedin.com/in/david-gonzalez-8615484', 'http://www.theportministries.org', 'https://www.instagram.com/portministries', 'https://www.facebook.com/theportministries')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, website, twitter_org, instagram_org)
VALUES ('La''Keisha', 'Gray-Sewell', 'lakeisha@girlslikemeproject.org', '17735993490', 'CPF', '2020', 'Alumni', '2020-09-03', true, 'http://www.girlslikemeproject.org', 'https://twitter.com/MrsGirlsLikeMe', 'https://www.instagram.com/mrsgirlslikeme')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, website, twitter_org, facebook_org)
VALUES ('Michael', 'Henderson', 'mghendersong@yahoo.com', '15672889741', 'CPF', '2020', 'Alumni', 'https://www.facebook.com/profile.php?id=100044636823008', 'https://www.ucanchicago.org', 'https://twitter.com/UCANchicago', 'https://www.facebook.com/UCANChicagoland')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook, website, facebook_org)
VALUES ('Philip', 'Jackson', 'pastorphil@thefcac.org', '1-773-398-6764', 'CPF', '2020', 'Alumni', '2020-01-28', true, 'https://twitter.com/PastorPhilJ', 'https://www.instagram.com/pastorphilj', 'https://www.facebook.com/PastorPhilJackson1', 'https://thefcac.org', 'https://www.facebook.com/thefirehouse.communityarts')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, instagram, instagram_org)
VALUES ('AnnaMaria', 'Leon', 'amjleon5@gmail.com', '14143395537', 'CPF', '2020', 'Alumni', 'https://www.instagram.com/amjleon', 'https://www.instagram.com/permaculturechicago')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, website, facebook_org)
VALUES ('Jennifer', 'Maddox', 'jmaddox@futureties.org', '(773) 218-5510', 'CPF', '2020', 'Alumni', '2020-09-10', true, 'https://futureties.org', 'https://www.facebook.com/afterschoolandsummermatters')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, website, facebook_org)
VALUES ('Pamela', 'Montgomery-Bosley', 'pambosley551@gmail.com', '1773-744-6144', 'CPF', '2020', 'Alumni', 'https://www.linkedin.com/in/pamela-montgomery-bosley-3a30723a', 'https://purposeoverpain.net/about-us', 'https://www.facebook.com/purposeoverpain2007')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, website, facebook_org)
VALUES ('Damen "Damien"', 'Morris', 'dmorris@breakthrough.org', '17736212089', 'CPF', '2020', 'Alumni', 'https://www.linkedin.com/in/damen-morris-0703b68b', 'https://www.breakthrough.org', 'https://www.facebook.com/BreakthroughChicago')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, facebook, website, twitter_org, instagram_org, facebook_org)
VALUES ('Margaret', 'Murphy-Webb', 'mmjazzcop@gmail.com', '17739833352', 'CPF', '2020', 'Alumni', '2020-01-30', true, 'https://www.linkedin.com/in/margaret-murphy-webb-aa441ba3', 'https://www.facebook.com/JazzPolice', 'http://southsidejazzcoalition.org', 'https://twitter.com/SSJCoalition', 'https://www.instagram.com/ssjcjazz', 'https://www.facebook.com/TheSouthSideJazzCoalition')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, website, twitter_org, instagram_org, facebook_org)
VALUES ('Cosette', 'Nazon-Wilburn', 'cwilburn@luvinstitute.org', '17089834612', 'CPF', '2020', 'Alumni', 'https://www.linkedin.com/in/cosettewilburn', 'http://www.luvinstitute.org', 'https://twitter.com/luvinstitute', 'https://www.instagram.com/luv_institute', 'https://www.facebook.com/luvinstitute')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, website, twitter_org, facebook_org)
VALUES ('Meghan', 'Olson', 'meghan@oneforonechicago.org', '13123151229', 'CPF', '2020', 'Alumni', '2020-07-07', true, 'https://www.linkedin.com/in/meghan-olson-3a4780b8', 'https://www.oneforonechicago.org', 'https://twitter.com/oneforonechi', 'https://www.facebook.com/oneforonechicago')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, instagram, website)
VALUES ('Tameka', 'Walton', 'tamekawalton123@gmail.com', '13128606296', 'CPF', '2020', 'Alumni', '2000-01-23', true, 'https://www.linkedin.com/in/tameka-walton-81a5b870', 'https://www.instagram.com/iam_tameka', 'www.restoredhopechicago.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, website, twitter_org, facebook_org)
VALUES ('Joseph', 'Williams', 'mr.dadsfathersclub@gmail.com', '13125860752', 'CPF', '2020', 'Alumni', 'https://mrdadsfathersclub.com', 'https://twitter.com/MrDadsEnglewood', 'https://www.facebook.com/mr.dadsfathersclub')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, instagram, facebook, website, twitter_org, instagram_org, facebook_org)
VALUES ('Marvinetta', 'Woodley-Penn', 'mpenn@globalgirlsinc.org', '13123207779', 'CPF', '2020', 'Alumni', '2000-04-02', true, 'https://www.linkedin.com/in/marvinetta-woodley-penn-41380b11', 'https://www.instagram.com/marvinettapenn', 'https://www.facebook.com/marvinetta', 'https://www.globalgirlsinc.org', 'https://twitter.com/globalgirlsinc1', 'https://www.instagram.com/globalgirlsinc', 'https://www.facebook.com/GlobalGirlsInc')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, website)
VALUES ('Angelina', 'Zayas', 'zayasiliana@gmail.com', '17734103790', 'CPF', '2020', 'Alumni', '2020-08-24', true, 'https://www.gapcommunitycenter.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook_org)
VALUES ('Mekazin', 'Alexander', 'powerfulmzin99@gmail.com', '773 600 9044', 'CPF', '2021', 'Alumni', 'Earl''s Garden Mae''s Kitchen Zuna (Facebook address)')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, website, facebook_org)
VALUES ('Pilar', 'Audain', 'wrapyourbeyouty@gmail.com', '773 727 7918', 'CPF', '2021', 'Alumni', 'FB: Trinigyal Pilar Audain Reed', 'www.pilarsplanet.com', 'WrapYourbeyouty')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Darius', 'Ballinger', 'djballinger23@gmail.com', '312 504 6719', 'CPF', '2021', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, instagram, facebook, website, twitter_org, instagram_org, facebook_org)
VALUES ('Tia', 'Brown', 'tbrownhouseexperience@yahoo.com', '773 220 6194', 'CPF', '2021', 'Alumni', 'www.instagram.com/mrstiabrown7', 'https://www.facebook.com/Mrs.TiaBrown', 'www.TheBrownHouseExperience.com', 'twitter.com/thebrownhouse7', 'instagram.com/thebrownhouseexperience', 'facebook.com/thebrownhouseexperience')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Maretta', 'Brown-Miller', 'maretta.brownmiller@gmail.com', '773 307 4743', 'CPF', '2021', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, twitter, facebook)
VALUES ('Vince', 'Carter', 'vince.carter1327@gmail.com', '312 520 0905', 'CPF', '2021', 'Alumni', 'https://www.linkedin.com/in/vince-carter-6943b237?original_referer=https%3A%2F%2Fduckduckgo.com%2F', 'https://twitter.com/ProjectEdPlus', 'https://www.facebook.com/vince.carter.14606')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, facebook)
VALUES ('Christopher', 'Crater', 'ccrater@obama.org', '773 808 3539', 'CPF', '2021', 'Alumni', 'https://www.linkedin.com/in/christopher-crater-23ba99103?original_referer=https%3A%2F%2Fduckduckgo.com%2F', 'https://www.facebook.com/kanye.krater')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, website, instagram_org, facebook_org)
VALUES ('Nicole', 'Davis', 'talk2mefoundation@gmail.com', '773 531 3794', 'CPF', '2021', 'Alumni', 'https://www.talk2mefoundation.org', 'https://www.instagram.com/talk2mefoundation', 'https://www.facebook.com/talk2mefoundation2014')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, website)
VALUES ('Rashada', 'Dawan', 'admin@bfliproductions.org', '773 544 5856', 'CPF', '2021', 'Alumni', 'www.Facebook.com/RashadaDawan', 'www.bfliproductions.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook)
VALUES ('Messiah', 'Equiano', 'mequiano@gmail.com', '773 979 2383', 'CPF', '2021', 'Alumni', 'Facebook.com/MessiahEquiano')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, website, facebook_org)
VALUES ('Reshorna', 'Fitzpatrick', 'reshorna@gmail.com', '773 297 1189', 'CPF', '2021', 'Alumni', 'https://www.facebook.com/reshorna.fitzpatrick.5', 'WWW.Stonetemplechurch.org', 'https://www.facebook.com/stonetemple3622')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, instagram_org, facebook_org)
VALUES ('Raynetta', 'Greenleaf', 'greenleafmotivationinc@gmail.com', '773 469 8661', 'CPF', '2021', 'Alumni', 'https://www.instagram.com/greenleafmotivationinc', 'https://www.facebook.com/profile.php?id=100063466899521')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, twitter, website, instagram_org, facebook_org)
VALUES ('Maureen', 'Hallagan', 'maureen.hallagan@marillacstvincent.org', '847 219 9403', 'CPF', '2021', 'Alumni', 'https://www.linkedin.com/company/msvchicago/mycompany', 'https://twitter.com/MSVChicago', 'www.marillacstvincent.org', 'https://www.instagram.com/MSVChicago', 'https://www.facebook.com/MarillacSt.VincentFamilyServices')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, website, facebook_org)
VALUES ('Juliet', 'Jones', 'tossbeachdrummers@gmail.com', '312 753 9662', 'CPF', '2021', 'Alumni', 'www.64thstreetbeachdrummers.org', 'https://www.facebook.com/people/The-Original-Sixty-Fourth-Street-Beach-Drummers-Inc/100069709661090')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, website, facebook_org)
VALUES ('Bertha', 'Purnell', 'mothersonamission28@gmail.com', '224 409 9870', 'CPF', '2021', 'Alumni', 'https://www.facebook.com/bertha.purnell.71', 'https://www.mothersonamission28.org', 'https://www.facebook.com/MothersOnAMission28')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, biography, program, cohort, status)
VALUES ('Tony', 'Raggs', 'tonyraggso1@yahoo.com', '773 918 5440', 'Faciltator', 'Goldin Institute', 'Chicago', 'In addition to his role as a Facilitator for the Chicago Peace Fellows, Tony is the Outreach Program Manager at the Alliance of Local Service Organizations (ALSO) with more than 20 years of experience working in various capacities for nonprofit organizations in Chicago. In the last 20 years, his experience has included many years of violence prevention work in the city. He has served as a volunteer outreach worker in West Humboldt Park and West Garfield Park, and, later, an outreach supervisor in West Humboldt Park. Most recently, he worked as a Program Coordinator at Breakthrough Urban Ministries. Over the years, he has also worked as a community activist for Bethel New Life. Tony’s background includes a dynamic creative side; he once worked as an illustrator and short story writer for Windy City Word, which was published on Chicago’s West Side. At ALSO, Tony says that “This work is about changing minds and saving lives.”', 'CPF', '2021', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, facebook, website, facebook_org)
VALUES ('Andrea D', 'Reed', 'info@greaterroselandchamber.org', '7082599240', 'CPF', '2021', 'Alumni', 'https://www.linkedin.com/andrea-d-reed', 'https://www.facebook/andreadreed.com', 'www.greaterroselandchamber.org', 'https://www.facebook/greaterroselandchamber.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, instagram, website, twitter_org, facebook_org)
VALUES ('Randy', 'Sadler', 'randyssadler@gmail.com', '708 299 8800', 'CPF', '2021', 'Alumni', 'Urban_enstein', 'nabsw.org', '@Chicago11CAPS', 'Block Club 1100 Facebook
Monticello Garden Project Facebook
Chicago Assoication of Black Social Workers Facebook
National Association of Black Social Workers Facebook
Vecinos Unidos Facebook
11th District CPD Facebook
Danny K Davis Facebook')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, website)
VALUES ('Oscar', 'Sanchez', 'oscar@asechicago.org', '773 484 5738', 'CPF', '2021', 'Alumni', 'http://southeastyouthalliance.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, website, facebook_org)
VALUES ('Dorothy', 'Thompson', 'bullyingpreventionawareness365@gmail.com', '773 410 2008', 'CPF', '2021', 'Alumni', 'https://www.facebook.com/do.thompson.9', 'www.bullyingprevention365.org', 'https://www.facebook.com/BullingPreventionandAwarenessEveryday')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, website, facebook_org)
VALUES ('David', 'Rojas Jr.', 'david@ta98.org', '773 808 3233', 'CPF', '2021', 'Alumni', 'IG: david.rojasjr  | FB & Linkedin: David Rojas Jr', 'www.ta98.org', 'https://www.facebook.com/thealliance98')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, facebook, website)
VALUES ('Annette', 'Kelly', 'akelly@4usyouthdevelopment.org', '708 508 7389', 'CPF', '2021', 'Alumni', 'linkedin.com/in/annettekelly', 'www.facebook.com/fousyouthdevelopmentservices.org', 'www.4usyouthdevelopment.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, facebook)
VALUES ('David', 'Orjuela Fierro', 'davidorjuela19@gmail.com', '5491134638108', 'GGF', '2021', 'Alumni', '1982-02-14', false, 'http://www.linkedin.com/in/davidorjuela', 'https://www.facebook.com/david.orjuela.986')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, facebook)
VALUES ('Mathias', 'Ngong Njoya', 'njoyajz@gmail.com', '237674863017', 'GGF', '2021', 'Alumni', '1985-12-30', false, 'http://www.linkedin.com/in/njoyamathias', 'www.facebook.com/NjoyaMathias')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, facebook, facebook_org)
VALUES ('Luz Jennifer', 'Divantoque Naranjo', 'jenniferdivantoquen@gmail.com', '57 3214213200', 'GGF', '2021', 'Alumni', '1992-04-22', false, 'https://www.linkedin.com/in/jennifer-divantoque-41b777180', 'https://www.facebook.com/JenniferDivantoqueN/about_contact_and_basic_info', 'https://www.facebook.com/Mingaiaa')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook)
VALUES ('Luc', 'Mukamba', 'lucmukamba89@gmail.com', '243979351835', 'GGF', '2021', 'Alumni', '2000-11-17', true, 'https://web.facebook.com/profile.php?id=100079927195594')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Valerie', 'Gordon-Williams', 'valeriebgordon@gmail.com', '5147186471', 'GGF', '2021', 'Alumni', '1961-05-14', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter)
VALUES ('Chhavi', 'Bhatia', 'chhavi02@gmail.com', '919988358572', 'GGF', '2021', 'Alumni', '1984-03-02', false, '@mannaadew')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook)
VALUES ('Nicholas Songora', 'Odoll', 'songoranicholas@gmail.com', '254712747656', 'GGF', '2021', 'Alumni', '1988-06-10', false, 'https://www.linkedin.com/in/nicholas-songora-4b00a7466', 'https://mobile.twitter.com/nicholassongora?lang=en', 'https://www.instagram.com/mcsongora', 'https://www.facebook.com/nsongora')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook, facebook_org)
VALUES ('Jennifer Kuwa', 'Henshaw', 'llegal2012_liberia@yahoo.com', '231880741192', 'GGF', '2021', 'Alumni', '1976-11-27', false, 'https://web.facebook.com/jennifer.henshaw.395', 'https://web.facebook.com/LEGAL2012')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook)
VALUES ('John', 'Kamma', 'john.kamma@yahoo.com', '231777930331', 'GGF', '2021', 'Alumni', '1976-06-28', false, 'https://www.linkedin.com/in/john-kamma-4974b9a', 'https://www.facebook.com/john.kamma', '@johnkamma', 'https://www.facebook.com/john.kamma')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook)
VALUES ('Fatmire', 'Ajdari', 'peace@childrensembassy.org.mk.  fatmire.81@live.com', '076421233', 'GGF', '2021', 'Alumni', '1981-04-20', false, 'https://www.facebook.com/fatmire.ajdari.9')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook)
VALUES ('Shazmin', 'Rafeeq', 'shazminrafeeq@gmail.com', '00407424401214', 'GGF', '2021', 'Alumni', '1987-04-06', false, 'https://www.linkedin.com/in/shazminrafeeq', 'https://twitter.com/shazminrafeeq', 'https://www.instagram.com/shaazminblack', 'https://www.facebook.com/shazminrafeeq')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, facebook_org)
VALUES ('Mahdar', 'Tahir', 'mahdartahir@gmail.com', '60162220626', 'GGF', '2021', 'Alumni', '1973-04-24', false, 'https://www.linkedin.com/in/mahdartahir', '@crescentcollective', 'https://www.facebook.com/Mingaiaa')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, facebook, facebook_org)
VALUES ('Sri Ram', 'Timilsina', 'timilsinasri@gmail.com', '9779856032015', 'GGF', '2021', 'Alumni', '1989-02-18', false, 'https://www.linkedin.com/in/sri-ram-timilsina-1b40a1147', 'https://twitter.com/sthatesluv', 'https://www.facebook.com/sthatesluv', 'https://www.facebook.com/groups/2199907796902725')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram)
VALUES ('Ismail', 'Auwal', 'ismaaga6@gmail.com', '2348065895152', 'GGF', '2021', 'Alumni', '1993-01-28', false, '@ismaga6', '@ismaaga')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, instagram, facebook)
VALUES ('Lilian', 'Efobi', 'luxuriantlilian@gmail.com', '23407084120055', 'GGF', '2021', 'Alumni', '1995-09-09', false, 'https://www.linkedin.com/in/lilian-elochukwu-efobi-176191125', 'https://www.instagram.com/lilianefobi/?hl=es', 'https://www.facebook.com/lilian.lilian.56829446')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook, facebook_org)
VALUES ('Andy', 'Alegre', 'dyalegrern@gmail.com', '639171752825', 'GGF', '2021', 'Alumni', '1986-02-25', false, 'https://www.linkedin.com/in/andyalegre', 'https://twitter.com/AndyAlegre', 'https://www.instagram.com/deealegre', 'https://www.facebook.com/andy.alegre1', 'https://www.facebook.com/InternationalJusticeMission')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram)
VALUES ('Berry', 'Behr', 'berrybehr@gmail.com', '27 (0)766721932', 'GGF', '2021', 'Alumni', '1963-12-06', false, 'https://www.linkedin.com/in/rev-berry-behr-76aa8b1a2', '@berrygargan
@berry_rev', '@berrybehr')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter)
VALUES ('Zeenat', 'Ebrahim', 'zeenatebrahim0@gmail.com', '27789152054', 'GGF', '2021', 'Alumni', '1996-02-24', false, 'https://www.linkedin.com/in/zeenat-ebrahim-10243087', '@Zeenat01Ebrahim')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook)
VALUES ('Lupai Samuel Kenyi', 'Stephen', 'sambrolupai@gmail.com', '2110924878738', 'GGF', '2021', 'Alumni', '1990-07-22', false, 'https://www.linkedin.com/in/lupai-samuel-kenyi-stephen-a6849a121', '@lupaisambro', '@lupaisambro', '@lupaisambro')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook)
VALUES ('Arpeeta Shams', 'Mizan', 'arpeeta.mizan@bristol.ac.uk', '8801711180481', 'GGF', '2021', 'Alumni', '1989-12-05', false, 'https://www.linkedin.com/in/arpeeta-shams-mizan-00bba76a', '@arpeetasm', '@arpeetasm', 'https://www.facebook.com/arpeetasm')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter)
VALUES ('Gopal', 'Iyer', 'gopal.iyer@newcastle.ac.uk', '44 07947793470', 'GGF', '2021', 'Alumni', '1980-08-24', false, 'https://www.linkedin.com/in/dr-gopal-iyer-70b2908', '@gkiyer')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook)
VALUES ('Blake', 'Stoner', 'blake@vngle.com', '4043452054', 'GGF', '2021', 'Alumni', '1994-09-29', false, 'https://www.linkedin.com/in/blakestoner', 'https://www.twitter.com/iamblakestoner', 'https://www.instagram.com/iamblakestoner', 'https://facebook.com/vnglestories')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram)
VALUES ('Nonnel', 'Galaviz-Johnson', 'nonnel.themovefgcu@gmail.com', '6363850219', 'GGF', '2021', 'Alumni', '1997-09-29', false, 'https://www.linkedin.com/in/nonnelgalavizjohnson', 'https://twitter.com/Nonnersss', 'https://www.instagram.com/nonnel_galaviz/?hl=es')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram)
VALUES ('Munyaradzi', 'Dzimunwe', 'mpdzimun@gmail.com', '263785908955', 'GGF', '2021', 'Alumni', '1980-04-14', false, '@NyarieDN', 'https://www.instagram.com/nyariedn')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, instagram, facebook, website, twitter_org, facebook_org)
VALUES ('Daniel', 'Allen', 'daniel.allen@divinepurposeyouth.org', '17737169733', 'CPF', '2022', 'Alumni', 'https://www.instagram.com/danallen1906', 'https://www.facebook.com/daniel.allen.7737769', 'http://www.divinepurposeyouth.org', 'https://twitter.com/ccpama', 'https://www.facebook.com/CCPMAA')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, website, instagram_org, facebook_org)
VALUES ('Sylvia', 'Del Raso', 'sylvia@chicagoyouthboxingclub.org', '17734264481', 'CPF', '2022', 'Alumni', 'https://www.linkedin.com/in/sylvia-del-raso-03ba3915', 'http://chicagoyouthboxingclub.org', 'https://www.instagram.com/cybc_boxing', 'https://www.facebook.com/CYBCBoxer')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, instagram, facebook)
VALUES ('Tina', 'Gulley-Augustus', 'tinaaugustus@elevateservices.net', '1773-931-2145', 'CPF', '2022', 'Alumni', 'https://www.instagram.com/tinaaugustus', 'https://www.facebook.com/tina.augustus.3')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, website)
VALUES ('Guillermo', 'Gutierrez', 'ggutierrez@enlacechicago.org', '17739196828', 'CPF', '2022', 'Alumni', 'https://www.enlacechicago.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, instagram, website, instagram_org, facebook_org)
VALUES ('Xochitl', 'Hubbell-Fox', 'xochitlhfox@territorychicago.org', '1-815-708-2910', 'CPF', '2022', 'Alumni', 'https://www.linkedin.com/in/xochitl-h-b1867412a', 'https://www.instagram.com/xoycheese', 'https://www.territorychicago.org', 'https://www.instagram.com/territorynfp', 'https://www.facebook.com/TerritoryAP')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, twitter, twitter_org, facebook_org)
VALUES ('Lindsey', 'Joyce', 'longlin55@gmail.com', '18475021616', 'CPF', '2022', 'Alumni', 'https://twitter.com/RevLJoyce', 'https://twitter.com/united_rogers', 'https://www.facebook.com/ucrogerspark')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin)
VALUES ('Edwin', 'Martinez', 'edwin@centrosanar.org', '17737592419', 'CPF', '2022', 'Alumni', 'https://www.linkedin.com/in/edwin-martinez-58493958')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, instagram, facebook, website, twitter_org, instagram_org)
VALUES ('Pha’Tal', 'Perkins', 'iamphatal@thinkoutsidedablock.org', '13122964130', 'CPF', '2022', 'Alumni', 'https://www.instagram.com/iamphatal', 'https://www.facebook.com/IAmPhatal', 'http://www.thinkoutsidedablock.org', 'https://twitter.com/thinkoutdablock', 'https://www.instagram.com/thinkoutsidedablock')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, facebook_org)
VALUES ('Maria', 'Pike', 'mariapike@hotmail.com', '17739684174', 'CPF', '2022', 'Alumni', 'https://www.facebook.com/maria.pike.319', 'www.facebook.com/chicago.survivors')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, instagram)
VALUES ('Jarmiah', 'Scott', 'heartcry090602@gmail.com', '16188822052', 'CPF', '2022', 'Alumni', 'https://www.instagram.com/heart_.cry')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, facebook, website, twitter_org, facebook_org)
VALUES ('Jamika', 'Smith', 'teenaslegacy@gmail.com', '17736783638', 'CPF', '2022', 'Alumni', '2020-10-13', true, 'https://www.linkedin.com/in/jamika-smith-2a8b1014', 'https://www.facebook.com/jamika.jacksonsmith', 'www.teenaslegacy.com', 'https://twitter.com/TeenasLegacy', 'https://www.facebook.com/teenalegacy')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, instagram, facebook, website, twitter_org, instagram_org, facebook_org)
VALUES ('Omar', 'Torres-Kortright', 'omar.torres@segundoruizbelvis.org', '17737507544', 'CPF', '2022', 'Alumni', 'www.linkedin.com/in/omar-torres-kortright-15b54a48', 'https://www.instagram.com/thechirican', 'www.Facebook.com/Torres.Kortright', 'http://segundoruizbelvis.org', 'https://twitter.com/SRBCC', 'https://www.instagram.com/segundoruizbelvis', 'www.Facebook.com/SRBCC')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Jacqueline', 'Williams', 'jackie15776@yahoo.com', '17084664633', 'CPF', '2022', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, twitter, facebook_org)
VALUES ('Donald', 'Williams', 'dwilliamsdew@deonjwilliamsfoundation.org', '13125041605', 'CPF', '2022', 'Alumni', 'https://twitter.com/dwilliamsdew', 'https://www.facebook.com/groups/392023929082205')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Diana Rocio', 'Gomez Torres', 'drociogt@gmail.com', '541139239238', 'ESP', '2022', 'Alumni', '1980-01-28', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Eva Martina', 'Gamboa', 'evachaco@gmail.com', '5491150034989', 'ESP', '2022', 'Alumni', '1958-02-28', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Gladys Lorena', 'Terrazas Arnez', 'lorena.terrazas@gmail.com', '70139446', 'ESP', '2022', 'Alumni', '1983-07-13', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Nora Gabriela', 'Fuentealba Rivas', 'nfuentealbarivas@gmail.com', '56978093268', 'ESP', '2022', 'Alumni', '1985-10-16', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Maria', 'Balaguera Villa', 'mbalaguerav@gmail.com', '573138579233', 'ESP', '2022', 'Alumni', '1996-03-23', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Julio Cesar', 'Pulido Castillo', 'escucharycontar@gmail.com', '3102505024', 'ESP', '2022', 'Alumni', '1983-10-01', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Johnatan', 'Cordoba Rivas', 'johnatancr1@gmail.com', '3173978120', 'ESP', '2022', 'Alumni', '1996-11-07', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Leydi Manuela', 'Mosquera Palacios', 'leydimanuela@funseop.org', '3207051978', 'ESP', '2022', 'Alumni', '1995-09-18', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Omar Arturo', 'Diaz Martinez', 'dima.artu@gmail.com', '573052980844', 'ESP', '2022', 'Alumni', '1990-05-13', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Geiner Alfonso', 'Arrieta Hurtado', 'galenopaz83@gmail.com', '3218962689', 'ESP', '2022', 'Alumni', '1983-05-11', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Jaquelin Maria', 'Ladeutt Herazo', 'jladeutt@gmail.com', '3012618912', 'ESP', '2022', 'Alumni', '1969-04-06', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Luis Alejandro', 'Alomia', 'alomiarodallega15@gmail.com', '3135321127', 'ESP', '2022', 'Alumni', '2004-06-27', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Martha Cecilia', 'Portocarrero Mosquera', 'mporto16@yahoo.es', '3206940387', 'ESP', '2022', 'Alumni', '1979-12-08', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Ernst Djeride', 'Jean-Baptiste', 'jdjeride@yahoo.fr', '50935074578', 'ESP', '2022', 'Alumni', '1992-01-09', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Nuria', 'Gracia Puigarnau', 'jadcoproductions@gmail.com', '34602069023', 'ESP', '2022', 'Alumni', '1966-07-30', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Janneth', 'Wilches Hernandez', 'manislinda@hotmail.com', '643012739', 'ESP', '2022', 'Alumni', '1982-01-06', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Maria Andrea', 'Avendano Valderrama', 'andrea.avendano90@gmail.com', '12396035826', 'ESP', '2022', 'Alumni', '1998-07-16', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Desiree Natasha', 'Duque Torres', 'natashaduque35@gmail.com', '573213785697', 'ESP', '2022', 'Alumni', '1987-02-20', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, instagram)
VALUES ('Anisa', 'Fejzo', 'blurasana@gmail.com', '3550677273660', 'GGF', '2022', 'Alumni', '1989-11-11', false, 'https://www.linkedin.com/in/anisa-fejzo-40a676145', 'https://www.instagram.com/tourism4education_al')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, facebook, website)
VALUES ('Ananda Kumar', 'Biswas', 'anandakumds18@gmail.com', '8801723840955', 'GGF', '2022', 'Alumni', '1993-05-05', false, 'https://www.linkedin.com/in/ananda-kumar-biswas-a8b216225', 'https://www.facebook.com/bdpeacebuilder', 'http://www.anandakbiswas.com')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter_org, facebook_org)
VALUES ('James', 'Offuh', 'offuhjames@gmail.com', '2250707072853', 'GGF', '2022', 'Alumni', '1972-05-07', false, 'https://twitter.com/ufpaci', 'https://www.facebook.com/www.ufpacidialogue.net?ref=hl')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook)
VALUES ('Nii Armah', 'Kwaku Tagoe', 'nii4brown@gmail.com', '233247814110', 'GGF', '2022', 'Alumni', '1993-02-10', false, 'https://www.linkedin.com/in/nii-armah-kwaku-tagoe', 'https://twitter.com/niiarmahktagoe', 'https://www.instagram.com/hon_niiarmahkwakutagoe', 'https://www.facebook.com/niiarmah.tagoe.9')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter_org, instagram_org, facebook_org)
VALUES ('Florence', 'Adhiambo', 'keunites@gmail.com', '254704781695', 'GGF', '2022', 'Alumni', '1995-10-19', false, 'https://twitter.com/Kenya_Unites', 'https://www.instagram.com/keunites', 'https://web.facebook.com/KenyaUnites')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, facebook_org)
VALUES ('Ishmael', 'Amini', 'aminishmael01@gmail.com', '265999303540', 'GGF', '2022', 'Alumni', '1985-11-11', false, 'https://www.linkedin.com/in/amini01cedgdf', 'https://twitter.com/AminiIshmael', 'https://www.facebook.com/ced.gdf')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, instagram, facebook)
VALUES ('Santoshi', 'Wagle', 'waglesantoshi@gmail.com', '9779846771757', 'GGF', '2022', 'Alumni', '1994-10-12', false, 'https://www.instagram.com/cntoshi_timilsina2015', 'https://www.facebook.com/profile.php?id=100009062649973')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook, website)
VALUES ('Oluchi Achi', 'Uzodimma', 'oluchiauzodimma@gmail.com', '2347030070399', 'GGF', '2022', 'Alumni', '1977-02-26', false, 'https://www.linkedin.com/in/oluchi-achi-uzodimma-542213202', 'https://twitter.com/Oluchified26', 'http://www.instagram.com/Oluch_ified', 'https://www.facebook.com/charity.achi', 'www.childshieldinitiative.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, instagram, facebook)
VALUES ('Klementina', 'Dobrevska', 'klementinadobrevska@gmail.com', '070 393 668', 'GGF', '2022', 'Alumni', '1998-12-25', false, 'https://www.linkedin.com/in/klementinadobrevska', 'https://www.instagram.com/dobrevska_', 'https://www.facebook.com/klementinadobrevska')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook)
VALUES ('Saro', 'Imran', 'muhammadsarimimran@gmail.com', '00923336773337', 'GGF', '2022', 'Alumni', '1992-08-21', false, 'https://www.linkedin.com/in/saro-imran', 'https://twitter.com/SaroImran', 'https://www.instagram.com/saroimranpk', 'https://web.facebook.com/sarim.imran')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, facebook)
VALUES ('Abdul Rahman', 'Kowa', 'kowaarahman@gmail.com', '23288524784', 'GGF', '2022', 'Alumni', '1984-02-03', false, 'https://www.linkedin.com/in/abdul-rahman-kowa-4ab2a990', 'https://twitter.com/Lordbizzo', 'https://www.facebook.com/abdul.r.kowa')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook, website)
VALUES ('Laura', 'Nicks', 'lauranicks1688@yahoo.com', '501-363-3678', 'GGF', '2022', 'Alumni', '1967-03-24', false, 'https://twitter.com/LauraBe84262970', 'https://www.instagram.com/laura.berry.96558', 'https://www.facebook.com/laura.berry.96558', 'Decarceratear.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, website, instagram_org, facebook_org)
VALUES ('David', 'Metler', 'davemetler@gmail.com', '12488191711', 'GGF', '2022', 'Alumni', '1987-07-04', false, 'https://www.linkedin.com/company/cen-nonprofit', 'https://eqeducation.org', 'https://www.instagram.com/eqeducation', 'https://www.facebook.com/CENnonprofit')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, website)
VALUES ('Richard', 'Mugobo', 'richard.mugobo@gmail.com', '263776187466', 'GGF', '2022', 'Alumni', '1986-01-24', false, 'https://www.linkedin.com/in/mugobo-richard', 'https://twitter.com/RichardMugobo', 'https://www.instagram.com/richardmugobo', 'www.thebigconvo.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, website, twitter_org, instagram_org, facebook_org)
VALUES ('Abdullah', 'Pratt', 'apratt313@gmail.com', '+13126180918', 'CPF', '2023', 'Alumni', '1989-03-13', false, 'https://www.linkedin.com/in/abdullah-hasan-pratt-44581173', 'https://twitter.com/DocOffTheBlock', 'https://www.instagram.com/doc_off_the_block', 'https://medceep.com', 'https://twitter.com/DocOffTheBlock', 'https://www.instagram.com/doc_off_the_block', 'https://www.facebook.com/people/Ucmceep/100083394786256')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, website, instagram_org, facebook_org)
VALUES ('Alexandra', 'Auguste', 'aauguste@clfellows.org', '+16176455783', 'CPF', '2023', 'Alumni', '1976-03-27', false, 'https://www.linkedin.com/in/alexandra-auguste-630010b1', 'https://clfellows.org', 'https://www.instagram.com/clfchi', 'https://www.facebook.com/CLFellows')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, website, twitter_org, instagram_org, facebook_org)
VALUES ('Antwan', 'McHenry', 'nobelneighborschicago@gmail.com', '+17737270170', 'CPF', '2023', 'Alumni', '1976-10-22', false, 'https://www.linkedin.com/in/antwan-mchenry-b5a2681a', 'https://nobelneighbors.org', 'https://twitter.com/NobelNeighbors', 'https://www.instagram.com/nobelneighbors', 'https://www.facebook.com/NobelNeighbors')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook)
VALUES ('Beria', 'Hampton', 'beria@pcrchi.org', '+17738225580', 'CPF', '2023', 'Alumni', '1977-04-19', false, 'https://www.facebook.com/beria.hampton')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, website, instagram_org, facebook_org)
VALUES ('Carlil', 'Pittman', 'carlil@gkmcenglewood.com', '+17735446628', 'CPF', '2023', 'Alumni', '1993-04-22', false, 'https://www.linkedin.com/in/carlil-pittman-a323098a', 'https://twitter.com/CarlilPittman', 'https://www.gkmcenglewood.com', 'https://www.instagram.com/gkmc_englewood', 'https://www.facebook.com/carlil.pittman')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, facebook_org)
VALUES ('Cecilia', 'Victory', 'ccvictory@stonetemple.org', '+18473220249', 'CPF', '2023', 'Alumni', '1969-10-21', false, 'https://www.linkedin.com/in/cecilia-victory-18a8348a', 'https://flavafood4thesoul.com')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook_org)
VALUES ('Ceola', 'Henderson-Bryant', 'cbrthome5134@gmail.com', '+1773-616-7909', 'CPF', '2023', 'Alumni', '2023-02-27', true, 'https://www.facebook.com/people/CBR-Tranquility/100067420621690')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, instagram, facebook, website, twitter_org, instagram_org)
VALUES ('Devonta', 'Boston', 'devontaboston@gmail.com', '+17737596060', 'CPF', '2023', 'Alumni', '1996-12-27', false, 'https://www.linkedin.com/in/devonta-boston-495598140', 'https://www.instagram.com/tgitae_', 'https://www.facebook.com/devonta.boston', 'https://www.tgimovement.com', 'https://twitter.com/TGiMovement', 'https://www.instagram.com/tgimovement')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook, website, instagram_org, facebook_org)
VALUES ('Ernest', 'Dawkins', 'ernestdawkins@sbcglobal.net', '+17732216385', 'CPF', '2023', 'Alumni', '1953-11-02', false, 'https://www.linkedin.com/in/ernest-dawkins-4269bb141', 'https://twitter.com/ErnestDawkins', 'https://www.instagram.com/dawkins.ernest', 'https://www.facebook.com/ernest.k.dawkins', 'https://englewoodjazzfest.org', 'https://www.instagram.com/livethespiritresidency', 'https://www.facebook.com/profile.php?id=100064269002537')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, facebook, website, instagram_org, facebook_org)
VALUES ('Jonathan', 'Johnson', 'jonathanjohnson788@gmail.com', '+17085374644', 'CPF', '2023', 'Alumni', '1993-05-14', false, 'https://www.linkedin.com/in/jonathanjohnson1', 'https://www.facebook.com/jonathan.johnson.589100?mibextid=LQQJ4d', 'https://maypoleavecoc.org', 'https://www.instagram.com/maypoleavecoc', 'https://www.facebook.com/profile.php?id=100064753806565')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook, website, instagram_org, facebook_org)
VALUES ('Kanesha', 'Walker Amaro', 'flippedconsciousinc@gmail.com', '+17736239208', 'CPF', '2023', 'Alumni', '1990-01-20', false, 'https://www.facebook.com/kanesha.walker.5', 'https://flippedconsciousin.wixsite.com/heartleadmind', 'https://www.instagram.com/flippedconsciousinc', 'https://www.facebook.com/FlippedConscious')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, website)
VALUES ('Lauryn', 'Collins', '6.collins.lauryn.2011@gmail.com', '+17733019429', 'CPF', '2023', 'Alumni', '1999-05-14', false, 'https://www.woodlawnrj.org/about')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, website)
VALUES ('Lyana', 'Funches', 'lfunches@chicagocares.org', '+17085778765', 'CPF', '2023', 'Alumni', '1985-01-10', false, 'https://www.linkedin.com/in/lyanafunches', 'https://www.chicagocares.org/s')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, website)
VALUES ('Diane', 'Deaderick DeMartra', 'justforyougirlfriend@gmail.com', '+1-312-505-1689', 'CPF', '2023', 'Alumni', '1950-12-13', false, 'https://www.linkedin.com/in/diane-deaderick-demartra-729b2814a', 'https://justforyougirlfriend.org/about-us')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, website)
VALUES ('Mary', 'Long', 'marylong9686@yahoo.com', '+13129781491', 'CPF', '2023', 'Alumni', 'http://sacredgroundministries.com')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, facebook, website, twitter_org, instagram_org, facebook_org)
VALUES ('Nachelle', 'Pugh', 'nachellep@johnwaltfoundation.org', '+17734509053', 'CPF', '2023', 'Alumni', '2023-10-03', true, 'https://www.linkedin.com/in/nachelle-pugh-40bb6842', 'https://www.facebook.com/nachelle.pugh', 'https://www.johnwaltfoundation.org', 'https://twitter.com/JohnWaltFdn', 'https://www.instagram.com/johnwaltfdn', 'https://www.facebook.com/johnwaltfoundation')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, facebook, website)
VALUES ('Nate', 'Tubbs', 'natetubbs@gmail.com', '+1-312-550-6290', 'CPF', '2023', 'Alumni', '1985-01-26', false, 'https://www.linkedin.com/in/natetubbs', 'https://twitter.com/nptubbs', 'https://www.facebook.com/natetubbs', 'https://islandchicago.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, facebook, website, twitter_org, instagram_org, facebook_org)
VALUES ('Sandra', 'Bivens', 'alexisbivensltd@yahoo.com', '+17732853401', 'CPF', '2023', 'Alumni', '2023-12-08', true, 'https://www.linkedin.com/in/sandra-bivens-126ba6225', 'https://www.facebook.com/sandra.bivens.127', 'http://www.51ststreetchicago.com', 'https://twitter.com/51stBA_Chicago', 'https://www.instagram.com/51stba_chicago', 'https://www.facebook.com/51stStBA')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, facebook, website)
VALUES ('Tomi', 'Moore', 'tmoore820@gmail.com', '+17739926039', 'CPF', '2023', 'Alumni', '1964-08-20', false, 'https://www.linkedin.com/in/atetomimoore', 'https://www.facebook.com/justmemato', 'https://themonroefoundation.org/business')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, website, twitter_org, instagram_org, facebook_org)
VALUES ('Trevor', 'Lester', 'tles91@yahoo.com', '+13128885421', 'CPF', '2023', 'Alumni', '1991-05-17', false, 'https://contextos.org/chicago', 'https://twitter.com/ContextosChi', 'https://www.instagram.com/contextoschi', 'https://www.facebook.com/ConTextosChi')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, website, instagram_org, facebook_org)
VALUES ('Yaritza', 'Guillen', 'createwithyari@gmail.com', '+13128663718', 'CPF', '2023', 'Alumni', '1993-08-28', false, 'https://www.linkedin.com/in/yaritza-guillen-0a18a786', 'yaritzaguillen.com', 'https://www.instagram.com/neighborspace', 'https://www.facebook.com/NeighborSpace')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, instagram, facebook, website, instagram_org)
VALUES ('Zahra', 'Glenda Baker', 'zahrafair25@gmail.com', '+17738141851', 'CPF', '2023', 'Alumni', '1958-07-25', false, 'https://www.linkedin.com/in/zahra-baker-33ba0496', 'https://www.instagram.com/zahramalika', 'https://www.facebook.com/zahra.g.baker', 'https://www.harmonyhopeandhealing.org', 'https://www.instagram.com/harmony_hope_healing')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook)
VALUES ('Beatriz', 'Cabanillas Sáez', 'beatriz.cabanillas@gmail.com', '56962313212', 'ESP', '2023', 'Alumni', '1974-06-20', false, 'https://facebook.com/libertia.chilensis')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, instagram_org, facebook_org)
VALUES ('Claudia', 'Cartes Paredes', 'claudia.a.cartes.p@gmail.com', '56987264345', 'ESP', '2023', 'Alumni', '1976-02-24', false, 'comunidadautista_nacto', 'Comunidad Autista-Nacimiento')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, instagram)
VALUES ('Edward', 'Doglia Jesus', 'edwarddogliasjc@yahoo.es', '573114571393', 'ESP', '2023', 'Alumni', '1984-04-25', false, 'https://instagram.com/ejdoglia?igshid=ZDdkNTZiNTM=')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook, instagram_org, facebook_org)
VALUES ('Yoana', 'Florez Nuñez', 'jhoamarflorez@gmail.com', '573188938535', 'ESP', '2023', 'Alumni', '1983-07-06', false, 'https://www.facebook.com/jhoanna.florez?mibextid=ZbWKwL', 'https://instagram.com/jhoannaflorez2?igshid=ZGUzMzM3NWJiOQ==', 'https://www.facebook.com/profile.php?id=100085426818696&mibextid=ZbWKwL')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook, facebook_org)
VALUES ('Dilia', 'Cordoba Castro', 'diliacordoba1968@gmail.com', '50762566006', 'ESP', '2023', 'Alumni', '1968-04-06', false, 'https://www.facebook.com/dilia.cordoba.9?mibextid=ZbWKwL', 'asociacion de mujeres recicladoras del medio baudo')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, instagram_org, facebook_org)
VALUES ('Juanita', 'Alvarez Castano', 'jarensijansi@gmail.com', '573045518179', 'ESP', '2023', 'Alumni', '1983-04-13', false, 'Teatro Tironeta', '@Teatro Tironeta', 'Teatro Tironeta')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook)
VALUES ('Eduar', 'Martinez de Arco', 'edenma7@gmail.com', '573205280506', 'ESP', '2023', 'Alumni', '1993-09-07', false, 'https://twitter.com/Edenma7Martinez?t=e7_CUkpg3TgjsCEcobaG8w&s=09', 'https://www.instagram.com/eduarenriquemartinezde', 'https://web.facebook.com/eduar.e.martinez.dearco')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook, facebook_org)
VALUES ('Sergio', 'Ernesto Cabrera', 'palomasproyecto162@gmail.com', '5352969396', 'ESP', '2023', 'Alumni', '1971-06-28', false, 'https://www.facebook.com/profile.php?id=100015432668108&mibextid=ZbWKwL', 'https://www.facebook.com/profile.php?id=100066908178646')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, instagram, facebook, instagram_org, facebook_org)
VALUES ('Elena', 'Lorac Pies', 'loracpies18@gmail.com', '8492085145', 'ESP', '2023', 'Alumni', '2023-04-18', true, 'ElenaLorac', 'ElenaLorac', 'ElenaLorac', '@Reconoci.do', '@Reconoci.do')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook)
VALUES ('Mario', 'Serrano', 'marioserranomarte@gmail.com', '18283226227', 'ESP', '2023', 'Alumni', '1968-11-23', false, '@Mserranomarte', '@Mario Serrano Marte', 'https://www.facebook.com/mario.serranomarte/?locale=br_FR')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook, website, facebook_org)
VALUES ('Helder', 'Lopez Escobar', 'lopez.helder1997@gmail.com', '50489525101', 'ESP', '2023', 'Alumni', '1997-11-10', false, 'https://www.facebook.com/RedHonduras', 'https://twitter.com/helder_ariel', '@helder2967', 'https://es-la.facebook.com/people/Helder-L%C3%B3pez/pfbid0Em9xxUqZ65CPnWnkd46a7msYuqRMe2V88jPwxC6MWowUXtjCdvufX8W3qMAsczi3l', 'https://www.facebook.com/PGCCNCG', 'https://www.facebook.com/PGCCNCG')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook, instagram_org, facebook_org)
VALUES ('Farida', 'Acevedo Castro', 'facevedo.ve@gmail.com', '525520149348', 'ESP', '2023', 'Alumni', '1977-11-04', false, '@humanoylibre', '@facevedo.ve', 'Farida Acevedo', '@humanoylibre', 'Humano y Libre')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, website, instagram_org, facebook_org)
VALUES ('David', 'Catejon Fernandez', 'musico_david@hotmail.com', '50762566006', 'ESP', '2023', 'Alumni', '1977-01-10', false, 'David Castejon', 'https://www.sinfronteraspo.org/aboutUs', '@orgsinfronteras', 'Orgsinfronteras Panama')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, instagram, facebook)
VALUES ('Yexis', 'Yhoxely Guzman', 'yexisg@gmail.com', '595976115082', 'ESP', '2023', 'Alumni', '1981-07-10', false, 'yexis.guzman', 'Yexis Guzman')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, website, instagram_org, facebook_org)
VALUES ('Martha', 'Fernandez Albornett', 'mfdeortiz@gmail.com', '51993055415', 'ESP', '2023', 'Alumni', '1971-09-11', false, 'https://www.linkedin.com/in/martha-fernandez-albornett-1578837a', '@AlbornettMartha', 'www.appv.pe', 'https://www.instagram.com/martha_fernandez_albornett', 'https://www.facebook.com/martha.fernandezalbornett')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, instagram, facebook)
VALUES ('Jessenia', 'Pariona Moran', 'jesseniaparionaa@gmail.com', '51952179748', 'ESP', '2023', 'Alumni', '1998-06-15', false, 'https://www.instagram.com/jesseniapariona', 'https://www.facebook.com/jessenia.pm.7')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, instagram, facebook, website, twitter_org, instagram_org, facebook_org)
VALUES ('Jennifer', 'Batista Torres', 'jennylex91@gmail.com', '79360004955', 'ESP', '2023', 'Alumni', '1991-12-20', false, 'https://www.linkedin.com/in/jennifer-batista-torres-716b9611b', 'https://www.instagram.com/jenni.batistatorres', 'https://www.facebook.com/jenni.batistatorres', 'https://linktr.ee/jennylex91', 'https://twitter.com/AsesorAteneo?t=kOGdnW574uLigoPdg4lqsg&s=09', 'https://www.instagram.com/ateneo_asesor', 'https://www.facebook.com/Ateneo-Asesor-Académico-111743804751486')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook)
VALUES ('Karymn', 'Salcedo', 'salcedokarymn@hotmail.com', '13054500076', 'ESP', '2023', 'Alumni', '1972-05-30', false, 'https://twitter.com/Kary_vzla', 'https://www.instagram.com/karymsalcedo', 'https://www.facebook.com/karym.salcedo')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, instagram, facebook, instagram_org)
VALUES ('Andrew', 'Quintero', 'quinteroanezandrew@gmail.com', '584241893556', 'ESP', '2023', 'Alumni', '1994-05-18', false, 'https://l.instagram.com/?u=https%3A%2F%2Fwww.linkedin.com%2Fin%2Fandrew-quintero-134a65165&e=AT1oLCnvAHUqwKq5jwwkjTvBfs0ZLj-ax3YmkF4J0xaZdAGotZamyWWyW-7O7pj3bq6DovQgVpA_BO67bST8SgkXE3UpvZn20UVQgHw', 'https://instagram.com/andrewquinterooficial?igshid=YmMyMTA2M2Y=', 'https://www.facebook.com/andrew.quintero.1818?mibextid=LQQJ4d', 'https://instagram.com/compromisoco?igshid=NTc4MTIwNjQ2YQ==')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, instagram, facebook)
VALUES ('Yuraima', 'Becerra Vargas', 'yuraimabecerra76@gmail.com', '573123292749', 'ESP', '2023', 'Alumni', '1976-12-30', false, 'https://www.instagram.com/yumeca_0904', 'https://www.facebook.com/yuraimavictoria.becerravargas?mibextid=ZbWKwL')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, facebook)
VALUES ('Nensi', 'Dragoti', 'nensidragoti1@gmail.com', '+355674818500', 'GGF', '2023', 'Alumni', '1991-05-20', false, 'https://www.linkedin.com/in/nensi-dragoti-45582996', 'https://www.facebook.com/nensi.dragoti')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook)
VALUES ('Farah Naj', 'Jahan', 'farahnajjahan@gmail.com', '+8801728289671', 'GGF', '2023', 'Alumni', '1994-06-14', false, 'https://twitter.com/FarahNajJahan1?t=kzzTawzrbvtlBvqqBrd46Q&s=07', 'https://instagram.com/farahnajjahan19?igshid=ZDdkNTZiNTM=', 'https://www.facebook.com/aninaidita.mou?mibextid=ZbWKwL')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram, facebook)
VALUES ('Rubin', 'Nyandwi', 'rubinnyandwi@yahoo.fr', '+25769086546', 'GGF', '2023', 'Alumni', '1983-10-08', false, 'https://twitter.com/NyandwiR', 'https://www.instagram.com/rubinnyandwi', 'https://www.facebook.com/rubin.nyandwi')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook, website)
VALUES ('Emilia', 'Miki', 'emimagique13@gmail.com', '+237677985413', 'GGF', '2023', 'Alumni', '1988-11-13', false, 'https://www.linkedin.com/in/emily-miki-95632777', 'https://www.twitter.com/Emily_Efeti', 'https://www.instagram.com/emilymikiofficial', 'https://www.facebook.com/efeti.miki.emily?mibextid=LQQJ4d', 'https://www.denismikifoundation.cm')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, facebook)
VALUES ('Mahlet', 'Sebsibe Haile', 'mahi4tw@gmail.com', '+251975370050', 'GGF', '2023', 'Alumni', '1998-05-31', false, 'https://www.linkedin.com/in/mahlet-sebsibe-haile-427158185', 'https://twitter.com/HaileMahlet', 'https://www.facebook.com/mahlet.sebsibe.7')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, website)
VALUES ('Maxo', 'Etienne', 'emaxo1986@gmail.com', '+1 850 938 7422', 'GGF', '2023', 'Alumni', '1986-03-04', false, 'https://fonahaiti.wordpress.com')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook, website)
VALUES ('Tarun', 'Masapeta', 'tmasapeta@gmail.com', '+91 7702698384', 'GGF', '2023', 'Alumni', '2002-01-10', false, 'https://www.linkedin.com/in/tarun-masapeta', 'https://twitter.com/TMasapeta', 'https://instagram.com/tmasapeta?igshid=YmMyMTA2M2Y=', 'https://www.facebook.com/profile.php?id=100077745556993', 'https://teamprojecteifl.wixsite.com/projecteifl')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, facebook)
VALUES ('Gresë', 'Sermaxhaj', 'sermaxhajgrese@gmail.com', '+38349722994', 'GGF', '2023', 'Alumni', '1992-12-27', false, 'https://www.linkedin.com/in/grese-sermaxhaj-ab8527251', 'https://twitter.com/sermaxhajgrese', 'https://www.facebook.com/gresesermaxhaj?mibextid=LQQJ4d')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Hajra', 'Hussein', 'hajrahussein97@gmail.com', '±265993762475', 'GGF', '2023', 'Alumni', '1999-09-08', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook, website)
VALUES ('Amadou', 'Dicko', 'amdoudicko@gmail.com', '+22376453545', 'GGF', '2023', 'Alumni', '1989-12-26', false, 'https://www.linkedin.com/in/amadou-nasrou-dicko-024722a5', 'https://twitter.com/nasrou_dicko?t=4CvOYHbRsq2ijbtNcR2l6A&s=08', 'https://instagram.com/amdoudicko?igshid=NTc4MTIwNjQ2YQ==', 'https://www.facebook.com/AmadouNasrouDicko?mibextid=LQQJ4d', 'https://www.appids.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, facebook, website)
VALUES ('Mohammad Ayatulla', 'Rahaman', 'mdayatulla2012@gmail.com', '+977-9849667159', 'GGF', '2023', 'Alumni', '1992-08-26', false, 'https://www.facebook.com/mohammadayatullarahaman', 'https://www.nepalunites.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook)
VALUES ('Godson', 'Nwanko', 'iamgodsonnwankwo@gmail.com', '+2348135609614', 'GGF', '2023', 'Alumni', '1993-05-11', false, 'http://www.linkedin.com/in/godsonk', 'https://twitter.com/GodsonK_', 'https://www.instagram.com/godsonk_', 'https://www.facebook.com/godsonn3')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Maria Cristina', 'Pasion', 'mcnpasion@gmail.com', '(02)09162929045', 'GGF', '2023', 'Alumni', '1976-06-19', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, website)
VALUES ('Abdoul Aziz', 'BA', 'baazizabdoul@yahoo.fr', '00221781760171', 'GGF', '2023', 'Alumni', '1956-03-15', false, 'https://abdoulazizwaha.mixsite/mcpc')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, website, instagram_org, facebook_org)
VALUES ('Kurt', 'Isaacs', 'kurtisaac@gmail.com', '+27765686111', 'GGF', '2023', 'Alumni', '1974-03-21', false, 'https://www.linkedin.com/in/kurt-isaacs-a1501813', 'https://www.sawubonaza.org', 'https://www.instagram.com/authenticengagement', 'https://www.facebook.com/sawubona')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, facebook, instagram_org)
VALUES ('Jill', 'Langhus-Griffin', 'jill@liluye.org', '34-634-351-174', 'GGF', '2023', 'Alumni', '1970-10-11', false, 'https://www.linkedin.com/in/jlanghus', 'https://www.twitter.com/jlanghus', 'https://www.facebook.com/jlanghus', 'https://www.instagram.com/liluyespirit')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Sashikala', 'Lakshman', 'sashikala@sarvodaya.org', '+94-767198305', 'GGF', '2023', 'Alumni', '1983-05-05', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, twitter, instagram)
VALUES ('Vaileth', 'Nicodem Mikao', 'vailethnicodem@gmail.com', '+255785767321', 'GGF', '2023', 'Alumni', '1993-10-18', false, 'https://twitter.com/NicodemVaileth', 'https://instagram.com/vaileth_nicodem')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Patricia', 'Novick', 'pnovick@aliveltd.org', '1-312-692-0230', 'GGF', '2023', 'Alumni', '1947-06-21', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, website)
VALUES ('Kudakwashe', 'Mushonga', 'tichachris21@gmail.com', '+263774329215', 'GGF', '2023', 'Alumni', '1992-12-16', false, 'https://www.linkedin.com/in/kudakwashe-mushonga-262a70123', 'https://twitter.com/chrismedic2', 'https://www.unazimbabwe.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, instagram)
VALUES ('Ana Maria', 'Hernandez', 'anamhern29@gmail.com', '+17735432732', 'CPF', '2024', 'Alumni', 'www.linkedin.com/in/ana-maria-hernandez-470905103', 'Instagram @musicmoveschi; instagram @academic_amigas')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, instagram_org)
VALUES ('Aniki', 'Coates', 'aniki@bethelnewlife.org', '+16305069372', 'CPF', '2024', 'Alumni', 'https://www.instagram.com/bethelnew4950')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Annette', 'Cartman', 'datroannette@yahoo.com', '+17733014245', 'CPF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, website, facebook_org)
VALUES ('Annie', 'Liddell', 'annielliddell@sbcglobal.net', '+17735774742', 'CPF', '2024', 'Alumni', 'www.stpaulcommunityfamilyservices.org', 'St. Paul Community Family Services')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, website)
VALUES ('Anthony', 'Jones', 'anthonyjonesmoreh@gmail.com', '+12248228172', 'CPF', '2024', 'Alumni', 'www.illinoisprisonproject.org, www.secondlook.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, website)
VALUES ('Antonio', 'Daniels', '5500adamsblockclub@gmail.com', '+17739811791', 'CPF', '2024', 'Alumni', 'IG: follow_a_fisher, FB: AntonioRDaniels, IN: Antonio (Tony) Daniels', 'https://www.facebook.com/groups/5500ABC')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, instagram, facebook, website, twitter_org, facebook_org)
VALUES ('Antonio', 'Davis', 'adavis@pavingthewayproject.org', '+17737097179', 'CPF', '2024', 'Alumni', 'https://www.instagram.com/bigantonio2006', 'https://www.facebook.com/antonio.t.davis.9', 'https://pavingthewayproject.org', 'https://www.instagram.com/pavingthewayproject', 'https://www.facebook.com/pavingthewayproject')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, instagram, website, twitter_org, facebook_org)
VALUES ('Ariel', 'Rainey', 'ariel@hustlemommies.org', '+13129729433', 'CPF', '2024', 'Alumni', 'https://www.linkedin.com/in/arielrainey?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app', 'www.instagram.com/ArielDeNey', 'www.HustleMommies.org', 'www.instagram.com/thehustlemommies;', 'https://www.facebook.com/HustleMommies?mibextid=LQQJ4d')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin, facebook)
VALUES ('Ava', 'Hawkins', 'blakesplacechicago@gmail.com', '+17736335442', 'CPF', '2024', 'Alumni', 'www.linkedin.com/in/ava-hawkins', 'Ava Hawkins on FB,')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, website, twitter_org, facebook_org)
VALUES ('Christopher', 'Payne', 'cpainchicago@gmail.com', '+17737188214', 'CPF', '2024', 'Alumni', 'Artology Studio', '@cpainchicago', 'https://www.facebook.com/artologystudiochi')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, website)
VALUES ('Elaine', 'Marthel', 'elaine@projectimpact180.org', '+17735924512', 'CPF', '2024', 'Alumni', 'https://www.facebook.com/elaine.marthel', 'www.projectimpact180.org https://www.facebook.com/ProjectImpact180 instagram: @projectimpact180')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Irynn Ashaki', 'Williams McClain', 'iashakimcclain@gmail.com', '+13122855234', 'CPF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, facebook, facebook_org)
VALUES ('Jason Michael', 'Maldonado', 'jason_bpcf@yahoo.com', '+17792258515', 'CPF', '2024', 'Alumni', 'Jason Michael Maldonado @ Facebook', 'Enlace Chicago @ Facebook')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, linkedin)
VALUES ('Kevin', 'Amaro', 'kevin_amaro@caslservice.org', '+17739123146', 'CPF', '2024', 'Alumni', 'www.linkedin.com/in/kevingamaro')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, website, twitter_org)
VALUES ('Parrish', 'Brown', 'parrishbrownjr@gmail.com', '+13123912838', 'CPF', '2024', 'Alumni', 'https://linktr.ee/Goodlookinout', '@goodlookinoutchi')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status, website)
VALUES ('Pat', 'Day-McCray', 'pday@apathwayfromgrief.com', '+13123154988', 'CPF', '2024', 'Alumni', 'www.apathwayfromgrief.com')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Riccadonna', 'Chaidez', 'ricki.chaidez@gmail.com', '+17737159140', 'CPF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Steve', 'Archer II', 'sarcherii@gmail.com', '+17732185685', 'CPF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Tai', 'Donovan', 'taidonovan2022@gmail.com', '+19149208818', 'CPF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Gayane', 'Khachatryan', 'gayanekhachatryan0@gmail.com', '+37494692094', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Duti', 'Toaha', 'ashfah.duti@gmail.com', '+8801810865236', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Sudesh', 'Pokhrel', 'sudeshpokhrel15@gmail.com', '+97517999241', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Arrey-Echi', 'Agbor-Ndakaw', 'arreyesmi@gmail.com', '+237677237306', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Haftee', 'Wako', 'ergaahafteewaaqoo@gmail.com', '+251911709333', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Huma', 'Nasir', 'nasirhuma0@gmail.com', '+918899057844', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Zohre', 'Solati', 'solati.zohre@gmail.com', '+989213009343', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Sara', 'Sasani', 'sarasasanee@gmail.com', '+989126658366', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Jummah', 'Alsileeni', 'jimjumaa@gmail.com', 'jimjumaa@gmail.com', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Shruti', 'Karki', 'shruti.karki@gmail.com', '+9779843756944', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Celine', 'Osukwu', 'cosukwu@yahoo.com', '+2348137344590', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, program, cohort, status)
VALUES ('Jahan Zaib', 'Ahmed', 'jahanzaibchanna9@gmail.com', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Faisal', 'Ilyas', 'faisaliono@yahoo.com', '+923314491840', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Mark', 'Devon Maitim', 'markdevonmaitim1999@gmail.com', '+639069067059', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Marielle Angelica', 'Keshia Villasper', 'makvillasper@gmail.com', '+639672207368', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Otile', 'Cleopas Edwin', 'cleopasoe@gmail.com', '+256708075451', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Abubaker', 'Sekatuka', 'sekatukabaker92@gmail.com', '+256776519540', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Rachel', 'Biel', 'rayela@comcast.net', '+12709947606', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Sabetha', 'Zulu', 'isazulu0@gmail.com', '+260974505963', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, program, cohort, status)
VALUES ('Charlene', 'Gail Taruwona', 'gailtaru09@gmail.com', '+263772456282', 'GGF', '2024', 'Alumni')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Aaliyah', 'Phillips', 'aaliyah.anniece@gmail.com', '312-560-2581', 'CEO', 'Vessels Being Restored', 'Chicago', 'USA', 'Aaliyah Phillips has over a decade of experience in community organizing, violence prevention, advocacy, youth development, and restorative justice. She is dedicated to reducing trauma, uplifting voices, and promoting peace. Passionate about building lasting relationships with multigenerational families and stakeholders, Aaliyah works to create healing-centered, community-driven solutions for lasting change.', 'CPF', '2025', 'Current', 'Female', 'Austin', '1996-12-06', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Andrea', 'Guzman', 'andrea.x.g@icloud.com', '312-772-1221', 'Senior Program Manager', 'Plant Chicago', 'Chicago', 'USA', 'Andrea X. Guzmán, mother of two sons, from La Villita, has worked in the nonprofit sector for over twenty years. Currently, she is the Senior Program Manager at Plant Chicago. She is passionate about food sovereignty; food as medicine; intergenerational family engagement; addressing health disparities; and, building multidisciplinary collaborations to better serve BIPOC communities.', 'CPF', '2025', 'Current', 'Female', 'New City', '1984-04-25', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Bobby', 'Price', 'bobbydprice@gmail.com', '773-837-5277', 'Founder and Director', 'Lawndale People + Principle Barbers', 'Chicago', 'USA', 'Bobby Price is the Founder and Owner of Principle Barbers, a barbershop that doubles as the charitable arm of the Lawndale People for the Arts and Culture nonprofit. A proud husband and father of three boys, Bobby was born and raised in Chicago''s North Lawndale community, where he is deeply committed to giving back and supporting local arts and culture initiatives.', 'CPF', '2025', 'Current', 'Male', 'North Lawndale', '1973-02-10', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Cecilia', 'Vazquez', 'cvazqu111@gmail.com', '773-600-9730', 'Program Manager', 'Port Ministries', 'Chicago', 'USA', 'Cecilia Vazquez is a program manager at a nonprofit in Chicago’s Back of the Yards neighborhood, overseeing youth and family programs. A first-gen college graduate with a degree in Anthropology, she’s dedicated to creating accessible, culturally aware initiatives. Cecilia also runs a book club that amplifies women of color’s voices and works to uplift marginalized communities, fostering spaces that build collective power and promote positive change.', 'CPF', '2025', 'Current', 'Female', 'New City', '1996-03-19', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Christina', 'Rice', 'christina.rice@globalgirlsinc.org', '773-310-0486', 'Executive Director', 'Global Girls Inc', 'Chicago', 'USA', 'Christina Rice is a visionary using technology to drive community transformation. With experience at Chi Tech Collective, The Sanctuary Chicago, and Global Girls, Inc., she pioneers data-driven strategies, capital access, and tech equity. Christina’s work strengthens communities, empowers institutions, and creates sustainable opportunities for historically overlooked groups, driving impactful social change.', 'CPF', '2025', 'Current', 'Female', 'Woodlawn', '1996-09-19', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Crystal', 'Dyer', 'info@catchtheworld.org', '312-813-6047', 'Founder and Executive Director', 'Chicago Austin Youth Travel Adventures', 'Chicago', 'USA', 'Crystal Dyer is a Chicago native, born and raised on the south side. She moved west in 1988 after receiving a housing grant from the city. As a single parent raising three sons, Crystal’s passion for advocacy grew through supporting families with kindness, respect, and helpful referrals. She is dedicated to assisting others in any way she can, always striving to make a positive impact on her community.', 'CPF', '2025', 'Current', 'Female', 'Austin', '1955-06-06', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Cynthia', 'Olivares', 'cynthia@increasethepeacechicago.org', '773-710-9633', 'Community Organizer', 'Increase The Peace Chicago', 'Chicago', 'USA', 'Cynthia Olivares, born and raised in Chicago’s Back of the Yards neighborhood to an immigrant Mexican family, is deeply connected to her community’s challenges. Through her work with Increase the Peace, she advocates for change and empowerment. Inspired by her family’s experiences with mental illness, Cynthia aims to establish a mental health facility in Back of the Yards to provide crucial resources and support for her community’s well-being.', 'CPF', '2025', 'Current', 'Female', 'Gage Park', '1999-04-02', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Daniel', 'Davenport III', 'dddavenport2412@gmail.com', '312-889-7165', 'Founder and Executive Director', 'Global Love Organization', 'Chicago', 'USA', 'Daniel Davenport III is a community organizer, music artist, drummer, and former basketball player from the Southside of Chicago. Passionate about spreading LOVE(!!!), he’s excited to see what new experiences and connections lie ahead. Daniel is dedicated to making a positive impact and building meaningful relationships while sharing his enthusiasm for music and community.', 'CPF', '2025', 'Current', 'Male', 'Roseland', '2002-02-24', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Darius', 'Caffey', 'darius.caffey@blackalphabet.org', '708-307-4209', 'Director of Institutional Partnerships', 'Black Alphabet', 'Chicago', 'USA', 'Darius Caffey is the Founder of The Closet Unlocked and Director of Institutional Partnerships for Black Alphabet NFP. As an entrepreneur, philanthropist, and media producer, he uses education as a tool to drive systemic change, advocating for the betterment of under-resourced and underrepresented communities. Darius is dedicated to empowering leaders and creating opportunities for positive transformation.', 'CPF', '2025', 'Current', 'Male', 'Douglas', '1994-12-31', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Guillermo', 'Nino', 'gnino@enlacechicago.org', '708-834-4191', 'Lead Outreach Worker', 'Enlace Chicago', 'Chicago', 'USA', 'As lead outreach worker at Enlace, Guillermo Nino mediates violence, prevents retaliation, and connects people to life changing resources. His passion for outreach and commitment to giving back are rooted in his lived experiences growing up in Little Village and witnessing poverty, violence, and disinvestment firsthand. One of his proudest accomplishments has been running a mobile GED program throughout Little Village. He also services the only black community in Little Village, specifically Lawndale Garden and the surrounding blocks.', 'CPF', '2025', 'Current', 'Male', 'South Lawndale', '1974-09-04', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Jackie', 'Hoffman', 'jackie@peacerunners773.com', '770-731-6330', 'Founder and CEO', 'Peace Runners 773', 'Chicago', 'USA', 'Jackie Hoffman, born and raised on Chicago''s West Side, turned his personal weight-loss journey into a mission to inspire others, particularly in marginalized communities. Motivated by his mother’s health transformation through Peace Runners 773, he emphasizes the link between physical health, mental well-being, and self-confidence. Jackie is passionate about using knowledge, motivation, and accountability to empower individuals and create lasting change.', 'CPF', '2025', 'Current', 'Male', 'East Garfield Park', '1989-11-15', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Kimeco', 'Roberson', 'kimeco@honeypotperformance.org', '773-600-4512', 'Ensemble Member', 'Honey Pot Performance', 'Chicago', 'USA', 'Kimeco Roberson (she/her/y''all) has over 20 years of experience in arts administration, youth development, social justice, and civics. She’s held leadership roles at Marwen, Heartland Alliance, CPS, Chicago Park District, After School Matters, and more. A trained circle keeper and Columbia College Chicago graduate, Kimeco is also a creative consultant and ensemble member of Honey Pot Performance.', 'CPF', '2025', 'Current', 'Female', 'East Garfield Park', '1973-03-18', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('LoLita', 'Canady', 'lolita@rosemoorchicago.org', '872-329-0449', 'Executive Director', 'Rosemoor Community Association', 'Chicago', 'USA', 'LoLita Canady leads Rosemoor Community Association as Executive Director/President. Born and raised in Roseland area, she''s a local homeowner and business owner. LoLita combines professional expertise with creative vision to drive neighborhood improvement, while actively volunteering to create lasting change. Her leadership focuses on creativity, vitality, and sustainable development in Rosemoor', 'CPF', '2025', 'Current', 'Female', 'Roseland (Fernwood, Princeton Park, Roseland)', '1983-05-14', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Mercedes', 'Pickett', 'mercedespickett@gmail.com', '312-998-1594', 'Founder and Community Architect', 'Earth''s Remedies Chicago', 'Chicago', 'USA', 'Mercedes Pickett is a data engineer and community architect with over a decade of experience in data analysis and two decades in community development. She supports marginalized communities and is pursuing a Master''s in Health Informatics at DePaul University. Mercedes founded Earth''s Remedies (E.R.) and ER Data Solutions (ERDS) to enhance nonprofit effectiveness and drive positive community impact.', 'CPF', '2025', 'Current', 'Female', 'West Garfield Park', '1991-08-11', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Miranda', 'Standberry-Wallace', 'mirandaw@ueca4help.org', '708-228-1220', 'Board Member', 'Culture Canvas Cafe and Art Gallery', 'Chicago', 'USA', 'Miranda Standberry-Wallace is a scholar-practitioner with 17+ years in higher education, nonprofit leadership, and community engagement. As AD at DePaul’s Steans Center and a member of The Culture Canvas Collective, she fosters asset-based partnerships and economic empowerment. A PhD candidate in Educational Leadership, Miranda is committed to leveraging education, technology, and the arts to drive community transformation and create lasting impact.', 'CPF', '2025', 'Current', 'Female', 'Washington Heights', '1980-08-27', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Nicole', 'Reed', 'nicolesorandom@gmail.com', '773-726-2610', 'Executive Director', 'Still Searching Project', 'Chicago', 'USA', 'Nicole Reed is the Executive Director of The Still Searching Project, a nonprofit using visual and performing arts to raise awareness about missing women and girls in Chicagoland. She recently completed The Wright Shop, a short film showcased at the Voices of the Southside screening during the Black Harvest Film Festival at the Gene Siskel Film Center. Nicole is dedicated to amplifying voices and shedding light on important social issues through creative expression.', 'CPF', '2025', 'Current', 'Female', 'South Shore', '1980-07-20', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Sam', 'Brandstrader', 'sbrandstrader@gmail.com', '312-860-3610', 'Assistant Program Director', 'Southwest Organizing Project', 'Chicago', 'USA', 'Sam Brandstrader holds both a Bachelor''s and Master''s in Urban Planning & Public Policy. He worked at the City of Chicago''s Planned Developments Department before transitioning into real estate development and management. Now expanding into marketing and brand development, Sam also co-founded a safari company in Uganda, promoting holistic tourism. He is passionate about blending urban planning, real estate, and sustainable tourism to create positive community impacts.', 'CPF', '2025', 'Current', 'Male', 'Chicago Lawn', '1995-08-10', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Tyrell', 'Shoemaker', 'tyrell@legacydisciple.org', '573-291-2532', 'Director of J29 Homes', 'Legacy Disciple', 'Chicago', 'USA', 'Tyrell Shoemaker is the J29 Homes Director for Legacy Disciple, with a passion for fostering community transformation through stable, affordable housing. A dedicated husband and father of five, Tyrell has called Chicago home since 2010 and is proud to be part of the East Garfield Park community. He is committed to creating positive change and improving housing opportunities for underserved neighborhoods.', 'CPF', '2025', 'Current', 'Male', 'Roseland', '1985-04-06', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Wanakee', 'Trask', 'wanakee@elevategreatnesschi.org', '773-726-0670', 'Founder and Executive Director', 'Elevate Greatness', 'Chicago', 'USA', 'Wanakee Trask is a visionary educator, advocate, and changemaker. A proud Army National Guard veteran with 10 years of service, she honed resilience and leadership through service. From teaching at Harlan High to co-founding Elevate Greatness, Wanakee empowers students to challenge limitations, connect with mentors, and unlock their potential, creating lasting, equitable impact in education and beyond.', 'CPF', '2025', 'Current', 'Female', 'Roseland', '1989-07-11', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year, linkedin, twitter, instagram, facebook, instagram_org, facebook_org)
VALUES ('Abdul Mufeez', 'Shaheed', 'abdulmshaheed92@gmail.com', '+6798001022', 'Co-Lead Programmes & Organizational Development', 'Oceania Pride', 'Suva', 'Fiji', 'Abdul Mufeez has over 10 years of experience in civic spaces, focusing on youth empowerment, gender, climate change, SOGIESC, human rights, and democracy. His professional roles include resource mobilization, organizational development, grant management, project and program management, budgeting, advocacy, and research. Currently pursuing a Masters in Human Rights and Democratisation, Abdul is dedicated to advancing human rights and democratic values through impactful work and leadership.', 'GGF', '2025', 'Current', '1992-01-26', false, 'https://www.linkedin.com/in/abdulmshaheed', 'https://x.com/abdulmshaheed', 'https://www.instagram.com/abdulmshaheed', 'https://www.facebook.com/abdulmshaheed', 'https://www.instagram.com/oceania_pride_679', 'https://www.facebook.com/OceaniaPride')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year, instagram, instagram_org, facebook_org)
VALUES ('Adiba', 'Aslami', 'aadibaaslami@gmail.com', '93744660758', 'Founder', 'Shakhaee Omid Online Academy', 'Kabul', 'Afghanistan', 'Adiba Aslami, a 23-year-old from Kabul, Afghanistan, graduated in 2021 with a degree in Political Science and Law. Currently studying Computer Science online, she has been involved in online businesses since 2020. In 2021, she founded Shakhaee Omid Online Academy, focusing on empowering girls. Adiba is also the founder of Behbood Foundation, where she continues her work to support and uplift women and girls in her community.', 'GGF', '2025', 'Current', '2000-05-11', true, 'https://www.instagram.com/adi_banajib?igsh=eXlnbjQzdG1hNm9v', 'https://www.instagram.com/behbood_improvement?igsh=MXQ3NWgzaWhod3FyYw==', 'https://www.facebook.com/share/158fXnbkUS/?mibextid=wwXIfr')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Amjad', 'Mohamed-Saleem', 'amjad@paths2people.com', '447941008738', 'Trustee', 'Eduspots', 'Geneva', 'Switzerland', 'Amjad Mohamed-Saleem works for the International Federation of the Red Cross and Red Crescent Societies in Geneva, focusing on strategic engagement for youth, peace, and fundamental principles. He is a research fellow at the Faculty of Education, Universiti Malaya, Malaysia, an adjunct fellow at the Sunway Centre for Planetary Health, and a non-resident fellow at the Centre for Humanitarian Studies in Doha. Amjad is dedicated to advancing humanitarian efforts and global peace through his academic and professional work.', 'GGF', '2025', 'Current', '1978-09-01', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Berlotte', 'Antoine', 'berlotte2000@yahoo.com', '17187497752', 'Senior Paralegal', 'New York Legal Assistance Group (NYLAG)', 'Brooklyn, NY', 'USA', 'Berlotte Antoine is a Licensed Master Social Worker, Public Notary, Paralegal, and human rights advocate. She is pursuing a graduate degree in Public and International Affairs. Berlotte serves as an appointee of the Brooklyn Borough President on her district''s community board, chairing the Parks and Beautification committee. She is also an active member of the Haitian Leadership Forum (HLF), dedicated to improving her community and advancing human rights initiatives.', 'GGF', '2025', 'Current', '1964-08-29', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Charles', 'Esibikhwa Edward', 'charlesesibikhwa@gmail.com', '254113668655', 'Founder', 'Kenyan Program on Pedagogies for Community (KPPC)', 'Nairobi', 'Kenya', 'Charles Esibikhwa Edward is the Director of the Kenyan Program on Pedagogies for Community (KPPC) with over 20 years of experience in community organizing and tribalism engagement in East Africa. He is also an Asset-Based Community Development (ABCD) consultant, partnering with various organizations to promote sustainable development. Charles is dedicated to fostering community empowerment and creating impactful, long-lasting change in East Africa.', 'GGF', '2025', 'Current', '1984-11-27', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year, linkedin, instagram, facebook, facebook_org)
VALUES ('Dhara', 'Patel', 'pateldaraa@gmail.com', '919879156633', 'Founder', 'You are not alone - Human is near you', 'Ahmedabad', 'India', 'Daraa Patel is a journalist focused on social issues, highlighting topics that demand attention for a healthier society. She believes in the need for change and the important roles of journalists, politicians, and advocates in driving it. Daraa runs You Are Not Alone - Human Is Near You, an initiative aimed at reducing mental health accessibility gaps and promoting an inclusive society. She is committed to raising awareness and breaking down barriers for those in need.', 'GGF', '2025', 'Current', '1989-10-08', false, 'https://www.linkedin.com/in/dharaa-patel-23b09630', 'www.instagram.com/_phool_kanwal', 'www.facebook.com/dhara.patel.963', 'https://www.facebook.com/profile.php?id=100068004775394')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Dylan', 'Pereira', 'dylanjpereira01@gmail.com', '+584141182395', 'CEO', 'Youth Forum for Democracy, Dialogue and Reconciliation', 'Caracas', 'Venezuela', 'Dylan Pereira is a Venezuelan social entrepreneur and young professional, graduating Summa Cum Laude with a Liberal Studies degree from Universidad Metropolitana in Caracas and holding a Master’s in Political Action. He is the Editor-in-Chief of Revista Diplomacia, an opinion writer for El Universal, and a political analyst featured in various media outlets. Dylan is dedicated to shaping political discourse and contributing to social impact through his work in media and analysis.', 'GGF', '2025', 'Current', '2000-01-11', true)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Kibwana Ali', 'Gasinya', 'kibwanaa093@gmail.com', '254759265151', 'ICT, Communications and MERL Officer.', 'Manyatta Africa', 'Mombasa', 'Kenya', 'Kibwana Gasinya, from Likoni, Mombasa, Kenya, is driven by the need to address youth unemployment and climate challenges. Witnessing despair due to police brutality and chaos, he harnessed digital innovation and creative arts to train 200+ youth and organize a festival of peace and resilience. Kibwana believes in bridging divides and amplifying voices, where creativity and collaboration foster progress and empower communities toward positive change.', 'GGF', '2025', 'Current', '1999-08-18', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Kouakou Michel', 'Konan', 'konankanmi@gmail.com', '+225 0707 89 57 29', 'Communication Coordinator', 'United for peace against conflicts international', 'Abidjan', 'Côte d’Ivoire', 'Michel KONAN is a journalist, English teacher, and currently serves as a Partnership Assistant at the Ivorian National Commission of Sustainable Development. With 15 years of experience as Groups’ Development and Communications Officer at Amnesty International Ivory Coast, he has been deeply involved in human rights advocacy. A dedicated community peace leader and a 2021 Euphrates PPA alumnus, Michel is committed to peace education as a World Citizen Peace Ambassador, collaborating with WBW to promote global harmony.', 'GGF', '2025', 'Current', '1973-12-04', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Lydia', 'Ayikoru', 'lydiaayikoru90@gmail.com', '+256773097150', 'Refugee Engagement and Participation Coordinator', 'Oxfam', 'Arua', 'Uganda', 'Lydia Ayikoru is a Refugee Engagement and Participation Coordinator at OXFAM Uganda, leading programs that amplify refugee voices in peacebuilding, protection, gender justice, advocacy, and financial support for Refugee-Led Organizations. She holds a law degree from Makerere University and a Postgraduate Diploma in Legal Practice. Lydia is dedicated to empowering refugees and advancing their rights through strategic programs and advocacy.', 'GGF', '2025', 'Current', '1985-05-27', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year, facebook, facebook_org)
VALUES ('Joseph', 'Asare', 'jasare@asaasiamvision.org', '+233 200030441', 'Founder and Programs Director', 'Asaasiam Vision International', 'Nkawkw', 'Ghana', 'Joseph is the founder of Asaasiam Vision International, a nonprofit organization in Ghana. He is passionate about peacebuilding, education for impoverished youth and youth with disabilities, economic empowerment for vulnerable women, and environmental sustainability. Joseph has received a Certificate of Congratulations from the U.S. Department of State for leadership in women’s and gender issues.', 'GGF', '2025', 'Current', '1979-07-21', false, 'https://www.facebook.com/asaredada', 'https://www.facebook.com/Asaasiam')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Maha', 'Jamal Alsileeni', 'mahaalsileeni@gmail.com', '218927751782', 'CEO', 'The Engineering Organization for Development (EOD)', 'Zliten', 'Libya', 'Maha Alsileeni is a feminist activist and human rights advocate, leading the Engineering Organization for Development (EOD) in Libya. She is also the President of the Youth Council at Zliten Municipal Council, where she directs programs focused on women’s leadership, youth participation, and refugee rights advocacy. Maha is dedicated to empowering women and marginalized groups through leadership development and social advocacy in her community.', 'GGF', '2025', 'Current', '1999-04-21', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Amina Murhebwa', 'Marie', 'aminamurh5519@gmail.com', '+243974776970', 'Program Manager', 'GAARJ Organization', 'North Kivu, Goma', 'DR Congo', 'Amina Murhebwa is from the Democratic Republic of Congo, passionate about empowering children and women through education and using art as a therapeutic tool to heal trauma from war. As a playwright and early childhood teacher, she helps youth raise their voices, engage in peacebuilding, and support internally displaced people in conflict zones. Amina is dedicated to fostering healing, resilience, and empowerment through creative expression and education.', 'GGF', '2025', 'Current', '1998-06-09', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Miracle', 'Ogbogu Nmesoma', 'ogbogumiraclesoma@gmail.com', '2349027076488', 'Co-founder', 'Health Alliance Africa', 'Owerri', 'Nigeria', 'Miracle Ogbogu holds a Bachelor''s degree in Genetics and Biotechnology from the University of Calabar, Nigeria, and works as a Graduate Research Assistant. She aims to address health challenges in Sub-Saharan Africa through research and community building. An avid writer, Miracle enjoys creating stories and poems, with one set to be published in Loch Raven Review. She is dedicated to blending scientific research with community-driven solutions to create lasting health impact.', 'GGF', '2025', 'Current', '2002-06-05', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Owais Amin', 'Khan', 'owaisamin001@gmail.com', '916006284682', 'Program Coordinator and Operations Lead', 'The Kashmir Journal', 'Jammu and Kashmir', 'India', 'Owais Amin Khan is a third-year law student at the University of Kashmir and Program Coordinator for Kashmir Journal, where he trains grassroots leaders in peacebuilding and conflict resolution. As a Millennium Fellow and Peace Practice Alliance Global Fellow, Owais uses media and arts to challenge conflict narratives, foster dialogue, and promote reconciliation in Kashmir. He is committed to advancing peace and positive social change in his community through education and collaboration.', 'GGF', '2025', 'Current', '2004-04-02', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status)
VALUES ('Rachel', 'Kamins', 'rachel.eve.kamins1@gmail.com', '972585468544', 'Compliance Officer & Grants Manager', 'The Arava Institute for Environmental Studies', 'Herziliya', 'Israel', 'For the past several years, Rachel has been working in the sustainability and environmental space, beginning with ESG-related projects before transitioning into environmental peacebuilding. Passionate about expanding her network and connecting with like-minded individuals, she is dedicated to integrating her love for the outdoors with her professional aspirations.', 'GGF', '2025', 'Current')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Ruth', 'Mulenga', 'ruthmulenga2020@gmail.com', '260969142541', 'Community of practice leader', 'Mwekera Beekeeping Educational Forum', 'Kitwe', 'Zambia', 'Ruth Mulenga is a trainer at Zambia Forestry College, passionate about natural resource management, climate change, and social impact projects. She works with the Mwekera Beekeeping Educational Forum and leads sustainable programs funded by UNESCO’s SST (Sustainability Starts with Teachers) initiative. Ruth is dedicated to promoting environmental sustainability and empowering communities through education and practical solutions for a greener future.', 'GGF', '2025', 'Current', '1995-12-13', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Sherna Alexander', 'Benjamin', 'shernabenjamin@oabivoices.org', '12606155854', 'Founding Director', 'The Center for Non-Violence, Research and Development', 'Port Of Spain, Woodbrook', 'Trinidad and Tobago', 'Sherna Alexander Benjamin is a socioeconomic sustainability practitioner dedicated to building healthy societies through people, conflict transformation, collaboration, and community. Her national and international awards reflect her work at the intersections of economic development, interpersonal violence prevention, peace, social work, and social innovation. Sherna is committed to creating lasting social change through innovative solutions and community empowerment.', 'GGF', '2025', 'Current', '1973-04-18', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year, twitter_org, facebook_org, website_org)
VALUES ('SM', 'Shaikat', 'info@serac-bd.org', '8801712229381', 'Executive Director', 'SERAC-Bangladesh', 'Dhaka', 'Bangladesh', 'SM Shaikat is a youth development and policy specialist leading SERAC-Bangladesh to advance youth rights, governance, and gender equality. As a former UN-Habitat Youth Advisor, he pioneered Urban Youth Councils and represented Bangladesh at global forums like the UNGA and WUF. A 2024 Young Global Changer Civic Champion and UN Women 30 Under 2030 leader, Shaikat champions inclusive policymaking and works to empower youth for sustainable social change.', 'GGF', '2025', 'Current', '1987-10-22', false, 'https://x.com/Serac_bd', 'https://www.facebook.com/seracbangladesh', 'https://serac-bd.org')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Sonam', 'Palden', 'spsonampalden@gmail.com', '97577442920', 'Founder', 'Happy Bamboo', 'Thimph', 'Bhutan', 'Sonam Palden is a literature student with qualifications in business and management. With a professional background in administration and human resources, her passion lies in climate change and environmental conservation. Since 2021, she has focused on tree plantation using the ''Miyawaki'' method and raising awareness about waste management. Sonam is dedicated to promoting sustainable environmental practices and contributing to a healthier planet through hands-on initiatives and education.', 'GGF', '2025', 'Current', '1986-02-20', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Veronica Ngum', 'Ndi', 'ngumvero29@gmail.com', '237675102899', 'Founder', 'Community Association for Vulnerable Persons (CAVP)', 'Bamenda', 'Cameroon', 'Veronica Ngum Ndi is the CEO of CAVP Bamenda, Cameroon, and a dedicated disability advocate and humanitarian. With extensive local, national, and international experience, she champions the rights of women and girls with disabilities. Veronica works to prevent gender-based violence, promote peace, sexual and reproductive health, education, and empowerment, driving positive change in vulnerable communities and advocating for inclusivity and equal rights.', 'GGF', '2025', 'Current', '1975-09-29', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, birthday, hide_birthday_year)
VALUES ('Yehuda', 'Silverman', 'yehuda.silverman@gmail.com', '16477860259', 'Cultural Exchange Assistant', 'Acquaint', 'Florida', 'USA', 'Yehuda Silverman is a peacebuilding pracademic and Cultural Exchange Assistant at Acquaint, connecting participants from 110+ nations in one-on-one dialogues to strengthen communities. He is also an Instructor at Northwestern University''s Civic Education Project. Yehuda holds a PhD in Conflict Analysis and Resolution with a concentration in International Peace, and is dedicated to fostering understanding, dialogue, and conflict resolution through education and global engagement.', 'GGF', '2025', 'Current', '1988-07-07', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, country, biography, program, cohort, status, gender, community_area, birthday, hide_birthday_year)
VALUES ('Wesley', 'Rodgers', 'railroadtracksmusicacademy@gmail.com', '312-618-9032', 'Executive Director', 'Railroad Tracks Music Academy', 'Chicago', 'USA', 'Wesley Rodgers is a music producer, educator, and entrepreneur dedicated to empowering communities through music. As the founder of Railroad Tracks Music Academy, he provides music education, production, and performance opportunities for youth and artists. Passionate about storytelling and creative expression, Wesley integrates media, technology, and culture to inspire the next generation.', 'CPF', '2025', 'Current', 'Male', 'Washington Park', '1980-04-20', false)
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, biography, status)
VALUES ('Michael', 'Henderson', 'michael@goldininstitute.org', '+1-567-288-9741', 'Director, Chicago Peace Fellows', 'Goldin Institute', 'Chicago', 'Michael Henderson serves as the director of the Chicago Peace Fellows and co-facilitator of the Mutual Aid Collaborative, a joint initiative of the Alumni of the Chicago Peace Fellows program. Prior to joining the Goldin Institute team, Michael served as a Youth Development Coach at UCAN as an expression of his passion for mentoring, life coaching, and helping others succeed. Michael has a decade of successful experience in counseling and community development. A strong believer in the power of positive influence, Michael is a hands-on coach who invests his time and resources in his client’s dreams and goals. Michael is a visionary leader with a vision for youth entrepreneurship and community collaboration. Michael enjoys a good Netflix binge but can also be found in the gym lifting weights or taking a nice run in the Forest Preserve.', 'Staff')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, biography, status)
VALUES ('Burrell', 'Poe', 'burrell@goldininstitute.org', '(773) 715-1928', 'Director, Mutual Aid Collaborative', 'Goldin Institute', 'Chicago', 'Burrell Poe is a U.S. Army Veteran from the West Side of Chicago. Burrell is very passionate about social and environmental justice and dedicates his time to furthering awareness and solutions for these issues. Burrell is on the Emerging Leaders Board at the Mikva Challenge and Compassion It Chicago. Burrell works as a Nonviolence Trainer at the Institute for Nonviolence Chicago.  Currently, Burrell is working with the Goldin Institute Global Associates in Colombia and Uganda to refine a new curriculum on the themes of peacebuilding and tools for forgiveness, compassion and reconciliation.', 'Staff')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, biography, status)
VALUES ('Olivia', 'Possley', 'olivia@goldininstitute.org', '630-272-0647', 'Fellows Support Associate', 'Goldin Institute', 'Chicago', 'Olivia Possley is a graduate student at DePaul University pursuing a degree in Public Health with a concentration in Social Epidemiology. Before pursuing a graduate degree in Public Health, she studied Anthropology and Criminology and Law Studies at Marquette University. Her undergraduate degree informed her decision to pursue Public Health as she is interested in how social factors affect health. Her current area of interest is gun violence prevention. When she is not working or doing school work, you can find her on the couch reading a book or watching movies with friends and family.', 'Staff')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, biography, status)
VALUES ('John', 'Zeigler', 'john@goldininstitute.org', '(773) 931-1215', 'Senior Director', 'Goldin Institute', 'Chicago', 'John Zeigler Jr. is a Senior Director for Programs on the core staff of the Goldin Institute in addition to his role as Director of the Egan Office of Urban Education and Community Partnerships (UECP) and adjunct faculty at DePaul University. He received his bachelor of science at Roosevelt University and a Masters in Social Work from the Jane Addams School of Social Work at University of Illinois in Chicago. John is a faculty member of the Asset Based Community Development (ABCD) Institute. John has worked internationally and believes in the power of building authentic community partnerships that provides a pathway for effective practices, promising ideas, addressing challenges and creating impact.', 'Staff')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, biography, status)
VALUES ('General', 'Facilitator', 'chicagoteamadmin@goldininstitute.org', '(567) 288-9741', 'Chicago Facilitator', 'Goldin Institute', 'Chicago', 'The Facilitation Team for the Chicago Peace Fellows program.', 'Staff')
ON CONFLICT DO NOTHING;

INSERT INTO contacts (first_name, last_name, email, phone, job_title, organization, city, biography, status)
VALUES ('Jayonna', 'Wolf', 'jayonna@goldininstitute.org', '(312) 210-0545', 'Public Ally', 'Goldin Institute', 'Chicago', 'Jayonna is a youth advocate born and raised on the west side of Chicago who is partnered with the Goldin Institute as a 2023 Public Ally. She attended Michigan State University with a major in Human Biology and Child Development. Her career working with youth started in 2021 with the organization, ‘Hope for Kids’ where she made a safe haven for young children by providing games, tutoring, a wide variety of field trips, and many other educational opportunities. In addition, she works with seniors as a home healthcare worker. Jayonna is always volunteering to serve her community by feeding the homeless, giving away clothing, and providing school supplies to children in need. Jayonna hopes to build a career of working with children to better their lives.', 'Staff')
ON CONFLICT DO NOTHING;

-- =============================================
-- Contact roles
-- =============================================

INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'alexandergwanvalla@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'lissymatster@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'anaznidarec@aol.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'emu4jesus@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'datillias@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jamal@anewdawninthenegev.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'famau456@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'djdiezlj@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'toahgbaye@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'ivan8castillon@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'molnar_laura@hotmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'emmarutikanga@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'waberijokar@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'dgetgoing1@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'masanja2110@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'alarokerd@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'omonyjeff@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'raymondrichard67@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'emmajanekuip@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'shynesd@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'passab39@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'velvian@cwapchicago.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'pdbutts.neca@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'rcline@neighbor-space.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jcole1226@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'ldaniels@dbefoundation.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'drhodges@imanicommunity.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'maat2016sk@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'dianekob@hotmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'frank.latin@westsidewriting.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'adi@westsidejustice.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'amgmentoring@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'roboticslady@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'johnnypayton34@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'drphoenix26@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'gloria@blackstarproject.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jtrimuel@lovchicago.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mvelazquez@tcepchicago.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mona@mindfulnessleader.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'qblackwell@chicagoecohouse.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'victoriabrady@abjchicago.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'loveartliveart@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mday2@sbcglobal.net'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'dhgonzalez@theportministries.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'lakeisha@girlslikemeproject.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mghendersong@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'pastorphil@thefcac.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'amjleon5@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jmaddox@futureties.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'pambosley551@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'dmorris@breakthrough.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mmjazzcop@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'cwilburn@luvinstitute.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'meghan@oneforonechicago.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'tamekawalton123@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mr.dadsfathersclub@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mpenn@globalgirlsinc.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'zayasiliana@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'powerfulmzin99@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'wrapyourbeyouty@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'djballinger23@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'tbrownhouseexperience@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'maretta.brownmiller@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'vince.carter1327@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'ccrater@obama.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'talk2mefoundation@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'admin@bfliproductions.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mequiano@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'reshorna@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'greenleafmotivationinc@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'maureen.hallagan@marillacstvincent.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'tossbeachdrummers@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mothersonamission28@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'team' FROM contacts WHERE LOWER(email) = 'tonyraggso1@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'info@greaterroselandchamber.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'randyssadler@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'oscar@asechicago.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'bullyingpreventionawareness365@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'david@ta98.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'akelly@4usyouthdevelopment.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'davidorjuela19@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'njoyajz@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jenniferdivantoquen@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'lucmukamba89@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'valeriebgordon@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'chhavi02@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'songoranicholas@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'llegal2012_liberia@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'john.kamma@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'peace@childrensembassy.org.mk.  fatmire.81@live.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'shazminrafeeq@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mahdartahir@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'timilsinasri@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'ismaaga6@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'luxuriantlilian@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'dyalegrern@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'berrybehr@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'zeenatebrahim0@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'sambrolupai@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'arpeeta.mizan@bristol.ac.uk'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'gopal.iyer@newcastle.ac.uk'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'blake@vngle.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'nonnel.themovefgcu@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mpdzimun@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'daniel.allen@divinepurposeyouth.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'sylvia@chicagoyouthboxingclub.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'tinaaugustus@elevateservices.net'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'ggutierrez@enlacechicago.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'xochitlhfox@territorychicago.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'longlin55@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'edwin@centrosanar.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'iamphatal@thinkoutsidedablock.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mariapike@hotmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'heartcry090602@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'teenaslegacy@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'omar.torres@segundoruizbelvis.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jackie15776@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'dwilliamsdew@deonjwilliamsfoundation.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'drociogt@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'evachaco@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'lorena.terrazas@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'nfuentealbarivas@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mbalaguerav@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'escucharycontar@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'johnatancr1@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'leydimanuela@funseop.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'dima.artu@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'galenopaz83@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jladeutt@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'alomiarodallega15@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mporto16@yahoo.es'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jdjeride@yahoo.fr'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jadcoproductions@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'manislinda@hotmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'andrea.avendano90@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'natashaduque35@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'blurasana@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'anandakumds18@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'offuhjames@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'nii4brown@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'keunites@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'aminishmael01@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'waglesantoshi@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'oluchiauzodimma@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'klementinadobrevska@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'muhammadsarimimran@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'kowaarahman@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'lauranicks1688@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'davemetler@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'richard.mugobo@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'apratt313@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'aauguste@clfellows.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'nobelneighborschicago@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'beria@pcrchi.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'carlil@gkmcenglewood.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'ccvictory@stonetemple.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'cbrthome5134@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'devontaboston@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'ernestdawkins@sbcglobal.net'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jonathanjohnson788@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'flippedconsciousinc@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = '6.collins.lauryn.2011@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'lfunches@chicagocares.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'justforyougirlfriend@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'marylong9686@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'nachellep@johnwaltfoundation.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'natetubbs@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'alexisbivensltd@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'tmoore820@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'tles91@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'createwithyari@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'zahrafair25@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'beatriz.cabanillas@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'claudia.a.cartes.p@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'edwarddogliasjc@yahoo.es'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jhoamarflorez@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'diliacordoba1968@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jarensijansi@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'edenma7@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'palomasproyecto162@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'loracpies18@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'marioserranomarte@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'lopez.helder1997@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'facevedo.ve@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'musico_david@hotmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'yexisg@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mfdeortiz@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jesseniaparionaa@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jennylex91@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'salcedokarymn@hotmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'quinteroanezandrew@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'yuraimabecerra76@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'nensidragoti1@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'farahnajjahan@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'rubinnyandwi@yahoo.fr'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'emimagique13@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mahi4tw@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'emaxo1986@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'tmasapeta@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'sermaxhajgrese@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'hajrahussein97@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'amdoudicko@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mdayatulla2012@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'iamgodsonnwankwo@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mcnpasion@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'baazizabdoul@yahoo.fr'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'kurtisaac@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jill@liluye.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'sashikala@sarvodaya.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'vailethnicodem@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'pnovick@aliveltd.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'tichachris21@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'anamhern29@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'aniki@bethelnewlife.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'datroannette@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'annielliddell@sbcglobal.net'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'anthonyjonesmoreh@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = '5500adamsblockclub@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'adavis@pavingthewayproject.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'ariel@hustlemommies.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'blakesplacechicago@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'cpainchicago@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'elaine@projectimpact180.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'iashakimcclain@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jason_bpcf@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'kevin_amaro@caslservice.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'parrishbrownjr@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'pday@apathwayfromgrief.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'ricki.chaidez@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'sarcherii@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'taidonovan2022@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'gayanekhachatryan0@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'ashfah.duti@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'sudeshpokhrel15@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'arreyesmi@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'ergaahafteewaaqoo@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'nasirhuma0@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'solati.zohre@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'sarasasanee@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jimjumaa@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'shruti.karki@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'cosukwu@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jahanzaibchanna9@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'faisaliono@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'markdevonmaitim1999@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'makvillasper@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'cleopasoe@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'sekatukabaker92@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'rayela@comcast.net'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'isazulu0@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'gailtaru09@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'aaliyah.anniece@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'andrea.x.g@icloud.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'bobbydprice@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'cvazqu111@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'christina.rice@globalgirlsinc.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'info@catchtheworld.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'cynthia@increasethepeacechicago.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'dddavenport2412@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'darius.caffey@blackalphabet.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'gnino@enlacechicago.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jackie@peacerunners773.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'kimeco@honeypotperformance.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'lolita@rosemoorchicago.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mercedespickett@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mirandaw@ueca4help.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'nicolesorandom@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'sbrandstrader@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'tyrell@legacydisciple.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'wanakee@elevategreatnesschi.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'abdulmshaheed92@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'aadibaaslami@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'amjad@paths2people.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'berlotte2000@yahoo.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'charlesesibikhwa@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'pateldaraa@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'dylanjpereira01@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'kibwanaa093@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'konankanmi@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'lydiaayikoru90@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'jasare@asaasiamvision.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'mahaalsileeni@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'aminamurh5519@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'ogbogumiraclesoma@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'owaisamin001@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'rachel.eve.kamins1@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'ruthmulenga2020@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'shernabenjamin@oabivoices.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'info@serac-bd.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'spsonampalden@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'ngumvero29@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'yehuda.silverman@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'fellow' FROM contacts WHERE LOWER(email) = 'railroadtracksmusicacademy@gmail.com'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'team' FROM contacts WHERE LOWER(email) = 'michael@goldininstitute.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'team' FROM contacts WHERE LOWER(email) = 'burrell@goldininstitute.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'team' FROM contacts WHERE LOWER(email) = 'olivia@goldininstitute.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'team' FROM contacts WHERE LOWER(email) = 'john@goldininstitute.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'team' FROM contacts WHERE LOWER(email) = 'chicagoteamadmin@goldininstitute.org'
ON CONFLICT (contact_id, role) DO NOTHING;
INSERT INTO contact_roles (contact_id, role)
SELECT id, 'team' FROM contacts WHERE LOWER(email) = 'jayonna@goldininstitute.org'
ON CONFLICT (contact_id, role) DO NOTHING;

-- =============================================
-- Cohort members
-- =============================================

INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'alexandergwanvalla@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'lissymatster@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'anaznidarec@aol.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'emu4jesus@yahoo.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'datillias@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jamal@anewdawninthenegev.org'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'famau456@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'djdiezlj@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'toahgbaye@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ivan8castillon@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'molnar_laura@hotmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'emmarutikanga@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'waberijokar@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'dgetgoing1@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'masanja2110@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'alarokerd@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'omonyjeff@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'raymondrichard67@yahoo.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'emmajanekuip@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'shynesd@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2018
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'passab39@yahoo.com'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'velvian@cwapchicago.org'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'pdbutts.neca@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'rcline@neighbor-space.org'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jcole1226@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ldaniels@dbefoundation.org'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'drhodges@imanicommunity.org'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'maat2016sk@yahoo.com'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'dianekob@hotmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'frank.latin@westsidewriting.org'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'adi@westsidejustice.org'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'amgmentoring@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'roboticslady@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'johnnypayton34@yahoo.com'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'drphoenix26@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'gloria@blackstarproject.org'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jtrimuel@lovchicago.org'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mvelazquez@tcepchicago.org'
AND co.program = 'CPF' AND co.cohort_year = 2019
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mona@mindfulnessleader.org'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'qblackwell@chicagoecohouse.org'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'victoriabrady@abjchicago.org'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'loveartliveart@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mday2@sbcglobal.net'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'dhgonzalez@theportministries.org'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'lakeisha@girlslikemeproject.org'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mghendersong@yahoo.com'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'pastorphil@thefcac.org'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'amjleon5@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jmaddox@futureties.org'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'pambosley551@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'dmorris@breakthrough.org'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mmjazzcop@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'cwilburn@luvinstitute.org'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'meghan@oneforonechicago.org'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'tamekawalton123@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mr.dadsfathersclub@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mpenn@globalgirlsinc.org'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'zayasiliana@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2020
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'powerfulmzin99@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'wrapyourbeyouty@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'djballinger23@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'tbrownhouseexperience@yahoo.com'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'maretta.brownmiller@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'vince.carter1327@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ccrater@obama.org'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'talk2mefoundation@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'admin@bfliproductions.org'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mequiano@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'reshorna@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'greenleafmotivationinc@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'maureen.hallagan@marillacstvincent.org'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'tossbeachdrummers@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mothersonamission28@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'tonyraggso1@yahoo.com'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'facilitator'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'tonyraggso1@yahoo.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'info@greaterroselandchamber.org'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'randyssadler@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'oscar@asechicago.org'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'bullyingpreventionawareness365@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'david@ta98.org'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'akelly@4usyouthdevelopment.org'
AND co.program = 'CPF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'davidorjuela19@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'njoyajz@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jenniferdivantoquen@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'lucmukamba89@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'valeriebgordon@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'chhavi02@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'songoranicholas@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'llegal2012_liberia@yahoo.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'john.kamma@yahoo.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'peace@childrensembassy.org.mk.  fatmire.81@live.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'shazminrafeeq@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mahdartahir@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'timilsinasri@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ismaaga6@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'luxuriantlilian@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'dyalegrern@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'berrybehr@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'zeenatebrahim0@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'sambrolupai@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'arpeeta.mizan@bristol.ac.uk'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'gopal.iyer@newcastle.ac.uk'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'blake@vngle.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'nonnel.themovefgcu@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mpdzimun@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2021
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'daniel.allen@divinepurposeyouth.org'
AND co.program = 'CPF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'sylvia@chicagoyouthboxingclub.org'
AND co.program = 'CPF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'tinaaugustus@elevateservices.net'
AND co.program = 'CPF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ggutierrez@enlacechicago.org'
AND co.program = 'CPF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'xochitlhfox@territorychicago.org'
AND co.program = 'CPF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'longlin55@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'edwin@centrosanar.org'
AND co.program = 'CPF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'iamphatal@thinkoutsidedablock.org'
AND co.program = 'CPF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mariapike@hotmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'heartcry090602@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'teenaslegacy@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'omar.torres@segundoruizbelvis.org'
AND co.program = 'CPF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jackie15776@yahoo.com'
AND co.program = 'CPF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'dwilliamsdew@deonjwilliamsfoundation.org'
AND co.program = 'CPF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'drociogt@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'evachaco@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'lorena.terrazas@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'nfuentealbarivas@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mbalaguerav@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'escucharycontar@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'johnatancr1@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'leydimanuela@funseop.org'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'dima.artu@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'galenopaz83@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jladeutt@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'alomiarodallega15@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mporto16@yahoo.es'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jdjeride@yahoo.fr'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jadcoproductions@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'manislinda@hotmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'andrea.avendano90@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'natashaduque35@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'blurasana@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'anandakumds18@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'offuhjames@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'nii4brown@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'keunites@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'aminishmael01@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'waglesantoshi@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'oluchiauzodimma@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'klementinadobrevska@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'muhammadsarimimran@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'kowaarahman@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'lauranicks1688@yahoo.com'
AND co.program = 'GGF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'davemetler@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'richard.mugobo@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2022
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'apratt313@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'aauguste@clfellows.org'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'nobelneighborschicago@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'beria@pcrchi.org'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'carlil@gkmcenglewood.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ccvictory@stonetemple.org'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'cbrthome5134@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'devontaboston@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ernestdawkins@sbcglobal.net'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jonathanjohnson788@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'flippedconsciousinc@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = '6.collins.lauryn.2011@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'lfunches@chicagocares.org'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'justforyougirlfriend@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'marylong9686@yahoo.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'nachellep@johnwaltfoundation.org'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'natetubbs@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'alexisbivensltd@yahoo.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'tmoore820@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'tles91@yahoo.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'createwithyari@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'zahrafair25@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'beatriz.cabanillas@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'claudia.a.cartes.p@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'edwarddogliasjc@yahoo.es'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jhoamarflorez@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'diliacordoba1968@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jarensijansi@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'edenma7@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'palomasproyecto162@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'loracpies18@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'marioserranomarte@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'lopez.helder1997@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'facevedo.ve@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'musico_david@hotmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'yexisg@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mfdeortiz@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jesseniaparionaa@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jennylex91@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'salcedokarymn@hotmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'quinteroanezandrew@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'yuraimabecerra76@gmail.com'
AND co.program = 'ESP' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'nensidragoti1@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'farahnajjahan@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'rubinnyandwi@yahoo.fr'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'emimagique13@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mahi4tw@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'emaxo1986@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'tmasapeta@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'sermaxhajgrese@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'hajrahussein97@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'amdoudicko@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mdayatulla2012@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'iamgodsonnwankwo@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mcnpasion@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'baazizabdoul@yahoo.fr'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'kurtisaac@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jill@liluye.org'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'sashikala@sarvodaya.org'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'vailethnicodem@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'pnovick@aliveltd.org'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'tichachris21@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2023
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'anamhern29@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'aniki@bethelnewlife.org'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'datroannette@yahoo.com'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'annielliddell@sbcglobal.net'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'anthonyjonesmoreh@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = '5500adamsblockclub@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'adavis@pavingthewayproject.org'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ariel@hustlemommies.org'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'blakesplacechicago@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'cpainchicago@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'elaine@projectimpact180.org'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'iashakimcclain@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jason_bpcf@yahoo.com'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'kevin_amaro@caslservice.org'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'parrishbrownjr@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'pday@apathwayfromgrief.com'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ricki.chaidez@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'sarcherii@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'taidonovan2022@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'gayanekhachatryan0@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ashfah.duti@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'sudeshpokhrel15@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'arreyesmi@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ergaahafteewaaqoo@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'nasirhuma0@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'solati.zohre@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'sarasasanee@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jimjumaa@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'shruti.karki@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'cosukwu@yahoo.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jahanzaibchanna9@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'faisaliono@yahoo.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'markdevonmaitim1999@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'makvillasper@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'cleopasoe@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'sekatukabaker92@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'rayela@comcast.net'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'isazulu0@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'gailtaru09@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2024
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'aaliyah.anniece@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'aaliyah.anniece@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'andrea.x.g@icloud.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'andrea.x.g@icloud.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'bobbydprice@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'bobbydprice@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'cvazqu111@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'cvazqu111@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'christina.rice@globalgirlsinc.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'christina.rice@globalgirlsinc.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'info@catchtheworld.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'info@catchtheworld.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'cynthia@increasethepeacechicago.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'cynthia@increasethepeacechicago.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'dddavenport2412@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'dddavenport2412@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'darius.caffey@blackalphabet.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'darius.caffey@blackalphabet.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'gnino@enlacechicago.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'gnino@enlacechicago.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jackie@peacerunners773.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jackie@peacerunners773.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'kimeco@honeypotperformance.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'kimeco@honeypotperformance.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'lolita@rosemoorchicago.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'lolita@rosemoorchicago.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mercedespickett@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mercedespickett@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mirandaw@ueca4help.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mirandaw@ueca4help.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'nicolesorandom@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'nicolesorandom@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'sbrandstrader@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'sbrandstrader@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'tyrell@legacydisciple.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'tyrell@legacydisciple.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'wanakee@elevategreatnesschi.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'wanakee@elevategreatnesschi.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'abdulmshaheed92@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'abdulmshaheed92@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'aadibaaslami@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'aadibaaslami@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'amjad@paths2people.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'amjad@paths2people.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'berlotte2000@yahoo.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'berlotte2000@yahoo.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'charlesesibikhwa@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'charlesesibikhwa@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'pateldaraa@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'pateldaraa@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'dylanjpereira01@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'dylanjpereira01@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'kibwanaa093@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'kibwanaa093@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'konankanmi@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'konankanmi@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'lydiaayikoru90@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'lydiaayikoru90@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jasare@asaasiamvision.org'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jasare@asaasiamvision.org'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mahaalsileeni@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'mahaalsileeni@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'aminamurh5519@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'aminamurh5519@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ogbogumiraclesoma@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ogbogumiraclesoma@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'owaisamin001@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'owaisamin001@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'rachel.eve.kamins1@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'rachel.eve.kamins1@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ruthmulenga2020@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ruthmulenga2020@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'shernabenjamin@oabivoices.org'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'shernabenjamin@oabivoices.org'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'info@serac-bd.org'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'info@serac-bd.org'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'spsonampalden@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'spsonampalden@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ngumvero29@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'ngumvero29@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'yehuda.silverman@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'yehuda.silverman@gmail.com'
AND co.program = 'GGF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'fellow'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'railroadtracksmusicacademy@gmail.com'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'facilitator'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'michael@goldininstitute.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'facilitator'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'burrell@goldininstitute.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'facilitator'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'olivia@goldininstitute.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'facilitator'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'john@goldininstitute.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'facilitator'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'chicagoteamadmin@goldininstitute.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;
INSERT INTO cohort_members (contact_id, cohort_id, role)
SELECT c.id, co.id, 'facilitator'
FROM contacts c, cohorts co
WHERE LOWER(c.email) = 'jayonna@goldininstitute.org'
AND co.program = 'CPF' AND co.cohort_year = 2025
ON CONFLICT (contact_id, cohort_id) DO NOTHING;

-- =============================================
-- Events (49)
-- =============================================

INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Welcome to GATHER', 'At our first meeting together, we will get to know each other and and explore our various leadership styles. We will also learn more about the GATHER Platform and answer your questions about the road ahead', 'Chicago Cultural Center
Millennium Park Room', '2025-03-20 02:00:00', 'Michael', 'workshop', 'Seed photos link'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Uncovering Shared Principles', 'We value the variety of unique different learning styles and gifts of each member of the cohort. What principles and practices will help us learn together as a community of practice?

What does building a strong, connected, and transformative community take? In this workshop, we’ll uncover the shared principles and practices that have shaped Imagine Englewood If into a space of change and empowerment.

As the 2025 CPF leaders, each of you brings unique gifts, perspectives, and ways of learning. Together, we’ll explore what it means to be a true community of practice that values collaboration, curiosity, and shared growth. Through interactive discussions and a guided walk through the spaces shaped by these principles, we’ll see firsthand how intentional practices create lasting impact.

This isn’t just about learning it’s about experiencing.Walking the path of those before us, reflecting on what brings us together, and discovering how we can apply these principles in our own leadership journey.Come ready to connect, engage, and uncover what makes a thriving community possible.', 'Imagine Englewood If - Spark Innovation Lab  (6429 S. Honore St)', '2025-03-27 12:00:00', 'Michael', 'workshop', 'MH Finalizing. >> MH to do a walk-thru  (Have lots of organizations housed there. Largest space isn''t most glamorous)  Food suggestion from Michelle:  Kusanya Cafe  - https://www.kusanyacafe.org/'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Chapter 1 Roundtable', 'In this session, we will review the themes we explored together in Chapter 1, especially the unique approaches required for community leadership and how that requires a different perspective than organizational management.', 'Home Base - Little Village Self-Help Credit Union', '2025-04-03 12:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Actively Removing Barriers', 'Actively Removing Barriers, where we’ll dive into equity, justice, and community leadership. This session challenges us to reflect on how our identities shape our perspectives, the role of power and privilege in our work, and how a systems approach helps drive real change.

Let’s explore how our worldviews influence what we see and how we create meaning. Come ready to reflect, learn, and take action!', 'Enlace / Blackstar / DuSable', '2025-04-10 12:00:00', NULL, 'workshop', 'Enlace: Jason got back to MH. Will CC AD. Jason looping Guillermo in. (3/26) Backup Blackstar /  MH emailed random person at DuSable 3/26.'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Neighborhood Activation with the Garfield Park Rite to Wellness Collaborative', 'Join us for an interactive, on-the-ground exploration of Community-Driven Social Change as we visit the Garfield Park Rite to Wellness Collaborative (GPRWC) and learn firsthand how they transform West Garfield Park. Through initiatives like the Sankofa Wellness Village and a community-driven Quality-of-Life Plan, GPRWC is actively removing barriers to health, wellness, and economic opportunity.

This deeper dive is an opportunity to see systems change in action and how power, privilege, and equity intersect with grassroots leadership. We’ll engage in meaningful dialogue, reflect on our own roles in community activation, and explore strategies for sustainable impact.', 'Legler Regional Library
(115 S Pulaski Rd, Chicago, IL 60624)', '2025-04-17 12:00:00', NULL, 'workshop', 'Wanted the Hatchery. AD has booked library as backup. Oz trying Lisa (ex ED). Think thru which space we want, there''s a big one but it''s very echoey. (tried Gold Dome Garfield Park  -> Community Room or Jensen. Unavailable)'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Actively Removing Barries Roundtable', 'Chapter 2: Actively Removing Barriers and focus on how to put our learning into action.
This is your chance to share insights, ask questions, and collaborate on real-world applications of equity, justice, and systems change in our communities. We’ll discuss practical steps for removing barriers, amplifying voices, and leading meaningful change in our neighborhoods.
Come ready to engage, challenge ideas, and leave with actionable next steps because learning is only the beginning, and impact happens when we put it into practice!', 'Virtual', '2025-04-24 12:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Discovering Our Strengths', 'In this interactive workshop, we’ll identify our unique strengths, gifts, andtalents and explore their critical role in Community-Driven SocialChange.

A thriving neighborhood is built on the contributions of its people, and every single person has something valuable to offer. Together, we’ll reflect on our strengths and discuss how to activatethem in our communities.

Come ready to uncover what makes you a leader, share yourgifts, and learn how to harness your strengths and those of the people aroundyou to drive meaningful change.', 'BIG', '2025-05-01 12:00:00', NULL, 'workshop', 'AD spoke with Suzanne 4.15. Catering: Gwen Pruitt - (312) 852-6714. Lounge side, enterprise hall, can be configured however like it, audio-visual, roundtables. 2 chairs at each round small table. Can do however you want. Can fit 22-24 at round tables. Have green livng room side, Peanut Butter Square, 4 leather brown couches, two chairs, 12-13 in the square, sprinkle some chairs around. Bar area on the Green Living Room side. Could use both sides.  Can change the table into a U, center area, round tables, two at each table.         6431 S. Cottage Grove      Will do invoice, AD speak to Gwen.'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Discovering Our Strengths - Deeper Dive', NULL, 'Virtual - combined w Global', '2025-05-08 12:00:00', NULL, 'workshop', 'Combined with Global'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Discovering Our Strengths Roundtable', 'Workshop 3C is our interactive roundtable discussion, where we’ll reflect on what we’ve discovered about our strengths and explore how to activate our gifts to drive real change.

Throughout this chapter, we’ve identified our unique talents, explored how maps shape our understanding of community challenges, and recognized the power of building on strengths to create Community-Driven Social Change. Now, it’s time to turn reflection into action.

As we wrap up Chapter 3: Discovering Our Strengths, we’ll dive into:
✅ Share key takeaways from our strength’s discovery journey
✅ The role of lived experiences in Community-Driven Social Change
✅ Discuss how we can apply our gifts to real-world challenges

This is not just a conversation. It’s a space for collaboration, inspiration, and action. Together, we’ll explore how to turn insight into impact, support each other’s growth, and continue building a movement that values every person’s unique contribution.', 'Home Base - Little Village Self-Help Credit Union', '2025-05-15 12:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Building On Assets', NULL, 'Stone Temple Baptist Church  (3622 W. Douglas Blvd)', '2025-05-22 12:00:00', NULL, 'workshop', 'Finalized. Need to use her people for food.'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Building On Assets Deeper Dive', NULL, 'Chicago Bee Library   (3647 S State St, Chicago, IL 60609)', '2025-05-29 12:00:00', NULL, 'workshop', 'Chicago Bee Library -- (Humbolt Library not available) AD to book. Presenting their maps. Need place with space to present'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Building On Assets Roundtable', NULL, 'Virtual - combined w Global', '2025-06-05 12:00:00', NULL, 'workshop', 'Combined with Global'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Ask Engaging Questions', 'In community work, the right question can be an invitation to partnership. In this session, we will begin exploring what kinds of questions are most effective for getting people engaged, as well as how to ask questions that produce insight and motivate action.', 'Breakthrough Ministries', '2025-06-12 12:00:00', NULL, 'workshop', 'Next Step: MH follow up w Damien, Fine details / logistics. 
Damien Morris Breakthrough Ministries. There''s a workshop at Breakthrough, do a practice interview, then do an optional walk. If people need to peel off they can. -- Confirm w Damien: We''ll spend 30 min of chatting - maybe at the multiplex - then take a walk.'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Questions that Unlock Potential Workshop', 'When we look for problems we find them. When we look for successes, we can find those, too. By studying the problems, we learn what not to do. By focusing on what works, we just might learn what to do. In this workshop, we''ll dive deeper into how to craft questions that point us toward solutions that community members are authentically energized by, and which draw on existing local strengths.', 'TBD - Juneteenth', '2025-06-19 12:00:00', NULL, 'workshop', '**  Ideas - to revisit. Options:  ask Alumni if they are doing anything we can feature  **'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Ask Engaging Questions Roundtable', 'In this session, we will review the themes we explored together in Chapter 5, especially ways to find the principles and values behind our practice and find authentic expressions of them in order to make it valuable to your own work..', 'Home Base - Little Village Self-Help Credit Union', '2025-06-26 12:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, '6A:  NO MEETING', '6A:  NO MEETING', '6A:  NO MEETING', '2025-07-03 00:00:00', NULL, 'workshop', '6A:  NO MEETING'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Leadership of the Many Deeper Dive', 'Real community change is never the endeavor of an individual. Social change requires shared leadership and a diversity of perspectives to see and change the system. In this session, we will begin consider together how we build diverse teams that include and reflect what our neighbors can contribute and what they care about deeply. We will dive deeper into what kinds of problems or situations call for particular kinds of leadership and how to convene the right kind of team to address collective concerns or goals within your neighborhood.', 'Self-Help CU (Firehouse  / Sip''n''Savor --> tour Ladies of Virtue)', '2025-07-10 12:00:00', NULL, 'workshop', 'Cancelled LoV, very tight'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Leadership of the Many Roundable', 'In this roundtable, we will reflect on the ideas discussed in Chapter 6, including our initial learnings around assembling diverse teams and stepping into adaptive leadership.', 'Home Base - Little Village Self-Help Credit Union', '2025-07-17 12:00:00', NULL, 'workshop', '** Remind Fellows next two sessions are longer **'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'No Small Plans', 'In this workshop, we will explore the meaning of Creating Community Vision and the need to build on what we have within our communities in order to achieve community driven social change.', 'Zhou B Gallery', '2025-07-24 12:00:00', NULL, 'workshop', 'Old ideas:  Gloria? Blackstarr -- (prev. Sears Tower Metropolitan Club /  Discovery Center //  Columbus Park Refectory)  (Sears Tower: MH met him, followed up. May be donated. View is breathtaking, 67th floor, possible lounge.  Metropolitan Club. Board rooms plus open lounge space. image.  Talk to all three, pick one.'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'No Small Plans Deeper Dive', 'In this workshop, we will dive deeper into how to bring the full diversity of your community together in ways that reflect on your shared aspirations while building on local assets. We will also begin discussing how to host a Community Visioning Summit.', 'Zhou B Gallery', '2025-07-31 12:00:00', NULL, 'workshop', 'see above'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'No Small Plans Roundable', 'In this roundable, we will share learnings and reflections around the topics in Chapter 7, with particular focus on hosting a community visioning summit in our neighborhoods.', 'Home Base - Little Village Self-Help Credit Union', '2025-08-07 12:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Telling Our Story', NULL, 'Share Space Lab', '2025-10-09 12:00:00', NULL, 'workshop', 'Meeting wi them Fri 3.26. Decide if want to utilize for telling our story section.'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Critical Moments Deeper Dive', NULL, 'Peerspace  (1535 N. Dayton, Chicago, IL 60642)', '2025-10-16 12:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Telling Our Story Roundtable', NULL, 'Home Base - Little Village Self-Help Credit Union', '2025-10-23 12:00:00', NULL, 'workshop', 'Graduation Planning / Prep - talking about what we learned from storytelling, debriefing from Contextos, graduation planning. (Roundable with a lean towards graduation)'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Sharing Our Wisdom - Graduation Rehearsal', NULL, 'Chicago Culture Center  - Fifth Floor Millenium Park // Chicago History Museum  // (ideal: Atrium/Bradley Hall for Chicago Culture Center', '2025-10-30 12:00:00', NULL, 'workshop', '** Get Fellows'' email lists of invites **  Mayor''s office guy was going to check and let us know.  MH following up.'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Graduation Planning', NULL, 'VIRTUAL', '2025-11-06 12:00:00', NULL, 'workshop', 'Graduation Planning / Prep'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Graduation Final Planning', NULL, 'Home Base - Little Village Self-Help Credit Union', '2025-11-13 12:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'CPF Graduation Ceremony', NULL, 'Chicago Culture Center -- GAR Hall and Rotunda    // (History Museum / Atrium/Bradley Hall for Chicago Culture Center)', '2025-11-20 06:00:00', 'Michael', 'workshop', 'Mayor''s office guy was going to check and let us know.  MH following up.'
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Launch of the 2025 Goldin Global Fellows', NULL, 'https://goldininstitute.zoom.us/j/88345860115?jst=2', '2025-03-20 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Building our shared learning principles', NULL, 'https://goldininstitute.zoom.us/j/88036617996', '2025-03-27 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Chapter one roundtable.', NULL, 'https://goldininstitute.zoom.us/j/83589940631', '2025-04-03 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Chapter 2 Community Walk exercise', NULL, 'https://goldininstitute.zoom.us/j/81615861288', '2025-04-10 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Chapter 2 Workshop on the danger of a single story and seeing the system', NULL, 'https://goldininstitute.zoom.us/j/84497285488', '2025-04-17 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Chapter 2 Roundtable: Actively Removing Barriers', NULL, 'https://goldininstitute.zoom.us/j/81656873294', '2025-04-24 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Workshop on Transect walk with Charles Esibikhwa', NULL, 'https://goldininstitute.zoom.us/j/86558467735', '2025-05-01 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Joint Session with the Chicago Peace Fellows on Compassion by Burrell Poe', NULL, 'https://goldininstitute.zoom.us/j/87679142006', '2025-05-08 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Chapter 3 Roundtable on Discovering Our Strengths and Workshop from Rachel Kamins on Kibbutz', NULL, 'https://goldininstitute.zoom.us/j/82336246122', '2025-05-15 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Overview of Chapter 4—Building on Assets', NULL, 'https://goldininstitute.zoom.us/j/87612146036', '2025-05-22 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Creating Community Asset Maps', NULL, 'https://goldininstitute.zoom.us/j/81270414233', '2025-05-29 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Joint session with the Chicago Peace Fellows presenting Asset Maps', NULL, 'https://goldininstitute.zoom.us/j/81178359687', '2025-06-05 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Chapter 5 Introduction—Ask Engaging Questions', NULL, 'https://goldininstitute.zoom.us/j/88608017463', '2025-06-12 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Celebrating local heroes and discussion on balancing work and the Fellowship', NULL, 'https://goldininstitute.zoom.us/j/87301643124', '2025-06-19 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Appreciative Inquiry practice interviews and presentation by Amjad Mohamed-Saleem', NULL, 'https://goldininstitute.zoom.us/j/89153786616', '2025-06-26 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Meeting rituals from Bhutan—Presentation by Sonam Palden', NULL, 'https://goldininstitute.zoom.us/j/89526362143', '2025-07-10 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Chapter 6 Roundtable—Leadership of the Many', NULL, 'https://goldininstitute.zoom.us/j/85337715023', '2025-07-17 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Introduction to Chapter 7—Hosting community visioning summit.', NULL, 'https://goldininstitute.zoom.us/j/84078997843', '2025-07-24 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Workshop on how to host community visioning summit', NULL, 'https://goldininstitute.zoom.us/j/85409506979', '2025-07-31 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Review of chapter goals, ideas, and assignments.', NULL, 'https://goldininstitute.zoom.us/j/82679069134', '2025-08-21 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO events (cohort_id, title, description, location, start_time, facilitator, event_type, notes)
SELECT co.id, 'Ch 9 Roundtable', NULL, 'https://goldininstitute.zoom.us/j/83764103932', '2025-10-23 09:00:00', NULL, 'workshop', NULL
FROM cohorts co WHERE co.program = 'GGF' AND co.cohort_year = 2025;

-- =============================================
-- Attendance (1190 records)
-- =============================================

INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-10-09T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-11-06T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
AND e.start_time::date = '2025-11-13T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-05-29T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-06-26T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-08-14T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'CPF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'abdul mufeez' AND LOWER(c.last_name) = 'shaheed'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'adiba' AND LOWER(c.last_name) = 'aslami'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amjad' AND LOWER(c.last_name) = 'mohamed-saleem'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'berlotte' AND LOWER(c.last_name) = 'antoine'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'charles' AND LOWER(c.last_name) = 'esibikhwa edward'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dhara' AND LOWER(c.last_name) = 'patel'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'dylan' AND LOWER(c.last_name) = 'pereira'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kibwana ali' AND LOWER(c.last_name) = 'gasinya'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'kouakou michel' AND LOWER(c.last_name) = 'konan'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'lydia' AND LOWER(c.last_name) = 'ayikoru'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'joseph' AND LOWER(c.last_name) = 'asare'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'maha' AND LOWER(c.last_name) = 'jamal alsileeni'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'amina murhebwa' AND LOWER(c.last_name) = 'marie'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'miracle' AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'owais amin' AND LOWER(c.last_name) = 'khan'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'rachel' AND LOWER(c.last_name) = 'kamins'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'ruth' AND LOWER(c.last_name) = 'mulenga'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sherna alexander' AND LOWER(c.last_name) = 'benjamin'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sm' AND LOWER(c.last_name) = 'shaikat'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'sonam' AND LOWER(c.last_name) = 'palden'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'veronica ngum' AND LOWER(c.last_name) = 'ndi'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-03-20T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-03-27T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-04-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-04-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-04-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-04-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-05-01T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-05-08T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-05-15T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-05-22T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-06-05T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-06-12T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-07-03T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-07-10T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-07-17T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-07-24T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-07-31T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-08-07T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-08-21T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-08-28T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-09-04T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-09-11T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-09-18T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-09-25T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'present'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-10-16T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-10-23T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;
INSERT INTO event_attendance (event_id, contact_id, status)
SELECT e.id, c.id, 'absent'
FROM events e
JOIN cohorts co ON e.cohort_id = co.id AND co.program = 'GGF' AND co.cohort_year = 2025
CROSS JOIN contacts c
WHERE LOWER(c.first_name) = 'yehuda' AND LOWER(c.last_name) = 'silverman'
AND e.start_time::date = '2025-10-30T00:00:00'
LIMIT 1
ON CONFLICT (event_id, contact_id) DO NOTHING;

-- =============================================
-- Curriculum
-- =============================================

INSERT INTO curricula (cohort_id, name, year)
SELECT id, name || ' Curriculum', 2025 FROM cohorts WHERE cohort_year = 2025;

INSERT INTO curriculum_chapters (curriculum_id, title, description, order_num)
SELECT cu.id, 'Chapter 1', '16 pages', 1
FROM curricula cu JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 1', 1
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 2', 2
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 3', 3
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 4', 4
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 5', 5
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 6', 6
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 7', 7
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 8', 8
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 9', 9
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 10', 10
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 11', 11
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 12', 12
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 13', 13
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 14', 14
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 15', 15
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 16', 16
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_chapters (curriculum_id, title, description, order_num)
SELECT cu.id, 'Chapter 2', '17 pages', 2
FROM curricula cu JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 1', 1
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 2', 2
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 3', 3
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 4', 4
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 5', 5
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 6', 6
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 7', 7
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 8', 8
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 9', 9
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 10', 10
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 11', 11
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 12', 12
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 13', 13
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 14', 14
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 15', 15
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 16', 16
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 17', 17
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_chapters (curriculum_id, title, description, order_num)
SELECT cu.id, 'Chapter 3', '9 pages', 3
FROM curricula cu JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025;
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 1', 1
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 2', 2
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 3', 3
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 4', 4
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 5', 5
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 6', 6
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 7', 7
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 8', 8
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 9', 9
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_chapters (curriculum_id, title, description, order_num)
SELECT cu.id, 'Chapter 1', '16 pages', 1
FROM curricula cu JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 1', 1
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 2', 2
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 3', 3
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 4', 4
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 5', 5
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 6', 6
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 7', 7
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 8', 8
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 9', 9
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 10', 10
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 11', 11
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 12', 12
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 13', 13
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 14', 14
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 15', 15
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 16', 16
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_chapters (curriculum_id, title, description, order_num)
SELECT cu.id, 'Chapter 2', '17 pages', 2
FROM curricula cu JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 1', 1
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 2', 2
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 3', 3
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 4', 4
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 5', 5
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 6', 6
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 7', 7
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 8', 8
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 9', 9
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 10', 10
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 11', 11
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 12', 12
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 13', 13
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 14', 14
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 15', 15
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 16', 16
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 17', 17
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_chapters (curriculum_id, title, description, order_num)
SELECT cu.id, 'Chapter 3', '9 pages', 3
FROM curricula cu JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025;
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 1', 1
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 2', 2
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 3', 3
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 4', 4
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 5', 5
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 6', 6
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 7', 7
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 8', 8
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'page', 'Page 9', 9
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';

INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Seed
Photo', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Interview a Peer', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Update Your Profile', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Document Your Journey', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Share Your Inspiration', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Evaluation', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'General', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Inspiration', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Teacher', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Hope to Benefit', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Connect to Peer', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Document Your World', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Community
Walk', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Interview a Peer', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'General', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'See The System', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Single Story', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Whole Story', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Strengths
Finder', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Asset
Inventory', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Connect
w/ Peer', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Evaluate
GATHER', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'General', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Maps', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Interview Peer', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 4';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Asset
Map', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 4';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Evaluate
GATHER', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 4';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Document Journey', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 4';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'General', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 4';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Asset', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 4';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Peer Interview', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 4';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Alumni Maps', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 4';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Share Asset Map', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 4';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Practice AI', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 5';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Interview', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 5';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Locl Heros', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 5';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Evaluate
GATHER', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 5';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'General', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 5';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Responses', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 5';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Appreciative Inquiry', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 5';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Local Heros', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 5';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'NLC', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Share Photos', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Evaluate
GATHER', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'General', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'First Step', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Decision Making', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Remove Barriers', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'My NLC', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'CPF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Connect With A Peer', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Share Your Inspiration', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Update Your Profile', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Document Your Journey', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Evaluation', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'General', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Inspiration', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Quality of A Teacher', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Hope to Benefit from Connecting with Peers', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Connect to Peer', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 1';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Community
Walk', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Connect With A Peer', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'General', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'See the System', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Single Story', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Whole Story', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 2';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Strengths
Finder', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Asset
Inventory', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Interview A Peer', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Evaluate
GATHER', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'General', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Maps', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Share Your Strengths', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Interview a Peer', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 3';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Community Asset map', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 4';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Connect with CPF', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 4';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Document your journey', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 4';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'See the System', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 4';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Single Story', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 4';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'What Qualify as asset', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 4';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Convene Your Team', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Images and Videos of Hope', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Evaluate', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'General Discussion', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'First Steps After Identifing A Challenge', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Easiest and challenging aspects of leadership', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Who Participates in Community Decisions', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Actively Removing Barriers', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Neighborhood Learning Team', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 6';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Host A Visioning Summit', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 7';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Share Your Story Online', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 7';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Evaluate
Gather', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 7';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'General', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 7';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Makes a Meeting Great', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 7';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'NEXT STEP /
LOCAL ACTION', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 8';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'SHARE NEXT STEP PLANS', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 8';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'TAKE ACTION
Project', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 8';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'EVALUATION', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 8';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'General', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 8';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Next Step /
Location Action', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 8';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Document your journey', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 9';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Interview a Peer', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 9';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Evaluation', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 9';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'General', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 9';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Gather Ideas/Lesson', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 9';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Example of A Local Campaign', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 9';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Why us Why now', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 9';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Partner Support', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 9';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Save the Date
Graduation', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 10';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'assignment', 'Evaluation', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 10';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'General', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 10';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'Next steps', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 10';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'temperature', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 10';
INSERT INTO curriculum_items (chapter_id, item_type, title, order_num)
SELECT cc.id, 'discussion', 'celebrating accomplishment', 100
FROM curriculum_chapters cc JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE co.program = 'GGF' AND co.cohort_year = 2025 AND cc.title = 'Chapter 10';

-- Curriculum completions
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'aaliyah'
AND LOWER(c.last_name) = 'phillips'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'aaliyah'
AND LOWER(c.last_name) = 'phillips'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'aaliyah'
AND LOWER(c.last_name) = 'phillips'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'aaliyah'
AND LOWER(c.last_name) = 'phillips'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Teacher'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'aaliyah'
AND LOWER(c.last_name) = 'phillips'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Hope to Benefit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'andrea'
AND LOWER(c.last_name) = 'guzman'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'andrea'
AND LOWER(c.last_name) = 'guzman'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'bobby'
AND LOWER(c.last_name) = 'price'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'cecilia'
AND LOWER(c.last_name) = 'vazquez'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Interview a Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'cecilia'
AND LOWER(c.last_name) = 'vazquez'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Document Your Journey'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'cecilia'
AND LOWER(c.last_name) = 'vazquez'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'cecilia'
AND LOWER(c.last_name) = 'vazquez'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'christina'
AND LOWER(c.last_name) = 'rice'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'christina'
AND LOWER(c.last_name) = 'rice'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Interview a Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'christina'
AND LOWER(c.last_name) = 'rice'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Document Your Journey'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'christina'
AND LOWER(c.last_name) = 'rice'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'christina'
AND LOWER(c.last_name) = 'rice'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'crystal'
AND LOWER(c.last_name) = 'dyer'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'crystal'
AND LOWER(c.last_name) = 'dyer'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'cynthia'
AND LOWER(c.last_name) = 'olivares'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'cynthia'
AND LOWER(c.last_name) = 'olivares'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'cynthia'
AND LOWER(c.last_name) = 'olivares'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'cynthia'
AND LOWER(c.last_name) = 'olivares'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'daniel'
AND LOWER(c.last_name) = 'davenport iii'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'daniel'
AND LOWER(c.last_name) = 'davenport iii'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Document Your Journey'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'daniel'
AND LOWER(c.last_name) = 'davenport iii'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'daniel'
AND LOWER(c.last_name) = 'davenport iii'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'daniel'
AND LOWER(c.last_name) = 'davenport iii'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'darius'
AND LOWER(c.last_name) = 'caffey'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'darius'
AND LOWER(c.last_name) = 'caffey'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Document Your Journey'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'darius'
AND LOWER(c.last_name) = 'caffey'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'darius'
AND LOWER(c.last_name) = 'caffey'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'darius'
AND LOWER(c.last_name) = 'caffey'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'darius'
AND LOWER(c.last_name) = 'caffey'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Teacher'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'darius'
AND LOWER(c.last_name) = 'caffey'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Hope to Benefit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'darius'
AND LOWER(c.last_name) = 'caffey'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Document Your World'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'guillermo'
AND LOWER(c.last_name) = 'nino'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'jackie'
AND LOWER(c.last_name) = 'hoffman'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'jackie'
AND LOWER(c.last_name) = 'hoffman'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kimeco'
AND LOWER(c.last_name) = 'roberson'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kimeco'
AND LOWER(c.last_name) = 'roberson'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kimeco'
AND LOWER(c.last_name) = 'roberson'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kimeco'
AND LOWER(c.last_name) = 'roberson'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'lolita'
AND LOWER(c.last_name) = 'canady'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'lolita'
AND LOWER(c.last_name) = 'canady'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'lolita'
AND LOWER(c.last_name) = 'canady'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'lolita'
AND LOWER(c.last_name) = 'canady'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'lolita'
AND LOWER(c.last_name) = 'canady'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Teacher'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'lolita'
AND LOWER(c.last_name) = 'canady'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Hope to Benefit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'mercedes'
AND LOWER(c.last_name) = 'pickett'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'mercedes'
AND LOWER(c.last_name) = 'pickett'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'mercedes'
AND LOWER(c.last_name) = 'pickett'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Teacher'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'mercedes'
AND LOWER(c.last_name) = 'pickett'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Hope to Benefit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miranda'
AND LOWER(c.last_name) = 'standberry-wallace'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miranda'
AND LOWER(c.last_name) = 'standberry-wallace'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miranda'
AND LOWER(c.last_name) = 'standberry-wallace'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miranda'
AND LOWER(c.last_name) = 'standberry-wallace'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'nicole'
AND LOWER(c.last_name) = 'reed'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'nicole'
AND LOWER(c.last_name) = 'reed'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Interview a Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'nicole'
AND LOWER(c.last_name) = 'reed'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Document Your Journey'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'nicole'
AND LOWER(c.last_name) = 'reed'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'nicole'
AND LOWER(c.last_name) = 'reed'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'nicole'
AND LOWER(c.last_name) = 'reed'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'nicole'
AND LOWER(c.last_name) = 'reed'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Teacher'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'nicole'
AND LOWER(c.last_name) = 'reed'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Hope to Benefit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'nicole'
AND LOWER(c.last_name) = 'reed'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Document Your World'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sam'
AND LOWER(c.last_name) = 'brandstrader'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sam'
AND LOWER(c.last_name) = 'brandstrader'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Interview a Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sam'
AND LOWER(c.last_name) = 'brandstrader'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Document Your Journey'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sam'
AND LOWER(c.last_name) = 'brandstrader'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sam'
AND LOWER(c.last_name) = 'brandstrader'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sam'
AND LOWER(c.last_name) = 'brandstrader'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sam'
AND LOWER(c.last_name) = 'brandstrader'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Teacher'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sam'
AND LOWER(c.last_name) = 'brandstrader'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Hope to Benefit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'tyrell'
AND LOWER(c.last_name) = 'shoemaker'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'tyrell'
AND LOWER(c.last_name) = 'shoemaker'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Document Your Journey'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'tyrell'
AND LOWER(c.last_name) = 'shoemaker'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'tyrell'
AND LOWER(c.last_name) = 'shoemaker'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'tyrell'
AND LOWER(c.last_name) = 'shoemaker'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'tyrell'
AND LOWER(c.last_name) = 'shoemaker'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Document Your World'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'wanakee'
AND LOWER(c.last_name) = 'trask'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'wanakee'
AND LOWER(c.last_name) = 'trask'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'wanakee'
AND LOWER(c.last_name) = 'trask'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'wanakee'
AND LOWER(c.last_name) = 'trask'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'wanakee'
AND LOWER(c.last_name) = 'trask'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Teacher'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'wanakee'
AND LOWER(c.last_name) = 'trask'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Hope to Benefit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'wesley'
AND LOWER(c.last_name) = 'rodgers'
AND co.program = 'CPF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Seed
Photo'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'adiba'
AND LOWER(c.last_name) = 'aslami'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Connect With A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'adiba'
AND LOWER(c.last_name) = 'aslami'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amjad'
AND LOWER(c.last_name) = 'mohamed-saleem'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amjad'
AND LOWER(c.last_name) = 'mohamed-saleem'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Update Your Profile'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amjad'
AND LOWER(c.last_name) = 'mohamed-saleem'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amjad'
AND LOWER(c.last_name) = 'mohamed-saleem'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Quality of A Teacher'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'berlotte'
AND LOWER(c.last_name) = 'antoine'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'charles'
AND LOWER(c.last_name) = 'esibikhwa edward'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Connect With A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'charles'
AND LOWER(c.last_name) = 'esibikhwa edward'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'charles'
AND LOWER(c.last_name) = 'esibikhwa edward'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Update Your Profile'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'charles'
AND LOWER(c.last_name) = 'esibikhwa edward'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Document Your Journey'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'charles'
AND LOWER(c.last_name) = 'esibikhwa edward'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Connect With A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Document Your Journey'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Quality of A Teacher'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dylan'
AND LOWER(c.last_name) = 'pereira'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kibwana ali'
AND LOWER(c.last_name) = 'gasinya'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kouakou michel'
AND LOWER(c.last_name) = 'konan'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'lydia'
AND LOWER(c.last_name) = 'ayikoru'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'lydia'
AND LOWER(c.last_name) = 'ayikoru'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'joseph'
AND LOWER(c.last_name) = 'asare'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Connect With A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'joseph'
AND LOWER(c.last_name) = 'asare'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'joseph'
AND LOWER(c.last_name) = 'asare'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'joseph'
AND LOWER(c.last_name) = 'asare'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Quality of A Teacher'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'maha'
AND LOWER(c.last_name) = 'jamal alsileeni'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amina murhebwa'
AND LOWER(c.last_name) = 'marie'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Update Your Profile'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amina murhebwa'
AND LOWER(c.last_name) = 'marie'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miracle'
AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miracle'
AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miracle'
AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Quality of A Teacher'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'owais amin'
AND LOWER(c.last_name) = 'khan'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'owais amin'
AND LOWER(c.last_name) = 'khan'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Quality of A Teacher'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'rachel'
AND LOWER(c.last_name) = 'kamins'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Connect With A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'rachel'
AND LOWER(c.last_name) = 'kamins'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'rachel'
AND LOWER(c.last_name) = 'kamins'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'ruth'
AND LOWER(c.last_name) = 'mulenga'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Connect With A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'ruth'
AND LOWER(c.last_name) = 'mulenga'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'ruth'
AND LOWER(c.last_name) = 'mulenga'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Update Your Profile'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'ruth'
AND LOWER(c.last_name) = 'mulenga'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Evaluation'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'ruth'
AND LOWER(c.last_name) = 'mulenga'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sherna alexander'
AND LOWER(c.last_name) = 'benjamin'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sherna alexander'
AND LOWER(c.last_name) = 'benjamin'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Update Your Profile'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sherna alexander'
AND LOWER(c.last_name) = 'benjamin'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Document Your Journey'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sherna alexander'
AND LOWER(c.last_name) = 'benjamin'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Quality of A Teacher'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sm'
AND LOWER(c.last_name) = 'shaikat'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sm'
AND LOWER(c.last_name) = 'shaikat'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Update Your Profile'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Update Your Profile'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Document Your Journey'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'veronica ngum'
AND LOWER(c.last_name) = 'ndi'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'veronica ngum'
AND LOWER(c.last_name) = 'ndi'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Update Your Profile'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'veronica ngum'
AND LOWER(c.last_name) = 'ndi'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Connect With A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Share Your Inspiration'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Update Your Profile'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Document Your Journey'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 1' AND ci.title = 'Quality of A Teacher'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'adiba'
AND LOWER(c.last_name) = 'aslami'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'adiba'
AND LOWER(c.last_name) = 'aslami'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'adiba'
AND LOWER(c.last_name) = 'aslami'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'See the System'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'adiba'
AND LOWER(c.last_name) = 'aslami'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Single Story'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amjad'
AND LOWER(c.last_name) = 'mohamed-saleem'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amjad'
AND LOWER(c.last_name) = 'mohamed-saleem'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'See the System'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amjad'
AND LOWER(c.last_name) = 'mohamed-saleem'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Single Story'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'berlotte'
AND LOWER(c.last_name) = 'antoine'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'charles'
AND LOWER(c.last_name) = 'esibikhwa edward'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'charles'
AND LOWER(c.last_name) = 'esibikhwa edward'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Single Story'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'charles'
AND LOWER(c.last_name) = 'esibikhwa edward'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Whole Story'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'See the System'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Single Story'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Whole Story'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kibwana ali'
AND LOWER(c.last_name) = 'gasinya'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kouakou michel'
AND LOWER(c.last_name) = 'konan'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'lydia'
AND LOWER(c.last_name) = 'ayikoru'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'lydia'
AND LOWER(c.last_name) = 'ayikoru'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'See the System'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'lydia'
AND LOWER(c.last_name) = 'ayikoru'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Whole Story'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'joseph'
AND LOWER(c.last_name) = 'asare'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'joseph'
AND LOWER(c.last_name) = 'asare'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'See the System'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'joseph'
AND LOWER(c.last_name) = 'asare'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Single Story'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amina murhebwa'
AND LOWER(c.last_name) = 'marie'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'See the System'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miracle'
AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miracle'
AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Connect With A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miracle'
AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'See the System'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miracle'
AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Single Story'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miracle'
AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Whole Story'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'owais amin'
AND LOWER(c.last_name) = 'khan'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'owais amin'
AND LOWER(c.last_name) = 'khan'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Connect With A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'rachel'
AND LOWER(c.last_name) = 'kamins'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'ruth'
AND LOWER(c.last_name) = 'mulenga'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'ruth'
AND LOWER(c.last_name) = 'mulenga'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'ruth'
AND LOWER(c.last_name) = 'mulenga'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'See the System'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sherna alexander'
AND LOWER(c.last_name) = 'benjamin'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sherna alexander'
AND LOWER(c.last_name) = 'benjamin'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Connect With A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sherna alexander'
AND LOWER(c.last_name) = 'benjamin'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'See the System'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Single Story'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Whole Story'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'veronica ngum'
AND LOWER(c.last_name) = 'ndi'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'veronica ngum'
AND LOWER(c.last_name) = 'ndi'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Connect With A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'veronica ngum'
AND LOWER(c.last_name) = 'ndi'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Community
Walk'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Connect With A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'See the System'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Single Story'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 2' AND ci.title = 'Whole Story'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'abdul mufeez'
AND LOWER(c.last_name) = 'shaheed'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'adiba'
AND LOWER(c.last_name) = 'aslami'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amjad'
AND LOWER(c.last_name) = 'mohamed-saleem'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'berlotte'
AND LOWER(c.last_name) = 'antoine'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'charles'
AND LOWER(c.last_name) = 'esibikhwa edward'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'charles'
AND LOWER(c.last_name) = 'esibikhwa edward'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Share Your Strengths'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dylan'
AND LOWER(c.last_name) = 'pereira'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kibwana ali'
AND LOWER(c.last_name) = 'gasinya'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kibwana ali'
AND LOWER(c.last_name) = 'gasinya'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Share Your Strengths'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kouakou michel'
AND LOWER(c.last_name) = 'konan'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'lydia'
AND LOWER(c.last_name) = 'ayikoru'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'joseph'
AND LOWER(c.last_name) = 'asare'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'maha'
AND LOWER(c.last_name) = 'jamal alsileeni'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amina murhebwa'
AND LOWER(c.last_name) = 'marie'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miracle'
AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'owais amin'
AND LOWER(c.last_name) = 'khan'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'owais amin'
AND LOWER(c.last_name) = 'khan'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Share Your Strengths'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'rachel'
AND LOWER(c.last_name) = 'kamins'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'ruth'
AND LOWER(c.last_name) = 'mulenga'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sherna alexander'
AND LOWER(c.last_name) = 'benjamin'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sm'
AND LOWER(c.last_name) = 'shaikat'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Share Your Strengths'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Interview A Peer'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 3' AND ci.title = 'Share Your Strengths'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'adiba'
AND LOWER(c.last_name) = 'aslami'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'What Qualify as asset'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amjad'
AND LOWER(c.last_name) = 'mohamed-saleem'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'Community Asset map'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amjad'
AND LOWER(c.last_name) = 'mohamed-saleem'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'What Qualify as asset'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'berlotte'
AND LOWER(c.last_name) = 'antoine'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'What Qualify as asset'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'charles'
AND LOWER(c.last_name) = 'esibikhwa edward'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'Community Asset map'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'charles'
AND LOWER(c.last_name) = 'esibikhwa edward'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'What Qualify as asset'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'Community Asset map'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'What Qualify as asset'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kibwana ali'
AND LOWER(c.last_name) = 'gasinya'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'Community Asset map'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kouakou michel'
AND LOWER(c.last_name) = 'konan'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'What Qualify as asset'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'joseph'
AND LOWER(c.last_name) = 'asare'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'Community Asset map'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'joseph'
AND LOWER(c.last_name) = 'asare'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'Connect with CPF'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miracle'
AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'Community Asset map'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miracle'
AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'What Qualify as asset'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'ruth'
AND LOWER(c.last_name) = 'mulenga'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'Community Asset map'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'ruth'
AND LOWER(c.last_name) = 'mulenga'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'What Qualify as asset'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sherna alexander'
AND LOWER(c.last_name) = 'benjamin'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'What Qualify as asset'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'Community Asset map'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'What Qualify as asset'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'veronica ngum'
AND LOWER(c.last_name) = 'ndi'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'Community Asset map'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'veronica ngum'
AND LOWER(c.last_name) = 'ndi'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'What Qualify as asset'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'Community Asset map'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 4' AND ci.title = 'What Qualify as asset'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 6' AND ci.title = 'General Discussion'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kouakou michel'
AND LOWER(c.last_name) = 'konan'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 6' AND ci.title = 'General Discussion'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'maha'
AND LOWER(c.last_name) = 'jamal alsileeni'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 6' AND ci.title = 'First Steps After Identifing A Challenge'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'ruth'
AND LOWER(c.last_name) = 'mulenga'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 6' AND ci.title = 'General Discussion'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 6' AND ci.title = 'General Discussion'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'veronica ngum'
AND LOWER(c.last_name) = 'ndi'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 6' AND ci.title = 'General Discussion'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 6' AND ci.title = 'General Discussion'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 6' AND ci.title = 'First Steps After Identifing A Challenge'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 6' AND ci.title = 'Easiest and challenging aspects of leadership'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amjad'
AND LOWER(c.last_name) = 'mohamed-saleem'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Host A Visioning Summit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amjad'
AND LOWER(c.last_name) = 'mohamed-saleem'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'berlotte'
AND LOWER(c.last_name) = 'antoine'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Host A Visioning Summit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'charles'
AND LOWER(c.last_name) = 'esibikhwa edward'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Host A Visioning Summit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'charles'
AND LOWER(c.last_name) = 'esibikhwa edward'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'charles'
AND LOWER(c.last_name) = 'esibikhwa edward'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Makes a Meeting Great'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Host A Visioning Summit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'dhara'
AND LOWER(c.last_name) = 'patel'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Makes a Meeting Great'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kibwana ali'
AND LOWER(c.last_name) = 'gasinya'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Host A Visioning Summit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kouakou michel'
AND LOWER(c.last_name) = 'konan'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'kouakou michel'
AND LOWER(c.last_name) = 'konan'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Makes a Meeting Great'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'lydia'
AND LOWER(c.last_name) = 'ayikoru'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Host A Visioning Summit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'joseph'
AND LOWER(c.last_name) = 'asare'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Host A Visioning Summit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'amina murhebwa'
AND LOWER(c.last_name) = 'marie'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Host A Visioning Summit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'miracle'
AND LOWER(c.last_name) = 'ogbogu nmesoma'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Host A Visioning Summit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'ruth'
AND LOWER(c.last_name) = 'mulenga'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Host A Visioning Summit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'ruth'
AND LOWER(c.last_name) = 'mulenga'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'ruth'
AND LOWER(c.last_name) = 'mulenga'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Makes a Meeting Great'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sherna alexander'
AND LOWER(c.last_name) = 'benjamin'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Host A Visioning Summit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sm'
AND LOWER(c.last_name) = 'shaikat'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Host A Visioning Summit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Host A Visioning Summit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'sonam'
AND LOWER(c.last_name) = 'palden'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Makes a Meeting Great'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'veronica ngum'
AND LOWER(c.last_name) = 'ndi'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Host A Visioning Summit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'veronica ngum'
AND LOWER(c.last_name) = 'ndi'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'veronica ngum'
AND LOWER(c.last_name) = 'ndi'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Makes a Meeting Great'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Host A Visioning Summit'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'General'
ON CONFLICT (contact_id, item_id) DO NOTHING;
INSERT INTO contact_curriculum_progress (contact_id, item_id, completed, completed_at)
SELECT c.id, ci.id, true, now()
FROM contacts c, curriculum_items ci
JOIN curriculum_chapters cc ON ci.chapter_id = cc.id
JOIN curricula cu ON cc.curriculum_id = cu.id
JOIN cohorts co ON cu.cohort_id = co.id
WHERE LOWER(c.first_name) = 'yehuda'
AND LOWER(c.last_name) = 'silverman'
AND co.program = 'GGF' AND co.cohort_year = 2025
AND cc.title = 'Chapter 7' AND ci.title = 'Makes a Meeting Great'
ON CONFLICT (contact_id, item_id) DO NOTHING;

-- =============================================
-- Ad Hoc Lists
-- =============================================

INSERT INTO adhoc_lists (cohort_id, name, fields)
SELECT co.id, 'Ad Hoc Tracking', '[{"key": "city_club_event_04_15_2025", "label": "City Club Event\n04/15/2025", "type": "text"}, {"key": "strengthsfinder", "label": "Strengthsfinder", "type": "text"}, {"key": "35_summer_project_donations", "label": "$35 Summer Project Donations", "type": "text"}, {"key": "tbd_3", "label": "TBD 3", "type": "text"}, {"key": "tbd_4", "label": "TBD 4", "type": "text"}, {"key": "tbd_5", "label": "TBD 5", "type": "text"}, {"key": "tbd_6", "label": "TBD 6", "type": "text"}]'::jsonb
FROM cohorts co WHERE co.program = 'CPF' AND co.cohort_year = 2025;

INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"city_club_event_04_15_2025": "1", "strengthsfinder": "9D8W9AAD4BA6EC7C", "35_summer_project_donations": "2025-08-27T00:00:00"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'aaliyah' AND LOWER(c.last_name) = 'phillips'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"city_club_event_04_15_2025": "1", "strengthsfinder": "F4BK8YAD4JB7F3YB"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'andrea' AND LOWER(c.last_name) = 'guzman'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"strengthsfinder": "G73MB4AQ4AB3F4PJ", "35_summer_project_donations": "2025-09-18T00:00:00"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'bobby' AND LOWER(c.last_name) = 'price'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"strengthsfinder": "8H6QC7AJ4AFT3H6B"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'cecilia' AND LOWER(c.last_name) = 'vazquez'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"city_club_event_04_15_2025": "1", "strengthsfinder": "K69MB3A8W6F4F6XK", "35_summer_project_donations": "2025-09-04T00:00:00"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'christina' AND LOWER(c.last_name) = 'rice'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"strengthsfinder": "TMC7CW9E4GWF4N8B", "35_summer_project_donations": "2025-08-28T00:00:00"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'crystal' AND LOWER(c.last_name) = 'dyer'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"strengthsfinder": "6CF3Q6TG4HCF3KY3"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'cynthia' AND LOWER(c.last_name) = 'olivares'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"strengthsfinder": "RQJ38KA7W6C8W3KH"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'daniel' AND LOWER(c.last_name) = 'davenport iii'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"strengthsfinder": "D7N8C79BX9W3K6HW", "35_summer_project_donations": "2025-09-09T00:00:00"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'darius' AND LOWER(c.last_name) = 'caffey'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"city_club_event_04_15_2025": "1", "strengthsfinder": "B9R7YH4P7YP8E9KX"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'guillermo' AND LOWER(c.last_name) = 'nino'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"strengthsfinder": "D3X4D6D7Y4D6D9FX", "35_summer_project_donations": "2025-09-18T00:00:00"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'jackie' AND LOWER(c.last_name) = 'hoffman'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"city_club_event_04_15_2025": "1", "strengthsfinder": "X44MB3B47MD6DC4C", "35_summer_project_donations": "2025-09-02T00:00:00"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'kimeco' AND LOWER(c.last_name) = 'roberson'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"city_club_event_04_15_2025": "1", "strengthsfinder": "BCY4A7TD4XBP9C7J", "35_summer_project_donations": "2025-08-28T00:00:00"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'lolita' AND LOWER(c.last_name) = 'canady'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"strengthsfinder": "YB6RDY8NK9F7PF3Y", "35_summer_project_donations": "2025-09-15T00:00:00"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'mercedes' AND LOWER(c.last_name) = 'pickett'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"city_club_event_04_15_2025": "1", "strengthsfinder": "B79AA3T64K9MF8KC", "35_summer_project_donations": "2025-09-10T00:00:00"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'miranda' AND LOWER(c.last_name) = 'standberry-wallace'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"strengthsfinder": "E6B9R4AF9EB8F9Y6", "35_summer_project_donations": "2025-08-27T00:00:00"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'nicole' AND LOWER(c.last_name) = 'reed'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"strengthsfinder": "7ADM4YTP4WEG4K8B"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'sam' AND LOWER(c.last_name) = 'brandstrader'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"strengthsfinder": "H9KA3NAQ4BG6F7YT", "35_summer_project_donations": "2025-08-27T00:00:00"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'tyrell' AND LOWER(c.last_name) = 'shoemaker'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"city_club_event_04_15_2025": "1", "strengthsfinder": "4KN63WR7W6GF9H4H"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'wanakee' AND LOWER(c.last_name) = 'trask'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;
INSERT INTO adhoc_list_entries (list_id, contact_id, data)
SELECT al.id, c.id, '{"strengthsfinder": "9MQ9DH9J8DBF8X6P"}'::jsonb
FROM adhoc_lists al
JOIN cohorts co ON al.cohort_id = co.id AND co.program = 'CPF'
JOIN contacts c ON LOWER(c.first_name) = 'wesley' AND LOWER(c.last_name) = 'rodgers'
WHERE al.name = 'Ad Hoc Tracking'
ON CONFLICT (list_id, contact_id) DO NOTHING;

-- =============================================
-- DONE
-- =============================================
