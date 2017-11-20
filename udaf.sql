-- 2017-11-20 11:38:41
-- Automatically generated from R by RHive version 0.0.1


DROP TABLE fundamental_diagram 
;

CREATE TABLE fundamental_diagram (
    station INT
  , n_total INT
  , slope DOUBLE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY 	
;

add FILE udaf.R
;

-- TODO: handle overwrite
INSERT OVERWRITE TABLE fundamental_diagram
SELECT
TRANSFORM (station,flow2,occ2)
USING "Rscript udaf.R"
AS (
    station,n_total,slope
)
FROM (
    SELECT station,flow2,occ2
    FROM pems
    CLUSTER BY station
) AS tmp
;
