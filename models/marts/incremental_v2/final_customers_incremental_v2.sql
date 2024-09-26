with source1 as (

    select
        *
    from {{ ref('stg_source_tables__source1') }}

),

source2 as (

    select
        PK,
        Column_3
    from {{ ref('stg_source_tables__source2') }}

),

source3 as (

    select
        PK,
        Column_2,
        Column_4
    from {{ ref('stg_source_tables__source3') }}

),

source4 as (

    select
        PK,
        Column_5,
        Column_200
    from {{ ref('stg_source_tables__source4') }}

),

step1 as (

    -- Start with Source 1 data
    select * from source1

),

step2 as (

    -- Update Column_3 from Source 2
    select
        step1.PK,
        step1.Column_1,
        step1.Column_2,
        coalesce(source2.Column_3, step1.Column_3) as Column_3,
        step1.Column_4,
        step1.Column_5,
        step1.Column_200
    from step1
    left join source2 on step1.PK = source2.PK

),

step3 as (

    -- Update Column_2 and Column_4 from Source 3
    select
        step2.PK,
        step2.Column_1,
        coalesce(source3.Column_2, step2.Column_2) as Column_2,
        step2.Column_3,
        coalesce(source3.Column_4, step2.Column_4) as Column_4,
        step2.Column_5,
        step2.Column_200
    from step2
    left join source3 on step2.PK = source3.PK

),

step4 as (

    -- Update Column_5 and Column_200 from Source 4
    select
        step3.PK,
        step3.Column_1,
        step3.Column_2,
        step3.Column_3,
        step3.Column_4,
        coalesce(source4.Column_5, step3.Column_5) as Column_5,
        coalesce(source4.Column_200, step3.Column_200) as Column_200
    from step3
    left join source4 on step3.PK = source4.PK

)

select
    *
from step4
