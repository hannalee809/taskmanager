# Add task function
add_task <- function() {
  if (!exists("tasks", envir = .GlobalEnv)) {
    tasks <- data.frame(
      Description = character(),
      Due_Date = character(),
      Priority = character(),
      Category = character(),
      Completed = logical(),
      stringsAsFactors = FALSE
    )
  } else {
    tasks <- get("tasks", envir = .GlobalEnv)
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

  # Update tasks in global environment
  assign("tasks", tasks, envir = .GlobalEnv)
}


# Prioritize function
prioritize <- function(tasks) {
  cat("What do you want to prioritize?\n")
  cat("1. Due Date\n")
  cat("2. Completion Status\n")
  cat("3. Priority Level\n")

  choice <- as.integer(readline(prompt = "Enter your choice (1/2/3): "))

  if (choice == 1) {
    # Sort tasks by Due_Date
    tasks <- tasks[order(as.Date(tasks$Due_Date, "%Y-%m-%d")), ]
  } else if (choice == 2) {
    # Sort tasks by Completed (completed tasks first)
    tasks <- tasks[order(tasks$Completed, decreasing = TRUE), ]
  } else if (choice == 3) {
    # Sort tasks by Priority Level
    tasks <- tasks[order(tasks$Priority, decreasing = TRUE), ]
  } else {
    cat("Invalid choice! Please enter 1, 2, or 3.\n")
    return(NULL)
  }

  return(tasks)
}
