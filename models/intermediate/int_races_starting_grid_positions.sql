WITH source AS (
    SELECT * 
    FROM {{ ref('stg_python_dataset__races_starting_grid_positions') }}
)

SELECT
    CONCAT(CAST(race_id AS STRING), '_', CAST(driver_id AS STRING), '_', CAST(year AS STRING), '_', CAST(round AS STRING)) AS key,
    race_id,
    year,
    round,
    CAST(position_number AS INT64) AS position_number,
    driver_number,
    driver_id,
    constructor_id,
    CAST(qualification_position_number AS INT64) AS qualification_position_number,
    CAST(grid_penalty_positions AS INT64) AS grid_penalty_positions,

    CASE
        WHEN time IS NULL OR TRIM(time) = '' THEN NULL
        WHEN INSTR(time, ':') > 0 THEN PARSE_TIME('%M:%E*S', time)
        ELSE PARSE_TIME('%H:%M:%E*S', CONCAT('00:00:', time))
    END AS time,

    CAST(time_millis AS INT64) AS time_millis

FROM source

ORDER BY year DESC, round, position_number