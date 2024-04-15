library(tidyverse)
# Add task function
add_task <- function(tasks = NULL) {
  if (is.null(tasks)) {
    tasks <- data.frame(
      Description = character(),
      Due_Date = character(),
      Priority = character(),
      Category = character(),
      Completed = logical(),
      stringsAsFactors = FALSE
    )
  }

  repeat {
    cat("Enter details for the new task:\n")
    description <- readline(prompt = "Description: ")
    due_date <- readline(prompt = "Due Date (YYYY-MM-DD): ")
    priority <- readline(prompt = "Priority (High/Medium/Low): ")
    category <- readline(prompt = "Category: ")

    # Create the task
    new_task <- data.frame(
      Description = description,
      Due_Date = due_date,
      Priority = priority,
      Category = category,
      Completed = FALSE,
      stringsAsFactors = FALSE
    )

    # Add the task to the task list
    tasks <- rbind(tasks, new_task)

    cat("Task added successfully!\n")

    # Ask if the user wants to add another task
    add_another <- readline(prompt = "Add another task? (yes/no): ")
    if (tolower(add_another) != "yes") {
      break
    }
  }

  return(tasks)
}
