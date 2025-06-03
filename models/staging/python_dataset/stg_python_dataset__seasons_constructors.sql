with 

source as (

    select * from {{ source('python_dataset', 'seasons_constructors') }}

),

renamed as (

    select
        year,
        constructorid as constructor_id,
        positionnumber as position_number,
        positiontext as position_text,
        beststartinggridposition as best_start_in_grid_position,
        bestraceresult as best_race_result,
        totalraceentries as total_race_entries,
        totalracestarts as total_race_starts,
        totalracewins as total_race_wins,
        total1and2finishes as total_1_and_2_finishes,
        totalracelaps as total_race_laps,
        totalpodiums as total_podiums,
        totalpodiumraces as total_podium_races,
        totalpoints as total_points,
        totalpolepositions as total_pole_positions,
        totalfastestlaps as total_fastest_laps

    from source

)

select * from renamed
