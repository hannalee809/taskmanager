
<!-- README.md is generated from README.Rmd. Please edit that file -->

# taskmanager

<!-- badges: start -->
<!-- badges: end -->

taskmanager allows users to create, edit, and organize a list of tasks a
user aims to complete. It’s similar to a to do list.

## Installation

You can install the development version of taskmanager from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("hannalee809/taskmanager")
#> Downloading GitHub repo hannalee809/taskmanager@HEAD
#> 
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#> * checking for file ‘/private/var/folders/34/18r5lhrj0_31n6492m63t1t40000gn/T/Rtmp9SGjXa/remotes1f507b66e67e/hannalee809-taskmanager-1961b47/DESCRIPTION’ ... OK
#> * preparing ‘taskmanager’:
#> * checking DESCRIPTION meta-information ... OK
#> * checking for LF line-endings in source and make files and shell scripts
#> * checking for empty or unneeded directories
#> * building ‘taskmanager_0.0.0.9000.tar.gz’
#> Installing package into '/private/var/folders/34/18r5lhrj0_31n6492m63t1t40000gn/T/Rtmp1jDYYv/temp_libpath1e0d47dcef73'
#> (as 'lib' is unspecified)
```

## Example

This is a basic example showing you how to create a task list:

``` r
library(taskmanager)

add_task()
```

You can delete, edit, organize, summarize, split, and find a task with
the functions below:

``` r

# add task to existing data frame
add_task(tasks_df)

delete_task(tasks_df)

edit_task(tasks_df, column_num, "task_description")

find_task(tasks_df, "task_description")

organize_tasks(tasks_df)

split_tasks(tasks_df, column_num, "task_desc_under_column_num")

summary_tasks(tasks_df)
```

add_task() can take the input of a df of a task list

delete_task() takes in the name of the df of a task list

edit_task() takes in the name of the df of a task list, the column
number of the task you’d like to edit, and the task description in
“quotes”

find_task() takes in the name of the df of a task list and the
description of the task in “quotes”

organize_tasks() takes in the name of the df of a task list

split_tasks() takes in the name of the df of a task list, the column
you’d like to split by, and the description of the task below the column
you’d like to split by in quotes.

summary_tasks() takes in the name of the df of a task list

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.
