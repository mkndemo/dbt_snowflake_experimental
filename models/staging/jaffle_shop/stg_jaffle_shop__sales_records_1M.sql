with source as (

    select * from {{ source('jaffle_shop', 'SALES_RECORDS_1M') }}

),

renamed as (

    select
        region as sales_region,
        country as sales_country,
        itemtype,
        saleschannel,
        orderpriority,
        orderdate,
        orderid,
        shipdate,
        unitssold,
        unitprice,
        unitcost,
        totalrevenue,
        totalcost,
        totalprofit

    from source

)

select * from renamed
