sample_data <- data.frame(
  Description = c("Task 1", "Task 2", "Task 3", "Task 4", "Task 5"),
  Due_Date = c(
    "04-21-2024",
    "05-10-2025",
    "05-10-2025",
    "05-08-2025",
    "05-02-2025"
  ),
  Priority = c("Medium", "High", "Low", "Medium", "High"),
  Category = c("SDS", "PSY", "CSC", "SDS", "CSC"),
  Completed = c(FALSE, TRUE, FALSE, FALSE, FALSE)
)

usethis::use_data(sample_data, overwrite = TRUE)
