# Sample data for testing
sample_tasks <- data.frame(
  Description = c("Task 1", "Task 2", "Task 3"),
  Due_Date = c("04-21-2024", "05-10-2025", "05-10-2025"),
  Priority = c("Medium", "High", "Low"),
  Category = c("SDS", "PSY", "CSC"),
  Completed = c(FALSE, TRUE, FALSE)
)

test_that("delete_task accurately removes task based on description ", {
  simulate_input(c("Task 2", "done"), {
    # Call the delete_task function
    delete_task(sample_tasks)
  })

  # Check if "Task 2" is deleted from the dataframe
  expect_false("Task 2" %in% sample_tasks$Description)
})


# test if user inputs a task that does not exist in the tasks data frame
