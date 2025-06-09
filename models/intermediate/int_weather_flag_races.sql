SELECT 
  w.year,
  w.round_number,
  race_key,
  r.grand_prix_id,
  r.circuit_id,
  r.circuit_type,
  COUNTIF(rainfall = true) AS rain_laps,
  COUNT(*) AS total_laps,
  SAFE_DIVIDE(COUNTIF(rainfall =true), COUNT(*)) AS rain_ratio,
  CASE 
    WHEN SAFE_DIVIDE(COUNTIF(rainfall = true), COUNT(*)) > 0.30 THEN TRUE
    ELSE FALSE
  END AS rain_flag
FROM {{ ref('int_races_weather') }} w
LEFT JOIN {{ ref('stg_python_dataset__races_full_all_years') }} as r ON w.gp_id = r.race_key
GROUP BY year, round_number, race_key, grand_prix_id, circuit_id, circuit_type