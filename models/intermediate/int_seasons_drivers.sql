

SELECT 
year,
driver_id,
CAST (position_number AS INT64) AS position_number,
CAST (best_race_result AS INT64) AS best_race_result,
total_race_starts,
total_race_wins,
total_race_laps,
total_podiums,
CAST (total_points AS INT64) AS total_points,
total_pole_positions,
total_fastest_laps,

FROM {{ ref('stg_python_dataset__seasons_drivers') }}

ORDER BY year DESC, position_number ASC
