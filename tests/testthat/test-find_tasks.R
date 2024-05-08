# Sample data for testing
sample_tasks <- data.frame(
  Description = c("Task 1", "Task 2", "Task 3"),
  Due_Date = c("04-21-2024", "05-10-2025", "05-10-2025"),
  Priority = c("Medium", "High", "Low"),
  Category = c("SDS", "PSY", "CSC"),
  Completed = c(FALSE, TRUE, FALSE)
)

test_that("find_tasks correctly outputs the occurance of a task", {
  expect_output(
    find_tasks(sample_tasks, "Task 1"),
    "An occurance of 'Task 1' occured at row 1: Task 1"
  )
})

test_that("find_tasks correctly reports that there is no such task based on user input", {
  expect_output(
    find_tasks(sample_tasks, "Task 10"),
    "No matches under this data frame, make sure your phrase of interest is under the 'Description' column"
  )
})
