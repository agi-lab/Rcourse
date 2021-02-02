library("tidyverse")
library("readxl")

# Reading "Average climate-adjusted productivity for all cropping farms, 1977-78 to 2014-15"
farm_data <- read_xlsx("raw_ABARES_data/FarmPerformanceClimate_v1.0.0.xlsx",
                      sheet = "Figure 10",
                      range = "A6:D45")

# Fixing column names
colnames(farm_data)[1] = "year"
colnames(farm_data) = make.names(colnames(farm_data))

# Removing formatted row
farm_data <- farm_data[-1,]

save(farm_data, file = "tidy_ABARES_data/farm_data.rdata")
