% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary_tasks.R
\name{summary_tasks}
\alias{summary_tasks}
\title{Summarize and visualize key information from tasks}
\usage{
summary_tasks(tasks)
}
\arguments{
\item{tasks}{a dataframe}
}
\value{
This function does not return any value, it only prints information
}
\description{
Summarize and visualize key information from tasks
}
\examples{
tasks <- data.frame(
  Description = c("Task 1", "Task 2", "Task 3"),
  Due_Date = c("04-21-2024", "05-10-2025", "05-10-2025"),
  Priority = c("Medium", "High", "Low"),
  Category = c("SDS", "PSY", "CSC"),
  Completed = c(FALSE, TRUE, FALSE)
)

if (interactive()) {
  summary_tasks(tasks)
}

}
