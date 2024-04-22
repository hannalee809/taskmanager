#' @title Summarize and visualize key information from tasks
#' @param tasks a dataframe
#' @returns This function does not return any value, it only prints information
#' @export
#' @examples
#' summary_tasks(df)
library(dplyr)
summary_tasks <- function(tasks) {
  cat("Summary of Tasks:\n\n")

  # total number of tasks
  cat("You have a total of", nrow(tasks), "tasks.\n\n")

  # total number of completed and incomplete tasks
  cat("Number of completed tasks: ", sum(tasks$Completed), "\n")
  cat("Number of incomplete tasks: ",
      sum(tasks$Completed == FALSE),
      "\n\n")

  # tasks with highest priority
  # tasks$Priority <- factor(tasks$Priority, levels = c("High", "Medium", "Low"))
  highest_priority <- tasks %>%
    filter(Priority == "High")
  cat("Your highest priority tasks: \n")
  print(highest_priority)

  # tasks with closest due date
  tasks$Due_Date <- as.Date(strptime(tasks$Due_Date, "%m-%d-%Y"))
  closest_due_date_task <- tasks[order(tasks$Due_Date)[1],]
  cat("\nTask with closest due date:\n")
  print(closest_due_date_task)
  cat("\n")

  # checks whether you have any complete or incomplete tasks
  current_time <- Sys.Date()

  overdue_tasks <- tasks %>%
    filter(Due_Date < current_time)

  if (nrow(overdue_tasks) > 0) {
    cat("You have", nrow(overdue_tasks), "overdue tasks:\n")
    print(overdue_tasks)
    cat("\n")

    # Ask if they want to edit overdue tasks
    response <-
      readline("Do you want to edit these tasks? (yes/no): ")

    if (tolower(response) == "yes") {
      #edit_tasks(overdue_tasks)
      cat("Edit function will be called.\n")
    } else {
      cat("End of Summary")
    }

  } else {
    cat("You have no overdue tasks.\n")
  }



  # # visualization for priority (change to ggplot2::)
  # priority_plot <- ggplot(tasks, aes(x = Priority)) +
  #   geom_bar(fill = "skyblue", color = "black") +
  #   labs(
  #     title = "Distribution of Task Priorities",
  #     x = "Task Priority",
  #     y = "Number of tasks"
  #   ) +
  #   theme_minimal()

  # print(priority_plot)
}

