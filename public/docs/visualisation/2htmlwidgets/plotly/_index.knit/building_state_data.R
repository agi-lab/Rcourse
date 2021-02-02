library("tidyverse")
library("readxl")

# Reading only 2008-2014 data for Water Consumption by State
consumption1 <- read_xls("raw_EnvAcc_data/Accounts2016.xls",
                sheet = "Table_13",
                range = "A5:G14")

# Renaming column 1
colnames(consumption1)[1] = "State"

# Removing row 1
consumption1 <- consumption1[-1,]

# Converting our data to "long" format using gather()
consumption <- consumption1 %>%
  gather(year, water_consumption, 2:7)

consumption$water_consumption <- as.numeric(consumption$water_consumption)

save(consumption, file = "tidy_EnvAcc_data/consumption.rdata")
