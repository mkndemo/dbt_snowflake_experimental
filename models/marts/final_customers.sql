-- merge strategy and ability to only update specific columns https://docs.getdbt.com/docs/build/incremental-strategy
{{ config(
    materialized='incremental',
    unique_key='PK',
    incremental_strategy='merge',
    on_schema_change='sync_all_columns',
    constraints={
        'primary_key': 'PK'
    },
    cluster_by=['PK']
) }}

-- create a variable to reuse for the when to update logic for this CTE
{% if is_incremental() %}
    WITH max_updated_at AS (
        SELECT MAX(updated_at) AS max_updated_at FROM {{ this }}
    ),
{% else %}
    WITH max_updated_at AS (
        SELECT TO_TIMESTAMP('1900-01-01 00:00:00') AS max_updated_at
    ),
{% endif %}

-- CTEs to identify changed PKs in each source
changed_source1 AS (
    SELECT PK
    FROM {{ ref('source1_incremental') }} s1
    CROSS JOIN max_updated_at
    WHERE s1.updated_at > max_updated_at.max_updated_at
),
changed_source2 AS (
    SELECT PK
    FROM {{ ref('source2_incremental') }} s2
    CROSS JOIN max_updated_at
    WHERE s2.updated_at > max_updated_at.max_updated_at
),
changed_source3 AS (
    SELECT PK
    FROM {{ ref('source3_incremental') }} s3
    CROSS JOIN max_updated_at
    WHERE s3.updated_at > max_updated_at.max_updated_at
),
changed_source4 AS (
    SELECT PK
    FROM {{ ref('source4_incremental') }} s4
    CROSS JOIN max_updated_at
    WHERE s4.updated_at > max_updated_at.max_updated_at
),

-- Union all changed PKs
changed_PKs AS (
    SELECT PK FROM changed_source1
    UNION
    SELECT PK FROM changed_source2
    UNION
    SELECT PK FROM changed_source3
    UNION
    SELECT PK FROM changed_source4
),

-- Base data combining all sources
combined_data AS (
    SELECT
        s1.PK,
        s1.Column_1,
        COALESCE(s3.Column_2, s1.Column_2) AS Column_2,
        COALESCE(s2.Column_3, s1.Column_3) AS Column_3,
        COALESCE(s3.Column_4, s1.Column_4) AS Column_4,
        COALESCE(s4.Column_5, s1.Column_5) AS Column_5,
        -- Include columns 6 to 199 from source1
        s1.column_6,
        s1.column_7,
        s1.column_8,
        s1.column_9,
        s1.column_10,
        s1.column_11,
        s1.column_12,
        s1.column_13,
        s1.column_14,
        s1.column_15,
        s1.column_16,
        s1.column_17,
        s1.column_18,
        s1.column_19,
        s1.column_20,
        s1.column_21,
        s1.column_22,
        s1.column_23,
        s1.column_24,
        s1.column_25,
        s1.column_26,
        s1.column_27,
        s1.column_28,
        s1.column_29,
        s1.column_30,
        s1.column_31,
        s1.column_32,
        s1.column_33,
        s1.column_34,
        s1.column_35,
        s1.column_36,
        s1.column_37,
        s1.column_38,
        s1.column_39,
        s1.column_40,
        s1.column_41,
        s1.column_42,
        s1.column_43,
        s1.column_44,
        s1.column_45,
        s1.column_46,
        s1.column_47,
        s1.column_48,
        s1.column_49,
        s1.column_50,
        s1.column_51,
        s1.column_52,
        s1.column_53,
        s1.column_54,
        s1.column_55,
        s1.column_56,
        s1.column_57,
        s1.column_58,
        s1.column_59,
        s1.column_60,
        s1.column_61,
        s1.column_62,
        s1.column_63,
        s1.column_64,
        s1.column_65,
        s1.column_66,
        s1.column_67,
        s1.column_68,
        s1.column_69,
        s1.column_70,
        s1.column_71,
        s1.column_72,
        s1.column_73,
        s1.column_74,
        s1.column_75,
        s1.column_76,
        s1.column_77,
        s1.column_78,
        s1.column_79,
        s1.column_80,
        s1.column_81,
        s1.column_82,
        s1.column_83,
        s1.column_84,
        s1.column_85,
        s1.column_86,
        s1.column_87,
        s1.column_88,
        s1.column_89,
        s1.column_90,
        s1.column_91,
        s1.column_92,
        s1.column_93,
        s1.column_94,
        s1.column_95,
        s1.column_96,
        s1.column_97,
        s1.column_98,
        s1.column_99,
        s1.column_100,
        s1.column_101,
        s1.column_102,
        s1.column_103,
        s1.column_104,
        s1.column_105,
        s1.column_106,
        s1.column_107,
        s1.column_108,
        s1.column_109,
        s1.column_110,
        s1.column_111,
        s1.column_112,
        s1.column_113,
        s1.column_114,
        s1.column_115,
        s1.column_116,
        s1.column_117,
        s1.column_118,
        s1.column_119,
        s1.column_120,
        s1.column_121,
        s1.column_122,
        s1.column_123,
        s1.column_124,
        s1.column_125,
        s1.column_126,
        s1.column_127,
        s1.column_128,
        s1.column_129,
        s1.column_130,
        s1.column_131,
        s1.column_132,
        s1.column_133,
        s1.column_134,
        s1.column_135,
        s1.column_136,
        s1.column_137,
        s1.column_138,
        s1.column_139,
        s1.column_140,
        s1.column_141,
        s1.column_142,
        s1.column_143,
        s1.column_144,
        s1.column_145,
        s1.column_146,
        s1.column_147,
        s1.column_148,
        s1.column_149,
        s1.column_150,
        s1.column_151,
        s1.column_152,
        s1.column_153,
        s1.column_154,
        s1.column_155,
        s1.column_156,
        s1.column_157,
        s1.column_158,
        s1.column_159,
        s1.column_160,
        s1.column_161,
        s1.column_162,
        s1.column_163,
        s1.column_164,
        s1.column_165,
        s1.column_166,
        s1.column_167,
        s1.column_168,
        s1.column_169,
        s1.column_170,
        s1.column_171,
        s1.column_172,
        s1.column_173,
        s1.column_174,
        s1.column_175,
        s1.column_176,
        s1.column_177,
        s1.column_178,
        s1.column_179,
        s1.column_180,
        s1.column_181,
        s1.column_182,
        s1.column_183,
        s1.column_184,
        s1.column_185,
        s1.column_186,
        s1.column_187,
        s1.column_188,
        s1.column_189,
        s1.column_190,
        s1.column_191,
        s1.column_192,
        s1.column_193,
        s1.column_194,
        s1.column_195,
        s1.column_196,
        s1.column_197,
        s1.column_198,
        s1.column_199,
        COALESCE(s4.Column_200, s1.Column_200) AS Column_200,
        GREATEST(
            s1.updated_at,
            COALESCE(s2.updated_at, TO_TIMESTAMP('1900-01-01 00:00:00')),
            COALESCE(s3.updated_at, TO_TIMESTAMP('1900-01-01 00:00:00')),
            COALESCE(s4.updated_at, TO_TIMESTAMP('1900-01-01 00:00:00'))
        ) AS updated_at,
        '{{ invocation_id }}' as batch_id
    FROM {{ ref('source1_incremental') }} s1
    LEFT JOIN {{ ref('source2_incremental') }} s2 ON s1.PK = s2.PK
    LEFT JOIN {{ ref('source3_incremental') }} s3 ON s1.PK = s3.PK
    LEFT JOIN {{ ref('source4_incremental') }} s4 ON s1.PK = s4.PK
    {% if is_incremental() %}
    WHERE s1.PK IN (SELECT PK FROM changed_PKs)
    {% endif %}
)

SELECT * FROM combined_data