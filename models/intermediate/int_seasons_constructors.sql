
#Cleand sort by & type 
SELECT
year,
constructor_id,
CAST (position_number AS INT64) AS position_number,
CAST (best_race_result AS INT64) AS best_race_result,
total_race_starts,
total_race_wins,
total_1_and_2_finishes,
total_podiums,
CAST (total_points AS INT64) AS total_points

FROM {{ ref('stg_python_dataset__seasons_constructors') }}

ORDER BY year DESC, position_number ASC

