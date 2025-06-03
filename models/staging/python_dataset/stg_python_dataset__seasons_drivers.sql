with 

source as (

    select * from {{ source('python_dataset', 'seasons_drivers') }}

),

renamed as (

    select
        year,
        driverid as drive_id,
        positionnumber as position_number,
        positiontext as position_text,
        beststartinggridposition as best_start_in_grid_position,
        bestraceresult as best_race_result,
        totalraceentries as total_race_entries,
        totalracestarts as total_race_starts,
        totalracewins as total_race_wins,
        totalracelaps as total_race_laps,
        totalpodiums as total_podiums,
        totalpoints as total_points,
        totalpolepositions as total_pole_positions,
        totalfastestlaps as total_fastest_laps,
        totaldriveroftheday as total_driver_of_the_day,
        totalgrandslams as total_grand_lams

    from source

)

select * from renamed
