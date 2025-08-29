-- ==============================
-- 1. Create Master Cleaned Table
-- ==============================
DROP TABLE IF EXISTS Master_Cleaned_Meteorites;

CREATE TABLE Master_Cleaned_Meteorites AS
SELECT DISTINCT *
FROM Meteorite_Landings
WHERE `mass (g)` IS NOT NULL
  AND `mass (g)` > 0
  AND year IS NOT NULL
  AND year BETWEEN 800 AND 2025;

-- ==============================
-- 2. Create Cluster-Ready Table
--    + Outlier Treatment
--    + Feature Engineering
-- ==============================
DROP TABLE IF EXISTS Cluster_Ready_Meteorites;

CREATE TABLE Cluster_Ready_Meteorites AS
WITH base AS (
    SELECT *,
           LOG(`mass (g)`) AS log_mass,
           (2025 - year) AS age,
           CASE WHEN reclat >= 0 THEN 'Northern' ELSE 'Southern' END AS hemisphere
    FROM Master_Cleaned_Meteorites
    WHERE reclat BETWEEN -90 AND 90 AND reclat != 0
      AND reclong BETWEEN -180 AND 180 AND reclong != 0
),
-- Cap extreme log_mass values (manual cap, e.g., 99th percentile = 12.0)
capped AS (
    SELECT *,
           CASE WHEN log_mass > 12.0 THEN 12.0 ELSE log_mass END AS log_mass_capped
    FROM base
)
SELECT * FROM capped;
