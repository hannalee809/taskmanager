#' @title Summarize and visualize key information from tasks
#' @param tasks a dataframe
#' @returns This function does not return any value, it only prints information
#'
#' @importFrom dplyr filter
#' @export
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
#'   summary_tasks(tasks)
#' }
#'
summary_tasks <- function(tasks) {
  cat("Summary of Tasks:\n\n")

  # total number of tasks
  cat("You have a total of", nrow(tasks), "tasks.\n\n")

  # total number of completed and incomplete tasks
  cat("Number of completed tasks: ", sum(tasks$Completed), "\n")
  cat("Number of incomplete tasks: ",
      sum(tasks$Completed == FALSE),
      "\n\n")

  # tasks with highest priority
  # tasks$Priority <- factor(tasks$Priority, levels = c("High", "Medium", "Low"))
  highest_priority <- dplyr::filter(tasks, Priority == "High")
  print(highest_priority)

  # tasks with closest due date
  tasks$Due_Date <- as.Date(strptime(tasks$Due_Date, "%m-%d-%Y"))
  closest_due_date_task <- tasks[order(tasks$Due_Date)[1],]
  cat("\nTask with closest due date:\n")
  print(closest_due_date_task)
  cat("\n")

  # checks whether you have any complete or incomplete tasks
  current_time <- Sys.Date()

  overdue_tasks <- dplyr::filter(tasks, Due_Date < current_time)

  if (nrow(overdue_tasks) > 0) {
    cat("You have", nrow(overdue_tasks), "overdue tasks:\n")
    print(overdue_tasks)
    cat("\n")

    # Ask if they want to edit overdue tasks
    response <-
      readline("Do you want to edit these tasks? (yes/no): ")

    if (tolower(response) == "yes") {
      # tasks <- edit_function(overdue_tasks, "Completed", overdue_tasks$Description[1])
      cat("Edit function will be called.\n")
    } else {
      cat("End of Summary")
    }

  } else {
    cat("You have no overdue tasks.\n")
  }

}


