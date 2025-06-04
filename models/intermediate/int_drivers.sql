SELECT
 id,
 name,
 abbreviation,
 CAST(date_of_birth AS date) AS date_of_birth,
 cast(nullif(date_of_death, '') as date) as date_of_death,
 nationality_country_id,
 CAST(best_race_result AS INT64) AS best_race_result,
 total_championship_wins,
 total_race_starts,
 total_race_wins,
 total_podiums,
FROM {{ ref('stg_python_dataset__drivers') }}
ORDER BY ID