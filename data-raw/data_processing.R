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
questionnaire <- read_xlsx("inst/extdata/fertilizer-management-pilot.xlsx")

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

# replace the last "_" with an "." in all variables starting with "own_livestock_animals_"

cols_of_interest <- grep("own_livestock_animals_", colnames(raw_data_measurements_added), value = TRUE)

new_colnames <- sub("_(?!.*_)", ".", cols_of_interest, perl = TRUE)

colnames(raw_data_measurements_added)[colnames(raw_data_measurements_added) %in% cols_of_interest] <- new_colnames

# combine the data and turn alls 99s into NAs as the were placeholders for NA in the survey
raw_data_raw_labels <- raw_data_measurements_added |>
  select(all_of(questions),
         contains("."),
         basal_fertilizer_grams = tag_basal_fertilizer_grams,
         topdressing_fertilizer_grams = tag_topdressing_fertilizer_grams,
         uuid = `_uuid`) |>
  relocate(basal_fertilizer_grams, .after = tag_basal_fertilizer) |>
  relocate(topdressing_fertilizer_grams, .after = tag_topdressing_fertilizer) |>
  select(-c(tag_basal_fertilizer, tag_topdressing_fertilizer)) |>
  relocate(contains("own_livestock_animals."), .after = "own_livestock_animals") |>
  mutate(across(where(is.numeric), ~na_if(., 99))) |>
  mutate(across(where(is.numeric), ~na_if(., -99))) |>
  mutate(across(where(is.double) & -any_of(c("start", "end", "today")), ~na_if(., 0.99))) |>
  mutate(across(where(is.logical), as.character)) |>
  mutate(price_scoop = as.numeric(price_scoop))

# Replace XML codes with labels -------------------------------------------

label_dict <- read_xlsx("inst/extdata/fertilizer-management-pilot.xlsx",
                        sheet = "choices") |>
  filter(list_name != "enumerator") |>
  select(identifier = name,
         label = `label::English (en)`) |>
  drop_na() |>
  mutate(label = ifelse(label == "Other (specify)", "Other", label)) |>
  distinct(label, .keep_all = TRUE)

# Helper function to replace XML codes for all character columns with its labels, keeping unmatched values
replace_xml_with_labels <- function(data, dict, exceptions) {

  names_vec <- names(data)

  names_vec_updated <- names_vec[! names_vec %in% exceptions]

  for (col in names_vec_updated) {

    if (is.character(data[[col]])) {

      matched_indices <- match(data[[col]], dict$identifier)

      new_values <- dict$label[matched_indices]

      data[[col]] <- ifelse(is.na(new_values), data[[col]], new_values)
    }
  }
  return(data)
}

mwfertiliserpilot <- replace_xml_with_labels(raw_data_raw_labels, label_dict, exceptions = c("own_livestock_animals"))

# Export Data ------------------------------------------------------------------
usethis::use_data(mwfertiliserpilot, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))
readr::write_csv(mwfertiliserpilot,
                 here::here("inst", "extdata", paste0("mwfertiliserpilot", ".csv")))
openxlsx::write.xlsx(mwfertiliserpilot,
                     here::here("inst", "extdata", paste0("mwfertiliserpilot", ".xlsx")))
