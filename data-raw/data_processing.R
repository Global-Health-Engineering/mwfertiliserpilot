library(tidyverse)
library(robotoolbox)
library(readxl)

# Read data --------------------------------------------------------------------

# fetch data from Kobo with robotoolbox, data from enumerator training (< 29.07.2024) not included
raw_data <- kobo_data(x = "aWtRoDGQCbMFZ9nzQ5BFw7",
                      all_versions = TRUE,
                      progress = TRUE) |>
  filter(today >= "2024-07-29")

# read in questionnaire from Kobo XLS form
questionnaire <- read_xlsx("documents/fertilizer-management-pilot.xlsx")

# only keep main variable types and don't include variables with PII (personally identifiable information)
questions <- questionnaire |>
  filter(str_detect(string = type, pattern = "^start$|^end$|today|select_one|select_multiple|integer|decimal|text")) |>
  select(name) |>
  filter(!name %in% c("enumerator", "farmer_name", "farmer_surname")) |>
  pull()

# Add fertiliser measurements ---------------------------------------------

fertiliser_measurements <- read_xlsx("data-raw/measurements-fertiliser.xlsx") |>
  mutate(across(where(is.numeric), ~na_if(., -99)))

npk_measurements <- fertiliser_measurements |>
  select(contains("basal")) |>
  mutate(tag_basal_fertilizer_grams = tag_basal_fertilizer_grams-10.8) |>
  drop_na()

urea_measurements <- fertiliser_measurements |>
  select(contains("topdressing")) |>
  mutate(tag_topdressing_fertilizer_grams = tag_topdressing_fertilizer_grams-10.8) |>
  drop_na()

raw_data_measurements_added <- raw_data |>
  left_join(npk_measurements) |>
  left_join(urea_measurements)

# combine the data and turn alls 99s into NAs as the were placeholders for NA in the survey
raw_data_raw_labels <- raw_data_measurements_added |>
  select(all_of(questions), tag_basal_fertilizer_grams, tag_topdressing_fertilizer_grams) |>
  relocate(tag_basal_fertilizer_grams, .after = tag_basal_fertilizer) |>
  relocate(tag_topdressing_fertilizer_grams, .after = tag_topdressing_fertilizer) |>
  mutate(across(where(is.numeric), ~na_if(., 99))) |>
  mutate(across(where(is.numeric), ~na_if(., -99))) |>
  mutate(across(where(is.numeric), ~na_if(., 0.99)))


# Replace XML codes with labels -------------------------------------------

label_dict <- read_xlsx("documents/fertilizer-management-pilot.xlsx",
                        sheet = "choices") |>
  filter(list_name != "enumerator") |>
  select(identifier = name,
         label = `label::English (en)`) |>
  drop_na() |>
  mutate(label = ifelse(label == "Other (specify)", "Other", label)) |>
  distinct(label, .keep_all = TRUE)

# Helper function to replace XML codes for all character columns with its labels, keeping unmatched values
replace_all_character_labels <- function(data, dict) {

  for (col in seq_along(data)) {

    if (is.character(data[[col]])) {

      matched_indices <- match(data[[col]], dict$identifier)

      new_values <- dict$label[matched_indices]

      data[[col]] <- ifelse(is.na(new_values), data[[col]], new_values)
    }
  }
  return(data)
}

mwfertiliserpilot <- replace_all_character_labels(raw_data_raw_labels, label_dict)

# Export Data ------------------------------------------------------------------
usethis::use_data(mwfertiliserpilot, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))
readr::write_csv(mwfertiliserpilot,
                 here::here("inst", "extdata", paste0("mwfertiliserpilot", ".csv")))
openxlsx::write.xlsx(mwfertiliserpilot,
                     here::here("inst", "extdata", paste0("mwfertiliserpilot", ".xlsx")))
