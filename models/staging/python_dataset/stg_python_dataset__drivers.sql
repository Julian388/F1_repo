with source as (
    select * from {{ source('python_dataset', 'drivers') }}
),

renamed as (
    select
        id as id,
        name as name,
        firstname as first_name,
        lastname as last_name,
        fullname as full_name,
        abbreviation,
        permanentnumber as permanent_number,
        gender,
        dateofbirth as date_of_birth,
        dateofdeath as date_of_death,
        placeofbirth as place_of_birth,
        countryofbirthcountryid as country_of_birth_id,
        nationalitycountryid as nationality_country_id,
        secondnationalitycountryid as second_nationality_country_id,
        bestchampionshipposition as best_championship_position,
        beststartinggridposition as best_starting_grid_position,
        bestraceresult as best_race_result,
        totalchampionshipwins as total_championship_wins,
        totalraceentries as total_race_entries,
        totalracestarts as total_race_starts,
        totalracewins as total_race_wins,
        totalracelaps as total_race_laps,
        totalpodiums as total_podiums,
        totalpoints as total_points,
        totalchampionshippoints as total_championship_points,
        totalpolepositions as total_pole_positions,
        totalfastestlaps as total_fastest_laps,
        totaldriveroftheday as total_driver_of_the_day,
        totalgrandslams as total_grand_slams
    from source
)

select * from renamed
