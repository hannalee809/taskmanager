# Sample data for testing
sample_tasks <- data.frame(
  Description = c("Task 1", "Task 2", "Task 3"),
  Due_Date = c("04-21-2024", "05-10-2025", "05-10-2025"),
  Priority = c("Medium", "High", "Low"),
  Category = c("SDS", "PSY", "CSC"),
  Completed = c(FALSE, TRUE, FALSE)
)

test_that("summary_tasks correctly outputs num of completed and incomplete tasks", {
  # Call the summary_tasks function with sample data
  capture_output(summary_tasks(sample_tasks))

  # output of complete and incomplete tasks
  expect_match(output[1], "Number of completed tasks: 1")
  expect_match(output[1], "Number of incomplete tasks: 2")
})
