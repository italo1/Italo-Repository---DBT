{{config(materialized='table', cluster_by=['all_lines_23_283_428_distinct_registers'])}}

with cte1 as (
    select
        ROW_NUM as all_lines
    from
        {{ ref('stg_teste_aux') }}
    where all_lines <= 2000000
),
--select * from cte1
cte2 as (
    select
        ROW_NUM as all_lines
    from
        {{ ref('stg_teste_aux') }}
    where all_lines > 2000000 and all_lines <= 4000000
),
cte3 as (
    select
        ROW_NUM as all_lines
    from
        {{ ref('stg_teste_aux') }}
    where all_lines > 4000000 and all_lines <= 6000000
),
cte4 as (
    select
        ROW_NUM as all_lines
    from
        {{ ref('stg_teste_aux') }}
    where all_lines > 6000000 and all_lines <= 8000000
),
cte5 as (
    select
        ROW_NUM as all_lines
    from
        {{ ref('stg_teste_aux') }}
    where all_lines > 8000000 and all_lines <= 10000000
),
cte6 as (
    select
        ROW_NUM as all_lines
    from
        {{ ref('stg_teste_aux') }}
    where all_lines > 10000000 and all_lines <= 12000000
),
cte7 as (
    select
        ROW_NUM as all_lines
    from
        {{ ref('stg_teste_aux') }}
    where all_lines > 12000000 and all_lines <= 14000000
),
cte8 as (
    select
        ROW_NUM as all_lines
    from
        {{ ref('stg_teste_aux') }}
    where all_lines > 14000000 and all_lines <= 16000000
),
cte9 as (
    select
        ROW_NUM as all_lines
    from
        {{ ref('stg_teste_aux') }}
    where all_lines > 16000000 and all_lines <= 18000000
),
cte10 as (
    select
        ROW_NUM as all_lines
    from
        {{ ref('stg_teste_aux') }}
    where all_lines > 18000000
),
cte_union1 as (
    select *, row_number()over(order by all_lines) as row_numm from (
    select * from cte1 union all select * from cte1 union all select * from cte1 union all select * from cte1 union all select * from cte1 union all select * from cte1 union all select * from cte1 union all select * from cte1 union all select * from cte1 union all select * from cte10
    )
),
--select * from cte_union1
--select count(distinct all_lines) from cte_union1 --7.285.028 distinct registers

cte_union2 as (
    select *, row_number()over(order by all_lines) as row_numm from (
    select * from cte1 union all select * from cte2 union all select * from cte1 union all select * from cte2 union all select * from cte1 union all select * from cte2 union all select * from cte1 union all select * from cte2 union all select * from cte1 union all select * from cte10
    )
),
--select * from cte_union2
--select count(distinct all_lines) from cte_union2 --9.284.828 distinct registers

cte_union3 as (
    select *, row_number()over(order by all_lines) as row_numm from (
    select * from cte1 union all select * from cte2 union all select * from cte3 union all select * from cte1 union all select * from cte2 union all select * from cte3 union all select * from cte1 union all select * from cte2 union all select * from cte3 union all select * from cte10
    )
),
--select * from cte_union3
--select count(distinct all_lines) from cte_union3 --11.284.628 distinct registers

cte_union4 as (
    select *, row_number()over(order by all_lines) as row_numm from (
    select * from cte1 union all select * from cte2 union all select * from cte3 union all select * from cte4 union all select * from cte1 union all select * from cte2 union all select * from cte3 union all select * from cte4 union all select * from cte1 union all select * from cte10
    )
),
--select * from cte_union4
--select count(distinct all_lines) from cte_union4 --13.284.428 distinct registers

cte_union5 as (
    select *, row_number()over(order by all_lines) as row_numm from (
    select * from cte1 union all select * from cte2 union all select * from cte3 union all select * from cte4 union all select * from cte5 union all select * from cte1 union all select * from cte2 union all select * from cte3 union all select * from cte4 union all select * from cte10
    )
),
--select * from cte_union5
--select count(distinct all_lines) from cte_union5 --15.284.228 distinct registers

cte_union6 as (
    select *, row_number()over(order by all_lines) as row_numm from (
    select * from cte1 union all select * from cte2 union all select * from cte3 union all select * from cte4 union all select * from cte5 union all select * from cte6 union all select * from cte1 union all select * from cte2 union all select * from cte3 union all select * from cte10
    )
),
--select * from cte_union6
--select count(distinct all_lines) from cte_union6 --17.284.028 distinct registers

cte_union7 as (
    select *, row_number()over(order by all_lines) as row_numm from (
    select * from cte1 union all select * from cte2 union all select * from cte3 union all select * from cte4 union all select * from cte5 union all select * from cte6 union all select * from cte7 union all select * from cte1 union all select * from cte2 union all select * from cte10
    )
),
--select * from cte_union7
--select count(distinct all_lines) from cte_union7 --19.283.828 distinct registers

cte_union8 as (
    select *, row_number()over(order by all_lines) as row_numm from (
    select * from cte1 union all select * from cte2 union all select * from cte3 union all select * from cte4 union all select * from cte5 union all select * from cte6 union all select * from cte7 union all select * from cte8 union all select * from cte1 union all select * from cte10
    )
),
--select * from cte_union8
--select count(distinct all_lines) from cte_union8 --21.283.628 distinct registers

final_union as (
    select
        ROW_NUM as all_lines_23_283_428_distinct_registers, --23.283.428 distinct registers
        cte_union8.all_lines as _21_283_628_distinct_registers, --21.283.628 distinct registers
        2*cte_union8.all_lines as _2_times_21_283_628_distinct_registers, --21.283.628 distinct registers
        3*cte_union8.all_lines as _3_times_21_283_628_distinct_registers, --21.283.628 distinct registers
        4*cte_union8.all_lines as _4_times_21_283_628_distinct_registers, --21.283.628 distinct registers        
        cte_union7.all_lines as _19_283_828_distinct_registers, --19.283.828 distinct registers
        2*cte_union7.all_lines as _2_times_19_283_828_distinct_registers, --19.283.828 distinct registers
        3*cte_union7.all_lines as _3_times_19_283_828_distinct_registers, --19.283.828 distinct registers
        4*cte_union7.all_lines as _4_times_19_283_828_distinct_registers, --19.283.828 distinct registers
        cte_union6.all_lines as _17_284_028_distinct_registers, --17.284.028 distinct registers
        2*cte_union6.all_lines as _2_times_17_284_028_distinct_registers, --17.284.028 distinct registers
        3*cte_union6.all_lines as _3_times_17_284_028_distinct_registers, --17.284.028 distinct registers
        4*cte_union6.all_lines as _4_times_17_284_028_distinct_registers, --17.284.028 distinct registers
        cte_union5.all_lines as _15_284_228_distinct_registers, --15.284.228 distinct registers
        2*cte_union5.all_lines as _2_times_15_284_228_distinct_registers, --15.284.228 distinct registers
        3*cte_union5.all_lines as _3_times_15_284_228_distinct_registers, --15.284.228 distinct registers
        4*cte_union5.all_lines as _4_times_15_284_228_distinct_registers, --15.284.228 distinct registers
        cte_union4.all_lines as _13_284_428_distinct_registers, --13.284.428 distinct registers
        2*cte_union4.all_lines as _2_times_13_284_428_distinct_registers, --13.284.428 distinct registers
        3*cte_union4.all_lines as _3_times_13_284_428_distinct_registers, --13.284.428 distinct registers
        4*cte_union4.all_lines as _4_times_13_284_428_distinct_registers, --13.284.428 distinct registers
        cte_union3.all_lines as _11_284_628_distinct_registers, --11.284.628 distinct registers
        2*cte_union3.all_lines as _2_times_11_284_628_distinct_registers, --11.284.628 distinct registers
        3*cte_union3.all_lines as _3_times_11_284_628_distinct_registers, --11.284.628 distinct registers
        4*cte_union3.all_lines as _4_times_11_284_628_distinct_registers, --11.284.628 distinct registers
        cte_union2.all_lines as _9_284_828_distinct_registers, --9.284.828 distinct registers
        2*cte_union2.all_lines as _2_times_9_284_828_distinct_registers, --9.284.828 distinct registers
        3*cte_union2.all_lines as _3_times_9_284_828_distinct_registers, --9.284.828 distinct registers
        4*cte_union2.all_lines as _4_times_9_284_828_distinct_registers, --9.284.828 distinct registers
        cte_union1.all_lines as _7_285_028_distinct_registers, --7.285.028 distinct registers 
        2*cte_union1.all_lines as _2_times_7_285_028_distinct_registers, --7.285.028 distinct registers 
        3*cte_union1.all_lines as _3_times_7_285_028_distinct_registers, --7.285.028 distinct registers 
        4*cte_union1.all_lines as _4_times_7_285_028_distinct_registers, --7.285.028 distinct registers 
        FOR_SUM as numbers_1_012_323_distinct_registers, --1.012.323 distinct registers
        ID as alphabet, --26 distinct registers
        1 as just_number_1 --1 distinct register
    from
        {{ ref('stg_teste_aux') }} as stg
    left join cte_union1
    on  stg.ROW_NUM = cte_union1.row_numm
    left join cte_union2
    on  stg.ROW_NUM = cte_union2.row_numm
    left join cte_union3
    on  stg.ROW_NUM = cte_union3.row_numm
    left join cte_union4
    on  stg.ROW_NUM = cte_union4.row_numm
    left join cte_union5
    on  stg.ROW_NUM = cte_union5.row_numm
    left join cte_union6
    on  stg.ROW_NUM = cte_union6.row_numm
    left join cte_union7
    on  stg.ROW_NUM = cte_union7.row_numm
    left join cte_union8
    on  stg.ROW_NUM = cte_union8.row_numm    
)

select * from final_union