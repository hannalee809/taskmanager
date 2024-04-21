
# A function where you put what dataframe, what column name this is under, and
# what the actual name under the column that you want to split it up by

split_function <- function(dataframe, column_name, cat_name) {
  new_df_name <- readline(prompt = "What would you like your dataframe name to be?")
  result <- dataframe[dataframe[, column_name] == cat_name, ]
  assign(new_df_name, result, envir = .GlobalEnv)
  return(new_df_name)
}
