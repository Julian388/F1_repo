{{ config(
    materialized = 'table',
    description = 'Season races from grid position to finish from 2018 to 2025'
) }}

with grid_result as (

    select
    gr.key,
    gr.race_id,
    gr.gp_id,
    gr.year,
    gr.round,
    r.country_code_alpha2,
    r.grand_prix_id,
    r.circuit_id,
    r.circuit_type,
    gr.driver_id,
    gr.abbreviation,
    gr.driver_number,
    gr.constructor_id,
    gr.grid_position,
    gr.qualification_position_number,
    gr.race_qualification_position_number,
    gr.grid_penalty_positions,
    gr.race_position,
    gr.positions_gained,
    gr.grid_time,
    gr.grid_time_millis,
    gr.laps,
    gr.race_time,
    gr.race_time_millis,
    gr.time_penalty,
    gr.time_penalty_millis,
    gr.gap_millis,
    gr.reason_retired,
    gr.points,
    gr.pole_position,
    gr.pit_stops,
    gr.fastest_lap,
    w.rain_flag,
    CASE
        WHEN rain_flag = false THEN positions_gained
        ELSE null
    END as dry_positions_gained,
    CASE
        WHEN rain_flag = true THEN positions_gained
        ELSE null
    END as wet_positions_gained,
    FROM {{ ref('race_grid_results') }} gr
    LEFT JOIN {{ ref('int_weather_flag_races') }} w ON gr.gp_id = w.race_key
    LEFT JOIN {{ ref('mart_races_2018_2025') }} r ON gr.race_id = r.id
    WHERE gr.year BETWEEN 2018 AND 2025

)

select *
from grid_result
order by year desc, round ASC, race_position asc
