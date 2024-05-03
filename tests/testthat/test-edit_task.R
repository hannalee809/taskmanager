# Sample data for testing
sample_tasks <- data.frame(
  Description = c("Task 1", "Task 2", "Task 3"),
  Due_Date = c("04-21-2024", "05-10-2025", "05-10-2025"),
  Priority = c("Medium", "High", "Low"),
  Category = c("SDS", "PSY", "CSC"),
  Completed = c(FALSE, TRUE, FALSE)
)

test_that("edit_task returns error if row number does not exist in data frame", {
  expect_error(edit_task(sample_tasks, 5))
})

test_that("edit_task prints out correct row of df when user calls function", {
  expect_output(edit_task(sample_tasks, 1), " Description   Due_Date Priority Category Completed
1      Task 1 04-21-2024   Medium      SDS     FALSE", all = FALSE)
})

