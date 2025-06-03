with source as (
    select * from {{ source('python_dataset', 'drivers') }}
),

renamed as (
    select
        id as id,
        name as name,
        abbreviation,
        dateofbirth as date_of_birth,
        dateofdeath as date_of_death,
        nationalitycountryid as nationality_country_id,
        bestraceresult as best_race_result,
        totalchampionshipwins as total_championship_wins,
        totalracestarts as total_race_starts,
        totalracewins as total_race_wins,
        totalpodiums as total_podiums,
    from source
)

select * from renamed
