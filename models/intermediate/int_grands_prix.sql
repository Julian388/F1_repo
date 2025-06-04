SELECT 
 id,
 name,
 fullname,
 shortname,
 abbreviation,
 country_id,
 CAST(total_races_held AS INT64) AS total_races_held
FROM {{ ref('stg_python_dataset__grands_prix') }}
