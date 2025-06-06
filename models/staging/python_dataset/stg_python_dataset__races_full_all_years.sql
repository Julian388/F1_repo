with 

source as (

    select * from {{ source('python_dataset', 'races_full_all_years') }}

),

renamed as (

    select
        id,
        year,
        round,
        date,
        time,
        grandprixid as grand_prix_id,
        officialname as official_name,
        qualifyingformat as qualifying_format,
        sprintqualifyingformat as sprint_qualifying_format,
        circuitid as circuit_id,
        circuittype as circuit_type,
        direction,
        courselength as course_length,
        turns,
        laps,
        distance,
        scheduledlaps as scheduled_laps,
        scheduleddistance as scheduled_distance,
        driverschampionshipdecider as drivers_championship_decider,
        constructorschampionshipdecider as constructors_championship_decider,
        prequalifyingdate,
        prequalifyingtime,
        freepractice1date,
        freepractice1time,
        freepractice2date,
        freepractice2time,
        freepractice3date,
        freepractice3time,
        freepractice4date,
        freepractice4time,
        qualifying1date,
        qualifying1time,
        qualifying2date,
        qualifying2time,
        qualifyingdate,
        qualifyingtime,
        sprintqualifyingdate,
        sprintqualifyingtime,
        sprintracedate,
        sprintracetime,
        warmingupdate,
        warminguptime,
        name,
        fullname,
        previousnames,
        type,
        direction_circuit,
        placename,
        countryid,
        latitude,
        longitude,
        length,
        turns_circuit,
        totalracesheld,
        alpha2code as country_code_alpha2,
        alpha3code,
        name_country,
        demonym,
        continentid,
        code,
        name_continent,
        demonym_continent

    from source

)

select * from renamed
