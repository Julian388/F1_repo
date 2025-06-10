WITH driver_performance AS (
  SELECT
    driver_id,
    abbreviation,
    -- Performance pluie
    AVG(CASE WHEN rain_flag = true THEN positions_gained END) AS avg_pos_gained_rain,
    AVG(CASE WHEN rain_flag = true THEN race_time_millis END) AS avg_laptime_rain,
    -- Performance sec
    AVG(CASE WHEN rain_flag = false THEN positions_gained END) AS avg_pos_gained_dry,
    AVG(CASE WHEN rain_flag = false THEN race_time_millis END) AS avg_laptime_dry,
    -- Compteurs pour validation
    COUNT(CASE WHEN rain_flag = true THEN 1 END) AS races_rain,
    COUNT(CASE WHEN rain_flag = false THEN 1 END) AS races_dry
  FROM {{ ref('mart_races_grid_results') }}
  WHERE driver_id NOT IN ('nikita-mazepin', 'antonio-giovinazzi', 'kimi-raikkonen','mick-schumacher','nicholas-latifi','robert-kubica','daniil-kvyat','romain-grosjean','daniel-ricciardo','sebastian-vettel')
  GROUP BY driver_id, abbreviation
  HAVING COUNT(CASE WHEN rain_flag = false THEN 1 END) >= 3
    AND COUNT(CASE WHEN rain_flag = true THEN 1 END) >= 2
),

rain_skill AS (
  SELECT
    *,
    -- Différentiel places (positif = meilleur sous pluie)
    (avg_pos_gained_rain - avg_pos_gained_dry) AS pos_diff_rain_vs_dry,
    -- Différentiel temps relatif (négatif = plus rapide sous pluie)
    (avg_laptime_rain - avg_laptime_dry) / NULLIF(avg_laptime_dry, 0) AS laptime_diff_pct,
    -- Score composite normalisé
    ROW_NUMBER() OVER (ORDER BY (avg_pos_gained_rain - avg_pos_gained_dry) DESC) AS rain_rank
  FROM driver_performance
)

SELECT
  *,
  -- Ajouter une métrique score 0 - 100 : 100 : super ; 0 : nul
  100 - (0.7 * PERCENT_RANK() OVER (ORDER BY pos_diff_rain_vs_dry DESC) + 
   0.3 * PERCENT_RANK() OVER (ORDER BY laptime_diff_pct ASC)) * 100 AS rain_skill_score
FROM rain_skill