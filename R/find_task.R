#' @title The Find function
#'
#' @description
#' The user inputs their desired phrase they want to search for and find and
#' under which data frame it may be under, and the function returns under what
#' row it is. If there is multiple matches, it returns each one.
#'
#' @param dataframe,phrase Where "dataframe" is the data frame of interest and
#' "phrase" is the phrase (character) being searched for under the subset of
#' dataframe$Description
#'
#' @returns A string that explains where the phrase is found and what the full
#' phrase is.
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
#'   find_task(tasks, "Task 1)
#' }
#'
# given a data frame and a phrase, it returns all rows and position/indexes
# of occurrences. It is not case sensitive.
find_task <- function (dataframe, phrase) {
  new_phrase <- tolower(phrase)
  new_desc <- tolower(dataframe$Description)
  list_tf <- grep(new_phrase, new_desc)
  for (i in list_tf) {
    cat("An occurance of '", phrase, "' occured at row ", i, ": ", dataframe$Description[i], "\n", sep = "")
  }
  if (length(list_tf) == 0){
    cat("No matches under this data frame, make sure your phrase of interest is under the 'Description' column")
  }
}


