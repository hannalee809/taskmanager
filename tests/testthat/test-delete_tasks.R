# Sample data for testing
sample_tasks <- data.frame(
  Description = c("Task 1", "Task 2", "Task 3"),
  Due_Date = c("04-21-2024", "05-10-2025", "05-10-2025"),
  Priority = c("Medium", "High", "Low"),
  Category = c("SDS", "PSY", "CSC"),
  Completed = c(FALSE, TRUE, FALSE)
)

test_that("delete_task correctly deletes a task by description", {
  delete_tasks(sample_tasks, "Task 1")
  expect_false("Task 1" %in% updated_tasks$Description)
})

test_that("delete_tasks indicates that a task does not exist in the tasks data frame", {
  expect_error(delete_tasks(sample_tasks, "Task 10"))
})
