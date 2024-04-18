# outline for edit...
# Take a row type and change the contents
# types: (all character) Description, Due_Date, Priority, Category, Completed (log)
# idea: it asks what you want to edit, you type the category, it shows you your
# current filled out thing, then you replace it. It then returns to you your
# new task

# example


# Where x is the desired match for the assignment name, ex "physics hw 2", it
# makes sure all the categories are what they are supposed to be, and you can
# type "keep" so you don't have to change your current status on certain
# categories... this only works if the description is unique.
edit_function <- function(tasks, column_name, x) {
  for(i in 1:nrow(tasks)){
    if (tasks[[column_name]][i] == x) {
      if (!is.character(tasks$Description[i])|
          !is.character(tasks$Category[i])|
          !(tasks$Priority[i] %in% c("High", "Medium", "Low")) |
          !(tasks$Completed[i] == TRUE | tasks$Completed[i] == FALSE)|
          !isTRUE(all(suppressWarnings(!is.na(as.Date(tasks$Due_Date[i], "%Y-%m-%d")))))
      ){
        message("Desc and category have to be a character, priority must be H/M/L, date must be as date, and completion must be TRUE or FALSE")
      } else {
        for (j in 1:ncol(tasks)) {
          new_val <- readline(prompt = paste("What do you want to change the", names(tasks)[j], "to? "))
          if (new_val == "keep") {
            tasks[[j]][i] <- tasks[[j]][i]
          } else {
            tasks[[j]][i] <- new_val
          }
        }
      }
    }
  }
  return(tasks)
}

