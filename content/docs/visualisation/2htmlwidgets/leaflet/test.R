library("sf")
library("tidyverse")
library("leaflet")

shapefile_map <- read_sf("shapefiles")
class(shapefile_map)

shapefile_map$State <- c("NSW", "VIC", "QLD", "SA", "WA", "TAS", "NT", "ACT")

load("tidy_EnvAcc_data/water_data.rdata")

water_data_map <- shapefile_map %>%
  merge(water_data, by = "State")

palette <- colorNumeric("Blues", domain = water_data_map$`HouseholdPrice($/KL)`)

water_data_map %>%
  leaflet() %>%
  addTiles() %>%
  addPolygons(color = ~palette(water_data_map$`HouseholdPrice($/KL)`),
              label = ~paste("Price:",
                            water_data_map$`HouseholdPrice($/KL)`),
              popup = ~paste("Average household consumption (KL):",
                             water_data_map$`HouseholdPhysical(GL)`,
                             "<br/>",
                             "Average household expenditure ($m):",
                             water_data_map$`HouseholdMonetary($m)`)) %>%
  addLegend(pal = palette,
            values = ~water_data_map$`HouseholdPrice($/KL)`,
            title = "Average price of water ($/KL): ")



load("tidy_ACORN-SAT_data/station_data.rdata")
library("geosphere")
library("sp")

east_to_west <- station_data %>%
  filter(year == 2000)

start_loc <- east_to_west %>%
  filter(Longitude == max(Longitude)) %>%
  select(Longitude, Latitude)
end_loc <- east_to_west %>%
  filter(Longitude == min(Longitude)) %>%
  select(Longitude, Latitude)

distance <- gcIntermediate(p1 = start_loc,
                           p2 = end_loc,
                           n = 50,
                           addStartEnd = TRUE,
                           sp = TRUE) %>%
  SpatialLinesDataFrame(data = east_to_west) %>%
  st_as_sf()

east_to_west %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(label = ~Station.name) %>%
  addPolylines(data = distance)
  
