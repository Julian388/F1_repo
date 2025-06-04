with source as (
    select * from {{ ref('stg_python_dataset__constructors') }}
)

select
    id,
    name,
    country_id,

    -- Cast to INTEGER
    cast(best_championship_position as int64) as best_championship_position,
    cast(best_starting_grid_position as int64) as best_starting_grid_position,
    cast(best_race_result as int64) as best_race_result,

    total_championship_wins,
    total_race_starts,
    total_race_wins,
    total_1_and_2_finishes,
    total_race_laps,
    total_podiums,
    total_podium_races,

    -- Cast to INTEGER
    cast(total_points as int64) as total_points,
    cast(total_championship_points as int64) as total_championship_points,

    total_pole_positions,
    total_fastest_laps

from source
