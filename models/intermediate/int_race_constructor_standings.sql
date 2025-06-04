SELECT 
        race_id,
        year,
        round,
        CAST(position_number AS INT64) AS position_number,
        constructor_id,
        CAST(points AS INT64) AS points,
        CAST(positions_gained AS INT64) as positions_gained

FROM {{ ref('stg_python_dataset__race_constructor_standings') }}
ORDER by year DESC, round ASC, position_number ASC