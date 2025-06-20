
WITH starting_grid AS (
    SELECT *
    FROM {{ ref('int_races_starting_grid_positions') }}
),

race_results AS (
    SELECT *
    FROM {{ ref('int_races_results') }}
)

SELECT
    sg.key,
    sg.race_id,
    CONCAT(CAST(sg.year AS STRING), '-', CAST(sg.round AS STRING)) AS gp_id,
    CONCAT(CAST(sg.year AS STRING), '-', CAST(sg.round AS STRING), '-', CAST(sg.driver_id AS STRING)) AS gp_driver_id,
    CONCAT(CAST(sg.year AS STRING), '-', CAST(sg.round AS STRING), '-', CAST(dd.abbreviation AS STRING)) AS gp_driver_abb_id,
    sg.year,
    sg.round,
    sg.driver_id,
    sg.driver_number,
    dd.abbreviation,
    sg.constructor_id,
    sg.position_number AS grid_position,
    sg.qualification_position_number,
    rr.qualification_position_number AS race_qualification_position_number,
    sg.grid_penalty_positions,
    rr.position_number AS race_position,
    rr.positions_gained,
    sg.time AS grid_time,
    sg.time_millis AS grid_time_millis,
    rr.laps,
    rr.time AS race_time,
    rr.time_millis AS race_time_millis,
    rr.time_penalty,
    rr.time_penalty_millis,
    rr.gap_millis,
    rr.reason_retired,
    rr.points,
    rr.pole_position,
    rr.pit_stops,
    rr.fastest_lap
FROM starting_grid sg
LEFT JOIN race_results rr
    ON sg.key = rr.key
LEFT JOIN {{ ref('stg_python_dataset__drivers') }} dd ON sg.driver_id = dd.id
order by year DESC, round