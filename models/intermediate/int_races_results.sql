SELECT
  CONCAT(CAST(race_id AS STRING), '_', CAST(driver_id AS STRING), '_', CAST(year AS STRING), '_', CAST(round AS STRING)) AS key,
  race_id,
  year,
  round,
  SAFE_CAST(position_number AS INT64) AS position_number,
  driver_number,
  driver_id,
  constructor_id,
  SAFE_CAST(laps AS INT64) AS laps,
  CASE
    WHEN time IS NULL OR CAST(time AS STRING) = '' THEN NULL
    WHEN REGEXP_CONTAINS(CAST(time AS STRING), r'^\d+:\d{2}:\d{2}\.\d+$') THEN SAFE.PARSE_TIME('%H:%M:%E*S', CAST(time AS STRING))
    WHEN REGEXP_CONTAINS(CAST(time AS STRING), r'^\d+:\d{2}\.\d+$') THEN SAFE.PARSE_TIME('%M:%E*S', CAST(time AS STRING))
    ELSE NULL
  END AS time,
  SAFE_CAST(time_millis AS INT64) AS time_millis,
  CASE
    WHEN rr.time_penalty IS NULL OR CAST(rr.time_penalty AS STRING) = '' THEN NULL
    WHEN REGEXP_CONTAINS(CAST(time_penalty AS STRING), r'^\d+:\d{2}:\d{2}\.\d+$') THEN SAFE.PARSE_TIME('%H:%M:%E*S', CAST(time_penalty AS STRING))
    WHEN REGEXP_CONTAINS(CAST(time_penalty AS STRING), r'^\d+:\d{2}\.\d+$') THEN SAFE.PARSE_TIME('%M:%E*S', CAST(time_penalty AS STRING))
    WHEN REGEXP_CONTAINS(CAST(time_penalty AS STRING), r'^\d+(\.\d+)?$') THEN SAFE.PARSE_TIME('%E*S', CAST(time_penalty AS STRING))
    ELSE NULL
  END AS time_penalty,
  SAFE_CAST(time_penalty_millis AS INT64) AS time_penalty_millis,
  SAFE_CAST(gap_millis AS INT64) AS gap_millis,
  reason_retired,
  SAFE_CAST(points AS INT64) AS points,
  pole_position,
  SAFE_CAST(qualification_position_number AS INT64) AS qualification_position_number,
  SAFE_CAST(positions_gained AS INT64) AS positions_gained,
  SAFE_CAST(pit_stops AS INT64) AS pit_stops,
  fastest_lap
FROM {{ ref('stg_python_dataset__races_race_results') }} rr
-- LEFT JOIN {{ ref('stg_python_dataset__races_full_all_years') }} rid ON rr.race_id = rid
ORDER BY year DESC, round ASC
