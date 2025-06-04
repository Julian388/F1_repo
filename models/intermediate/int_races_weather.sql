SELECT
  CASE
    WHEN time IS NULL OR time = '' THEN NULL

    -- Extract time after 'days' and parse with microseconds (6 digits)
    WHEN REGEXP_CONTAINS(time, r'^\d+ days \d{2}:\d{2}:\d{2}\.\d{6}$') THEN
      SAFE.PARSE_TIME('%H:%M:%E6S', REGEXP_EXTRACT(time, r'(\d{2}:\d{2}:\d{2}\.\d{6})'))

    WHEN REGEXP_CONTAINS(time, r'^\d{2}:\d{2}:\d{2}\.\d{6}$') THEN
      SAFE.PARSE_TIME('%H:%M:%E6S', time)

    WHEN REGEXP_CONTAINS(time, r'^\d+:\d{2}\.\d+$') THEN
      SAFE.PARSE_TIME('%M:%S.%E3S', time)

    WHEN REGEXP_CONTAINS(time, r'^\d+(\.\d+)?$') THEN
      SAFE.PARSE_TIME(
        '%H:%M:%E6S',
        FORMAT('00:00:%06.3f', CAST(time AS FLOAT64))
      )

    ELSE NULL
  END AS time,

  air_temp,
  humidity,
  pressure,
  rainfall,
  track_temp,
  wind_speeed as wind_speed,
  round_number,
  year
FROM {{ ref('stg_python_dataset__weather_2018_2025') }}
ORDER BY year DESC, round_number ASC, time ASC