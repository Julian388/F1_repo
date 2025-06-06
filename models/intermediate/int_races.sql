SELECT
id
, year
, round
, CONCAT(CAST(year AS STRING), '-', CAST(round AS STRING)) as race_key
, SAFE.PARSE_DATE('%Y-%m-%d', date) AS date
, grand_prix_id
, qualifying_format
, sprint_qualifying_format
, circuit_id
, circuit_type
, turns
, laps
, drivers_championship_decider
, constructors_championship_decider
, country_code_alpha2

FROM {{ ref('stg_python_dataset__races_full_all_years') }}
order by year DESC, round ASC