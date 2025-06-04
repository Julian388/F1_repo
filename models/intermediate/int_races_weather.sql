SELECT
CASE
  WHEN time IS NULL OR CAST(time AS STRING) = '' THEN NULL
  WHEN REGEXP_CONTAINS(CAST(time AS STRING), r'^\d+ days \d{2}:\d{2}:\d{2}\.\d+$') THEN
    SAFE.PARSE_TIME('%H:%M:%E*S', REGEXP_EXTRACT(CAST(time AS STRING), r'(\d{2}:\d{2}:\d{2}\.\d+)'))
  WHEN REGEXP_CONTAINS(CAST(time AS STRING), r'^\d+:\d{2}:\d{2}\.\d+$') THEN SAFE.PARSE_TIME('%H:%M:%E*S', CAST(time AS STRING))
  WHEN REGEXP_CONTAINS(CAST(time AS STRING), r'^\d+:\d{2}\.\d+$') THEN SAFE.PARSE_TIME('%M:%E*S', CAST(time AS STRING))
  WHEN REGEXP_CONTAINS(CAST(time AS STRING), r'^\d+(\.\d+)?$') THEN SAFE.PARSE_TIME('%E*S', CAST(time AS STRING))
  ELSE NULL
END AS time
    , air_temp
    , humidity
    , pressure
    , rainfall
    , track_temp
    , wind_speeed
    , round_number
    , year
FROM {{ ref('stg_python_dataset__weather_2018_2025') }}
order by year DESC, round_number ASC, time ASC