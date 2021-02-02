library("tidyverse")

survey_data <- read_delim("raw_data/survey.txt", delim = " ")

colnames(survey_data)[1:2] <- c("family_member", "cereal_preference")

survey_data <- survey_data %>%
  select(family_member, cereal_preference)


save(survey_data, file = "tidy_data/survey_data.rdata")

rm(survey_data)

load("tidy_data/survey_data.rdata")
