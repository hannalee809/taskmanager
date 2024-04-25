#' @title Delete specific tasks from data frame
#'
#' @param tasks the name of the data frame
#'
#' @return An updated tasks data frame that does not include the deleted tasks
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

#' delete_task(tasks)
delete_task <- function(tasks) {
  repeat {
    if (nrow(tasks) == 0) {
      cat("No tasks to delete.\n")
    }

    cat("Current tasks:\n")
    print(tasks)

    description <- readline(prompt = "Enter the description of the task you want to delete (or type 'done'): ")

    if (tolower(description) == "done") {
      break
    }

    task_to_delete <- tasks[tasks$Description == description,]

    if (nrow(task_to_delete) == 0) {
      cat("Task not found.\n")
    } else {
      tasks <- tasks[tasks$Description != description,]
      cat("Task deleted successfully.\n")
    }
  }

  new_df_name <- readline(prompt = "What would you like your dataframe name to be? ")
  assign(new_df_name, tasks, envir = .GlobalEnv)
  cat("Done!")
}
