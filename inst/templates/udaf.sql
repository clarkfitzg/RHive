-- {{{gen_time}}}
-- Automatically generated from R by RHive version {{{RHive_version}}}

{{{#overwrite_table}}}
DROP TABLE {{{output_table}}} 
;

CREATE TABLE {{{output_table}}} (
  {{{#output_table_definition}}}{{{^first}}}  , {{{/first}}}{{{ddl}}}
{{{/output_table_definition}}})
ROW FORMAT DELIMITED
FIELDS TERMINATED BY {{{sep}}}
;
{{{/overwrite_table}}}
add FILE {{{udaf_dot_R}}}
;

-- TODO: handle overwrite
INSERT OVERWRITE TABLE {{{output_table}}}
SELECT
TRANSFORM ({{{input_cols}}})
USING "Rscript {{{udaf_dot_R}}}"
AS (
    {{{output_cols}}}
)
FROM (
    SELECT {{{input_cols}}}
    FROM {{{input_table}}}
    CLUSTER BY {{{cluster_by}}}
) AS {{{tmptable}}}
;
