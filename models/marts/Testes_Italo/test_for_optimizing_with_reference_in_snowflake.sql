{{config(materialized='table')}}--, cluster_by=['a'])}}

with cte1 as (
    select
        all_lines_23_283_428_distinct_registers, --23.283.428 distinct registers
        _21_283_628_distinct_registers, --21.283.628 distinct registers
        _2_times_21_283_628_distinct_registers, --21.283.628 distinct registers
        _3_times_21_283_628_distinct_registers, --21.283.628 distinct registers
        _4_times_21_283_628_distinct_registers, --21.283.628 distinct registers        
        _19_283_828_distinct_registers, --19.283.828 distinct registers
        _2_times_19_283_828_distinct_registers, --19.283.828 distinct registers
        _3_times_19_283_828_distinct_registers, --19.283.828 distinct registers
        _4_times_19_283_828_distinct_registers, --19.283.828 distinct registers
        _17_284_028_distinct_registers, --17.284.028 distinct registers
        _2_times_17_284_028_distinct_registers, --17.284.028 distinct registers
        _3_times_17_284_028_distinct_registers, --17.284.028 distinct registers
        _4_times_17_284_028_distinct_registers, --17.284.028 distinct registers
        _15_284_228_distinct_registers, --15.284.228 distinct registers
        _2_times_15_284_228_distinct_registers, --15.284.228 distinct registers
        _3_times_15_284_228_distinct_registers, --15.284.228 distinct registers
        _4_times_15_284_228_distinct_registers, --15.284.228 distinct registers
        _13_284_428_distinct_registers, --13.284.428 distinct registers
        _2_times_13_284_428_distinct_registers, --13.284.428 distinct registers
        _3_times_13_284_428_distinct_registers, --13.284.428 distinct registers
        _4_times_13_284_428_distinct_registers, --13.284.428 distinct registers
        _11_284_628_distinct_registers, --11.284.628 distinct registers
        _2_times_11_284_628_distinct_registers, --11.284.628 distinct registers
        _3_times_11_284_628_distinct_registers, --11.284.628 distinct registers
        _4_times_11_284_628_distinct_registers, --11.284.628 distinct registers
        _9_284_828_distinct_registers, --9.284.828 distinct registers
        _2_times_9_284_828_distinct_registers, --9.284.828 distinct registers
        _3_times_9_284_828_distinct_registers, --9.284.828 distinct registers
        _4_times_9_284_828_distinct_registers, --9.284.828 distinct registers
        _7_285_028_distinct_registers, --7.285.028 distinct registers 
        _2_times_7_285_028_distinct_registers, --7.285.028 distinct registers 
        _3_times_7_285_028_distinct_registers, --7.285.028 distinct registers 
        _4_times_7_285_028_distinct_registers, --7.285.028 distinct registers 
        numbers_1_012_323_distinct_registers, --1.012.323 distinct registers
        alphabet, --26 distinct registers
        just_number_1 --1 distinct register
    from
        {{ ref('Big_table_as_a_source') }}
),

cte2 as (
    select
        all_lines_23_283_428_distinct_registers as a, --23.283.428 distinct registers
        3*_21_283_628_distinct_registers as b, --21.283.628 distinct registers
        4*_2_times_21_283_628_distinct_registers as c, --21.283.628 distinct registers
        _3_times_21_283_628_distinct_registers, --21.283.628 distinct registers
        _4_times_21_283_628_distinct_registers, --21.283.628 distinct registers        
        _19_283_828_distinct_registers, --19.283.828 distinct registers
        _2_times_19_283_828_distinct_registers, --19.283.828 distinct registers
        _3_times_19_283_828_distinct_registers, --19.283.828 distinct registers
        _4_times_19_283_828_distinct_registers, --19.283.828 distinct registers
        _17_284_028_distinct_registers, --17.284.028 distinct registers
        _2_times_17_284_028_distinct_registers, --17.284.028 distinct registers
        _3_times_17_284_028_distinct_registers, --17.284.028 distinct registers
        _4_times_17_284_028_distinct_registers, --17.284.028 distinct registers
        _15_284_228_distinct_registers, --15.284.228 distinct registers
        5*_2_times_15_284_228_distinct_registers as d, --15.284.228 distinct registers
        _3_times_15_284_228_distinct_registers, --15.284.228 distinct registers
        _4_times_15_284_228_distinct_registers, --15.284.228 distinct registers
        _13_284_428_distinct_registers, --13.284.428 distinct registers
        _2_times_13_284_428_distinct_registers, --13.284.428 distinct registers
        _3_times_13_284_428_distinct_registers, --13.284.428 distinct registers
        6*_4_times_13_284_428_distinct_registers as e, --13.284.428 distinct registers
        _11_284_628_distinct_registers, --11.284.628 distinct registers
        _2_times_11_284_628_distinct_registers, --11.284.628 distinct registers
        _3_times_11_284_628_distinct_registers, --11.284.628 distinct registers
        _4_times_11_284_628_distinct_registers, --11.284.628 distinct registers
        _9_284_828_distinct_registers, --9.284.828 distinct registers
        _2_times_9_284_828_distinct_registers, --9.284.828 distinct registers
        _3_times_9_284_828_distinct_registers, --9.284.828 distinct registers
        _4_times_9_284_828_distinct_registers, --9.284.828 distinct registers
        _7_285_028_distinct_registers, --7.285.028 distinct registers 
        _2_times_7_285_028_distinct_registers, --7.285.028 distinct registers 
        _3_times_7_285_028_distinct_registers, --7.285.028 distinct registers 
        _4_times_7_285_028_distinct_registers, --7.285.028 distinct registers 
        numbers_1_012_323_distinct_registers, --1.012.323 distinct registers
        alphabet, --26 distinct registers
        just_number_1 --1 distinct register
    from
        cte1
),
cte3 as (
    select
        a, --23.283.428 distinct registers
        b, --21.283.628 distinct registers
        c, --21.283.628 distinct registers
        _3_times_21_283_628_distinct_registers, --21.283.628 distinct registers
        _4_times_21_283_628_distinct_registers, --21.283.628 distinct registers        
        _19_283_828_distinct_registers, --19.283.828 distinct registers
        _2_times_19_283_828_distinct_registers, --19.283.828 distinct registers
        _3_times_19_283_828_distinct_registers, --19.283.828 distinct registers
        5*_4_times_19_283_828_distinct_registers as f, --19.283.828 distinct registers
        _17_284_028_distinct_registers, --17.284.028 distinct registers
        _2_times_17_284_028_distinct_registers, --17.284.028 distinct registers
        _3_times_17_284_028_distinct_registers, --17.284.028 distinct registers
        _4_times_17_284_028_distinct_registers, --17.284.028 distinct registers
        _15_284_228_distinct_registers, --15.284.228 distinct registers
        2*d as g, --15.284.228 distinct registers
        _3_times_15_284_228_distinct_registers, --15.284.228 distinct registers
        _4_times_15_284_228_distinct_registers, --15.284.228 distinct registers
        _13_284_428_distinct_registers, --13.284.428 distinct registers
        _2_times_13_284_428_distinct_registers, --13.284.428 distinct registers
        _3_times_13_284_428_distinct_registers, --13.284.428 distinct registers
        e, --13.284.428 distinct registers
        _11_284_628_distinct_registers, --11.284.628 distinct registers
        _2_times_11_284_628_distinct_registers, --11.284.628 distinct registers
        _3_times_11_284_628_distinct_registers, --11.284.628 distinct registers
        _4_times_11_284_628_distinct_registers, --11.284.628 distinct registers
        _9_284_828_distinct_registers, --9.284.828 distinct registers
        _2_times_9_284_828_distinct_registers, --9.284.828 distinct registers
        _3_times_9_284_828_distinct_registers, --9.284.828 distinct registers
        _4_times_9_284_828_distinct_registers, --9.284.828 distinct registers
        _7_285_028_distinct_registers, --7.285.028 distinct registers 
        _2_times_7_285_028_distinct_registers, --7.285.028 distinct registers 
        _3_times_7_285_028_distinct_registers, --7.285.028 distinct registers 
        _4_times_7_285_028_distinct_registers, --7.285.028 distinct registers 
        numbers_1_012_323_distinct_registers, --1.012.323 distinct registers
        alphabet, --26 distinct registers
        just_number_1 --1 distinct register
    from
        cte2
),
cte4 as (
    select
        a, --23.283.428 distinct registers
        b, --21.283.628 distinct registers
        c, --21.283.628 distinct registers
        _3_times_21_283_628_distinct_registers, --21.283.628 distinct registers
        _4_times_21_283_628_distinct_registers, --21.283.628 distinct registers        
        _19_283_828_distinct_registers, --19.283.828 distinct registers
        _2_times_19_283_828_distinct_registers, --19.283.828 distinct registers
        _3_times_19_283_828_distinct_registers, --19.283.828 distinct registers
        f, --19.283.828 distinct registers
        _17_284_028_distinct_registers, --17.284.028 distinct registers
        _2_times_17_284_028_distinct_registers, --17.284.028 distinct registers
        _3_times_17_284_028_distinct_registers, --17.284.028 distinct registers
        _4_times_17_284_028_distinct_registers, --17.284.028 distinct registers
        _15_284_228_distinct_registers, --15.284.228 distinct registers
        g, --15.284.228 distinct registers
        _3_times_15_284_228_distinct_registers, --15.284.228 distinct registers
        _4_times_15_284_228_distinct_registers, --15.284.228 distinct registers
        _13_284_428_distinct_registers, --13.284.428 distinct registers
        _2_times_13_284_428_distinct_registers, --13.284.428 distinct registers
        _3_times_13_284_428_distinct_registers, --13.284.428 distinct registers
        e, --13.284.428 distinct registers
        _11_284_628_distinct_registers, --11.284.628 distinct registers
        _2_times_11_284_628_distinct_registers, --11.284.628 distinct registers
        _3_times_11_284_628_distinct_registers, --11.284.628 distinct registers
        _4_times_11_284_628_distinct_registers, --11.284.628 distinct registers
        _9_284_828_distinct_registers, --9.284.828 distinct registers
        _2_times_9_284_828_distinct_registers, --9.284.828 distinct registers
        _3_times_9_284_828_distinct_registers, --9.284.828 distinct registers
        _4_times_9_284_828_distinct_registers, --9.284.828 distinct registers
        _7_285_028_distinct_registers, --7.285.028 distinct registers 
        _2_times_7_285_028_distinct_registers, --7.285.028 distinct registers 
        _3_times_7_285_028_distinct_registers, --7.285.028 distinct registers 
        _4_times_7_285_028_distinct_registers, --7.285.028 distinct registers 
        numbers_1_012_323_distinct_registers, --1.012.323 distinct registers
        alphabet, --26 distinct registers
        just_number_1 --1 distinct register
    from
        cte3
),
cte5 as (
    select * from cte4
    union all
    select * from cte1
),
cte6 as (
    select * from cte5 group by all
)
select * from cte6

