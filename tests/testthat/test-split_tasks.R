# Sample data for testing
sample_tasks <- data.frame(
  Description = c("Task 1", "Task 2", "Task 3"),
  Due_Date = c("04-21-2024", "05-10-2025", "05-10-2025"),
  Priority = c("Medium", "High", "High"),
  Category = c("SDS", "PSY", "CSC"),
  Completed = c(FALSE, TRUE, FALSE)
)

test_that("split_tasks correctly split tasks based on category 'Priority'", {
  split_tasks(sample_tasks, "Priority", "High", "result_df")
  expect_equal(nrow(result_df), 2)
})

test_that("split_tasks correctly identifies incorrect user inputs in category name", {
  expect_error(split_tasks(sample_tasks, "High", "WRONGINPUT"))
})


