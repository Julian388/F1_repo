WITH base AS (
  SELECT 
    DISTINCT year,
    driver_id,
    CAST(points AS INT64) AS points
  FROM {{ ref('int_seasons_driver_standings') }}
),

-- Assign experience per driver per season (earliest year = 1st season)
driver_experience AS (
  SELECT 
    driver_id,
    year,
    points,
    ROW_NUMBER() OVER (PARTITION BY driver_id ORDER BY year ASC) AS season_number
  FROM base
),

-- Find the season where each driver had their max points
max_points_per_driver AS (
  SELECT
    driver_id,
    year,
    points,
    season_number,
    ROW_NUMBER() OVER (PARTITION BY driver_id ORDER BY points DESC, year ASC) AS rn
  FROM driver_experience
)

-- Final result: one row per driver, with year of max points and experience at that year
SELECT
  driver_id,
  year AS year_of_max_points,
  points AS max_points,
  season_number AS years_of_experience_at_max
FROM max_points_per_driver
WHERE rn = 1
ORDER BY year_of_max_points DESC