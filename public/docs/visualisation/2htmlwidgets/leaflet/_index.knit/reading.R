library("sf")
library("leaflet")
library("tidyverse")
SA_shapefiles <- read_sf(dsn = "SA-shapefiles")
class(SA_shapefiles)

SA_shapefiles %>%
  mutate(geometry = list(geometry))

SA_shapefiles %>%
  leaflet() %>%
  addPolygons()
