SELECT 
    driver,
    tyre_type,
    CAST(tyre_life AS INT64) AS tyre_life,
    CAST(lap_number AS INT64) AS lap_number,
    pitstop_nb,
    season as year,
    round,

    -- CAST(pit_in_time AS date) AS pit_in_time,
    -- CAST(pit_out_time AS date) AS pit_out_time,

    CAST(track_status AS INT64) AS track_status,

    -- Traitement de pit_in_time
    CASE
        WHEN pit_in_time IS NULL OR pit_in_time = '' THEN PARSE_TIME('%H:%M:%E*S','00:00:00.000000')
        ELSE PARSE_TIME('%H:%M:%E*S', REGEXP_REPLACE(pit_in_time, r'^0 days ', ''))
    END AS pit_in_time,

    -- Traitement de pit_out_time
    CASE
        WHEN pit_out_time IS NULL OR pit_out_time = '' THEN NULL
        ELSE PARSE_TIME('%H:%M:%E*S', REGEXP_REPLACE(pit_out_time, r'^0 days ', ''))
    END AS pit_out_time
    , CONCAT(CAST(season AS STRING), '-', CAST(round AS STRING)) AS gp_id

FROM {{ ref('stg_python_dataset__pitstops_2018_2025') }}
ORDER by year DESC, round ASC, lap_number ASC