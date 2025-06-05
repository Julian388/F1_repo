SELECT 
  year,
  round_number,
  CONCAT(CAST(year AS STRING), '-', CAST(round_number AS STRING)) AS race_key,
  COUNTIF(rainfall = true) AS rain_laps,
  COUNT(*) AS total_laps,
  SAFE_DIVIDE(COUNTIF(rainfall =true), COUNT(*)) AS rain_ratio,
  CASE 
    WHEN SAFE_DIVIDE(COUNTIF(rainfall = true), COUNT(*)) >= 0.35 THEN TRUE
    ELSE FALSE
  END AS pluie_flag
FROM {{ ref('int_races_weather') }}
GROUP BY year, round_number