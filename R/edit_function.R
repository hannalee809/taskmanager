#' @title The Edit function
#' @description
#' The user inputs their desired dataframe they want to edit, and the function
#' finds it by taking in the column name and value that the row they want to
#' change is at.
#'
#' @param dataframe,column_name,value_name These inuputs are all required so
#' that the function can find the correct row. It is prefered that column_name is
#' the description column and value_name is a unique description name.
#'
#' @returns Outputs a readline where the user gets to input new values if needed
#' in their desired data frame. There is an option to "keep" the old values if
#' needed by typing in "keep", and if the user tries to input a value that does
#' not align with each column's params, a warning is issued.
#'
#' @export ...?
#'
#' @examples
# 'tasks <- data.frame(
#'  Description = c("physics hw 1", "physics hw 2", "math 1"),
#'  Due_Date = as.Date(as.character("2024-04-18", "2024-04-19", "2024-04-19")),
#'  Priority = c("High", "Medium", "Low"),
#'  Category = c("Homework", "Homework", "Assignment"),
#'  Completed = c(FALSE, FALSE, TRUE)
#' )

#' tasks <- edit_function(tasks, "Description", "Physics hw 2")
#'

edit_function <- function(dataframe, column_name, value_name) {
  for(i in 1:nrow(dataframe)){
    if (dataframe[[column_name]][i] == value_name) {
      if (!is.character(dataframe$Description[i])|
          !is.character(dataframe$Category[i])|
          !(dataframe$Priority[i] %in% c("High", "Medium", "Low")) |
          !(dataframe$Completed[i] == TRUE | dataframe$Completed[i] == FALSE)|
          !isTRUE(all(suppressWarnings(!is.na(as.Date(dataframe$Due_Date[i], "%Y-%m-%d")))))
      ){
        warning("Desc and category have to be a character, priority must be High, Medium, or Low, date must be in date form, and completion must be TRUE or FALSE")
      } else {
        for (j in 1:ncol(dataframe)) {
          print(readline(promt = paste("If you would like to keep the information as is, type the word keep")))
          new_val <- readline(prompt = paste("What do you want to change the", names(dataframe)[j], "to? "))
          if (new_val == "keep") {
            dataframe[[j]][i] <- dataframe[[j]][i]
          } else {
            dataframe[[j]][i] <- new_val
          }
        }
      }
    }
  }
  return(dataframe)
}

sample_data <- edit_function(sample_data, "Description", "Project 3")
