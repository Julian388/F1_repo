select
race_id
, year -- convertir year en date
, round
, CAST(position_number AS INT64) AS position_number -- convertir year en int
, driver_number
, constructor_id
, CAST(lap AS INT64) AS lap_nb
, time_millis 

-- convertir en min,sec,et milisec
, CASE
  WHEN time IS NULL OR time = '' THEN NULL
  WHEN REGEXP_CONTAINS(time, r':') AND REGEXP_CONTAINS(time, r'\.') THEN PARSE_TIME('%M:%E*S', REPLACE(time, '+', ''))
  WHEN REGEXP_CONTAINS(time, r'\.') THEN PARSE_TIME('%M:%E*S', CONCAT('00:', REPLACE(time, '+', '')))
  ELSE NULL
END AS time
, CASE
  WHEN gap IS NULL OR gap = '' THEN NULL
  WHEN REGEXP_CONTAINS(gap, r':') AND REGEXP_CONTAINS(gap, r'\.') THEN PARSE_TIME('%M:%E*S', REPLACE(gap, '+', ''))
  WHEN REGEXP_CONTAINS(gap, r'\.') THEN PARSE_TIME('%M:%E*S', CONCAT('00:', REPLACE(gap, '+', '')))
  ELSE NULL
END AS gap_time
from {{ ref('stg_python_dataset__races_fastest_laps') }}
order by year DESC, round ASC
