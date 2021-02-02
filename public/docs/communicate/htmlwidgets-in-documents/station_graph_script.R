library("leaflet")

load("tidy_ACORN-SAT_data/station_data.rdata")

pal <- colorNumeric(
  palette = "YlOrRd",
  domain = station_data$average.temp)

station_graph <- station_data %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(label = ~paste("Station: ", Station.name),
                   popup = ~paste0("Temperature: ", average.temp),
                   color = ~pal(average.temp),
                   lng = ~Longitude,
                   lat = ~Latitude)

widgetframe::frameWidget(station_graph)