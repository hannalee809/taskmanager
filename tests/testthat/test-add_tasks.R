# Define a test case for adding a task to a new data frame
testthat::test_that("Adding a task to a new data frame works correctly", {
  # Simulate calling add_tasks without any existing data frame name
  add_tasks <- function(df_name = NULL) {
    # Create a sample data frame
    tasks <- data.frame(
      Description = "New Task",
      Due_Date = "2024-04-13",
      Priority = "Medium",
      Category = "Personal",
      Completed = FALSE,
      stringsAsFactors = FALSE
    )

    # Update tasks in global environment
    assign("tasks", tasks, envir = .GlobalEnv)
  }

  # Call the add_tasks function
  add_tasks()

  # Check if the tasks data frame is created in the global environment
  testthat::expect_true(exists("tasks", envir = .GlobalEnv))

  # Check if the tasks data frame has the correct structure
  tasks <- get("tasks", envir = .GlobalEnv)
  testthat::expect_identical(names(tasks), c("Description", "Due_Date", "Priority", "Category", "Completed"))

  # Check if the column names are correct
  expected_column_names <- c("Description", "Due_Date", "Priority", "Category", "Completed")
  testthat::expect_equal(names(tasks), expected_column_names)
})

# Define a test case for adding a task to an existing data frame
testthat::test_that("Adding a task to an existing data frame works correctly", {
  # Simulate calling add_tasks with an existing data frame name
  add_tasks <- function(df_name = NULL) {
    # Create a sample data frame
    tasks <- data.frame(
      Description = "Existing Task",
      Due_Date = "2024-04-12",
      Priority = "High",
      Category = "Work",
      Completed = FALSE,
      stringsAsFactors = FALSE
    )

    # Retrieve the existing data frame if it exists
    if (!is.null(df_name) && exists(df_name, envir = .GlobalEnv)) {
      existing_tasks <- get(df_name, envir = .GlobalEnv)
      tasks <- rbind(existing_tasks, tasks)
    }

    # Update tasks in global environment
    assign(df_name, tasks, envir = .GlobalEnv)
  }

  # Call the add_tasks function with the existing data frame name
  add_tasks("tasks")

  # Check if the task was added correctly to the existing data frame
  updated_tasks <- get("tasks", envir = .GlobalEnv)
  testthat::expect_equal(nrow(updated_tasks), 2)
})
