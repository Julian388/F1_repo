with 

source as (

    select * from {{ source('python_dataset', 'seasons_drivers') }}

),

renamed as (

    select
        year,
        driverid as driver_id,
        positionnumber as position_number,
        bestraceresult as best_race_result,
        totalracestarts as total_race_starts,
        totalracewins as total_race_wins,
        totalracelaps as total_race_laps,
        totalpodiums as total_podiums,
        totalpoints as total_points,
        totalpolepositions as total_pole_positions,
        totalfastestlaps as total_fastest_laps,

    from source

)

select * from renamed
