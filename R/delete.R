delete_task <- function(tasks) {
  repeat {
    # if there are no current tasks
    if (nrow(tasks) == 0) {
      cat("No tasks to delete.\n")
    }

    cat("Current tasks:\n")
    print(tasks)

    description <-
      readline(prompt = "Enter the description of the task you want to delete (or type 'done'): ")

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

  return(tasks)
}
