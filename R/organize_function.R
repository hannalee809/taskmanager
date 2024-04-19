# @title Organize a given data frame by columns named priority, due date, completion status, or category
#
# @ description Given a data frame, which represents a to do list, organize the
# to do tasks by a task's due date, completion status, or category
organize <- function(tasks) {
  cat("What do you want to organize by?\n")
  cat("1. Due Date\n")
  cat("2. Completion Status\n")
  cat("3. Category\n")
  cat("4. Priority Level\n")

  choice <- as.integer(readline(prompt = "Enter your choice (1/2/3/4): "))

  if (choice == 1) {
    # Sort tasks by Due_Date
    tasks <- tasks[order(as.Date(tasks$Due_Date, "%Y-%m-%d")), ]
  } else if (choice == 2) {
    # Sort tasks by Completed (completed tasks first)
    tasks <- tasks[order(tasks$Completed, decreasing = TRUE), ]
  } else if (choice == 3) {
    # Sort tasks by Category
    tasks <- tasks[order(tasks$Category), ]
  } else if (choice == 4) {
    # Convert Priority column to ordered factor
    tasks$Priority <- factor(tasks$Priority, levels = c("High", "Medium", "Low"), ordered = TRUE)
    # Sort tasks by Priority Level
    tasks <- tasks[order(tasks$Priority), ]
  } else {
    cat("Invalid choice! Please enter 1, 2, 3, or 4.\n")
    return(NULL)
  }

  return(tasks)
}
