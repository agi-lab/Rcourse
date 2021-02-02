library("tidyverse")
library("readxl")

clean_station_data <- function(FILE_NAME) {
  # Read file
  station <- read_delim(paste0("raw_ACORN-SAT_data/",FILE_NAME), delim = " ")
  
  # Neaten the column names and retrieve the station number
  colnames(station) <- make.names(colnames(station))
  station_number = colnames(station)[3]
  
  # Add Number and year columns
  station <- station %>%
    mutate(Number = as.numeric(substr(station_number, start = 3, stop = 8))) %>%
    mutate(year = substr(MEAN, start = 1, stop = 4))
  
  # Rename and fix the type of the temperature column
  colnames(station)[3] <- "average.temp"
  station$average.temp <- as.numeric(station$average.temp)
  
  # Remove null data points
  station <- station %>%
    filter(average.temp != 99999.9)

  # Select relevant data
  station <- station %>%
    select(year,
           average.temp,
           Number)
  
  return(station)
}

# Selecting the files we want and applying the function
file_list <- list.files(path = "raw_ACORN-SAT_data", pattern = "*annual.txt")
stations <- bind_rows(lapply(file_list, clean_station_data))

# Merging our data with catalogue data containing geolocation and name of station
catalogue <- read_xlsx("raw_ACORN-SAT_data/station-cat.xlsx")
station_data <- merge(stations, catalogue, by = "Number") %>%
  arrange(year) %>%
  select(1:8)

# Making latitude and longitude numeric
station_data$Latitude = as.numeric(station_data$Latitude)
station_data$Longitude = as.numeric(station_data$Longitude)

# Standardizing the column names
colnames(station_data) <- make.names(colnames(station_data))

save(station_data, file = "tidy_ACORN-SAT_data/station_data.rdata")

