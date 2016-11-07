#' Create database connection
#' 
#' Returns database connection object
#' 
#' @param server The server that hosts the database
#' @param database The name of the database that includes hockey-fighter data
#' @param port The database port number
#' @param user Username for the database
#' @param password Password for user
#' @return Database connection object
#' @export

create_con <- function(server, database, port, user, password){
  con <- RPostgreSQL::dbConnect("PostgreSQL", dbname=database, host=server, 
                                port=port, user=user, password=password)
  return(con)
}
