# Sample data frame
tasks <- data.frame(
  Description = c("Task 1", "Task 2", "Task 3"),
  Due_Date = c("2024-04-15", "2024-04-10", "2024-04-20"),
  Priority = c("High", "Medium", "Low"),
  Category = c("Work", "Personal", "Work"),
  Completed = c(FALSE, FALSE, TRUE),
  stringsAsFactors = FALSE
)

# Testing organize by due date
testthat::test_that("Organizing tasks by due date works correctly", {
  # Create a sample data frame of tasks
  tasks <- data.frame(
    Description = c("Task 1", "Task 2", "Task 3"),
    Due_Date = c("2024-04-15", "2024-04-12", "2024-04-20"),
    Priority = c("High", "Medium", "Low"),
    Category = c("Work", "Personal", "Work"),
    Completed = c(FALSE, FALSE, TRUE)
  )

  # Call the organize function to organize tasks by due date
  organized_tasks <- organize_tasks(tasks, choice = 1)

  # Check if tasks are organized correctly
  testthat::expect_identical(organized_tasks$Due_Date, sort(organized_tasks$Due_Date))
})


# Testing organize by completion status
testthat::test_that("Organizing tasks by completion status works correctly", {
  # Call the organize function to organize tasks by completion status
  organized_tasks <- organize_tasks(tasks, choice = 2)
  # Check if tasks are organized correctly
  testthat::expect_identical(organized_tasks$Completed, rev(sort(organized_tasks$Completed)))
})

# Testing organize by priority level
testthat::test_that("Organizing tasks by priority level works correctly", {
  # Call the organize function to organize by priority level
  organized_tasks <- organize_tasks(tasks, choice = 4)
  # Check if tasks are organized correctly
  testthat::expect_identical(organized_tasks$Priority, sort(organized_tasks$Priority))
})

# Testing organize by category
testthat::test_that("Organizing tasks by category works correctly", {
  # Call organize function to organize by priority level
  organized_tasks <- organize_tasks(tasks, choice = 3)
  # Check if tasks are organized correctly
  testthat::expect_identical(organized_tasks$Category, sort(organized_tasks$Category))
})
