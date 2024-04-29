#' @title Delete specific tasks from data frame
#'
#' @param tasks the name of the data frame
#'
#' @return An updated_tasks data frame that does not include the deleted tasks
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
delete_task <- function(tasks, description_name = NULL) {
  if (nrow(tasks) == 0) {
    cat("No tasks to delete.\n")
  }

  # if/else to determine whether to delete task automatically (if called to
  # argument) or to ask what task to delete
  if (!is.null(description_name)) {
    if (!(description_name %in% tasks$Description)) {
      stop("Task not found.")
    } else {
      tasks <- tasks[tasks$Description != description_name, ]
      cat("Task with description '",
          description_name,
          "' deleted.\n")
    }
  } else {
    cat("Current tasks:\n")
    print(tasks)
    description_name <-
      readline(prompt = "Enter the description of the task you want to delete: ")

    # if user inputs incorrect task description
    if (!(description_name %in% tasks$Description)) {
      stop("Task not found.")
    } else {
      tasks <- tasks[tasks$Description != description_name, ]
      cat("Task deleted successfully.\n")
    }
  }
  cat("Here are the updated tasks:\n")
  print(tasks)
  updated_tasks <<- tasks
}
