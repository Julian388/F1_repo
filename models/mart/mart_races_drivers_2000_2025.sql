{{ config(
    materialized = 'table',
    description = 'Season performance stats for drivers from 2018 to 2025'
) }}

WITH penalty_seconds_raw AS (
  SELECT
    driver_id,
    year,
    CONCAT(CAST(year AS STRING), '-', CAST(driver_id AS STRING)) AS ss_driver_id,
    grid_penalty_positions,
    EXTRACT(HOUR FROM time_penalty) * 3600 +
    EXTRACT(MINUTE FROM time_penalty) * 60 +
    EXTRACT(SECOND FROM time_penalty) AS time_penalty_seconds
  FROM {{ ref('race_grid_results') }}
  WHERE time_penalty IS NOT NULL
),

penalities AS (
  SELECT
    driver_id,
    year,
    ss_driver_id,
    SUM(grid_penalty_positions) AS total_grid_penality_pos,
    SUM(time_penalty_seconds) AS total_time_penalty
  FROM penalty_seconds_raw
  GROUP BY driver_id, year, ss_driver_id
),

-- add ss_driver_id here as well
seasons_drivers_raw AS (
  SELECT
    d.*,
    CONCAT(CAST(d.year AS STRING), '-', CAST(d.driver_id AS STRING)) AS ss_driver_id_concat,
    p.total_grid_penality_pos,
    p.total_time_penalty
  FROM {{ ref('int_seasons_drivers') }} d
  LEFT JOIN penalities p ON CONCAT(CAST(d.year AS STRING), '-', CAST(d.driver_id AS STRING)) = p.ss_driver_id
  WHERE d.year BETWEEN 2000 AND 2025
    AND best_race_result > 0
),

experience_ranked AS (
  SELECT
    driver_id,
    year,
    ROW_NUMBER() OVER (PARTITION BY driver_id ORDER BY year ASC) AS year_of_experience
  FROM seasons_drivers_raw
)

SELECT 
  sdr.*,
  er.year_of_experience
FROM seasons_drivers_raw sdr
LEFT JOIN experience_ranked er
  ON sdr.driver_id = er.driver_id AND sdr.year = er.year
ORDER BY sdr.year DESC, sdr.position_number ASC
