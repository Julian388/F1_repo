with source as (
    select * from {{ source('python_dataset', 'races_with_context') }}
),

renamed as (
    select
        id as id,
        year,
        round,
        date,
        grandprixid as grand_prix_id,
        qualifyingformat as qualifying_format,
        sprintqualifyingformat as sprint_qualifying_format,
        circuitid as circuit_id,
        circuittype as circuit_type,
        turns,
        laps,
        driverschampionshipdecider as drivers_championship_decider,
        constructorschampionshipdecider as constructors_championship_decider,
        alpha2code as country_code_alpha2,

    from source
)

select * from renamed
