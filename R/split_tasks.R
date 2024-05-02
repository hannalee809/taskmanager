#' @title The split_tasks function
#'
#' @description
#' A function where the user inputs what data frame they want to split and by
#' what param they want to split it by.
#'
#' @param dataframe,column_name,value_name,new_df_name the data frame being split up,
#' and under what column name and specific value(s) that are wanted to be
#' rounded up into a new data frame, the name of the new data frame.
#'
#' @returns This function returns a new data frame under the desired params.
#'
#' @export
#'
#' @examples
#' split_tasks(tasks, "Category", "Homework")

split_tasks <- function(dataframe, column_name, value_name, new_df_name = NULL) {

  # if user does not accurately input column name
  if (!(column_name %in% colnames(dataframe))) {
    stop("Category not found.")
  }
  # if user does not accurately input column_name
  if (!(value_name %in% dataframe[[column_name]])) {
    stop("Column not found.")
  }

  # if user does or does not supply the name of new data frame
  if (!is.null(new_df_name)) {
    result <- dataframe[dataframe[, column_name] == value_name, ]
    assign(new_df_name, result, envir = .GlobalEnv)
    cat("Done!")
  } else {
    new_df_name <- readline(prompt = "What would you like your dataframe name to be? ")
    result <- dataframe[dataframe[, column_name] == value_name, ]
    assign(new_df_name, result, envir = .GlobalEnv)
    cat("Done!")
  }
}
