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
        grandprixid,
        officialname,
        qualifyingformat,
        sprintqualifyingformat,
        circuitid,
        circuittype,
        direction,
        courselength,
        turns,
        laps,
        distance,
        scheduledlaps,
        scheduleddistance,
        driverschampionshipdecider,
        constructorschampionshipdecider,
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
        alpha2code,
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
