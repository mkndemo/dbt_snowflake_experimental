with 

source as (

    select * from {{ source('raw', 'source11') }}

),

renamed as (

    select
        pk,
        column_1,
        column_2,
        column_3,
        column_4,
        column_5,
        column_6,
        column_7,
        column_8,
        column_9,
        column_10,
        column_11,
        column_12,
        column_13,
        column_14,
        column_15,
        column_16,
        column_17,
        column_18,
        column_19,
        column_20,
        column_21,
        column_22,
        column_23,
        column_24,
        column_25,
        column_26,
        column_27,
        column_28,
        column_29,
        column_30,
        column_31,
        column_32,
        column_33,
        column_34,
        column_35,
        column_36,
        column_37,
        column_38,
        column_39,
        column_40,
        column_41,
        column_42,
        column_43,
        column_44,
        column_45,
        column_46,
        column_47,
        column_48,
        column_49,
        column_50,
        column_51,
        column_52,
        column_53,
        column_54,
        column_55,
        column_56,
        column_57,
        column_58,
        column_59,
        column_60,
        column_61,
        column_62,
        column_63,
        column_64,
        column_65,
        column_66,
        column_67,
        column_68,
        column_69,
        column_70,
        column_71,
        column_72,
        column_73,
        column_74,
        column_75,
        column_76,
        column_77,
        column_78,
        column_79,
        column_80,
        column_81,
        column_82,
        column_83,
        column_84,
        column_85,
        column_86,
        column_87,
        column_88,
        column_89,
        column_90,
        column_91,
        column_92,
        column_93,
        column_94,
        column_95,
        column_96,
        column_97,
        column_98,
        column_99,
        column_100,
        column_101,
        column_102,
        column_103,
        column_104,
        column_105,
        column_106,
        column_107,
        column_108,
        column_109,
        column_110,
        column_111,
        column_112,
        column_113,
        column_114,
        column_115,
        column_116,
        column_117,
        column_118,
        column_119,
        column_120,
        column_121,
        column_122,
        column_123,
        column_124,
        column_125,
        column_126,
        column_127,
        column_128,
        column_129,
        column_130,
        column_131,
        column_132,
        column_133,
        column_134,
        column_135,
        column_136,
        column_137,
        column_138,
        column_139,
        column_140,
        column_141,
        column_142,
        column_143,
        column_144,
        column_145,
        column_146,
        column_147,
        column_148,
        column_149,
        column_150,
        column_151,
        column_152,
        column_153,
        column_154,
        column_155,
        column_156,
        column_157,
        column_158,
        column_159,
        column_160,
        column_161,
        column_162,
        column_163,
        column_164,
        column_165,
        column_166,
        column_167,
        column_168,
        column_169,
        column_170,
        column_171,
        column_172,
        column_173,
        column_174,
        column_175,
        column_176,
        column_177,
        column_178,
        column_179,
        column_180,
        column_181,
        column_182,
        column_183,
        column_184,
        column_185,
        column_186,
        column_187,
        column_188,
        column_189,
        column_190,
        column_191,
        column_192,
        column_193,
        column_194,
        column_195,
        column_196,
        column_197,
        column_198,
        column_199,
        column_200,
        updated_at

    from source

)

select * from renamed
