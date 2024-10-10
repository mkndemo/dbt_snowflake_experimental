-- models/final_customers_incremental_v2_jinja.sql

{% set all_columns = [
    'PK',
    'Column_1',
    'Column_2',
    'Column_3',
    'Column_4',
    'Column_5',
    'Column_6',
    'Column_7',
    'Column_8',
    'Column_9',
    'Column_10',
    'Column_11',
    'Column_12',
    'Column_13',
    'Column_14',
    'Column_15',
    'Column_16',
    'Column_17',
    'Column_18',
    'Column_19',
    'Column_20',
    'Column_21',
    'Column_22',
    'Column_23',
    'Column_24',
    'Column_25',
    'Column_26',
    'Column_27',
    'Column_28',
    'Column_29',
    'Column_30',
    'Column_31',
    'Column_32',
    'Column_33',
    'Column_34',
    'Column_35',
    'Column_36',
    'Column_37',
    'Column_38',
    'Column_39',
    'Column_40',
    'Column_41',
    'Column_42',
    'Column_43',
    'Column_44',
    'Column_45',
    'Column_46',
    'Column_47',
    'Column_48',
    'Column_49',
    'Column_50',
    'Column_51',
    'Column_52',
    'Column_53',
    'Column_54',
    'Column_55',
    'Column_56',
    'Column_57',
    'Column_58',
    'Column_59',
    'Column_60',
    'Column_61',
    'Column_62',
    'Column_63',
    'Column_64',
    'Column_65',
    'Column_66',
    'Column_67',
    'Column_68',
    'Column_69',
    'Column_70',
    'Column_71',
    'Column_72',
    'Column_73',
    'Column_74',
    'Column_75',
    'Column_76',
    'Column_77',
    'Column_78',
    'Column_79',
    'Column_80',
    'Column_81',
    'Column_82',
    'Column_83',
    'Column_84',
    'Column_85',
    'Column_86',
    'Column_87',
    'Column_88',
    'Column_89',
    'Column_90',
    'Column_91',
    'Column_92',
    'Column_93',
    'Column_94',
    'Column_95',
    'Column_96',
    'Column_97',
    'Column_98',
    'Column_99',
    'Column_100',
    'Column_101',
    'Column_102',
    'Column_103',
    'Column_104',
    'Column_105',
    'Column_106',
    'Column_107',
    'Column_108',
    'Column_109',
    'Column_110',
    'Column_111',
    'Column_112',
    'Column_113',
    'Column_114',
    'Column_115',
    'Column_116',
    'Column_117',
    'Column_118',
    'Column_119',
    'Column_120',
    'Column_121',
    'Column_122',
    'Column_123',
    'Column_124',
    'Column_125',
    'Column_126',
    'Column_127',
    'Column_128',
    'Column_129',
    'Column_130',
    'Column_131',
    'Column_132',
    'Column_133',
    'Column_134',
    'Column_135',
    'Column_136',
    'Column_137',
    'Column_138',
    'Column_139',
    'Column_140',
    'Column_141',
    'Column_142',
    'Column_143',
    'Column_144',
    'Column_145',
    'Column_146',
    'Column_147',
    'Column_148',
    'Column_149',
    'Column_150',
    'Column_151',
    'Column_152',
    'Column_153',
    'Column_154',
    'Column_155',
    'Column_156',
    'Column_157',
    'Column_158',
    'Column_159',
    'Column_160',
    'Column_161',
    'Column_162',
    'Column_163',
    'Column_164',
    'Column_165',
    'Column_166',
    'Column_167',
    'Column_168',
    'Column_169',
    'Column_170',
    'Column_171',
    'Column_172',
    'Column_173',
    'Column_174',
    'Column_175',
    'Column_176',
    'Column_177',
    'Column_178',
    'Column_179',
    'Column_180',
    'Column_181',
    'Column_182',
    'Column_183',
    'Column_184',
    'Column_185',
    'Column_186',
    'Column_187',
    'Column_188',
    'Column_189',
    'Column_190',
    'Column_191',
    'Column_192',
    'Column_193',
    'Column_194',
    'Column_195',
    'Column_196',
    'Column_197',
    'Column_198',
    'Column_199',
    'Column_200',
    'updated_at'
] %}


{% set source2_columns = ['Column_3'] %}
{% set source3_columns = ['Column_2', 'Column_4'] %}
{% set source4_columns = ['Column_5', 'Column_200'] %}

with source1 as (

    select
    {% for col in all_columns %}
        {{ col }}{% if not loop.last %}, {% endif %}
    {% endfor %}
    from {{ ref('stg_source_tables__source1') }}

),

source2 as (

    select
        PK,
    {% for col in source2_columns %}
        {{ col }} as {{ col }}_update{% if not loop.last %}, {% endif %}
    {% endfor %}
    from {{ ref('stg_source_tables__source2') }}

),

source3 as (

    select
        PK,
    {% for col in source3_columns %}
        {{ col }} as {{ col }}_update{% if not loop.last %}, {% endif %}
    {% endfor %}
    from {{ ref('stg_source_tables__source3') }}

),

source4 as (

    select
        PK,
    {% for col in source4_columns %}
        {{ col }} as {{ col }}_update{% if not loop.last %}, {% endif %}
    {% endfor %}
    from {{ ref('stg_source_tables__source4') }}

),

step1 as (

    select * from source1

),

step2 as (

    select
        step1.PK,
    {% for col in all_columns if col != 'PK' %}
        {% if col in source2_columns %}
            coalesce(source2.{{ col }}_update, step1.{{ col }}) as {{ col }}
        {% else %}
            step1.{{ col }}
        {% endif %}{% if not loop.last %}, {% endif %}
    {% endfor %}
    from step1
    left join source2 on step1.PK = source2.PK

),

step3 as (

    select
        step2.PK,
    {% for col in all_columns if col != 'PK' %}
        {% if col in source3_columns %}
            coalesce(source3.{{ col }}_update, step2.{{ col }}) as {{ col }}
        {% else %}
            step2.{{ col }}
        {% endif %}{% if not loop.last %}, {% endif %}
    {% endfor %}
    from step2
    left join source3 on step2.PK = source3.PK

),

step4 as (

    select
        step3.PK,
    {% for col in all_columns if col != 'PK' %}
        {% if col in source4_columns %}
            coalesce(source4.{{ col }}_update, step3.{{ col }}) as {{ col }}
        {% else %}
            step3.{{ col }}
        {% endif %}{% if not loop.last %}, {% endif %}
    {% endfor %}
    from step3
    left join source4 on step3.PK = source4.PK

)

select
    *
from step4
