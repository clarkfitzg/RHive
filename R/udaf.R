#' Writes User Defined Aggregation Function
#'
#' Generates R and SQL scripts to call as user defined aggregation
#' functions in Hive
#'
#' Feedback: 
#'
#' Do I attempt to have consistency with similar funcs /
#' packages? Ie. DBI package uses statement, lapply uses FUN
#'
#' Alternatively I could use caps to denote SQL things, ie. CLUSTER_BY
#'
#' @param f function which accepts a grouped data frame and returns a
#'  data frame
#' @param cluster_by character name of column to \code{CLUSTER BY}
#' @param input_table character name of table to be transformed, ie.
#'  \code{SELECT input_cols FROM input_table}. Can also contain more SQL,
#'  such as \code{input_table WHERE col1 < 10}.
#' @param input_cols character vector of input columns to f
#' @param output_table character name of table to \code{INSERT INTO
#'  output_table}
#' @param output_cols character vector of columns that f will output
#' @param base_name character base name of script to write ie. foo.R and foo.sql
#' @param sep field separator string
#' @return scripts character vector containing generated scripts
#' @examples
#' write_udaf_scripts(...)
#' @export
write_udaf_scripts = function(f, cluster_by
    , input_table
    , input_cols
    , output_table
    , output_cols
    , base_name = "udaf"
    , sep = "\t"
){
}
