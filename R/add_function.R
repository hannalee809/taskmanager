add_task <- function(df = NULL) {
  # Check if df argument is provided
  if (is.null(df)) {
    # Ask the user for the name of the data frame
    df_name <- readline(prompt = "Enter the name for your task data frame: ")

    # Check if the data frame name is valid
    if (!grepl("^[_a-zA-Z][_a-zA-Z0-9.]*$", df_name)) {
      stop("Error: Invalid data frame name. Please use only letters, numbers, and dots, starting with a letter.\n")
    }

    # Check if the data frame already exists in the global environment
    if (!exists(df_name, envir = .GlobalEnv)) {
      # Create a new data frame if it doesn't exist
      df <- data.frame(
        Description = character(),
        Due_Date = character(),
        Priority = character(),
        Category = character(),
        Completed = logical(),
        stringsAsFactors = FALSE
      )
    } else {
      # Retrieve the existing data frame from the global environment
      df <- get(df_name, envir = .GlobalEnv)
    }
  }

  # Prompt the user to add a task to the data frame
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

    # Add the task to the data frame
    df <- rbind(df, new_task)

    cat("Task added successfully!\n")

    # Ask if the user wants to add another task
    add_another <- readline(prompt = "Add another task? (yes/no): ")
    if (tolower(add_another) != "yes") {
      break
    }
  }

  # Update the data frame in the global environment if a new one was created
  if (!exists("df_name")) {
    df_name <- readline(prompt = "What's the name of the data frame you want to add your new task(s) to? ")
  }
  assign(df_name, df, envir = .GlobalEnv)

  return(df)
}
