with 

source as (

    select * from {{ source('python_dataset', 'seasons_constructors') }}

),

renamed as (

    select
        year,
        constructorid as constructor_id,
        positionnumber as position_number,
        bestraceresult as best_race_result,
        totalracestarts as total_race_starts,
        totalracewins as total_race_wins,
        total1and2finishes as total_1_and_2_finishes,
        totalpodiums as total_podiums,
        totalpoints as total_points,

    from source

)

select * from renamed
