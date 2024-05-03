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
#' Description = c("Task 1", "Task 2", "Task 3"),
#' Due_Date = c("04-21-2024", "05-10-2025", "05-10-2025"),
#' Priority = c("Medium", "High", "Low"),
#' Category = c("SDS", "PSY", "CSC"),
#' Completed = c(FALSE, TRUE, FALSE)
#' )
#'
#' if (interactive()) {
#'   edit_task(tasks, 1)
#' }
#'

edit_task <- function(dataframe, row_number) {

  # Check if row number is within range
  if (row_number < 1 || row_number > nrow(dataframe)) {
    stop("Row number does not exist in the data frame.")
  }

  print(dataframe[row_number,])
  cat("If you would like to keep the information as is, type the word keep")
  cat("Desc and category have to be a character, priority must be High, Medium, or Low, date must be in %Y-%m-%d form, and completion must be (capitalized) TRUE or FALSE")
  for (i in 1:ncol(dataframe[row_number,])) {
    new_val <- readline(prompt = paste("What do you want to change the", names(dataframe)[i], "to? "))
    if (new_val == "keep") {
      dataframe[row_number, ][i] <- dataframe[row_number, ][i]
      print(dataframe[row_number, ][i])
    } else {
      dataframe[row_number, ][i] <- new_val
      print(dataframe[row_number, ][i])
    }
  }
}
