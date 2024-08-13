library(tidyverse)
library(readxl)

# import question labels from XLS form
question_labels <- read_xlsx("documents/fertilizer-management-pilot.xlsx") |>
  select(variable_name = name, label = `label::English (en)`)

# add to dictionary
join_dictionary <- dictionary |>
  left_join(question_labels) |>
  mutate(description = label) |>
  select(-label)

write_csv(join_dictionary, file = "data-raw/dictionary.csv")

# Add labels with LLama 3.1B ----------------------------------------------

# library(ollamar)
#
# dictionary <- read_csv("data-raw/dictionary.csv")
#
# add_var_description <- function(x){
#
#   var_description <- generate(model = "llama3.1",
#                               prompt = paste("Describe the following variable in a few words:",
#                                              x,
#                                              "Give me just the description as output, limit it to a few words and don't add any special characters such as slashes. The output will be used for a codebook"),
#                               output = "text")
#
#   return(var_description)
#
# }
#
# dictionary_updated <- dictionary |>
#   mutate(description = map_chr(.x = variable_name, .f = add_var_description,
#                                .progress = TRUE)) |>
#   mutate(description = str_to_sentence(description))
#
# write_csv(dictionary_updated, file = "data-raw/dictionary.csv")
