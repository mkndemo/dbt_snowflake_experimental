WITH source_1 AS (
    SELECT
        pk,
        column_1 AS source1_column_1,
        column_2 AS source1_column_2,
        column_3 AS source1_column_3
    FROM {{ ref('stg_raw__source1') }}
),

source_2 AS (
    SELECT
        pk,
        column_1 AS source2_column_1,
        column_2 AS source2_column_2,
        column_3 AS source2_column_3
    FROM {{ ref('stg_raw__source2') }}
),

source_3 AS (
    SELECT
        pk,
        column_1 AS source3_column_1,
        column_2 AS source3_column_2,
        column_3 AS source3_column_3
    FROM {{ ref('stg_raw__source3') }}
),

source_4 AS (
    SELECT
        pk,
        column_1 AS source4_column_1,
        column_2 AS source4_column_2,
        column_3 AS source4_column_3
    FROM {{ ref('stg_raw__source4') }}
),

source_5 AS (
    SELECT
        pk,
        column_1 AS source5_column_1,
        column_2 AS source5_column_2,
        column_3 AS source5_column_3
    FROM {{ ref('stg_raw__source5') }}
),

source_6 AS (
    SELECT
        pk,
        column_1 AS source6_column_1,
        column_2 AS source6_column_2,
        column_3 AS source6_column_3
    FROM {{ ref('stg_raw__source6') }}
),

source_7 AS (
    SELECT
        pk,
        column_1 AS source7_column_1,
        column_2 AS source7_column_2,
        column_3 AS source7_column_3
    FROM {{ ref('stg_raw__source7') }}
),

source_8 AS (
    SELECT
        pk,
        column_1 AS source8_column_1,
        column_2 AS source8_column_2,
        column_3 AS source8_column_3
    FROM {{ ref('stg_raw__source8') }}
),

source_9 AS (
    SELECT
        pk,
        column_1 AS source9_column_1,
        column_2 AS source9_column_2,
        column_3 AS source9_column_3
    FROM {{ ref('stg_raw__source9') }}
),

source_10 AS (
    SELECT
        pk,
        column_1 AS source10_column_1,
        column_2 AS source10_column_2,
        column_3 AS source10_column_3
    FROM {{ ref('stg_raw__source10') }}
),

source_11 AS (
    SELECT
        pk,
        column_1 AS source11_column_1,
        column_2 AS source11_column_2,
        column_3 AS source11_column_3
    FROM {{ ref('stg_raw__source11') }}
),

source_12 AS (
    SELECT
        pk,
        column_1 AS source12_column_1,
        column_2 AS source12_column_2,
        column_3 AS source12_column_3
    FROM {{ ref('stg_raw__source12') }}
),

source_13 AS (
    SELECT
        pk,
        column_1 AS source13_column_1,
        column_2 AS source13_column_2,
        column_3 AS source13_column_3
    FROM {{ ref('stg_raw__source13') }}
),

source_14 AS (
    SELECT
        pk,
        column_1 AS source14_column_1,
        column_2 AS source14_column_2,
        column_3 AS source14_column_3
    FROM {{ ref('stg_raw__source14') }}
),

source_15 AS (
    SELECT
        pk,
        column_1 AS source15_column_1,
        column_2 AS source15_column_2,
        column_3 AS source15_column_3
    FROM {{ ref('stg_raw__source15') }}
),

source_16 AS (
    SELECT
        pk,
        column_1 AS source16_column_1,
        column_2 AS source16_column_2,
        column_3 AS source16_column_3
    FROM {{ ref('stg_raw__source16') }}
),

source_17 AS (
    SELECT
        pk,
        column_1 AS source17_column_1,
        column_2 AS source17_column_2,
        column_3 AS source17_column_3
    FROM {{ ref('stg_raw__source17') }}
),

source_18 AS (
    SELECT
        pk,
        column_1 AS source18_column_1,
        column_2 AS source18_column_2,
        column_3 AS source18_column_3
    FROM {{ ref('stg_raw__source18') }}
),

source_19 AS (
    SELECT
        pk,
        column_1 AS source19_column_1,
        column_2 AS source19_column_2,
        column_3 AS source19_column_3
    FROM {{ ref('stg_raw__source19') }}
),

source_20 AS (
    SELECT
        pk,
        column_1 AS source20_column_1,
        column_2 AS source20_column_2,
        column_3 AS source20_column_3
    FROM {{ ref('stg_raw__source20') }}
),

source_21 AS (
    SELECT
        pk,
        column_1 AS source21_column_1,
        column_2 AS source21_column_2,
        column_3 AS source21_column_3
    FROM {{ ref('stg_raw__source21') }}
),

source_22 AS (
    SELECT
        pk,
        column_1 AS source22_column_1,
        column_2 AS source22_column_2,
        column_3 AS source22_column_3
    FROM {{ ref('stg_raw__source22') }}
),

source_23 AS (
    SELECT
        pk,
        column_1 AS source23_column_1,
        column_2 AS source23_column_2,
        column_3 AS source23_column_3
    FROM {{ ref('stg_raw__source23') }}
),

source_24 AS (
    SELECT
        pk,
        column_1 AS source24_column_1,
        column_2 AS source24_column_2,
        column_3 AS source24_column_3
    FROM {{ ref('stg_raw__source24') }}
),

source_25 AS (
    SELECT
        pk,
        column_1 AS source25_column_1,
        column_2 AS source25_column_2,
        column_3 AS source25_column_3
    FROM {{ ref('stg_raw__source25') }}
),

source_26 AS (
    SELECT
        pk,
        column_1 AS source26_column_1,
        column_2 AS source26_column_2,
        column_3 AS source26_column_3
    FROM {{ ref('stg_raw__source26') }}
),

source_27 AS (
    SELECT
        pk,
        column_1 AS source27_column_1,
        column_2 AS source27_column_2,
        column_3 AS source27_column_3
    FROM {{ ref('stg_raw__source27') }}
),

source_28 AS (
    SELECT
        pk,
        column_1 AS source28_column_1,
        column_2 AS source28_column_2,
        column_3 AS source28_column_3
    FROM {{ ref('stg_raw__source28') }}
),

source_29 AS (
    SELECT
        pk,
        column_1 AS source29_column_1,
        column_2 AS source29_column_2,
        column_3 AS source29_column_3
    FROM {{ ref('stg_raw__source29') }}
),

source_30 AS (
    SELECT
        pk,
        column_1 AS source30_column_1,
        column_2 AS source30_column_2,
        column_3 AS source30_column_3
    FROM {{ ref('stg_raw__source30') }}
)

SELECT * FROM source_1
UNION ALL
SELECT * FROM source_2
UNION ALL
SELECT * FROM source_3
UNION ALL
SELECT * FROM source_4
UNION ALL
SELECT * FROM source_5
UNION ALL
SELECT * FROM source_6
UNION ALL
SELECT * FROM source_7
UNION ALL
SELECT * FROM source_8
UNION ALL
SELECT * FROM source_9
UNION ALL
SELECT * FROM source_10
UNION ALL
SELECT * FROM source_11
UNION ALL
SELECT * FROM source_12
UNION ALL
SELECT * FROM source_13
UNION ALL
SELECT * FROM source_14
UNION ALL
SELECT * FROM source_15
UNION ALL
SELECT * FROM source_16
UNION ALL
SELECT * FROM source_17
UNION ALL
SELECT * FROM source_18
UNION ALL
SELECT * FROM source_19
UNION ALL
SELECT * FROM source_20
UNION ALL
SELECT * FROM source_21
UNION ALL
SELECT * FROM source_22
UNION ALL
SELECT * FROM source_23
UNION ALL
SELECT * FROM source_24
UNION ALL
SELECT * FROM source_25
UNION ALL
SELECT * FROM source_26
UNION ALL
SELECT * FROM source_27
UNION ALL
SELECT * FROM source_28
UNION ALL
SELECT * FROM source_29
UNION ALL
SELECT * FROM source_30
