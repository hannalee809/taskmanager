#' @title The split function
#'
#' @description
#' A function where the user inputs what data frame they want to split and by
#' what param they want to split it by.
#'
#' @param dataframe,column_name,cat_name the data frame being split up,
#' and under what column name and specific value(s) that are wanted to be
#' rounded up into a new data frame.
#'
#' @returns This function returns a new data frame under the desired params.
#'
#' @export
#'
#' @examples
#'
#' tasks <- data.frame(
#'  Description = c("physics hw 1", "physics hw 2", "math 1"),
#'  Due_Date = as.Date(as.character("2024-04-18", "2024-04-19", "2024-04-19")),
#'  Priority = c("High", "Medium", "Low"),
#'  Category = c("Homework", "Homework", "Assignment"),
#'  Completed = c(FALSE, FALSE, TRUE)
#' )

#' split_function(tasks, "Category", "Homework")
#'


split_function <- function(dataframe, column_name, cat_name) {
  new_df_name <- readline(prompt = "What would you like your dataframe name to be? ")
  result <- dataframe[dataframe[, column_name] == cat_name, ]
  assign(new_df_name, result, envir = .GlobalEnv)
  return(new_df_name)
}
