library("tidyverse")
library("plotly")
library("readxl")

temperature_data <- read_csv("global_temp/GlobalLandTemperaturesByCountry.csv") %>%
  filter(dt == "2000-01-01") %>%
  filter(is.na(AverageTemperature) == FALSE)


palette <- colorRampPalette(c('yellow', 'red'))(length(temperature_data$AverageTemperature))

temperature_data %>%
  plot_geo() %>%
  add_trace(locationmode = "country names",
            locations = ~Country,
            z = ~AverageTemperature,
            colors = palette)
