library("tidyverse")
library("highcharter")

load("tidy_EnvAcc_data/consumption.rdata")

consumption %>%
  group_by(year) %>%
  mutate(consumption_total = sum(water_consumption)) %>%
  ungroup() %>%
  hchart(type = "column",
         hcaes(x = year,
               y = water_consumption,
               group = State),
         color = c("red", "blue", "green", "orange", "purple", "brown", "pink", "lightblue")) %>%
  hc_plotOptions(column = list(stacking = "percent"))


load("tidy_ABARES_data/farm_data.rdata")

farm_data %>%
  hchart(type = "scatter",
         hcaes(x = Climate.effect,
               y = Total.factor.productivity,
               color = Climate.adjusted.TFP)) 

farm_data %>%
  hchart(type = "bubble",
         hcaes(x = Climate.effect,
               y = Total.factor.productivity,
               value = Climate.adjusted.TFP),
         marker = list(enabled = FALSE))
  

farm_data %>%
  hchart(type = "bubble",
         hcaes(x = Climate.effect,
               y = Total.factor.productivity,
               size = Climate.adjusted.TFP))

farm_data %>%
  hchart(type = "bubble",
         hcaes(x = Climate.effect,
               y = Total.factor.productivity,
               size = Climate.adjusted.TFP)) %>%
  hc_plotOptions(bubble = list(maxSize = "12%"))


farm_data %>%
  hchart(type = "scatter",
         hcaes(x = Climate.effect,
               y = Total.factor.productivity)) %>%
  hc_xAxis(type = "logarithmic")

library("lubridate")

farm_data2 <- farm_data %>%
  mutate(year = as.integer(year))

highchart(type = "stock") %>%
  hc_add_series(data = farm_data,
                type = "line",
                hcaes(x = year,
                      y = Total.factor.productivity),
                name = "TFP",
                color = "orange") %>%
  hc_add_series(data = farm_data,
                type = "line",
                hcaes(x = year,
                      y = Climate.adjusted.TFP),
                name = "Climate-Adjusted TFP",
                color = "red") %>%
  hc_add_series(data = farm_data,
                type = "line",
                hcaes(x = year,
                      y = Climate.effect),
                name = "Climate Effect",
                color = "lightblue") %>%
  hc_legend(enabled = TRUE)
  

library("sf")
shapefile_map <- read_sf(dsn = "shapefiles")
# Note: for file path, do not include a '/' at the end
class(shapefile_map)

shapefile_map$STE <- c("NSW", "VIC", "QLD", "SA", "WA", "TAS", "NT", "ACT")


library("geojsonio")
geojson_file <- geojson_list(shapefile_map)
class(geojson_file)

load("tidy_EnvAcc_data/consumption.rdata")

consumption14 <- consumption %>%
  filter(year == "2013–14")

highchart(type = "map") %>%
  hc_add_series_map(map = geojson_file,
                    df = consumption14,
                    value = "water_consumption",
                    joinBy = c("STE", "State"),
                    name = "Water Consumption (KL)",
                    dataLabels = list(enabled = TRUE)) %>%
  hc_colorAxis(minColor = "#C5C000", maxColor = "#434000") %>%
  hc_tooltip(headerFormat = "REEE",
             pointFormat = "{point.State}: {point.water_consumption} KL")


consumption14 <- consumption14 %>%
  mutate(colour = plyr::mapvalues(State,
                                  from = c("NSW",
                                           "VIC",
                                           "QLD",
                                           "SA",
                                           "WA",
                                           "TAS",
                                           "NT",
                                           "ACT"),
                                  to = c("red",
                                         "yellow",
                                         "pink",
                                         "green",
                                         "purple",
                                         "orange",
                                         "blue",
                                         "brown")))
