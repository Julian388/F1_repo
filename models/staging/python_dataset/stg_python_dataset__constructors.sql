with 

source as (

    select * from {{ source('python_dataset', 'constructors') }}

),

renamed as (

    select
        id as id,
        name as name,
        fullName as full_name,
        countryId as country_id,
        bestChampionshipPosition as best_championship_position,
        bestStartingGridPosition as best_starting_grid_position,
        bestRaceResult as best_race_result,
        totalChampionshipWins as total_championship_wins,
        totalRaceEntries as total_race_entries,
        totalRaceStarts as total_race_starts,
        totalRaceWins as total_race_wins,
        total1And2Finishes as total_1_and_2_finishes,
        totalRaceLaps as total_race_laps,
        totalPodiums as total_podiums,
        totalPodiumRaces as total_podium_races,
        totalPoints as total_points,
        totalChampionshipPoints as total_championship_points,
        totalPolePositions as total_pole_positions,
        totalFastestLaps as total_fastest_laps

    from source

)

select * from renamed
