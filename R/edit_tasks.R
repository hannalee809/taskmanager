#' @title The Edit function
#' @description
#' The user inputs their desired data frame they want to edit, and the function
#' finds it by taking in the row number and returning options to edit the whole
#' row.
#'
#' @param dataframe,row_number, These inputs are all required so
#' that the function can edit the correct row.
#'
#' @returns edited_tasks data frame with the edited tasks
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
edit_tasks <- function(dataframe, row_number) {
  # Check if row number is within range
  if (row_number < 1 || row_number > nrow(dataframe)) {
    stop("Row number does not exist in the data frame.")
  }

  print(dataframe[row_number, ])
  cat("If you would like to keep the information as is, type the word keep")
  cat("Desc and category have to be a character, priority must be High, Medium, or Low, date must be in %Y-%m-%d form, and completion must be (capitalized) TRUE or FALSE\n")

  new_data_frame <- dataframe
  for (col_name in colnames(dataframe)) {
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
        tryCatch(
          {
            as.Date(input_string)
            return(TRUE)
          },
          error = function(e) {
            return(FALSE)
          }
        )
      }
      if (isFALSE(validate_date_format(new_value))) {
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

  edited_tasks <<- new_data_frame
}
