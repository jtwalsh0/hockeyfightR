#' Get fighter from database
#'
#' Returns a dataframe with fighter data
#'
#' @param con Connection to Postgres database
#' @param tablename The table in the database with fighter information
#' @return A dataframe with a row for each fighter
#' @export

query_fighters <- function(tablename){
  query = paste("select * from", tablename)
  fighters = RPostgreSQL::dbGetQuery(con, query)
  return(fighters)
}
