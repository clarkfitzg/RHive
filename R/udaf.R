#' Writes User Defined Aggregation Function
#'
#' Generates R and SQL scripts to call as user defined aggregation
#' functions in Hive
#'
#' This approach splits the data based on the value of the column
#' \code{cluster_by}. Each group of split data must be small enough to fit
#' in memory of the R process that runs it.
#'
#' This function is relatively low level. It provides the foundation for
#' something more advanced that knows and uses the schema of the database.
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
#' @param cluster_by character name of column to \code{CLUSTER BY}, ie.
#' split the main table based on this column and apply \code{f} to each
#' group
#' @param input_table character name of table to be transformed, ie.
#'  \code{SELECT input_cols FROM input_table}. Can also contain more SQL,
#'  such as \code{input_table WHERE col1 < 10}.
#' @param input_cols input column names. See \code{col.names} in
#' \code{\link[utils]{read.table}}.
#' @param input_classes character vector passed on to
#' @param output_table character name of table to \code{INSERT INTO
#'  output_table}
#' @param output_cols character vector of columns that f will output
#' @param rows_per_chunk integer number of rows to process in each chunk.
#'  If this is too small, say 10, then the generated script will be slow.
#'  If this is too large, say 1 billion, then the R process may fail
#'  because it uses excessive memory.
#' @param base_name character base name of script to write ie. foo.R and foo.sql
#' @param overwrite logical write over any existing scripts with
#'  \code{base_name}?
#' @param sep character field separator string
#' @param verbose logical log messages to \code{stderr} so that they can be
#'  examined later via \code{$ yarn logs -applicationId <your app id>
#'  -log_files stderr}
#' @param try logical If \code{try = TRUE} then it will try to call
#' \code{f} on every group, and ignore those groups that fail. If \code{try
#' = FALSE} then a failure on any group will cause the whole Hive job to
#' fail.
#' @return scripts character vector containing generated scripts
#' @examples
#' #write_udaf_scripts(...)
#' @export
write_udaf_scripts = function(f, cluster_by
    , input_table, input_cols, input_classes
    , output_table, output_cols
    , base_name = "udaf"
    , overwrite = FALSE
    , rows_per_chunk = 1e6L
    , sep = "\t"
    , verbose = FALSE
    , try = FALSE
){


}


#' Write Program To File
write_program = function(program, file)
{
    sink(file)
    for(expr in program){
        print(expr)
    }
    sink()
}
