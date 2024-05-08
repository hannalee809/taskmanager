#' @title The Edit function
#' @description
#' The user inputs their desired data frame they want to edit, and the function
#' finds it by taking in the row number and returning options to edit the whole
#' row.
#'
#' @param dataframe,row_number, These inputs are all required so
#' that the function can edit the correct row.
#'
#' @returns Outputs a readline where the user gets to input new values if needed
#' in their desired data frame. There is an option to "keep" the old values if
#' needed by typing in "keep", and if the user tries to input a value that does
#' not align with each column's params, a warning is issued.
#'
#' @export
#'
#' @examples
#' tasks <- data.frame(
#'   Description = c("Task 1", "Task 2", "Task 3"),
#'   Due_Date = c("04-21-2024", "05-10-2025", "05-10-2025"),
#'   Priority = c("Medium", "High", "Low"),
#'   Category = c("SDS", "PSY", "CSC"),
#'   Completed = c(FALSE, TRUE, FALSE)
#' )
#'
#' if (interactive()) {
#'   edit_task(tasks, 1)
#' }
#'

edit_task <- function(old_data_frame, row_number) {

  if (row_number < 1 || row_number > nrow(old_data_frame)) {
    stop("Invalid row number")
  }
  new_data_frame <- old_data_frame
  for (col_name in colnames(old_data_frame)) {
    cat("Enter new value for", col_name, "in row", row_number, ": ")
    new_value <- readline(prompt = "")
    if (new_value == "keep") {
      next
    }
    if (col_name == "Description" || col_name == "Category") {
      if (!is.character(new_value)) {
        warning("Input must be a character for this column")
      }
    }
    if (col_name == "Due_Date") {
      validate_date_format <- function(input_string) {
        tryCatch({
          as.Date(input_string)
          return(TRUE)
        }, error = function(e) {
          return(FALSE)
        })
      }
      if (isFALSE(validate_date_format(new_value))){
        warning("Must be in YYYY-MM-DD format for this column")
      }
    }
    if (col_name == "Priority") {
      if (new_value != "High" && new_value != "Medium" && new_value != "Low") {
        warning("Input must be a the words, High, Medium, or Low for this column")
      }
    }
    if (col_name == "Completed") {
      if (new_value != "TRUE" && new_value != "FALSE") {
        warning("Input must be TRUE or FALSE for this column")
      }
    }
    new_data_frame[row_number, col_name] <- new_value
  }

  return(new_data_frame)
}

