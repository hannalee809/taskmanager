# Sample data for testing
sample_tasks <- data.frame(
  Description = c("Task 1", "Task 2", "Task 3"),
  Due_Date = c("04-21-2024", "05-10-2025", "05-10-2025"),
  Priority = c("Medium", "High", "Low"),
  Category = c("SDS", "PSY", "CSC"),
  Completed = c(FALSE, TRUE, FALSE)
)

test_that("summary_tasks correctly outputs num of completed and incomplete tasks", {
  # test output of complete and incomplete tasks
  expect_output(summary_tasks(sample_tasks), "Number of completed tasks:  1", all = FALSE)
  expect_output(summary_tasks(sample_tasks), "Number of incomplete tasks:  2", all = FALSE)

  # test to see if overdue tasks object is accurate
  expect_output(summary_tasks(sample_tasks), "You have 1 overdue tasks:", all = FALSE)
})
