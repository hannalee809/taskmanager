#' @title Summarize and visualize key information from tasks
#' @param tasks a dataframe
#' @returns This function does not return any value, it only prints information
#' @export
#' @examples
#' summary_tasks(df)
summary_tasks <- function(tasks) {
  cat("Summary of Tasks:\n")

  # total number of tasks
  cat("You have a total of", nrow(tasks), "tasks.\n")

 # total number of completed and incomplete tasks
  cat("Number of completed tasks: ", sum(tasks$Completed), "\n")
  cat("Number of incomplete tasks: ", sum(tasks$Completed == FALSE), "\n")

  # tasks with highest priority
  # tasks$Priority <- factor(tasks$Priority, levels = c("High", "Medium", "Low"))
  highest_priority <- tasks %>%
    filter(Priority == "High")
  cat("You're highest priority tasks: \n")
  print(highest_priority)

  # tasks with closest due date
  tasks$Due_Date <- strptime(tasks$Due_Date, "%m-%d-%y")
  closest_due_date_task <- tasks[order(tasks$Due_Date)[1], ]
  cat("\nTask with closest due date:\n")
  print(closest_due_date_task)

  # visualization for priority (change to ggplot2::)
  priority_plot <- ggplot(tasks, aes(x = Priority)) +
    geom_bar(fill = "skyblue", color = "black") +
    labs(
      title = "Distribution of Task Priorities",
      x = "Task Priority",
      y = "Number of tasks"
    ) +
    theme_minimal()

  print(priority_plot)
}

